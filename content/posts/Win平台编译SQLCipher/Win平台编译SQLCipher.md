---
title: Win平台编译SQLCipher
toc: true
authors:
  - Francis Fu
tags:
categories:
series:
date: '2021-08-13'
draft: false
---

最近一个项目需要用到嵌入式数据库，自然就想到了SQLite。但是由于开源的SQLite是不支持加密的，官方的SEE加密服务需要2000美元，我等自然是没有这个经济实力的。搜索一番，找到了[Zetetic](/images/Win平台编译SQLCipher/https://www.zetetic.net/)公司的SQLCipher，社区版开源并且需要自行编译，商业版在社区版基础上优化了查询速度和数据库体积，同时给了各个平台的预编译文件。由于SQLite在Windows上编译较为繁琐，特此记录编译过程。

<!--more-->

### 0. 准备工作

* Windows 11 专业版 21H2 64位
* Visual Studio Community 2019 16.11.0（包含“使用C++的桌面开发”工作负载）
* [ActiveState ActiveTcl 8.6 Community Edition](/images/Win平台编译SQLCipher/https://www.activestate.com/products/tcl/downloads/)
* [Win64 OpenSSL v1.1.1k](/images/Win平台编译SQLCipher/https://slproweb.com/products/Win32OpenSSL.html)

### 1. 克隆源码

```
git clone https://github.com/sqlcipher/sqlcipher.git
```

![Git Clone](/images/Win平台编译SQLCipher/GitClone.png)


### 2. 安装ActiveTcl

双击打开下载好的安装包，使用默认选项（Typical）安装即可。

### 3. 安装OpenSSL

双击打开下载好的安装包，在安装过程中，将目标路径改为 _C:\\dev\\OpenSSL-Win64_：

![OpenSSL installation path](/images/Win平台编译SQLCipher/OpenSSL_ChangeDir.png)

然后在选项中设置 _.DLLs_ 文件存放在OpenSSL binaries (_/bin_) 路径中：

![OpenSSL binaries directory](/images/Win平台编译SQLCipher/OpenSSL_BinariesDirectory.png)

之后，开始安装：

![OpenSSL binaries directory](/images/Win平台编译SQLCipher/OpenSSL_Ready2Install.png)

### 4. 编辑Makefile.msc文件

安装好所需的环境后，在克隆的源码路径下，编辑 _Makefile.msc_ 文件，使其适配我们的编译环境。

我们需要禁用增量链接来使编译不出错。默认情况下， _nmake_ 会使用增量链接。

向 _LDLFLAGS_ 变量添加 _/INCREMENTAL:NO_ ：

```
LDFLAGS = $(LDFLAGS) /INCREMENTAL:NO
```

![LDLFLAGS Disable nmake incremental linking](/images/Win平台编译SQLCipher/DisableIncrementalLinking.png)


之后将 _\-DSQLITE\_TEMP\_STORE_ 的值从1改为2，并向 _TCC_ 和 _RCC_ 变量添加 _\-DSQLITE\_HAS\_CODEC_ 和 _\-IC:\\dev\\OpenSSL\-Win64\\include_。

```
TCC = $(TCC) -DSQLITE_TEMP_STORE=2
RCC = $(RCC) -DSQLITE_TEMP_STORE=2

TCC = $(TCC) -DSQLITE_HAS_CODEC
RCC = $(RCC) -DSQLITE_HAS_CODEC

TCC = $(TCC) -IC:\dev\OpenSSL-Win64\include
RCC = $(RCC) -IC:\dev\OpenSSL-Win64\include
```

![TCC and RCC flags](/images/Win平台编译SQLCipher/TCC_RCC_Flags.png)

向 _LTLIBPATHS_ 变量添加 _/LIBPATH:C:\dev\OpenSSL-Win64\lib /LIBPATH:C:\dev\OpenSSL-Win64\lib\VC_ ，并将 _capi.lib_、_padlock.lib_、_libcrypto.lib_、_libssl.lib_ 添加到 _LTLIBS_ 变量中。

注意，这些文件实际上就是刚刚安装的OpenSSL的库文件。如果你选择了其他路径去安装，请根据实际情况进行修改。

```
LTLIBPATHS = $(LTLIBPATHS) /LIBPATH:C:\dev\OpenSSL-Win64\lib /LIBPATH:C:\dev\OpenSSL-Win64\lib\VC
LTLIBS = $(LTLIBS) capi.lib padlock.lib libcrypto.lib libssl.lib
```

![LTLIBPATHS and LTLIBS OpenSSL libs](/images/Win平台编译SQLCipher/OpenSSL_Libs.png)

### 5. 修改名称

注意，此步骤是可选步骤，可以跳过此步骤直接编译得到默认名称（SQLite）的文件。

修改如下内容：

* SQLITE3DLL - 应改为sqlcipher

![Change DLL Name](/images/Win平台编译SQLCipher/Change_DLL_Name.png)

* SQLITE3LIB - 应改为sqlcipher

![Change Import Library Name](/images/Win平台编译SQLCipher/Change_Lib_Name.png)

* SQLITE3EXE - 应改为sqlcipher

![Change Shell Executable Name](/images/Win平台编译SQLCipher/Change_EXE_Name.png)

* SQLITE3EXEPDB - 应改为sqlcipher

![Change PDB Name](/images/Win平台编译SQLCipher/Change_PDB_Name.png)

* 最后，对该文件进行一次大小写敏感的全文检索，将sqlite3.def替换为sqlcipher3.def（应该找到5处）：

![Change .def file names](/images/Win平台编译SQLCipher/Change_DEFs.png)

### 6. 最终编译

在开始菜单查找并打开 _**x64** Native Tools Command Prompt for VS 2019_，切换到源码路径，建立一个新目录并在其中执行 _nmake_ 来编译SQLCipher：

```
mkdir compile
cd compile
nmake /f ..\Makefile.msc TOP=..\
```

之后就可以看到SQLCipher已经编译成功。 

![SQLCipher compile results](/images/Win平台编译SQLCipher/SQLCipherCompiled.png)

将 _libcrypto-1\_1-x64.dll_ 和 _libssl-1\_1-x64.dll_ 复制到输出目录以确保程序可以正常运行：

```
copy c:\dev\OpenSSL-Win64\*.dll .\
```

![Copy OpenSSL DLLs](/images/Win平台编译SQLCipher/Copy_OpenSSL_DLLs.png)

至此，SQLCipher已经可以正常使用了。

![Running SQLCipher](/images/Win平台编译SQLCipher/SQLCipherRunning.png)

![Runnig SQLCipher](/images/Win平台编译SQLCipher/Export.png)


**最后：**

**非常感谢SQLite社区、Zetetic公司及其社区将这些产品作为开源代码提供。**

**本文受[carlosbet](/images/Win平台编译SQLCipher/https://github.com/carlosbet/sqlcipher/wiki/Compiling)启发完成，图片均源自链接原文，在此对您的工作深表感谢。**