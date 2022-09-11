---
title: Hugo搭建静态页面及自动推送指南
toc: false
authors:
  - Francis Fu
series:
  - Hugo Manual
date: '2022-09-10'
math: true
draft: false
---

最近把个人主页从Statiq全面转移到Hugo上了。五年的时间内，从Hexo到Statiq再到Hugo，我尝试了不同的几种静态页面生成器。最终选择了Hugo也是因为感觉，它还是最方便好用的一种。在此记录一下Hugo的使用方式、我所选用的Anatole主题的搭建和配置，以及配合GitHub Webhook实现代码自动更新推送的流程。

<!--more-->

## 1. 项目搭建

[Hugo](https://gohugo.io/)是基于GoLang的静态页面生成器，以超高的渲染速度，超低的渲染负载著称。开发速度、更新迭代都非常快，各项功能支持也很广泛，堪称“下一代”静态页面生成器。下文中开发环境为Windows11 x64操作系统。

首先在[发布](https://github.com/gohugoio/hugo/releases)页面下载二进制预编译文件。

