---
title: Hugo搭建静态页面及自动推送指南
author: Francis Fu
categories: [Hugo静态页面生成器指南]
date: 2022-09-10
lastmod: 2023-03-10
draft: false
---

最近把个人主页从Statiq全面转移到Hugo上了。五年的时间内，从Hexo到Statiq再到Hugo，我尝试了不同的几种静态页面生成器。最终选择了Hugo也是因为感觉，它还是最方便好用的一种。在此记录一下Hugo的使用方式、我所选用的FixIt主题的搭建和配置，以及配合GitHub Webhook实现代码自动更新推送的流程。

<!--more-->

## 1. 项目搭建

[Hugo](https://gohugo.io/)是基于GoLang的静态页面生成器，以超高的渲染速度，超低的渲染负载著称。开发速度、更新迭代都非常快，各项功能支持也很广泛，堪称“下一代”静态页面生成器。下文中开发环境为Windows11 x64操作系统，VSCode编辑器。

首先在[发布](https://github.com/gohugoio/hugo/releases)页面下载二进制预编译文件，然后将解压后的*hugo.exe*放在你喜欢的目录里。我放在了*C:\Program Files\hugo*目录下。

打开「开始->设置->系统->高级系统设置->环境变量」，在「用户变量->Path」下加入存放Hugo可执行文件的目录。终端测试命令`hugo version`，如能够正确显示版本号，则可以进入下一步。

在代码编辑器中导航至想存放项目文件的目录中，使用命令
```bash
hugo new site your_project_name
```
建立项目文件夹，并初始化项目。

之后，从FixIt主题的[Github仓库](https://github.com/hugo-fixit/FixIt)下载全部文件，复制到本地项目的*themes/anatole/*目录中。再将主题文件夹中的*exampleSite/config*目录及内容拷贝到项目根目录下，并删除原项目自带的`config.toml`文件。至此，所有基本环境已经搭建完成。

FixIt主题的配置可以参考[官方文档](https://fixit.lruihao.cn/zh-cn/categories/documentation/)，整体较为简单，并且主题随带的默认配置已经很合适了。主题中包含大量支持自定义的元素，可以根据需求自行调整。

## 2. 版本管理

建立好项目以后，就可以在项目目录下的*content*目录中进行写作了。如果掌握不好写作的格式要求，可以将*themes/anatole/exampleSite/content*目录下的内容拷贝到项目*content*目录中，这些示例文档都是可以参考的案例。Markdown语法部分也可以参考我在这个系列中的第二篇文章——[Hugo/FixIt语法参考](/posts/hugo静态页面生成器指南/hugo-fixit语法参考/)。

文章编写完成后，终端中使用命令`hugo serve`可以在*localhost:1313*进行预览，此模式下支持热编辑。如渲染效果满意，使用命令`hugo`可以进行渲染生成。常用命令如下：

```bash
hugo serve # 预览网页
hogo serve -e production # 以生产环境预览网页
hugo serve --disableFastRender # 预览时关闭快速渲染，重新完整渲染改动页面
hugo serve --cleanDestinationDir # 清除预览目录中的多余页面
hugo # 渲染输出
hugo --cleanDestinationDir # 清除输出目录中的多余页面
```

渲染输出到*public*目录后就可以推送到Git了。这部分本不想着墨太多，但考虑到我自己有时候也经常忘记如何使用Git，写在这里权当给自己一个Reminder了。

以GitHub为例，安装完[Git](https://git-scm.com/)后首先是本地Git用户信息配置并生成SSH密钥：

```bash
git config user.name "yourname"
git config user.email "your_email@youremail.com"
ssh-keygen -t rsa -C "your_email@youremail.com"
```

然后将.ssh/id_rsa.pub中的内容复制粘贴到GitHub 「Settings->SSH and GPG keys->New SSH key」处。

验证连接：`ssh -T git@github.com`

连接成功后，在远程创建与本地项目目录同名的仓库。本地目录下初始化Git：`git init`

然后将本地目录连接远程仓库：

```bash
git remote add origin git@github.com:xxx.git #推荐，SSH方式
git remote add origin https:xxx.git #HTTPS方式
```
最后同步仓库：
```bash
# 若远程仓库有文件：
git pull origin main

# 若远程仓库为空：
git commit -m "comment"
git push origin main
``` 

## 3. 自动拉取

配置好Git后，可以开始进行服务器上的设置，以完成每次更新推送到Github都可以自动拉取文件，不需要手动同步服务器文件了。

服务器以使用[宝塔面板](https://www.bt.cn/new/index.html)为例，运行环境是Ubuntu 20.04LTS。

首先安装并配置Git：

```bash
sudo apt install git
git config --global user.name "yourname"
git config --global user.email "your_email@youremail.com"
sudo ssh-keygen -t rsa -C "xxxxx@xxxxx.com"
sudo cat /root/.ssh/id_rsa.pub
# 复制密钥并粘贴到GitHub
sudo -u root ssh -T git@github.com
```
之后登录宝塔面板，在「软件商店->宝塔插件」处搜索并安装**宝塔WebHook**。添加到主面板后，在主面板点击它，新建一个WebHook。这里需要注意，和常见的接收到信息后拉取同步整个仓库不同的是，Hugo渲染输出页面只存在于仓库的*public*路径下，所以我们需要设置为只同步该路径下的内容，其余文件不需要同步。具体配置代码如下：

```bash
#! /bin/bash
echo ""
# 输出当前时间
date --date='0 days ago' "+%Y-%m-%d %H:%M:%S"
echo "-------开始-------"
# 服务器项目存放路径
gitPath="/www/wwwroot/your_file_path"
# 此处不要用HTTPS地址，使用SSH地址
gitHttp="git@github.com:your_repository_path"
echo "Web站点路径：$gitPath"
sudo rm -rf $gitPath
mkdir $gitPath
cd $gitPath
#判断是否存在git目录
if [ ! -d ".git" ]; then
  echo "在该目录下克隆git"
  sudo git clone $gitHttp gittemp
  sudo mv gittemp/.git .
  sudo rm -rf gittemp
fi
echo "拉取最新的项目文件"
# 设置部分拉取
sudo git config core.sparsecheckout true
sudo echo public/ >> .git/info/sparse-checkout
# 拉取最新的项目文件
git reset --hard origin/main
sudo git pull 
# 移动文件
sudo mv $gitPath/public/* $gitPath/
sudo rm -rf $gitPath/public
echo "-----拉取成功-----"
exit
```

设置好后保存，在WebHook右侧点击“测试”，可以在“日志”中查看代码执行情况。如果一切正常，那么点击“查看密钥”处可以看到密钥，复制它。来到GitHub仓库，在仓库设置的左侧有一个“Webhooks”选项卡，点击它，添加一个Webhook，在Payload URL处填写：
```
https://宝塔面板地址/hook?access_key=复制的密钥
```
Content Type选择“application/json”，SSL verification根据情况设置，其他不要改动，保存Webhook。

接下来就是更新本地代码，推送到GitHub上，然后查看自动拉取情况了。
