---
title: 安卓Parcel漏洞攻击案例分析
author: Francis Fu
categories: [安卓那点事儿]
date: 2023-03-09
lastmod: 2020-03-09
draft: false
---

本文旨在用通俗易懂的文字描述最近一段时间被爆出的“并夕夕”安卓版APP利用Parcel漏洞对用户进行攻击的原理和过程。
<!--more-->

{{< admonition type=warning title="省流" open=true >}}
*如果你正在使用安卓手机并安装了“并夕夕”，最好的处理方式是：1.立即卸载“并夕夕”；2.备份数据；3.刷机恢复至出厂设置；4.更新至安卓13。如果正在使用苹果手机则不受**本次**攻击影响。但是需要提醒的是：出轨只有零次和无数次。*
{{< /admonition >}}

## 1. 技术背景

安卓中一个核心的对象传递机制是 *Parcel* 。一个对象如果希望被通过 *Parcel* 进行传递，那么它需要定义 *readFromParcel* 和 *writeToParcel* 接口函数，并实现 *Parcelable* 接口。从理论上来讲，匹配序列化和反序列化函数应当是**自反等效**的，但系统ROM的开发者在编程过程中可能会出现不匹配的情况，例如写入的时候使用了*长整型变量*，读取的时候却使用了*整数型变量*。这类问题在运行过程中一般不会引起注意，也不会导致崩溃或错误，但在攻击者的精心布局下，却可最终利用 Settings和system_server进程，将这个微小的错误转化为 **LaunchAnyWhere** 提权。

安卓近年来累计已修复上百个这类漏洞，并在 Android 13 中对 Parcel 机制做了全面改革，彻底杜绝了大部分此类攻击。然而对于鸿蒙和绝大部分未升级到 Android 13 的设备和用户来说，他们仍处于危险之中。

近年来公布漏洞一览：

| 漏洞编号            | 序列化对象              | 公布时间    |
|----------------|---------------------------|---------|
| CVE-2017-0806  | GateKeeperResponse        | 2017.01  |
| CVE-2017-13286 | OutputConfiguration       | 2018.04 |
| CVE-2017-13287 | VerifyCredentialResponse  | 2018.04 |
| CVE-2017-13288 | PeriodicAdvertisingReport | 2018.04 |
| CVE-2017-13289 | ParcelableRttResults      | 2018.04 |
| CVE-2017-13311 | SparseMappingTable        | 2018.05 |
| CVE-2017-13315 | DcParamObject             | 2018.05 |
| CVE-2021-0970  | GpsNavigationMessage      | 2021.12 |

## 2. 邪恶行径

上述攻击所涉及的多个安卓漏洞目前已全部修复。但是在2022年，仍然有无良知名互联网厂商持续挖掘安卓OEM相关漏洞，在其公开发布的APP中实现对目前市场主流手机系统的漏洞攻击。该互联网厂商在自家看似无害的APP里，利用上文提到的安卓 Parcel 序列化与反序列化不匹配系列漏洞，结合“堆风水”(Bundle-FengShui)攻击技术，实现 0day/Nday攻击，从而绕过安卓系统校验，获取系统最高权限，通过APP实际控制了用户的整个手机系统。

在提权控制手机系统之后，该 APP 即开启了一系列的违规操作，绕过隐私合规监管，大肆收集用户的隐私信息，包括社交媒体账户资料、位置信息、WiFi 信息、基站信息甚至路由器信息等。

同时，该 APP 进一步使用的另一个黑客技术手段，是利用手机厂商 OEM 代码中导出的 root-path FileContentProvider， 进行 System App 和敏感系统应用文件读写，进而突破沙箱机制、绕开权限系统改写系统关键配置文件为自身进行后台保活，修改用户桌面配置隐藏自身或欺骗用户实现防卸载（假卸载）。此外，还进一步通过覆盖动态代码文件的方式劫持其他应用注入后门执行代码，进行更加隐蔽的长期后台驻留，甚至还实现了和间谍软件类似的遥控机制，通过远端“云控开关”控制非法行为的启动与暂停，来躲避实时检测。最终，该互联网厂商通过上述一系列隐蔽的黑客技术手段，在其合法 APP 的背后，达到了一系列目的：

* 隐蔽安装，提升装机量
* 修改系统自启动、关联启动设置
* 开启通知权限，监听通知内容
* 修改系统设置，使用户无法卸载
* 攻击竞争对手软件
* 窃取用户隐私敏感数据
* 逃避隐私合规监管

## 3. 攻击推演

>*鉴于6.50版本PDD软件已经移除了攻击代码，本文根据参考文献中案例分析，以6.49版APK安装包为基准。*

### 3.1 提权代码

解压apk文件，找到中提权代码所在的文件位置：

pinduoduo-6-49-0.zip\assets\component\com.xunmeng.pinduoduo.AliveBaseAbility.7z\com.xunmeng.pinduoduo.AliveBaseAbility\vmp_src\mw1.bin

该文件是一个加VMP壳的dex文件，脱壳后可还原出代码，其中包含针对不同手机厂商系统的多个用于提权的漏洞利用代码。此处不多赘述，毕竟提权只是它攻击的第一步。

### 3.2 恶意代码

