---
title: Teknologio Estas Senkulpa
toc: true
authors:
  - Francis Fu
tags:
categories:
series:
date: '2022-09-03'
draft: false
---

> He picked up the children's history book and looked at the portrait of Big Brother which formed its frontispiece. The hypnotic eyes gazed into his own. It was as though some huge force were pressing down upon you -- something that penetrated inside your skull, battering against your brain, frightening you out of your beliefs, persuading you, almost, to deny the evidence of your senses. In the end the Party would announce that two and two made five, and you would have to believe it.
>
> — <cite>George Orwell [^1]</cite>

[^1]: George Orwell -- [*1984* Part 1, Chapter 7](http://www.george-orwell.org/1984/6.html) 

## 0. Preface

Today I'd like to talk about the *Great Firewall (GFW)* of **Ethiopia**, the principles behind it, and the methods to bypass it. 

Planed in 1998 and established in 2002, the GFW Project was lead by Prof. Fang Binxing. Basically, it's an *Intrusion Prevention System*, combined with a *Detection-Attack Double Phase Model*.

Never underestimate the ability of the GFW Dept. Some people may wonder, if the GFW Dept is as powerful as others said, why they can still use their own way to go through it. Actually, in Ethiopia, all technologies should command by the politics, and serve for the politics. Though the GFW may have the ability to block some of the protocols, if they were not command to do so, they would not deploy those functions.

In **Ethiopia**, people use many different words to describe the fobidden action of bypassing the GFW. The most common used phase is "Climb the Wall". While some others may use "Study Abroad", or "Scientifically Surf". I myself would prefer to use the word "Magic", and I will use it to refer to the action mentioned above in the rest of this article.

So, the reason why I wrote this article is quite simple. As a developer, I have been using the magic surfing for decades. Of course I had a pretty nice magic ladder, however, there are two main problems to be solved: speed and flow. The maxium network speed of the ladder I used was 500kbps, plus it has 20Gb per month's maxium network flow limit. Definitely, when I used my cellphone and laptop to access magic, 20Gb is enough. However, I had just finished decorating my new house, and I plan to set up a Side Route to make all the devices, including TV and NAS, to be able to access magic. Thus, the network speed and flow limit are far not enough to supply so many devices and the same time.

Then I consider to set up my own magic ladder. After searched through the internet and tried some commonly used ways, I decided to write down my experience and share it with others. Anybody who needs to build their own, can refer to my article.

I will mainly forcus on free, opensource and multi-platforms supported tools and protocols that you can set up on your own server. Don't depend on the third party associations if you could, since they may scam your money, or not as stable as you expected.

Since the GFW possesses <abbr title="Advanced Deep Package Inspection">ADPI</abbr> technology, those tunnel we used should possesses the ability of *User Network Flow Camouflage*. Thus, I picked serveral qualified tunnels and listed below. Those tunnels are devided into three groups by the techonology behind them.

## 1. Theory Introduction

### 1.1 VPNs

VPN, the abbreviation of *Virtual Private Network*, was commonly used world wide to traverse NAT or protect oneself when surfing the internet. Otherwise, it can also used as a kind of magic ladder. 

#### 1.1.1 IKEv2

[IKEv2](https://github.com/strongswan/strongswan), also known as the "Internet Key Exchange v2", is based on IPSec tunnel protocol. Jointly developed by Microsoft and Cisco, it has been merged into windows 7 and above as a built in function.

IKEv2 has a very practical automatic reconnection feature. When the user temporarily loses the Internet connection, it will automatically re-establish the VPN connection after re-gain the Internet.

* Pros
  * It is faster than PPTP and L2TP, and does not involve overhead on <abbr title="Point-to-Point Protocols">PPP</abbr>
  * Stable, especially when switching networks or reconnecting after a short time of network connection loss
  * Highly security. It supports AES-128, AES-192, AES-256 and 3DES encryption algorithms
  * Easy to install and configure on the client side
* Cons
  * Setting up IKEv2 on the server is really difficult, which is also the hidden danger of many problems

#### 1.1.2 OpenVPN

[OpenVPN](https://github.com/OpenVPN/openvpn) uses OpenSSL library and SSL v3 / TLS v1 protocol to provide a powerful and reliable VPN solution by integrating with other technologies.

* Pros
  * Highly configurable
  * Highly Security (if <abbr title="Perfect Forward Secrecy">PFS</abbr> is used, it would be even safe for <abbr title="National Security Agency">NSA</abbr>)
  * Firewall (normal) bypassing
  * Multiple encryption algorithms
* Cons
  * Third party software is required
  * Although efforts are being made to improve the support for mobile devices, it's still not as perfect as desktop devices

#### 1.1.3 OpenConnect

OpenConnect, or we can also call it [ocserv](https://gitlab.com/openconnect/ocserv), is a compatible server of Cisco Anyconnect. Anyconnect is a Cisco proprietary technology, and its server can only run on Cisco devices. OpenConnect solves this problem. Its goal is to run a server compatible with AnyConnect protocol on relatively Linux devices, so people can use the protocol without buying Cisco devices.
Since many multinational companies use Cisco AnyConnect to build their private network,blocking AnyConnect will have disastrous consequences. Therefore, although the handshake feature of AnyConnect is quite obvious, it can still be used normally. However, it's said that nowadays, the GFW is able to identify OpenConnect from AnyConnect, then you may still have the chance to be banned. 

* Pros
  * Can be pretend as normal enterprise tunnel
* Cons
  * Hard to set up
  * probably be blocked

#### 1.1.4 Tinc

Well, actually I don't know why I wrote [Tinc](https://github.com/gsliepen/tinc) here. It's mainly used to set up a private tunnel to traverse NAT or build up personal virtual LAN. However, I found an [article](http://blog.emzee.be/posts/fuck-games-for-windows-via-tinc/) of how to set up Tinc as magic ladder. Since there's not many people to do so, I thought it would probably be a nice approach and may worth a try (though it's so difficult to set everythings up). Link is given above, you can take a look by yourself.
* No Pros and Cons, since I never tried this.


### 1.2 Proxies

A proxy server is a server application that acts as an intermediary between a client requesting a resource and the server providing that resource. Normally, proxies lack encryption, and that’s what differentiates a VPN and a proxy.

#### 1.2.1 SOCKS

When talk about proxies, you cannot avoid saying anything about SOCKS, especially SOCKS5.

SOCKS, which stands for Socket Secure, is an Internet protocol that exchanges network packets between a client and server through a proxy server. Practically, a SOCKS server proxies TCP connections to an arbitrary IP address, and provides a means for UDP packets to be forwarded. As a protocol defined in RFC 1928, SOCKS5 is an incompatible extension of the SOCKS4 protocol; it offers more choices for authentication and adds support for IPv6 and UDP, the latter of which can be used for DNS lookups.

##### 1.2.1.1 ShadowSocks

Socks5 born the **MOST FAMOUS** magic ladder -- ShadowSocks(SS). Created in 2012,  ShadowSocks is not a proxy on its own, but (typically) is the client software to help connect to a third-party Socks5 proxy, which is similar to an SSH tunnel. Once connected, internet traffic can then be directed through the proxy. Unlike an SSH tunnel, ShadowSocks can also proxy UDP traffic.

ShadowSocks was once most commonly used tool, until August 2015, the creator was *invited to have a cup of tea* by the **Ethiopia** police, and all the source code of ShadowSocks were removed from github.

##### 1.2.1.2 ShadowSocksR

After the SS project stopped, another developer claims that SS is easy to be detected by GFW, so improvements have been made in terms of confusion and protocol, making it harder to detect, and fully compatible with SS. The improved project is called [ShadowSocksR(SSR)](https://github.com/ShadowsocksR-Live/shadowsocksr).

Well, nowadays, it seems no differnces between the SS and the SSR. In the massacre of magic ladder each year when holding **the Great Meetings in Ethiopia**, the victims are mainly use SS or SSR proxies.

##### 1.2.1.3 SSRoT

Forked from the original SSR, yet another developer take over senior's work. First developed in 2019, [SSRoT](https://github.com/ShadowsocksR-Live/shadowsocksr-native) focus on the network traffic of "SSR over TLS". It has been proved that this is probably the only SOCKS plan that still alive currently, and pretty worth a try.

##### 1.2.1.4 Other SOCKS Implementions

Besides all those ShadowSocks-like plans, there are some other implemetion of SOCKS proxy, such as [Daze](https://github.com/mohanson/daze), [Brook](https://github.com/txthinking/brook), and [Lightsocks](https://github.com/gwuhaolin/lightsocks).

All these plans are proved to be killed when **the Great Meetings** held. You can have a try if you really curious about them. Since they are still in active development, so there's may be a chance to success. Note that all technologies based on the SOCKS proxy without encryption and obfuscation, are not stable and quite danger, due to the recognition algorithm of GFW.


#### 1.2.2 V2Ray & Trojan & XRay

After ShadowSocks been blocked by the GFW, a developer called "Victoria Raymond" created another great magic ladder in 2015, and named it "V2Ray". Afterwards, he build up a *HUGE* environment consists of a set of tools surrounding it, called "[Project V](https://www.v2ray.com/)". Nevertheless, after two years of active maintained, Victoria Raymond disappeared. Nobody could find him anymore, just like Satoshi Nakamoto. So other people forked his code and rebuild his *empire*, thus we have the brand new "[Project V](https://www.v2fly.org/)", and the core project is called "V2Fly".

##### 1.2.2.1 VMess & VMessAEAD

When we talk about V2Ray, we always refer to the VMess Protocol. [VMess](https://github.com/v2fly/v2ray-core), the first original protocol designed by V2Ray, is a protocol based on TCP. All data was transmitted by TCP. It's a stateless protocol, that is, the client and the server can directly transmit data without handshaking, and each data transmission has no impact on other data transmissions before it or after it. The client of VMess initiates a request, and the server determines whether the request comes from a legitimate client. If the verification passes, the request is forwarded and the obtained response is sent back to the client. VMess uses an asymmetric format, that is, the request sent by the client and the response from the server use different formats.

VMess has the built in function of obfuscation and encryption. So the security of it is indisputable. However, is't not unbreakable -- by [Replay-Attack](https://github.com/v2ray/v2ray-core/issues/2523), GFW can accurately determine whether it is a VMess service. The damage of this event to VMess is fatal, so VMessAEAD was born later.

Another problem is, VMess' data is not masqueraded, so it's still possible to identify it. Therefore, VMess protocol is usually used with some camouflage methods such as "V2Ray + WS + TLS + CDN" and "V2ray + HTTP2 + TLS + CDN", etc.

##### 1.2.2.2 Trojan & Trojan-Go

The design of VMess itself focuses on safety. On the premise of ensuring safety, people has a higher pursuit of speed and performance. So another tool with a new design idea came into view: Trojan.

[Trojan](https://github.com/trojan-gfw/trojan) can be considered as a simplified version of V2Ray's "WS + TLS" mode. It is faster than V2Ray, and its camouflage is more realistic than V2Ray,which made GFW more difficult to recognize.

Trojan disguises data as normal HTTPS communication by listening to port 443, and truly completes the TLS handshake to trick GFW into thinking it's HTTPS, so that it will not be recognized. Trojan processes HTTPS requests from the outside. If it's legal, Trojan provides services for the requests. Otherwise, Trojan forwards the traffic to caddy, nginx or other web servers, and they will provide web services for them. Based on the whole interaction process, this can make your VPS more like a normal web server, because all the behaviors of Trojan are consistent with those web servers, no additional features are introduced, thus achieve the effect of being difficult to identify.

[Trojan-Go](https://github.com/p4gefau1t/trojan-go) is a Trojan implemented using Go, which is functionally a superset of Trojan. Compared with the original Trojan, Trojan-Go has some more functions, such as: multiplexing (SMUX) to reduce delay, improve concurrency performance, CDN traffic transfer, etc.

##### 1.2.2.3 VLess(TLS)

Since Trojan's idea is feasible, why add a layer of custom encryption protocols such as VMess to TLS? Double safety insurances is unnecessary for most users and may cost performance loss. So VLess protocol came into being.

The major differences between VLess and VMess are as follows:
* VLess does not depend on system time
* VLess does not have encryption, TLS and other encryptions should be used
* VLess supports streaming and fallback, which is more concise, efficient and secure than nginx streaming forwarding
* When using TLS, VLess is faster and has better performance than VMess, since VLess doesn't encrypt and decrypt data
* V2Fly officials have higher expectations and stricter restrictions on VLess
* VLess is more flexible in encryption and is not as highly coupled as VMess

##### 1.2.2.4 XRay

So, as you can see above, VLess protocol needs TLS. A brilliant developer called RPRX, creatively come up an idea -- why not use it to hide the data, so that we do not need encryption and decryption anymore?

Then we have the great protocol -- XTLS.When using TLS proxy, HTTPS data actually goes through two layers of TLS: the outer layer is the proxy TLS, and the inner layer is the HTTPS TLS. XTLS seamlessly splices these two genuine TLS, so that the agent hardly needs to encrypt and decrypt HTTPS traffic, only plays the role of traffic transition, so that greatly improves performance.

The XTLS protocol also comes from the V2Fly community, however, because of the [license problem](https://github.com/XTLS/Go/issues/9), it has been removed from v2ray-core since 4.33.0. Finally, RPRX independently established XRay community, and named it ["Project X"](https://xtls.github.io/). In short, XRay is a branch of V2Ray and a superset of V2Ray. Moreover, XRay has better performance, faster speed and more frequent update iterations. Whether XTLS is natively supported is one of the biggest differences between XRay and V2Ray.

Combined VLess TLS and XTLS, there are a few ways to build the tunnel:
* VLess + TCP + TLS
* VLess + TCP + TLS + WS
* VLess + TCP + XTLS
* VLess + HTTP2 + h2c

Among all these above, the most suggested way currently is definetely VLess+TCP+XTLS.

#### 1.2.3 HTTP Proxy

There is only one HTTP proxy I would like to mention here, [GoFlyway](https://github.com/coyove/goflyway). It uses pure HTTP POST requests to relay TCP connections. There is no connect involved nor needed because GoFlyway is designed mainly for those people who are behind a connect-less HTTP proxy or want to accelerate connections through static CDNs. Some people proved it work well, while some others report their server ip get blocked. Since it was last updated in Feburary 2020, I'm not sure it's still work now.

### 1.3 Commercial Plans

Well, actually I don't wanna talk a lot about those commercial plans. But there are two I have to mention here, [Lantern](https://getlantern.org/) and [Psiphon](https://psiphon.ca/). They are all very popular when came out, and soon being blocked by the GFW. *VERY SOON.* Besides, at first they are all free and opensource. After being blocked, they became commercial plans. Obviously, they are weapons of hostile forces abroad, and what's more, they failed. LOL.

## 2. Test and Comparison

In this section, I will show you the performance test result of IKEv2, OpenVPN, SSRoT, Trojan-Go and XRay. These are the most common use and proved to be available and stable plans.