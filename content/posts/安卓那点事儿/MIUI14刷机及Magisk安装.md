---
title: MIUI 14刷机及Magisk安装
author: Francis Fu
categories: [安卓那点事儿]
date: 2023-04-24
lastmod: 2023-04-24
draft: false
---

这两天休息在家，研究了一下小米MIUI 14刷机的方式，主要是结合Magisk模块安装和后续的一系列操作，在此作一简单记录。

<!--more-->

两年前我写了一篇魔趣ROM的刷机教程。两年后，「斯人已逝」，魔趣ROM官方停止了更新。国产第三方ROM的时代一去不返了，此后只能研究折腾官方ROM了。而夹带私货的官方ROM，无论选哪个，都是吃屎一般的感觉，只不过某些屎相比其他的，可能还稍微容易让人下咽一些。本文的环境是：**小米11，MIUI 14.0.8.0**。在工作开始之前，需要先了解一个概念：Virtual A/B Partition。

{{< admonition type=warning title="注意" open=true >}}
*如果在操作过程中遇到无法下载的情况，请考虑网络因素。*
{{< /admonition >}}

## 0.理论铺垫

安卓系统为智能手机的普及立下了汗马功劳，可是开源所导致的碎片化问题，一直是谷歌心中难以掩饰的痛。为了改变这一现状，谷歌进行了许多尝试，例如在An­droid 7.0引入的「A/​B 无缝系统更新」，An­droid 8.0时推出的「Pro­ject Tre­ble」，都是为了铺平无障碍更新系统的道路，减轻更新失败导致设备故障的风险，以便厂商可以更轻松地推送系统更新。

而在Android 11版本，谷歌使用了名为「vir­tual A/​B」的新分区，并将其率先使用在Pixel 5 上。「vir­tual A/​B」更新系统的方法与「A/​B」类似，核心功能也相同。在系统进行OTA更新时，如果更新失败，则会自动回滚到上一个系统，成功开机进入之后才会将新数据写入到系统中。且系统更新可在待机状态下完成，无需重启等待新数据写入，可谓是极大地改善了更新系统时的用户体验。只是「A/​B」需要准备两个相同的分区，会占用更多的存储空间，而「vir­tual A/​B」删除了「cache」和「re­cov­ery」分区，「sys­tem」分区只保留一个，以解决上述空间占用问题。

小米11也是使用的「vir­tual A/​B」的机型，这对玩家而言并不是什么好消息。因为「vir­tual A/​B」删除了「re­cov­ery」分区，没有了「re­cov­ery」分区就不能刷入第三方「re­cov­ery」。因此在 TWRP 官方解决为这类新分区方式刷入第三方 re­cov­ery 之前，我们只能使用其他方法来为诸如小米11的使用Virtual A/B分区手机进行刷机了。

当然本文的目的只是安装Magisk模块，相比于完整刷机，简单很多，风险也小不少。

Magisk是什么？百度给出的解释是：Magisk是一套用于定制Android的开源工具,支持高于 Android4.2的设备。涵盖了Android定制的基本部分:root、引导脚本、SELInux修补、移除AVB2.0/dm-verity/强制加密等。它是当前Android社区用来获取root权限的主流方式。同时，Magisk特殊的运作机制还赋予了它systemless的特质。systemless让Magisk一方面可以有针对性地隐藏root，甚至暂时隐藏Magisk本身。另一方面，挂载系统的存在，也让Magisk拥有了多样的模块化生态系统。

在玩家群体里，Magisk被称为「面具」，基本是「搞机达人」人手必备的强大工具。有了它，就可以轻松获取root权限，挂载强大的功能模块。

## 1.准备工作
刷机之前，请务必备份手机里所有重要的个人数据，包括但不限于：通讯录、照片、应用数据等。刷机过程中会清除全部个人数据，所以一定一定做好备份！

