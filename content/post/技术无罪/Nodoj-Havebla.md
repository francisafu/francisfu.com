---
title: Nodoj Havebla
toc: false
authors:
  - Francis Fu
series:
  - 技术无罪
date: '2023-02-04'
draft: false
---

## Introduction

This webpage is basically based on the GitHub Repository: [V2RayAggregator](https://github.com/mahdibland/V2RayAggregator/). Thanks to the great efforts made by the authors and all of those who share the free nodes to everyone. They fight for the freedom and liberty. They are true warriors.

The speed measurement function is implemented in the *GitHub Actions* environment using [LiteSpeedTest](https://github.com/xxf098/LiteSpeedTest), so there are many nodes in the United States, which cannot well represent the node availability in the domestic network environment.

## Instructions & Usage

### Tips

- Just import the following subscription link into the corresponding client.
- Use a client that atleast support SS + SSR + VMess + Trojan.
- Group 1: All filtered high speed nodes to use and will be updated every 2 hours.
- Group 2: Public nodes that are stable to use and will be updated every 12 hours.
- Group 3: Some free airports only provide 1GB traffic or have limited time to use. These nodes will be updated every 2 hours. Set the auto-update option on your client to get fresh nodes when using them.
- If an IP is repeated more than once, it's usually because of the different ports.
- Depending on your internet provider and location, some nodes might not work.

### Ready to import

Nodes filtered using speedtest measurement will be stored in following files:  

* Group 1 (High speed nodes)
  - [Base64](https://francisfu.com/nodes/nodes/G1B.txt)

* Group 2 (Contains free public nodes)
  - [Base64](https://francisfu.com/nodes/nodes/G2B.txt)
  - [Mixed](https://francisfu.com/nodes/nodes/G2M.txt)
  - [Clash](https://francisfu.com/nodes/nodes/G2C.txt)

* Group 3 (Contains only free airports)
  - [Base64](https://francisfu.com/nodes/nodes/G3B.txt)
  - [Mixed](https://francisfu.com/nodes/nodes/G3M.txt)
  - [Clash](https://francisfu.com/nodes/nodes/G3C.txt)

### Manual Subs Conversion

If your client does not support the formats that provided here, use below services to convert them to your client format.

- [sub-web-modify](https://sub.v1.mk/)
- [bianyuan](https://bianyuan.xyz/)  

{{< notice warning >}}
**Do not use these APIs for your personal airport subs! Please run the subconverter locally.**
{{< /notice >}}

If you don't like the groups and rules that are already set, you can simply use bianyuan API like this:  

```
https://pub-api-1.bianyuan.xyz/sub?target=(OutputFormat)&url=(SubUrl)&insert=false

For Example:
(OutputFormat) = clash
(SubUrl) = https://raw.githubusercontent.com/mahdibland/ShadowsocksAggregator/master/Eternity.yml

https://pub-api-1.bianyuan.xyz/sub?target=clash&url=https://raw.githubusercontent.com/mahdibland/ShadowsocksAggregator/master/Eternity.yml&insert=false

Now you can use the link above to import the subs into your client
```

## Softwares

### Best Clients For Each OS

|    OS   |              Best Client               | Alternatives |
|:-------:|:--------------------------------------:|:------------:|
|   IOS   |        Quantumult - Shadowrocket       |  NapsternetV |
| Android |      Surfboard - Clash For Android     |    V2rayNg   |
| Windows |   Clash For Windows - V2rayN - Nekoray |    Qv2ray    |
|  Linux  |           Clash For Windows            |    Qv2ray    |
|  MacOS  |           Clash For Windows            |    Qv2ray    |

### Desktop Clients

|                              MacOS                               |                              Linux                               |                                       Windows                                       | Brief description                                                                                         |
| :--------------------------------------------------------------: | :--------------------------------------------------------------: | :---------------------------------------------------------------------------------: | :----------------------------------------------------------------------------------------------- |
| [CFW](https://github.com/Fndroid/clash_for_windows_pkg/releases) | [CFW](https://github.com/Fndroid/clash_for_windows_pkg/releases) | [CFW](https://github.com/Fndroid/clash_for_windows_pkg/releases) | SS, SSR, Trojan, Vmess, VLESS protocol support, strong policy offload capability.                                         |
|       [Qv2ray](https://github.com/Qv2ray/Qv2ray/releases)        |       [Qv2ray](https://github.com/Qv2ray/Qv2ray/releases)        |                 [Qv2ray](https://github.com/Qv2ray/Qv2ray/releases)                 | SS, SSR, Trojan, Vmess, VLESS, Trojan-Go protocol support (relevant plugins need to be installed).                            |
|                                ×                                 |                                ×                                 |                 [V2rayN](https://github.com/2dust/v2rayN/releases)                  | SS, Trojan, Vmess, VLESS protocol support, with speed measurement, delay measurement function, support subscription, QR code, clipboard import and manual configuration.  |
|                                ×                                 |                                ×                                 |               [WinXray](https://github.com/TheMRLL/winxray/releases)                | SS, SSR, Trojan, Vmess, VLESS protocol support, support automatic connection to the fastest node.                                   |                                                                   |                                                               |
|                  [Surge](https://nssurge.com/)                   |                                ×                                 |                                          ×                                          | SS, Trojan, Vmess protocol support, well-known network debugging tools, powerful strategy offloading ability, need to pay.                         |
|     [ClashX](https://github.com/yichengchen/clashX/releases)     |                                ×                                 |                                          ×                                          | SS, SSR, Trojan, Vmess protocol support, occupy less resources.                                                  |
|        [V2rayU](https://github.com/yanue/V2rayU/releases)        |                                ×                                 |                                          ×                                          | SS, Trojan, Vmess protocol support, support subscription, QR code, clipboard import, manual configuration, QR code sharing, similar to V2RayN. |

### Mobile Clients

|                               iOS/iPadOS                                |                                      Android                                       | Brief description                                                                                                                                                  |
| :---------------------------------------------------------------------: | :--------------------------------------------------------------------------------: | --------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [Shadowrocket](https://apps.apple.com/us/app/shadowrocket/id932747118)  |  [Shadowrocket](https://play.google.com/store/apps/details?id=com.v2cross.proxy)   | SS, SSR, Trojan, Vmess, VLESS protocol support, the iOS side needs to be purchased in the non-country App Store, the US price is $2.99; the Android side is not the same author as the iOS side, does not support the SSR protocol, free and built-in free nodes. |
|                      [Surge](https://nssurge.com/)                      |                                         ×                                          | SS, Trojan, Vmess protocol support, well-known network debugging tools on the iOS side, chargeable.                                                                                              |
|                                    ×                                    |    [Surfboard](https://play.google.com/store/apps/details?id=com.getsurfboard)     | SS, SSR, Vmess Protocol support, Android network debugging software, compatible with Surge 2 configuration.                                                                                          |
|                                    ×                                    |    [CFA](https://github.com/Kr328/ClashForAndroid/releases)     | SS, SSR, Trojan, Vmess Protocol support.                                                                                                                         |
|                                    ×                                    |             [SagerNet](https://github.com/SagerNet/SagerNet/releases)              | SS, SSR, Trojan, Vmess, VLESS Protocol support.                                                                                                                  |
|                                    ×                                    |                [V2rayNG](https://github.com/2dust/v2rayNG/releases)                | SS, Trojan, Vmess, VLESS protocol support, v2ray kernel.                                                                                                           |
