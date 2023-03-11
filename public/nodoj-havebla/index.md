# Nodoj Havebla


This webpage is basically based on the GitHub Repository: [V2RayAggregator](https://github.com/mahdibland/V2RayAggregator/). Thanks to the great efforts made by the authors and all of those who share the free nodes to everyone. They fight for the freedom and liberty. They are true warriors.

<!--more-->

The speed measurement function is implemented in the *GitHub Actions* environment using [LiteSpeedTest](https://github.com/xxf098/LiteSpeedTest), so there are many nodes in the United States, which cannot well represent the node availability in the domestic network environment.

## Instructions & Usage

### Tips

- Just import the following subscription link into the corresponding client.
- Use a client that atleast support SS + SSR + VMess + Trojan.
- Group 1: Public nodes that are stable to use and will be updated every 12 hours.
- Group 2: Some free airports only provide 1GB traffic or have limited time to use. These nodes will be updated every 2 hours. Set the auto-update option on your client to get fresh nodes when using them.
- If an IP is repeated more than once, it's usually because of the different ports.
- Depending on your internet provider and location, some nodes might not work.

### Ready to import

Nodes filtered using speedtest measurement will be stored in following files:  

* All Untested Nodes
  - [all_proxies](https://francisfu.com/nodes/all_proxies.yml)

* All Tested Nodes
  - [Clash](https://francisfu.com/nodes/clash_all.yml)
  - [Surge4](https://francisfu.com/nodes/surge_all.ini)

* Selected Tested Nodes
  - [Clash](https://francisfu.com/nodes/clash_part.yml)
  - [Surge4](https://francisfu.com/nodes/surge_part.ini)

### Manual Subs Conversion

If your client does not support the formats that provided here, use below services to convert them to your client format.

- [sub-web-modify](https://sub.v1.mk/)
- [bianyuan](https://bianyuan.xyz/)  

**Do not use these APIs for your personal airport subs! Please run the subconverter locally.**

If you don't like the groups and rules that are already set, you can simply use bianyuan API like this:  

```
https://pub-api-1.bianyuan.xyz/sub?target=(OutputFormat)&url=(SubUrl)&insert=false

For Example:
(OutputFormat) = clash
(SubUrl) = https://francisfu.com/nodes/nodes/G1B.txt

https://pub-api-1.bianyuan.xyz/sub?target=clash&url=https://francisfu.com/nodes/nodes/G1B.txt&insert=false

Now you can use the link above to import the subs into your client
```

## Softwares

| Platform | Recommended       | Alternatives                                    |
|----------|-------------------|-------------------------------------------------|
| IOS      | QuantumultX        | Shadowrocket/Loon/Surge                  |
| Android  | Surfboard         | Clash For Android/V2rayNg/Shadowrocket/SagerNet/Matsuri |
| Windows  | Clash For Windows | V2rayN/Nekoray/Qv2ray/WinXray                   |
| MacOS    | Clash For Windows | Qv2ray/Surge/ClashX/V2rayU                      |
| Linux    | Clash For Windows | Qv2ray                                          |