## 2.手机解锁
现在不少手机是锁BootLoader的，BootLoader对于嵌入式设备（如ARM架构）而言类似于PC设备的BIOS。出于对设备安全性的考虑，厂商会锁定BootLoader以防止恶意程序或者不法分子篡改。那么如果我们要更换操作系统，第一步就是需要解锁BootLoader。很多国产手机厂商已经不支持解锁BL了，不过小米截至目前都是允许的。小米手机的解锁请参考[这个页面](http://www.miui.com/unlock/download.html)，先下载手机解锁程序到电脑上，解压缩后，依次执行如下步骤：
1. 在电脑上打开小米手机解锁程序（miflash_unlock.exe）；
2. 同意条款，登录小米账户，进入待解锁界面；
3. 拿出手机，进入「设置 -> 我的设备 -> 全部参数」页面；
4. 这时连续点击MIUI版本号7次；
5. 直到手机屏幕提示已经处于开发者模式即可停止点击；
6. 进入「设置 -> 更多设置 -> 开发者选项 -> 设备解锁状态」中按照提示绑定账号和设备，新机可能需要连续绑定账号7天才能继续进行操作；
7. 手动进入Bootloader模式（先关机，然后同时按住开机键和音量下键，直到手机界面出现米兔画面和FASTBOOT字样）；
8. 通过USB将电脑连接手机，点击程序上的「解锁」按钮。
解锁过程中根据电脑情况可能会自动安装小米手机驱动，并且联网验证当前手机，所以需要保持电脑和手机的联网状态。另外，根据机型不同，程序会提示解锁操作是否会清空全部用户数据，请注意备份数据。  
解锁后手机会自动重启，如果解锁成功，在启动界面下方会出现一把打开的小锁头图标和「unlocked」字样。此时标志着解锁成功。

## 3.提取引导文件

Magisk模块的刷入需要通过修补系统引导文件「boot.img」的方式去完成，所以我们需要下载对应系统版本的线刷包，然后提取引导文件。小米的ROM可以在[这个网址](https://miuirom.org/)找到。搜索「mi 11」关键字后，找到对应的手机型号和系统版本，我使用的是国行14.0.8.0ROM，对应的在网站上名称是「MIUI China 14.0.8.0.TKBCNXM」。在下载链接处可以看到两个链接，分别是「Recovery」和「Fastboot」，前者是卡刷包，后者是线刷包。我们这里下载线刷包。下载好的文件解压缩后即可在根目录下找到boot.img文件，将他复制到手机中去。

## 4.安装Magisk

首先[在此处](https://github.com/topjohnwu/Magisk/releases)下载Magisk Man­ager安装并打开，目前最新版是v26.1。打开后右上角有一个「安装」，点击「选择并修补一个文件」，从文件管理器中选择刚才复制过来的boot.img文件。Magisk会自动修补它，并将修补好的文件放在 /Download 目录下，名为「magisk_patched_xxxxx.img」。将这个修补好的文件复制到电脑，为下一步刷入做准备。

在本文附件中下载[ADB工具箱]()并解压到电脑中，连接手机到电脑，在「开发者选项」中打开手机的「USB调试」功能。双击工具箱中的「打开CMD命令行.bat」，依次输入下述命令：

```shell
adb devices
```
该命令会成功列出当前adb设备，如果失败的话，可以检查驱动、数据线、电脑接口等，进行一一排查。

```shell
adb reboot bootloader
```
该命令会将手机重启到Fast­boot模式，然后就可以刷入打过补丁的boot.img了。由于修补过后的 magisk_patched_xxxxx.img名字每次都不一样，建议重命名为「magisk_patched.img」。由于是Virtual A/B分区方案，必须将两个分区中的引导文件全部修补才可以避免变砖。

```shell
fastboot flash boot_a magisk_patched.img
fastboot flash boot_b magisk_patched.img
```
刷入成功后，输入`fastboot reboot`命令重启手机，不出意外的话，再次打开Magisk就可以看到已经成功的激活了。

## 5.文件管理

root手机以后，我们需要在[这个链接](https://rootexplorer.co/)下载Root Explorer，也就是大名鼎鼎的RE文件管理器。再获取root权限后，它可以浏览整个手机的文件系统，为后续编辑系统核心目录文件做好铺垫。下载下来的是安卓apk程序包，直接打开安装即可。

安装好启动程序，在Magisk中可以看到它索取root权限，点击授权，即可正常访问所有目录。可以尝试访问 /data/adb 目录做测试，后续我们也会主要用到这个目录。

## 6.神隐土遁

由于Magisk模块是一种root的手段，如果不加以隐藏，将导致很多金融类APP和游戏类APP无法正常使用。金融类比如微信支付、支付宝、各种银行官方APP等，主要是基于防止资金被盗的考虑。游戏类比如王者荣耀、英雄联盟等，主要是基于防止外挂的考虑。这个时候就需要隐藏Magisk和root权限。首先是安装我们所需要的两个模块：自动神仙救砖、Shamiko和LSPosed。

「自动神仙救砖」模块是玩Magisk必刷的模块，而且是要第一个刷的。它可以在出现模块冲突导致死机变砖时，自动禁用所有模块并重启进入系统。类似于Windows的「安全模式」。由于是2021年发布于论坛的，官方链接已经早不可考，可以在[附件]()中下载。Magisk模块都是压缩包，下载后复制到手机上，从软件内部选择并安装即可。

「Shamiko」和「LSPosed」模块都可以在[这个链接](https://lsposed.org/)找到。在安装这两个模块之前，首先要在Magisk中开启Zygisk选项。这里需要插播一条理论介绍，关于什么是Zygisk。

### 6.1 Zygisk

Zygisk和曾经非常主流，但是现在已经被废弃的Riru一样，都是Zygote注入工具。那么Zygote是什么？在安卓中，负责孵化新进程的父进程叫做Zygote，安卓上的应用进程都是由Zygote进程孵化的。众所周知，安卓是Linux内核，安卓系统上运行的一切程序都是放在Dalvik虚拟机上的，Zygote也不例外。事实上，它是安卓系统运行的第一个Dalvik虚拟机进程，是由Linux内核启动的用户级进程Init所创建的。

那么Zygisk和Riru区别在哪？Riru是Magisk老版本内置的Zygote注入器，配合Magisk Hide功能，可以完美的将Magisk隐藏到Zygote进程中，防止被子级进程发现Magisk的存在。但是由于Magisk的核心开发者被谷歌「招安」，承诺不再提供隐蔽Magisk功能，Magisk Hide功能就被从v24版本中移除了。与之不同的是，Zygisk能为Magisk模块提供更深入、更强悍的核心修改能力。它有一个排除列表，可以撤销Magisk及模块所产生的所有更改。这样用户就能手动划定Magisk起作用的范围。但是，该功能跟Riru不同，不能避免root被检测到，没有任何隐藏作用。即使将某些程序加入排除列表，它们依旧可以发现Zygisk/Magisk的存在，只是模块对其无法生效而已。如果用户要隐藏root，只能借助其他方式，比如Shamiko。此外，Zygisk和Riru是无法共存的，当前版本Magisk中自带Zygisk，而且也是未来一段时间的主流Zygote注入解决方案。

启用Zygisk比较简单，打开Magisk，点击右上角的「设置」图标，选择「Zygisk」开关，打开它。重启手机后设置会生效。

### 6.2 隐藏Magisk

继续点击Magisk设置，找到「隐藏 Magisk 应用」选项，启用它，会弹出一个已经有默认名称「Settings」的对话框，此处可以随意输入想要伪装的名字。比如我们输入Yamato，一路点击确定后，会在桌面出现新生成的APP名为Yamato。这个APP没有图标，打开它会跳转至Magisk程序，并询问你是否创建一个容易识别的快捷方式。如果有需求，可以在桌面创建一个快捷方式。

### 6.3 Shamiko

完成隐藏Magisk并启用Zygisk后，我们就可以刷入Shamiko模块了。它的作用很简单，就是隐藏root。成功刷入并重启手机后，Shamiko模块会提示一个笑脸，并显示「Shamiko is working as blacklist mode」。这里需要指出，Shamiko默认工作在黑名单模式下，即对选定的APP隐藏root，未选定的一律不隐藏。黑名单的设置在Magisk设置中的「配置排除列表」中进行选定。需要注意的是，如果想要完整的屏蔽一个APP，必须**全部勾选**该APP的所有子进程，否则无法实现完全屏蔽。

不过，由于我手机中大部分程序是需要屏蔽的，我只对ADB调试程序和Root Explorer文件管理器开放root权限，所以白名单模式会更加适合我。白名单模式是，只对已经在Magisk中获取了root权限的程序（即「超级用户」列表下已经显示的程序）开放root权限，其余程序一律屏蔽。实际上，出于安全考虑，我个人也建议使用白名单模式。但是据称，白名单模式可能存在严重的性能和内存占用问题。具体使用哪一种模式，还需要用户自行体验感受。

切换白名单模式也很简单，打开RE浏览器，在 /data/adb/shamiko 目录下建立一个空的新文件，文件名为「whitelist」，无需重启即可切换Shamiko为白名单模式。回到Magisk中就可以看到Shamiko已经工作在白名单模式下了。白名单模式默认禁止授权新的root权限，如果有新的需要赋予root权限的APP，删除这个文件切回黑名单模式，赋予权限后再重建即可。

## 7. 外挂插件

说到外挂功能模块，那自然是要讨论LSPosed。这里还是要插播一条理论介绍，什么是LSPosed，它跟XPosed区别又在哪里？

根据百度，我们可以知道，XPosed框架(Xposed Framework)是一套开源的、在Android高权限模式下运行的框架服务，可以在不修改APK文件的情况下影响程序运行（修改系统）的框架服务，基于它可以制作出许多功能强大的模块，且在功能不冲突的情况下同时运作。换句话说，由于XPosed运行在root权限下，对于运行在常规权限下的其他APP来说，自然是降维打击。它为各种第三方插件的代码提供了一个高权限的容器，可以基于XPosed框架开发各种功能强大的插件。我们听说过或者使用过的一些微信自动抢红包、防撤回等插件，就都是运行在XPosed框架内的知名插件。

自原版Xposed框架为安卓平台的注入提供了统一规范以来，安卓搞机进入了一个全新的时代。而在时间变迁中，原版Xposed开发停止，新的框架逐渐接替其位置。EdXposed框架在高版本安卓上几乎完全取代了原版Xposed的地位。今天要说的LSPosed（又名「老色批」），则是基于EdXposed开发的半个新框架，它的出现主要由于EdXposed存在的以下现状：

1. EdXposed的主要维护者solohsu是一只老鸽子，喜欢咕咕咕，长期没有更新代码。
2. EdXposed在MlgmXyysd的主导下，倾向于保持与原版Xposed框架的兼容性和行为一致性，存在大量历史包袱。
3. EdXposed管理器没有很好地适应当前Xposed界的发展情况，允许用户进行一些可能给手机带来卡顿的操作。

LSPoesd针对这些问题作出了改进：1.拿出砍刀大砍特砍，无用的功能与代码统统砍掉，更精简的代码意味着更佳的性能表现。2.去掉了全局模式与黑白名单机制。在使用LSPosed时，必须针对各个插件选择该插件将会注入的应用，也就是其“作用域”。这样虽然引入了额外的操作，但有效防止了过多无用的注入引起的卡顿问题或隐私问题。换言之，LSPosed并未在原理上进行大的调整，重点在于引导用户「正确合法」地使用Xposed框架，确保Xposed框架和插件都不会做多余的事。同时，LSPosed还引入了新的Xposed API，允许插件自动告知管理器它所需要的作用域，无需手动设置。3.管理器不再作为单独app，成为SystemUI的一部分并通过拨号或者快捷方式启动。4.加入native层注入的支持（旧版Xposed模块通常只支持Java层注入）5.维护全新的Xposed模块仓库，取代XDA所维护的那个年久失修的仓库。

鉴于有如此多的优点和好处，我们自然要选择LSPosed框架。刷入Magisk并重启手机后，LSPosed即开始正常工作了。如果建立了桌面快捷方式，可以看到它是一个蓝色的X形创可贴。如果不小心忘记了建立，也可以在拨号界面输入「\*#\*#5776733#\*#\*」（即LSPOSED的九键数字）唤出LSPosed主界面。

LSPosed下，我最需要安装的是这个插件：[AntiAntiDefraud](https://github.com/MinaMichita/AntiAntiDefraud/releases)。自从MIUI 14后，小米在系统中加入了反诈模块，自动扫描手机中安装的软件包并上传至广东机房，同时将副本上传至腾讯天御安防系统。我个人非常反感这种泄露隐私的行为。MIUI届的大佬「MinaMichita」开发了这款XPosed插件，屏蔽上传链接，阻止列表上传。下载APK文件并安装后，在LSPosed中授权启用插件即可正常使用，日志中可以查看屏蔽器是否生效，具体可以参考Github上Readme文档中的说明。

## 8.Transparent Proxy

{{< admonition type=warning title="注意" open=true >}}
*此章节为高级用法，非专业人士请勿尝试。*
{{< /admonition >}}

This is the most important part of the whole article, about how to set up a transparent proxy with Magisk. While using proxies or VPNs, you may face some problems, like, you have to install some apks, or a VPN connection may show up in the notification bar and leave a record in your phone. This may cause great influence, you know what I mean. A transparent proxy is, as it's name, a proxy that no one can see, and will left almost nothing in your phone. I will show you how to do so.

First, download the Magisk module [box4magisk](https://github.com/CHIZI-0618/box4magisk/releases). I use the latest version (v4.6). Install the module in the Magisk. 

The module support mutiple core of 3rd generation proxies, such as: clash, clash.meta, sing-box, v2ray-core and Xray-core. Here I choose to use Clash. Then we need to download clash-core from [this link](https://github.com/Dreamacro/clash/releases/tag/premium). I choose the Premium version(clash-linux-armv7-2023.04.16.gz), which will support more functions. Unzip the file, extract the clash core and rename it into "clash", copy it into the phone and place it under /data/adb/box/bin/ .

Now you have to set up the proxy config file. I tried a lot here, the default version of config.yaml under clash folder have multiple bugs. Here is an example of config.yaml file content under the clash folder:

```yaml
mixed-port: 7890
redir-port: 7891
tproxy-port: 1536
allow-lan: true
mode: rule
geodata-mode: true
unified-delay: true
log-level: info
ipv6: false
external-controller: 127.0.0.1:9999
#external-ui: dashboard
secret: ""
enable-process: true
find-process-mode: strict
#tcp-concurrent: true
global-client-fingerprint: chrome

geox-url:
  geoip: "https://github.com/MetaCubeX/meta-rules-dat/releases/download/latest/geoip.dat"
  geosite: "https://github.com/MetaCubeX/meta-rules-dat/releases/download/latest/geosite.dat"
  mmdb: "https://github.com/MetaCubeX/meta-rules-dat/releases/download/latest/country.mmdb"

profile:
  store-selected: true
  store-fake-ip: true

sniffer:
  enable: false
  sniff:
    TLS:
      ports: [443, 8443]
    HTTP:
      ports: [80, 8080-8880]
      override-destination: true

tun:
  enable: false
  device: tun3
  stack: system
  inet6-address: 
  dns-hijack:
    - 'any:53'
  auto-route: true
  auto-detect-interface: true

dns:
  enable: true
  listen: 0.0.0.0:1053
  ipv6: false
  enhanced-mode: fake-ip
  fake-ip-range: 28.0.0.1/8
  default-nameserver: [223.5.5.5, 119.29.29.29]
  nameserver: ['https://doh.pub/dns-query', 'https://dns.alidns.com/dns-query']
  fallback: ['https://doh.dns.sb/dns-query', 'https://dns.cloudflare.com/dns-query', 'https://dns.twnic.tw/dns-query', 'tls://8.8.4.4:853']
  fallback-filter: { geoip: true, ipcidr: [240.0.0.0/4, 0.0.0.0/32] }
  
proxies:
p: &p
  {type: http, interval: 3600, health-check: {enable: true, url: https://www.gstatic.com/generate_204, interval: 300}}
pr: &pr
  {type: select, proxies: [PROXY, AUTO, DIRECT]}

u: &u
  type: select
  use:
  - provider1
  # - provider2

proxy-providers:
  provider1:
    <<: *p
    # url: "provider1 订阅链接"
    path: ./proxy_providers/provider1.yaml

  # provider2:
  #   <<: *p
  #   url: "provider2 订阅链接"
  #   path: ./proxy_providers/provider2.yaml

proxy-groups:

  - {name: PROXY, <<: *u}

  - {name: AUTO, <<: *u, tolerance: 2, type: url-test}

rule-providers:
  reject:
    type: http
    behavior: domain
    url: "https://cdn.jsdelivr.net/gh/Loyalsoldier/clash-rules@release/reject.txt"
    path: ./ruleset/reject.yaml
    interval: 86400

  google:
    type: http
    behavior: domain
    url: "https://cdn.jsdelivr.net/gh/Loyalsoldier/clash-rules@release/google.txt"
    path: ./ruleset/google.yaml
    interval: 86400

  proxy:
    type: http
    behavior: domain
    url: "https://cdn.jsdelivr.net/gh/Loyalsoldier/clash-rules@release/proxy.txt"
    path: ./ruleset/proxy.yaml
    interval: 86400

  direct:
    type: http
    behavior: domain
    url: "https://cdn.jsdelivr.net/gh/Loyalsoldier/clash-rules@release/direct.txt"
    path: ./ruleset/direct.yaml
    interval: 86400

  private:
    type: http
    behavior: domain
    url: "https://cdn.jsdelivr.net/gh/Loyalsoldier/clash-rules@release/private.txt"
    path: ./ruleset/private.yaml
    interval: 86400

  gfw:
    type: http
    behavior: domain
    url: "https://cdn.jsdelivr.net/gh/Loyalsoldier/clash-rules@release/gfw.txt"
    path: ./ruleset/gfw.yaml
    interval: 86400

  tld-not-cn:
    type: http
    behavior: domain
    url: "https://cdn.jsdelivr.net/gh/Loyalsoldier/clash-rules@release/tld-not-cn.txt"
    path: ./ruleset/tld-not-cn.yaml
    interval: 86400

  telegramcidr:
    type: http
    behavior: ipcidr
    url: "https://cdn.jsdelivr.net/gh/Loyalsoldier/clash-rules@release/telegramcidr.txt"
    path: ./ruleset/telegramcidr.yaml
    interval: 86400

  cncidr:
    type: http
    behavior: ipcidr
    url: "https://cdn.jsdelivr.net/gh/Loyalsoldier/clash-rules@release/cncidr.txt"
    path: ./ruleset/cncidr.yaml
    interval: 86400

  lancidr:
    type: http
    behavior: ipcidr
    url: "https://cdn.jsdelivr.net/gh/Loyalsoldier/clash-rules@release/lancidr.txt"
    path: ./ruleset/lancidr.yaml
    interval: 86400

  applications:
    type: http
    behavior: classical
    url: "https://cdn.jsdelivr.net/gh/Loyalsoldier/clash-rules@release/applications.txt"
    path: ./ruleset/applications.yaml
    interval: 86400

rules:
  - DOMAIN-SUFFIX,services.googleapis.cn,PROXY
  - DOMAIN-SUFFIX,googleapis.cn,PROXY
  - DOMAIN-SUFFIX,xn--ngstr-lra8j.com,PROXY
  - RULE-SET,applications,DIRECT
  - DOMAIN,clash.razord.top,DIRECT
  - DOMAIN,yacd.haishan.me,DIRECT
  - RULE-SET,private,DIRECT
  - RULE-SET,reject,REJECT
  - RULE-SET,google,PROXY
  - RULE-SET,proxy,PROXY
  - RULE-SET,direct,DIRECT
  - RULE-SET,lancidr,DIRECT
  - RULE-SET,cncidr,DIRECT
  - RULE-SET,telegramcidr,PROXY
  - GEOIP,LAN,DIRECT
  - GEOIP,CN,DIRECT
  - MATCH,PROXY
  ```

And you should set up a "provider1.yaml" file under /proxy_providers folder in the same directory, which contains all the proxies of this provider:

```yaml
proxies:
    - { your proxy one }
    - { your proxy two }
    ...
```

The final thing is to edit the file /data/adb/box/scripts/box.config . This file controls how module work. Commonly there are three ways: Blacklist, whitelist and all. By default, the module will work under "all" mode, which will tunnel all traffic from the phone to the proxy. However, if you want to tunnel some specific traffic only, use whitelist mode. Otherwise, if you want to un-tunnel some specific traffic, use blacklist mode. Like the Shamiko module, I only want to tunnel some specific traffic only, so I choose to use whitelist mode. Here is an example:

```shell
#!/system/bin/sh

bin_name="clash"

redir_port="7891"
tproxy_port="1536"
clash_dns_port="1053"
clash_dns_listen="0.0.0.0:${clash_dns_port}"
clash_fake_ip_range="28.0.0.1/8"
tun_device="tun0"

box_user_group="root:net_admin"
# If you want to change the user or group, you must make the Box core in the /system/bin directory, otherwise the changes will not take effect.
# If you are using Magisk, you can copy the Box core files (sing-box, clash, etc.) to /data/adb/modules/bin_files/system/bin/ and reboot the phone
bin_name_list=("sing-box" "clash" "xray" "v2ray")
box_path="/data/adb/box"
bin_path="${box_path}/bin/${bin_name}"
run_path="${box_path}/run"
pid_file="${run_path}/${bin_name}.pid"


intranet=(0.0.0.0/8 10.0.0.0/8 100.64.0.0/10 127.0.0.0/8 169.254.0.0/16 192.0.0.0/24 192.0.2.0/24 192.88.99.0/24 192.168.0.0/16 198.51.100.0/24 203.0.113.0/24 224.0.0.0/4 240.0.0.0/4 255.255.255.255/32)
intranet6=(::/128 ::1/128 ::ffff:0:0/96 100::/64 64:ff9b::/96 2001::/32 2001:10::/28 2001:20::/28 2001:db8::/32 2002::/16 fe80::/10 ff00::/8)

ipv6="disable"

proxy_method="TPROXY"
# REDIRECT: TCP only / TPROXY: TCP + UDP / MIXED: REDIRECT TCP + TUN UDP

proxy_mode="whitelist"
# blacklist / whitelist / core
user_packages_list=("0:com.google.android.gsf" "0:com.google.android.onetimeinitializer" "0:com.google.android.gms" "0:com.android.vending")
# Android User:Package Name, For example:
# user_packages_list=("0:com.android.captiveportallogin" "10:com.tencent.mm")

ap_list=("wlan+" "ap+" "rndis+")
ignore_out_list=()
```

Notice the line of "proxy_mode" and "user_packages_list". In this file, I proxied all the Google series app's traffic. You can add more apps in the same format: "user-id:package-name".

Therefore, when you finished all three config files, place them into the right place, restart the module, you can see from the log at /data/adb/box/run and check if your proxy works great.

## 9.结语

至此，小米11/MIUI 14刷机过程就全部结束了。希望国产ROM能有健康的发展，也期待有一天网络环境可以越来越好，个人隐私可以越来越安全。