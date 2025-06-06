# Docker助力本地环境搭建


我之前一直是在本机上搭建各种运行环境，包括VS、SQL SERVER、PHPStudy、NodeJS、Python等。听闻Docker for Windows现在已经很好用了，遂决定尝试一下，并将环境搭建和IDE配置流程在此做一记录。

<!--more-->

我涉及到迁移到Docker的环境主要是三个：SQL SERVER、LNMP和NodeJS。C#开发环境我最常用，而且跟VS深度绑定，必须在本机安装。Python本身比较精简，本地安装也很方便，就不迁移到Docker上去了。本机系统环境为：Windows11专业版 21H2 x64开启HyperV功能，i7-1185G7开启硬件虚拟化，16GB内存。

## 1. 安装Docker

首先在官网下载[Docker Desktop for Windows](https://www.docker.com/products/docker-desktop/)。Windows版的Docker支持两种后端技术方案：WSL2和HyperV。我个人建议使用WSL2作为后端。关于两种不同后端的系统要求和区别可以[参考这里](https://docs.docker.com/desktop/install/windows-install/)。下载的同时打开终端，依次输入下述两个指令：

```
wsl --install
wsl --update
```

安装并更新好WSL2后，打开安装包并安装Docker Desktop for Windows。安装好后，打开 *%UserProfile%/.docker/daemon.json* 文件，在最后追加下面一段：

```
"registry-mirrors": [
    "http://hub-mirror.c.163.com",
    "https://docker.mirrors.ustc.edu.cn",
    "https://registry.docker-cn.com"
  ]
```

更换为国内镜像源。找到 *%UserProfile%/.wslconfig* 文件，如没有此文件则需要建立一个，修改内容为：

```config
[wsl2]
processors=2
memory=4GB
swap=2GB
```

其中，processors是给虚拟机分配的核心数，默认和宿主机一样，这里我设置为两个（50%）。memory是虚拟机最大可以占用的内存，默认为50%总内存。我设置为4G（25%）。swap是虚拟机允许使用的最大交换空间，默认为25%总内存，我设置为2G（12.5%）。如果宿主机硬件资源丰富，也可以不设置这里。

之后就是双击启动Docker Desktop即可。

## 2. 安装SQL SERVER

在Docker Hub中可以找到SQL SERVER的[官方镜像](https://hub.docker.com/_/microsoft-mssql-server)。启动Docker后，在终端中依次使用如下命令拉取镜像并创建容器：

```
docker pull mcr.microsoft.com/mssql/server:2022-latest

docker run  -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=@Qwe1234" -p 1433:1433  --memory 2000M --name sqlserver -d mcr.microsoft.com/mssql/server:2022-latest
```

返回Docker Desktop中可以看到已经拉取好的镜像和运行中的容器，镜像总大小为1.6G。

使用SSMS连接时，服务器名为localhost，用户名sa，密码为上边设置的@Qwe1234。

## 3. 安装LNMP和NodeJS

在这里我用了整整3天的时间。最开始我试图从GitHub或者DockerHub上找到合适的镜像，但是事实上经过很多次尝试后，我发现没有能使我用得称心如意的。无奈之下，我只能自己编写Dockerfile进行搭建。由于是初次接触Docker，查找资料反复尝试花费了很多时间和精力。所幸，最终结果很不错，成功的完成了一个LNMP和NodeJS的集成开发环境。项目已经开源，可以通过下方链接查看源码或者拉取镜像：

* GitHub：https://github.com/francisafu/DockerLNMP
* DockerHub：https://hub.docker.com/r/francisafu/lnmp

镜像的具体参数和使用方法在ReadMe里都有进行详细阐述，在此就不过多赘述了。下文主要就PHP+XDebug环境配合IDEA+PHP插件进行开发做详细描述。网上很多文章提供的都是过时的信息，我自己在配置IDE的时候走了很多弯路，对配置过程做一个记录，也可以防止更多的人踩坑。

## 4. 配置IDEA

软件前提：

* IntelliJ IDEA Ultimate 2022.3.1
* 插件：PHP
* 插件：PHP Docker
* 插件：PHP Remote Interpreter
* 插件：Chinese ​(Simplified)​ Language Pack / 中文语言包

运行Docker Desktop，按照GitHub上的指示拉取镜像并启动容器。打开PHPStorm，载入项目，点击 **文件——设置** ，点击左侧的 **构建、执行、部署** 板块，点击 **Docker** 子版块，在右侧添加一个Docker进程。这一步除了起个名字外不需要任何设置，如添加成功，下方会提示“连接成功”。

![docker](/images/Docker助力本地环境搭建/docker.png)

之后展开左侧的 **语言和框架** 板块，点击 **PHP** 子版块，在右侧 **解释器** 处点击省略号，弹窗左上角点击加号，选择 **From Docker, Vagrant, VM, WSL, Remote** 。选择 **Docker** ，在服务器处选择刚刚建立的Docker进程，镜像名称下拉菜单里选择前面拉取的镜像，点击确定。经过程序分析，会自动显示镜像中的PHP解释器。

![dockercli](/images/Docker助力本地环境搭建/dockercli.png)

点击确定后返回上一级菜单，在右侧 **路径映射** 处点击文件夹图标，新增一个映射。由于在镜像中，web目录默认在/var/www下，我本地的路径是~/PHP，而项目目录结构是/test/index.php，所以我们要将本地的test目录映射到容器中（实际上默认已经是映射的，但是仍然需要在IDEA中手动配置一下）。

![pathmapping](/images/Docker助力本地环境搭建/pathmapping.png)

之后在左侧选择正下方的 **服务器** 板块，新建一台服务器，主机名为localhost，做好路径映射如图。

![server](/images/Docker助力本地环境搭建/server.png)

接再来在左侧点击PHP板块下方的 **调试** 板块（不展开），在上方 **预配置** 区域里，点击第三步中的红色小电话图标，点击后它将变为绿色，代表已经开始侦听PHP调试连接。这时再点击第一步中蓝色高亮的 **验证** 字样，选择第二项“本地Web服务器或共享文件夹”，路径默认为项目根目录，URL填写项目URL，在我这里是“localhost/test”，点击下方的 **验证** ，如验证通过可关闭此对话框并保存配置。

![verify](/images/Docker助力本地环境搭建/verify.png)

之后关闭设置窗口。在IDE主界面右上角 **当前文件** 处点击，选择 **编辑配置** ，加号新增配置，下拉列表中选择 **PHP网页** 。服务器选择前面设置好的，起始URL填写网站根路径，浏览器根据需要用来调试的浏览器进行选择。

![debug](/images/Docker助力本地环境搭建/debug.png)

最后一步，在需要用来调试的浏览器上安装[XDebug Helper](https://www.jetbrains.com/help/phpstorm/browser-debugging-extensions.html)插件，配置其idekey为“PHPSTORM”。

全部配置好之后，就愉快的开始调试了。我们先进行一个测试。下图中的源码，启动侦听后点击右上角绿色箭头，可以看到网页直接显示了，断点没有生效。

![code](/images/Docker助力本地环境搭建/code.png)

在浏览器插件中启动Debug选项，重新运行网页文件，可以看到断点中断成功，调试信息正确显示。

![breakpoint](/images/Docker助力本地环境搭建/breakpoint.png)


---

> 作者: [Francis Fu](https://francisfu.com/)  
> URL: https://francisfu.com/posts/docker%E5%8A%A9%E5%8A%9B%E6%9C%AC%E5%9C%B0%E7%8E%AF%E5%A2%83%E6%90%AD%E5%BB%BA/docker%E5%8A%A9%E5%8A%9B%E6%9C%AC%E5%9C%B0%E7%8E%AF%E5%A2%83%E6%90%AD%E5%BB%BA/  