提权后，根据检测到当前不同的手机型号和系统类型，动态下发dex文件进行恶意代码执行。参考文献链接中有包含所有下发的dex文件的Github仓库，可以使用[TTDeDroid](https://github.com/tp7309/TTDeDroid)直接打开查看源码进行分析。本文只对已解包分析明确，并对系统有较大危害的dex恶意代码进行罗列。

#### 3.2.1 监听通知


1. 95cd95ab4d694ad8bdf49f07e3599fb3.dex
   * 对象：小米手机
   * 功能：获取用户通知的标题；获取发生通知的 APP 包名；获取通知发送时间；获取通知的密钥和频道ID
   * 类名：com.google.android.sd.biz_dynamic_dex.xm_ntf_info.XMGetNtfInfoExecutor


2. 0fc0e98ac2e54bc29401efaddfc8ad7f.dex
   * 对象：小米手机
   * 功能：如检测到用户关闭PDD通知权限，则自动强制打开
   * 类名：com.google.android.sd.biz_dynamic_dex.xm_permission.XMPermissionExecutor

3. 2eb20dc580aaa5186ee4a4ceb2374669.dex
   * 对象：VIVO手机
   * 功能：如检测到用户关闭PDD通知权限，则自动强制打开
   * 类名：com.google.android.sd.biz_dynamic_dex.vivo_open_push.VivoOpenPushExecutor

4. 67c9e686004f45158e94002e8e781192.dex
   * 对象：OPPO手机
   * 功能：如检测到用户关闭PDD通知权限，则自动强制打开
   * 类名：com.google.android.sd.biz_dynamic_dex.oppo_notification_ut.OppoNotificationUTExecutor

5. a3937709-b9cc-48fd-8918-163c9cb7c2df.dex
   * 对象：华为手机
   * 功能：强制打开鸿蒙系统的通知监听权限
   * 类名：com.google.android.sd.biz_dynamic_dex.hw_notification_listener.HWNotificationListenerExecutor

6. 257682c986ab449ab9e7c8ae7682fa61.dex
   * 对象：华为手机
   * 功能：如检测到用户关闭PDD通知权限，则自动强制打开
   * 类名：com.google.android.sd.biz_dynamic_dex.hw_permission.HwPermissionExecutor


7. ab8ed4c3482c42a1b8baef558ee79deb.dex
    * 对象：所有安卓
    * 功能：实时监听并收集所有系统通知
    * 类名：com.google.android.sd.biz_dynamic_dex.ud_notification_listener.UdNotificationListenerExecutor

8. 4f260398-e9d1-4390-bbb9-eeb49c07bf3c.dex
    * 对象：所有安卓
    * 功能：实时监听并收集所有软件通知
    * 类名：com.google.android.sd.biz_dynamic_dex.notification_listener.NotificationListenerExecutor

#### 3.2.2 数据获取

1. 35604479f8854b5d90bc800e912034fc.dex
   * 类名 ：com.google.android.sd.biz_dynamic_dex.usage_event_all.UsageEventAllExecutor
2. b50477f70bd14479a50e6fa34e18b2a0.dex
   * 类名：com.google.android.sd.biz_dynamic_dex.usage_event.UsageEventExecutor

   * 对象：所有安卓
   * 功能：获取用户的使用手机的数据，如某个APP启动/关闭/挂起时间、后台服务变化、设置变化、熄屏亮屏、开关机等

#### 3.2.3 后台保活

1. e723d560-c2ee-461e-b2a1-96f85b614f2b.dex
   * 对象：所有安卓
   * 功能：获取自启动权限并设置自启动
   * 类名：com.google.android.sd.biz_dynamic_dex.oppo_boot_perm.OppoBootPermExecutor

2. 8b56d820-cac2-4ca0-8a3a-1083c5cca7ae.dex
   * 对象：VIVO手机
   * 功能：软件后台保活
   * 类名：com.google.android.sd.biz_dynamic_dex.vivo_association_start.VivoAssociationStartExecutor

3. 7c6e6702-e461-4315-8631-eee246aeba95.dex
   * 对象：华为手机
   * 功能：关闭华为耗电精灵
   * 类名：com.google.android.sd.biz_dynamic_dex.hw_hide_power_window.HidePowerWindowExecutor
  
#### 3.2.4 回滚卸载

1. d643e0f9a68342bc8403a69e7ee877a7.dex
    * 类名：com.google.android.sd.biz_dynamic_dex.vivo_rollback_uninstall.VivoRollbackUninstallExecutor
2. be7a2b643d7e8543f49994ffeb0ee0b6.dex
   * 类名：com.google.android.sd.biz_dynamic_dex.vivo_official_uninstall.OfficialUntiUninstallV3
3. 183bb87aa7d744a195741ce524577dd0.dex
   * 类名：com.google.android.sd.biz_dynamic_dex.vivo_official_uninstall.VivoOfficialUninstallExecutor
   * 对象：VIVO手机
   * 功能：检测到用户卸载APP之后，将回滚到某特定的预置版本

## 4. 应对策略

首先需要明确，Android 13中目前已经不存在可用的Parcel序列化与反序列化漏洞。其次。PDD版本6.50+中目前已经移除了恶意代码。此外，已经被恶意代码入侵的手机，卸载APP或者单纯更新系统并不能完全去除后门及漏洞利用代码段。

所以，如果手机不幸中招，首先应该卸载PDD软件。之后备份重要个人数据，备份好以后进行彻底刷机，利用Fastboot/Recovery模式全面格式化手机并重新刷入完整ROM包。如果硬件支持的话，尽可能使用Android 13。

## 参考文献
1. [「 深蓝洞察 」2022 年度最“不可赦”漏洞](https://mp.weixin.qq.com/s/P_EYQxOEupqdU0BJMRqWsw)
2. [dex文件源码分析](https://www.zhihu.com/question/587624599/answer/2927765317)
3. [davinci1010/pinduoduo_backdoor](https://github.com/davinci1010/pinduoduo_backdoor)