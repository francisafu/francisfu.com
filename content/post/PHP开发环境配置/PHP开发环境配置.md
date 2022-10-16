---
title: PHP开发环境配置
toc: false
authors:
  - Francis Fu
date: '2022-10-15'
math: true
draft: false
---

最近因为手上的一些WEB项目，重新开始使用PHP进行开发。早年使用PHP时一般用XAMPP+VSCode配置简易环境，最近项目体量较大，再加上涉及到多版本切换问题，于是配置了一套PHPStorm+PHPStudy的开发环境，在此对配置过程进行记录。

<!--more-->

## 1. 演示环境

* Windows 11 专业版 21H2 x64
* [PHPStudy(小皮面板) 8.1.1.3](https://www.xp.cn/)
* [PHPStorm 2022.2.3](https://www.jetbrains.com/)
* PHP 7.4.3 nts
* XDebug 3.0.4

## 2. 软件安装

下载安装软件后设置好相关属性配置即可。启动服务器（我选择用Nginx），访问localhost，如出现PHPStudy界面，则一切正常。

之后，在PHPStudy安装目录下的WEB路径中建立站点文件夹，用来存放网站文件。对应站点链接为：localhost/路径名

![files](/images/PHP开发环境配置/files.png)

建议在WEB路径下存放一个phpinfo.php文件，内容为

```php
<?php
echo phpinfo();
```
通过localhost/phpinfo.php访问，用以查看当前环境的phpinfo。

再从[官网](https://www.phpmyadmin.net/)下载phpmyadmin，将放置在WEB路径中，通过localhost/phpmyadmin访问。如果是在开发环境，可以将`config.sample.inc.php`文件重命名为`config.inc.php`，并添加如下代码实现自动登录：

```php
$cfg['Servers'][$i]['auth_type'] = 'config';
$cfg['Servers'][$i]['host'] = '数据库服务器';
$cfg['Servers'][$i]['user'] = '数据库用户名';
$cfg['Servers'][$i]['password'] = '数据库密码';
```

之后在[官网](https://xdebug.org/)下载正确版本的XDebug，复制到PHPStudy对应的php-cli目录下的ext目录中，在php.ini文件后进行配置。

```
[Xdebug]
zend_extension=路径/php_xdebug.dll
xdebug.idekey = PHPSTORM
xdebug.mode = develop,debug
xdebug.discover_client_host=true
xdebug.remote_cookie_expire_time = 3600
xdebug.client_port=9000
xdebug.client_host="localhost"
xdebug.start_with_request=yes
xdebug.remote_handler = "dbgp"
xdebug.var_display_max_depth = 15
xdebug.var_display_max_data  = 2048
```

最后一步，在你需要调试的浏览器上安装[XDebug Helper](https://www.jetbrains.com/help/phpstorm/browser-debugging-extensions.html)插件，配置其idekey为“PHPSTORM”。

大功告成！重启WNMP环境！

## 3. 配置PHPStorm

打开PHPStorm并载入项目，点击 **文件——设置** ，点击左侧的 **PHP** 板块，设置对应的PHP版本和解释器。

![phpcli](/images/PHP开发环境配置/phpcli.png)

之后在左侧选择PHP板块下方的 **调试** 板块，将 **Xdebug——调试端口** 设置为“9000”。点击展开左侧调试板块，选择下方的 **DBGp代理** 板块，配置IDE键，主机和端口。上述信息需要与php.ini中的信息保持一致。

![dbgp](/images/PHP开发环境配置/dbgp.png)

最后选择左侧的 **服务器** 板块，点击加号添加一个服务器，名称随便起，主机填写PHPStudy站点根路径，点击 **应用——确定** 进行保存。

![server](/images/PHP开发环境配置/server.png)

接下来在菜单栏中依次展开 **工具——部署——配置** 点击加号新增服务器，选择 **本地或挂载文件夹** ，文件夹处选取项目目录，URL处填写站点地址，确定保存。

![deploy](/images/PHP开发环境配置/deploy.png)

然后在PHPStorm界面右上角 **当前文件** 处点击，选择 **编辑配置** ，加号新增配置，下拉列表中选择 **PHP网页** 。名称随便填，服务器选择前面设置好的，起始URL填写网站根路径，浏览器根据需要用来调试的浏览器进行选择。

![debug](/images/PHP开发环境配置/debug.png)

下方 **调试预配置** 区有个蓝色高亮的 **验证** 字样，点击它，在弹出的验证对话框中核对设置，无误点击 **验证** ，如验证通过可关闭此对话框并保存配置。

![verify](/images/PHP开发环境配置/verify.png)

全部配置好之后，打个断点测试一下，可以愉快的开始调试了！

![test](/images/PHP开发环境配置/test.png)

