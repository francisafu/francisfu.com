# AI板块使用说明


本文是关于网站AI板块的使用说明。

<!--more-->

细心的朋友（嗯，理论上应该是没有人）可能已经发现了，网站首页菜单栏上线了一个新的板块——“AI”。是的，早在两个月前这个板块就已经上线了，但是内容不完善，所以我没有特意发文讲解。现在三部分内容已经完备了，在此作一简单的使用说明。

# 1.ChatGPT

脱胎于Yidadaa大佬的项目[ChatGPT-Next-Web](https://github.com/Yidadaa/ChatGPT-Next-Web)，同样部署于Vercel上（这三项服务目前都在Vercel上部署），这是一个兼容ChatGPT类接口的GPT对话前端。使用方式很简单，我会一步一步介绍。

我个人推荐使用API2D提供的服务，我这个私有部署也是基于这项服务的。如果需要使用其他服务，如OpenAI官方接口，请使用其他部署。打开API2D的[官网](https://api2d.com/)，点击右上角的“登录·注册”并注册账号。

登入账号后，左侧“点数充值”这里可以进行充值。API2D采用P点进行计费，一个P点对应100个OpenAI GPT 3.5 模型的token。具体的计费规则参考“使用文档”中的“计费说明”。

![charge](/images/AI板块使用说明/充值.png)

充值后，在左侧“Forward Key”部分可以看到一个已经启用的密钥，点击复制它到剪切板。如果没有，请新建一个并复制。注意，这个密钥请务必收藏好，不能泄露给其他人使用。

![key](/images/AI板块使用说明/密钥.png)

打开网站AI板块的ChatGPT链接，你会看到这样的页面：

![cgpt](/images/AI板块使用说明/主页.png)

点击左下角齿轮形的设置图标，找到“API Key”这项设置，将刚刚复制的密钥粘贴进右侧的框框里。

![copy-key](/images/AI板块使用说明/粘贴密钥.png)

随后点击右上角的X形图标关闭设置页面返回对话主页，只要账号的余额点数够用，就可以和ChatGPT愉快的对话了！

![chat](/images/AI板块使用说明/对话.png)

其他的一些功能比如模型调整、预设对话、内置Prompts和“面具”，有兴趣的朋友们可以自行尝试，不过要注意余额哦。

# 2.Prompts List

AI板块的第二个功能是提示词列表。脱胎于rockbenben的项目[ChatGPT-Shortcut](https://github.com/rockbenben/ChatGPT-Shortcut)，截止目前已经收录了上百个有用的中英文双语提示词。使用AI对话工具，最重要的就是一个良好的提示词（也就是Prompt）。这个工具可以提供高质量的提示词合集供使用者选择和参考，非常便捷。使用起来也并不复杂，打开页面后，搜索、筛选、复制、粘贴，所有流程一目了然，清晰简洁。我自己也是这个项目的开发者之一，贡献了“AI”分类下的约20组提示词，做了一些尾小的工作。

# 3. Prompt Engineering Guide

AI板块的第三个功能是“提示工程指南”。脱胎于dair-ai爆火的万星项目[Prompt-Engineering-Guide](https://github.com/dair-ai/Prompt-Engineering-Guide)，这套指南非常全面完备的介绍了提示工程学的基础运用，如果能够全文参透，可以掌握大部分对话型AI的使用方式和变通方法，堪称AI利器。指南被译为包含中文在内的九种语言并且不断更新，建议对AI运用感兴趣的朋友可以深入学习一下。

以上就是当前网站AI板块所提供的三项服务的一个简短说明介绍，后续AI板块还可能会根据实际情况加入一些自部署AI模型，比如Stable Diffusion，SoVits 4.0等。具体部署方案有待我进一步考察学习，最关键的是集资筹款。毕竟目前GPU和显存算力的这个价格嘛...真的太不友好了。

---

> 作者: [Francis Fu](https://francisfu.com/)  
> URL: https://francisfu.com/ai%E6%9D%BF%E5%9D%97%E4%BD%BF%E7%94%A8%E8%AF%B4%E6%98%8E/  

