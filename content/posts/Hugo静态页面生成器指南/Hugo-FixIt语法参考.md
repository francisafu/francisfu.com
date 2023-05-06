---
title: Hugo/FixIt语法参考
author: Francis Fu
categories: [Hugo静态页面生成器指南]
date: 2022-09-09
lastmod: 2023-03-10
draft: false
---

此文章系Hugo以及FixIt主题所支持的Markdown语法规则参考及演示

<!--more-->

## 0 摘要

使用如下代码进行手动摘要分割：

```markdown
<!--more-->
```

## 1 标题

从 `h2` 到 `h6` 的标题在每个级别上都加上一个 `＃`:

```markdown
## h2 标题
### h3 标题
#### h4 标题
##### h5 标题
###### h6 标题
```

输出的 HTML 看起来像这样:

```html
<h2>h2 标题</h2>
<h3>h3 标题</h3>
<h4>h4 标题</h4>
<h5>h5 标题</h5>
<h6>h6 标题</h6>
```

{{< admonition note "标题 ID" >}}
要添加自定义标题 ID, 请在与标题相同的行中将自定义 ID 放在花括号中:

```markdown
### 一个很棒的标题 {#custom-id}
```

输出的 HTML 看起来像这样:

```html
<h3 id="custom-id">一个很棒的标题</h3>
```
{{< /admonition >}}

## 2 注释

注释是和 HTML 兼容的：

```html
<!--
这是一段注释
-->
```

**不能**看到以下的注释:

<!--
这是一段注释
-->

## 3 水平线

HTML 中的 `<hr>` 标签是用来在段落元素之间创建一个 "专题间隔" 的.
使用 Markdown, 你可以用以下方式创建一个 `<hr>` 标签:

* `___`: 三个连续的下划线
* `---`: 三个连续的破折号
* `***`: 三个连续的星号

呈现的输出效果如下:

___
---
***

## 4 段落

按照纯文本的方式书写段落, 纯文本在呈现的 HTML 中将用 `<p>`/`</p>` 标签包裹.

如下段落:

```markdown
Lorem ipsum dolor sit amet, graecis denique ei vel, at duo primis mandamus. Et legere ocurreret pri,
animal tacimates complectitur ad cum. Cu eum inermis inimicus efficiendi. Labore officiis his ex,
soluta officiis concludaturque ei qui, vide sensibus vim ad.
```

输出的 HTML 看起来像这样:

```html
<p>Lorem ipsum dolor sit amet, graecis denique ei vel, at duo primis mandamus. Et legere ocurreret pri, animal tacimates complectitur ad cum. Cu eum inermis inimicus efficiendi. Labore officiis his ex, soluta officiis concludaturque ei qui, vide sensibus vim ad.</p>
```

可以使用一个空白行进行**换行**.

## 5 内联 HTML 元素

如果你需要某个 HTML 标签 (带有一个类), 则可以简单地像这样使用:

```html
Markdown 格式的段落.

<div class="class">
    这是 <b>HTML</b>
</div>

Markdown 格式的段落.
```

## 6 强调

### 加粗

用于强调带有较粗字体的文本片段.

以下文本片段会被 **渲染为粗体**.

```markdown
**渲染为粗体**
__渲染为粗体__
```

输出的 HTML 看起来像这样:

```html
<strong>渲染为粗体</strong>
```

### 斜体

用于强调带有斜体的文本片段.

以下文本片段被 _渲染为斜体_.

```markdown
*渲染为斜体*
_渲染为斜体_
```

输出的 HTML 看起来像这样:

```html
<em>渲染为斜体</em>
```

### 删除线

按照 [[GFM]^(GitHub flavored Markdown)](https://github.github.com/gfm/) 你可以使用删除线.

```markdown
~~这段文本带有删除线.~~
```

呈现的输出效果如下:

~~这段文本带有删除线.~~

输出的 HTML 看起来像这样:

```html
<del>这段文本带有删除线.</del>
```

### 组合

加粗, 斜体, 和删除线可以 组合使用.

```markdown
***加粗和斜体***
~~**删除线和加粗**~~
~~*删除线和斜体*~~
~~***加粗, 斜体和删除线***~~
```

呈现的输出效果如下:

***加粗和斜体***

~~**删除线和加粗**~~

~~*删除线和斜体*~~

~~***加粗, 斜体和删除线***~~

输出的 HTML 看起来像这样:

```html
<em><strong>加粗和斜体</strong></em>
<del><strong>删除线和加粗</strong></del>
<del><em>删除线和斜体</em></del>
<del><em><strong>加粗, 斜体和删除线</strong></em></del>
```

## 7 引用

用于在文档中引用其他来源的内容块.

在要引用的任何文本之前添加 `>`:

```markdown
> **Fusion Drive** combines a hard drive with a flash storage (solid-state drive) and presents it as a single logical volume with the space of both drives combined.
```

呈现的输出效果如下:

> **Fusion Drive** combines a hard drive with a flash storage (solid-state drive) and presents it as a single logical volume with the space of both drives combined.

输出的 HTML 看起来像这样:

```html
<blockquote>
  <p>
    <strong>Fusion Drive</strong> combines a hard drive with a flash storage (solid-state drive) and presents it as a single logical volume with the space of both drives combined.
  </p>
</blockquote>
```

引用也可以嵌套:

```markdown
> Donec massa lacus, ultricies a ullamcorper in, fermentum sed augue.
Nunc augue augue, aliquam non hendrerit ac, commodo vel nisi.
>> Sed adipiscing elit vitae augue consectetur a gravida nunc vehicula. Donec auctor
odio non est accumsan facilisis. Aliquam id turpis in dolor tincidunt mollis ac eu diam.
```

呈现的输出效果如下:

> Donec massa lacus, ultricies a ullamcorper in, fermentum sed augue.
Nunc augue augue, aliquam non hendrerit ac, commodo vel nisi.
>> Sed adipiscing elit vitae augue consectetur a gravida nunc vehicula. Donec auctor
odio non est accumsan facilisis. Aliquam id turpis in dolor tincidunt mollis ac eu diam.

## 8 列表

### 无序列表

一系列项的列表, 其中项的顺序没有明显关系.

你可以使用以下任何符号来表示无序列表中的项:

```markdown
* 一项内容
- 一项内容
+ 一项内容
```

例如:

```markdown
* Lorem ipsum dolor sit amet
* Consectetur adipiscing elit
* Integer molestie lorem at massa
* Facilisis in pretium nisl aliquet
* Nulla volutpat aliquam velit
  * Phasellus iaculis neque
  * Purus sodales ultricies
  * Vestibulum laoreet porttitor sem
  * Ac tristique libero volutpat at
* Faucibus porta lacus fringilla vel
* Aenean sit amet erat nunc
* Eget porttitor lorem
```

呈现的输出效果如下:

* Lorem ipsum dolor sit amet
* Consectetur adipiscing elit
* Integer molestie lorem at massa
* Facilisis in pretium nisl aliquet
* Nulla volutpat aliquam velit
  * Phasellus iaculis neque
  * Purus sodales ultricies
  * Vestibulum laoreet porttitor sem
  * Ac tristique libero volutpat at
* Faucibus porta lacus fringilla vel
* Aenean sit amet erat nunc
* Eget porttitor lorem

输出的 HTML 看起来像这样:

```html
<ul>
  <li>Lorem ipsum dolor sit amet</li>
  <li>Consectetur adipiscing elit</li>
  <li>Integer molestie lorem at massa</li>
  <li>Facilisis in pretium nisl aliquet</li>
  <li>Nulla volutpat aliquam velit
    <ul>
      <li>Phasellus iaculis neque</li>
      <li>Purus sodales ultricies</li>
      <li>Vestibulum laoreet porttitor sem</li>
      <li>Ac tristique libero volutpat at</li>
    </ul>
  </li>
  <li>Faucibus porta lacus fringilla vel</li>
  <li>Aenean sit amet erat nunc</li>
  <li>Eget porttitor lorem</li>
</ul>
```

### 有序列表

一系列项的列表, 其中项的顺序确实很重要.

```markdown
1. Lorem ipsum dolor sit amet
2. Consectetur adipiscing elit
3. Integer molestie lorem at massa
4. Facilisis in pretium nisl aliquet
5. Nulla volutpat aliquam velit
6. Faucibus porta lacus fringilla vel
7. Aenean sit amet erat nunc
8. Eget porttitor lorem
```

呈现的输出效果如下:

1. Lorem ipsum dolor sit amet
2. Consectetur adipiscing elit
3. Integer molestie lorem at massa
4. Facilisis in pretium nisl aliquet
5. Nulla volutpat aliquam velit
6. Faucibus porta lacus fringilla vel
7. Aenean sit amet erat nunc
8. Eget porttitor lorem

输出的 HTML 看起来像这样:

```html
<ol>
  <li>Lorem ipsum dolor sit amet</li>
  <li>Consectetur adipiscing elit</li>
  <li>Integer molestie lorem at massa</li>
  <li>Facilisis in pretium nisl aliquet</li>
  <li>Nulla volutpat aliquam velit</li>
  <li>Faucibus porta lacus fringilla vel</li>
  <li>Aenean sit amet erat nunc</li>
  <li>Eget porttitor lorem</li>
</ol>
```

{{< admonition tip >}}
如果你对每一项使用 `1.`, Markdown 将自动为每一项编号. 例如:

```markdown
1. Lorem ipsum dolor sit amet
1. Consectetur adipiscing elit
1. Integer molestie lorem at massa
1. Facilisis in pretium nisl aliquet
1. Nulla volutpat aliquam velit
1. Faucibus porta lacus fringilla vel
1. Aenean sit amet erat nunc
1. Eget porttitor lorem
```

呈现的输出效果如下:

1. Lorem ipsum dolor sit amet
1. Consectetur adipiscing elit
1. Integer molestie lorem at massa
1. Facilisis in pretium nisl aliquet
1. Nulla volutpat aliquam velit
1. Faucibus porta lacus fringilla vel
1. Aenean sit amet erat nunc
1. Eget porttitor lorem
{{< /admonition >}}

### 任务列表

任务列表使你可以创建带有复选框的列表.
要创建任务列表, 请在任务列表项之前添加破折号 (`-`) 和带有空格的方括号 (`[ ]`). 要选择一个复选框，请在方括号之间添加 x (`[x]`).

```markdown
- [x] Write the press release
- [ ] Update the website
- [ ] Contact the media
```

呈现的输出效果如下:

- [x] Write the press release
- [ ] Update the website
- [ ] Contact the media

## 9 代码

### 行内代码

用 <code>`</code> 包装行内代码段.

```markdown
在这个例子中, `<section></section>` 会被包裹成 **代码**.
```

呈现的输出效果如下:

在这个例子中, `<section></section>` 会被包裹成 **代码**.

输出的 HTML 看起来像这样:

```html
<p>
  在这个例子中, <code>&lt;section&gt;&lt;/section&gt;</code> 会被包裹成 <strong>代码</strong>.
</p>
```

### 缩进代码

将几行代码缩进至少四个空格，例如:

```markdown
    // Some comments
    line 1 of code
    line 2 of code
    line 3 of code
```

呈现的输出效果如下:

    // Some comments
    line 1 of code
    line 2 of code
    line 3 of code

输出的 HTML 看起来像这样:

```html
<pre>
  <code>
    // Some comments
    line 1 of code
    line 2 of code
    line 3 of code
  </code>
</pre>
```

### 围栏代码块

使用 "围栏" <code>```</code> 来生成一段带有语言属性的代码块.

{{< highlight markdown >}}
```markdown
Sample text here...
```
{{< / highlight >}}

输出的 HTML 看起来像这样:

```html
<pre language-html>
  <code>Sample text here...</code>
</pre>
```

### 语法高亮

[GFM]^(GitHub Flavored Markdown) 也支持语法高亮.

要激活它，只需在第一个代码 "围栏" 之后直接添加你要使用的语言的文件扩展名,
<code>```js</code>, 语法高亮显示将自动应用于渲染的 HTML 中.

例如, 在以下 JavaScript 代码中应用语法高亮:

{{< highlight markdown >}}
```js
grunt.initConfig({
  assemble: {
    options: {
      assets: 'docs/assets',
      data: 'src/data/*.{json,yml}',
      helpers: 'src/custom-helpers.js',
      partials: ['src/partials/**/*.{hbs,md}']
    },
    pages: {
      options: {
        layout: 'default.hbs'
      },
      files: {
        './': ['src/templates/pages/index.hbs']
      }
    }
  }
};
```
{{< / highlight >}}

呈现的输出效果如下:

```js
grunt.initConfig({
  assemble: {
    options: {
      assets: 'docs/assets',
      data: 'src/data/*.{json,yml}',
      helpers: 'src/custom-helpers.js',
      partials: ['src/partials/**/*.{hbs,md}']
    },
    pages: {
      options: {
        layout: 'default.hbs'
      },
      files: {
        './': ['src/templates/pages/index.hbs']
      }
    }
  }
};
```

{{< admonition >}}
**Hugo** 文档中的 [语法高亮页面](https://gohugo.io/content-management/syntax-highlighting/) 介绍了有关语法高亮的更多信息,
包括语法高亮的 shortcode.
{{< /admonition >}}

## 10 表格

通过在每个单元格之间添加竖线作为分隔线, 并在标题下添加一行破折号 (也由竖线分隔) 来创建表格. 注意, 竖线不需要垂直对齐.

```markdown
| Option | Description |
| ------ | ----------- |
| data   | path to data files to supply the data that will be passed into templates. |
| engine | engine to be used for processing templates. Handlebars is the default. |
| ext    | extension to be used for dest files. |
```

呈现的输出效果如下:

| Option | Description |
| ------ | ----------- |
| data   | path to data files to supply the data that will be passed into templates. |
| engine | engine to be used for processing templates. Handlebars is the default. |
| ext    | extension to be used for dest files. |

输出的 HTML 看起来像这样:

```html
<table>
  <thead>
    <tr>
      <th>Option</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>data</td>
      <td>path to data files to supply the data that will be passed into templates.</td>
    </tr>
    <tr>
      <td>engine</td>
      <td>engine to be used for processing templates. Handlebars is the default.</td>
    </tr>
    <tr>
      <td>ext</td>
      <td>extension to be used for dest files.</td>
    </tr>
  </tbody>
</table>
```

{{< admonition note "文本右对齐或居中对齐" >}}
在任何标题下方的破折号右侧添加冒号将使该列的文本右对齐.

在任何标题下方的破折号两边添加冒号将使该列的对齐文本居中.

```markdown
| Option | Description |
|:------:| -----------:|
| data   | path to data files to supply the data that will be passed into templates. |
| engine | engine to be used for processing templates. Handlebars is the default. |
| ext    | extension to be used for dest files. |
```

呈现的输出效果如下:

| Option | Description |
|:------:| -----------:|
| data   | path to data files to supply the data that will be passed into templates. |
| engine | engine to be used for processing templates. Handlebars is the default. |
| ext    | extension to be used for dest files. |
{{< /admonition >}}

## 11 链接 {#links}

### 基本链接

```markdown
<https://assemble.io>
<contact@revolunet.com>
[Assemble](https://assemble.io)
```

呈现的输出效果如下 (将鼠标悬停在链接上，没有提示):

<https://assemble.io>

<contact@revolunet.com>

[Assemble](https://assemble.io)

输出的 HTML 看起来像这样:

```html
<a href="https://assemble.io">https://assemble.io</a>
<a href="mailto:contact@revolunet.com">contact@revolunet.com</a>
<a href="https://assemble.io">Assemble</a>
```

### 添加一个标题

```markdown
[Upstage](https://github.com/upstage/ "Visit Upstage!")
```

呈现的输出效果如下 (将鼠标悬停在链接上，会有一行提示):

[Upstage](https://github.com/upstage/ "Visit Upstage!")

输出的 HTML 看起来像这样:

```html
<a href="https://github.com/upstage/" title="Visit Upstage!">Upstage</a>
```

### 定位标记

定位标记使你可以跳至同一页面上的指定锚点. 例如, 每个章节:

```markdown
## Table of Contents
  * [Chapter 1](#chapter-1)
  * [Chapter 2](#chapter-2)
  * [Chapter 3](#chapter-3)
```

将跳转到这些部分:

```markdown
## Chapter 1 <a id="chapter-1"></a>
Content for chapter one.

## Chapter 2 <a id="chapter-2"></a>
Content for chapter one.

## Chapter 3 <a id="chapter-3"></a>
Content for chapter one.
```

{{< admonition >}}
定位标记的位置几乎是任意的. 因为它们并不引人注目, 所以它们通常被放在同一行了.
{{< /admonition >}}

## 12 脚注

脚注使你可以添加注释和参考, 而不会使文档正文混乱.
当你创建脚注时, 会在添加脚注引用的位置出现带有链接的上标编号.
读者可以单击链接以跳至页面底部的脚注内容.

要创建脚注引用, 请在方括号中添加插入符号和标识符 (`[^1]`).
标识符可以是数字或单词, 但不能包含空格或制表符.
标识符仅将脚注引用与脚注本身相关联 - 在脚注输出中, 脚注按顺序编号.

在中括号内使用插入符号和数字以及用冒号和文本来添加脚注内容 (`[^1]：这是一段脚注`).
你不一定要在文档末尾添加脚注. 可以将它们放在除列表, 引用和表格等元素之外的任何位置.

```markdown
这是一个数字脚注[^1].
这是一个带标签的脚注[^label]

[^1]: 这是一个数字脚注
[^label]: 这是一个带标签的脚注
```

这是一个数字脚注[^1].

这是一个带标签的脚注[^label]

[^1]: 这是一个数字脚注
[^label]: 这是一个带标签的脚注

## 13 图片

图片的语法与链接相似, 但包含一个在前面的感叹号.

```markdown
![Minion](https://octodex.github.com/images/minion.png)
```

![Minion](https://octodex.github.com/images/minion.png)

或者:

```markdown
![Alt text](https://octodex.github.com/images/stormtroopocat.jpg "The Stormtroopocat")
```

![Alt text](https://octodex.github.com/images/stormtroopocat.jpg "The Stormtroopocat")

像链接一样, 图片也具有脚注样式的语法:

```markdown
![Alt text][id]
```

![Alt text][id]

稍后在文档中提供参考内容, 用来定义 URL 的位置:

```markdown
[id]: https://octodex.github.com/images/dojocat.jpg  "The Dojocat"
```

[id]: https://octodex.github.com/images/dojocat.jpg  "The Dojocat"

{{< admonition tip >}}
**FixIt** 主题提供了一个包含更多功能的 [图片的 shortcode](../theme-documentation-extended-shortcodes#image).
{{< /admonition >}}

## 14 数学公式

**FixIt** 基于 [$\KaTeX$](https://katex.org/) 提供数学公式的支持.

在你的 [网站配置](../theme-documentation-basics#site-configuration) 中的 `[params.math]` 下面设置属性 `enable = true`,
并在文章的前置参数中设置属性 `math: true`来启用数学公式的自动渲染.
**$\KaTeX$** 根据 **特定的分隔符** 来自动渲染公式.

{{< admonition tip >}}
有一份 [$\KaTeX$ 中支持的 $\TeX$ 函数](https://katex.org/docs/supported.html) 清单.
{{< /admonition >}}

{{< admonition >}}
由于 Hugo 在渲染 Markdown 文档时会根据 `_`/`*`/`>>` 之类的语法生成 HTML 文档,
并且有些转义字符形式的文本内容 (如 `\(`/`\)`/`\[`/`\]`/`\\`) 会自动进行转义处理,
因此需要对这些地方进行额外的转义字符表达来实现自动渲染:

* `_` -> `\_`
* `*` -> `\*`
* `>>` -> `\>>`
* `\(` -> `\\(`
* `\)` -> `\\)`
* `\[` -> `\\[`
* `\]` -> `\\]`
* `\\` -> `\\\\`

**FixIt** 主题支持 [`raw` shortcode](../theme-documentation-extended-shortcodes#12-raw) 以避免这些转义字符,
它可以帮助您编写原始数学公式内容.

一个 `raw` 示例:

```markdown
行内公式: {{</* raw */>}}\(\mathbf{E}=\sum_{i} \mathbf{E}_{i}=\mathbf{E}_{1}+\mathbf{E}_{2}+\mathbf{E}_{3}+\cdots\){{</* /raw */>}}

公式块:

{{</* raw */>}}
\[ a=b+c \\ d+e=f \]
{{</* /raw */>}}
```

呈现的输出效果如下:

行内公式: {{< raw >}}\(\mathbf{E}=\sum_{i} \mathbf{E}_{i}=\mathbf{E}_{1}+\mathbf{E}_{2}+\mathbf{E}_{3}+\cdots\){{< /raw >}}

公式块:

{{< raw>}}
\[ a=b+c \\ d+e=f \]
{{< /raw >}}
{{< /admonition >}}

### 行内公式

默认的行内公式分割符有:

* `$ ... $`
* `\( ... \)` (转义的: `\\( ... \\)`)

例如:

```tex
$c = \pm\sqrt{a^2 + b^2}$ 和 \\(f(x)=\int_{-\infty}^{\infty} \hat{f}(\xi) e^{2 \pi i \xi x} d \xi\\)
```

呈现的输出效果如下:

$c = \pm\sqrt{a^2 + b^2}$ 和 \\(f(x)=\int_{-\infty}^{\infty} \hat{f}(\xi) e^{2 \pi i \xi x} d \xi\\)

### 公式块

默认的公式块分割符有:

* `$$ ... $$`
* `\[ ... \]` (转义的: `\\[ ... \\]`)
* `\begin{equation} ... \end{equation}` (不编号的: `\begin{equation*} ... \end{equation*}`)
* `\begin{align} ... \end{align}` (不编号的: `\begin{align*} ... \end{align*}`)
* `\begin{alignat} ... \end{alignat}` (不编号的: `\begin{alignat*} ... \end{alignat*}`)
* `\begin{gather} ... \end{gather}` (不编号的: `\begin{gather*} ... \end{gather*}`)
* `\begin{CD} ... \end{CD}`

例如:

```tex
$$ c = \pm\sqrt{a^2 + b^2} $$

\\[ f(x)=\int_{-\infty}^{\infty} \hat{f}(\xi) e^{2 \pi i \xi x} d \xi \\]

\begin{equation*}
  \rho \frac{\mathrm{D} \mathbf{v}}{\mathrm{D} t}=\nabla \cdot \mathbb{P}+\rho \mathbf{f}
\end{equation*}

\begin{equation}
  \mathbf{E}=\sum_{i} \mathbf{E}\_{i}=\mathbf{E}\_{1}+\mathbf{E}\_{2}+\mathbf{E}_{3}+\cdots
\end{equation}

\begin{align}
  a&=b+c \\\\
  d+e&=f
\end{align}

\begin{alignat}{2}
   10&x+&3&y = 2 \\\\
   3&x+&13&y = 4
\end{alignat}

\begin{gather}
   a=b \\\\
   e=b+c
\end{gather}

\begin{CD}
   A @>a\>> B \\\\
@VbVV @AAcA \\\\
   C @= D
\end{CD}
```

呈现的输出效果如下:

$$ c = \pm\sqrt{a^2 + b^2} $$

\\[ f(x)=\int_{-\infty}^{\infty} \hat{f}(\xi) e^{2 \pi i \xi x} d \xi \\]

\begin{equation*}
  \rho \frac{\mathrm{D} \mathbf{v}}{\mathrm{D} t}=\nabla \cdot \mathbb{P}+\rho \mathbf{f}
\end{equation*}

\begin{equation}
  \mathbf{E}=\sum_{i} \mathbf{E}\_{i}=\mathbf{E}\_{1}+\mathbf{E}\_{2}+\mathbf{E}_{3}+\cdots
\end{equation}

\begin{align}
  a&=b+c \\\\
  d+e&=f
\end{align}

\begin{alignat}{2}
   10&x+&3&y = 2 \\\\
   3&x+&13&y = 4
\end{alignat}

\begin{gather}
   a=b \\\\
   e=b+c
\end{gather}

\begin{CD}
   A @>a\>> B \\\\
@VbVV @AAcA \\\\
   C @= D
\end{CD}

{{< admonition tip >}}
你可以在 [网站配置](../theme-documentation-basics#site-configuration) 中自定义行内公式和公式块的分割符.
{{< /admonition >}}

### mhchem

**[mhchem](https://github.com/Khan/KaTeX/tree/master/contrib/mhchem)** 是一个 **$\KaTeX$** 的插件.

通过这个扩展, 你可以在文章中轻松编写漂亮的化学方程式.

```markdown
$$ \ce{CO2 + C -> 2 CO} $$

$$ \ce{Hg^2+ ->[I-] HgI2 ->[I-] [Hg^{II}I4]^2-} $$
```

呈现的输出效果如下:

$$ \ce{CO2 + C -> 2 CO} $$

$$ \ce{Hg^2+ ->[I-] HgI2 ->[I-] [Hg^{II}I4]^2-} $$

## 15 字符修饰

**FixIt** 主题支持多种 **字符修饰** Markdown 扩展语法:

```markdown
[Hugo]{?^}(一个开源的静态网站生成工具)

[99]{?/}[100]

<abbr title="Graphics Interchange Format">GIF</abbr>是一种位图图片格式。

H<sub>2</sub>O

X<sup>n</sup> + Y<sup>n</sup> = Z<sup>n</sup>

按下<kbd><kbd>CTRL</kbd>+<kbd>ALT</kbd>+<kbd>Delete</kbd></kbd>以访问任务管理器。

大多数<mark>口腔癌</mark>都是由于不良的生活习惯导致的。
```

呈现的输出效果如下:

[Hugo]^(一个开源的静态网站生成工具)

[90]/[100]

<abbr title="Graphics Interchange Format">GIF</abbr>是一种位图图片格式。

H<sub>2</sub>O

X<sup>n</sup> + Y<sup>n</sup> = Z<sup>n</sup>

按下<kbd><kbd>CTRL</kbd>+<kbd>ALT</kbd>+<kbd>Delete</kbd></kbd>以访问任务管理器。

大多数<mark>口腔癌</mark>都是由于不良的生活习惯导致的。

## 16 转义字符 {#escape-character}

在某些特殊情况下，文章内容会与 Markdown 的基本或者扩展语法冲突, 并且无法避免.

转义字符语法可以帮助你渲染出想要的内容:

```markdown
{{??}X} -> X
```

例如, 两个 `:` 会启用 emoji 语法. 但有时候这不是你想要的结果. 可以像这样使用转义字符语法:

```markdown
{{??}:}joy:
```

呈现的输出效果如下:

**{?:}joy{?:}** 而不是 **:joy:**

另一个例子是:

```markdown
[link{{??}]}(#escape-character)
```

呈现的输出效果如下:

**[link{?]}(#escape-character)** 而不是 **[link](#escape-character)**.

## 17 内置shortcode

### 1 figure

一个 `figure` 示例:

```markdown
{{</* figure src="https://octodex.github.com/images/minion.png" title="Lighthouse (figure)" */>}}
```

呈现的输出效果如下:

{{< figure src="https://octodex.github.com/images/minion.png" title="Lighthouse (figure)" >}}

输出的 HTML 看起来像这样:

```html
<figure>
    <img src="https://octodex.github.com/images/minion.png"/>
    <figcaption>
        <h4>Lighthouse (figure)</h4>
    </figcaption>
</figure>
```

### 2 gist

一个 `gist` 示例:

```markdown
{{</* gist spf13 7896402 */>}}
```

呈现的输出效果如下:

{{< gist spf13 7896402 >}}

输出的 HTML 看起来像这样:

```html
<script type="application/javascript" src="https://gist.github.com/spf13/7896402.js"></script>
```

### 3 highlight

一个 `highlight` 示例:

```markdown
{{</* highlight html */>}}
<section id="main">
    <div>
        <h1 id="title">{{ .Title }}</h1>
        {{ range .Pages }}
            {{ .Render "summary"}}
        {{ end }}
    </div>
</section>
{{</* /highlight */>}}
```

呈现的输出效果如下:

{{< highlight html >}}
<section id="main">
    <div>
        <h1 id="title">{{ .Title }}</h1>
        {{ range .Pages }}
            {{ .Render "summary"}}
        {{ end }}
    </div>
</section>
{{< /highlight >}}

### 4 param

一个 `param` 示例:

```markdown
{{</* param description */>}}
```

呈现的输出效果如下:

{{< param description >}}

## 18 扩展shortcode

### 1 style

`style` shortcode 用来在你的文章中插入自定义样式，它有两个位置参数.

第一个参数是自定义样式的内容. 它支持 [SASS](https://sass-lang.com/documentation/style-rules/declarations#nesting) 中的嵌套语法，并且 `&` 指代这个父元素.

第二个参数是包裹你要更改样式的内容的 HTML 标签, 默认值是 `div`.

一个 `style` 示例:

```markdown
{{</* style "text-align:right; strong{color:#00b1ff;}" */>}}
This is a **right-aligned** paragraph.
{{</* /style */>}}
```

呈现的输出效果如下:

{{< style "text-align:right; strong{color:#00b1ff;}" >}}
This is a **right-aligned** paragraph.
{{< /style >}}

### 2 link

`link` shortcode 是 Markdown 链接语法的替代，可以提供一些其它的功能并且可以在代码块中使用。

`link` shortcode 有以下命名参数:

* **href** *[必需]* (**第一个**位置参数)

    链接的目标.

* **content** *[可选]* (**第二个**位置参数)

    链接的内容, 默认值是 **href** 参数的值.

    *支持 Markdown 或者 HTML 格式.*

* **title** *[可选]* (**第三个**位置参数)

    HTML `a` 标签 的 `title` 属性, 当悬停在链接上会显示的提示.

* **rel** *[可选]*

    HTML `a` 标签 的 `rel` 补充属性.

* **class** *[可选]*

    HTML `a` 标签 的 `class` 属性.

一个 `link` 示例:

```markdown
{{</* link "https://assemble.io" */>}}
或者
{{</* link href="https://assemble.io" */>}}

{{</* link "mailto:contact@revolunet.com" */>}}
或者
{{</* link href="mailto:contact@revolunet.com" */>}}

{{</* link "https://assemble.io" Assemble */>}}
或者
{{</* link href="https://assemble.io" content=Assemble */>}}
```

呈现的输出效果如下:

* {{< link "https://assemble.io" >}}
* {{< link "mailto:contact@revolunet.com" >}}
* {{< link "https://assemble.io" Assemble >}}

一个带有标题的 `link` 示例:

```markdown
{{</* link "https://github.com/upstage/" Upstage "Visit Upstage!" */>}}
或者
{{</* link href="https://github.com/upstage/" content=Upstage title="Visit Upstage!" */>}}
```

呈现的输出效果如下 (将鼠标悬停在链接上，会有一行提示):

{{< link "https://github.com/upstage/" Upstage "Visit Upstage!" >}}

### 3 image

`image` shortcode 是 `figure` shortcode的替代，`image` shortcode 可以充分利用 [lazysizes](https://github.com/aFarkas/lazysizes) 和 [lightGallery](https://github.com/sachinchoolur/lightgallery) 两个依赖库.

`image` shortcode 有以下命名参数:

* **src** *[必需]* (**第一个**位置参数)

    图片的 URL.

* **alt** *[可选]* (**第二个**位置参数)

    图片无法显示时的替代文本, 默认值是 **src** 参数的值.

    *支持 Markdown 或者 HTML 格式.*

* **caption** *[可选]* (**第三个**位置参数)

    图片标题.

    *支持 Markdown 或者 HTML 格式.*

* **title** *[可选]*

    当悬停在图片上会显示的提示.

* **class** *[可选]*

    HTML `figure` 标签的 `class` 属性.

* **src_s** *[可选]*

    图片缩略图的 URL, 用在画廊模式中, 默认值是 **src** 参数的值.

* **src_l** *[可选]*

    高清图片的 URL, 用在画廊模式中, 默认值是 **src** 参数的值.

* **height** *[可选]*

    图片的 `height` 属性.

* **width** *[可选]*

    图片的 `width` 属性.

* **linked** *[可选]*

    图片是否需要被链接, 默认值是 `true`.

* **rel** *[可选]*

    HTML `a` 标签 的 `rel` 补充属性, 仅在 **linked** 属性设置成 `true` 时有效.

一个 `image` 示例:

```markdown
{{</* image src="/images/lighthouse.jpg" caption="Lighthouse (`image`)" src_s="/images/lighthouse-small.jpg" src_l="/images/lighthouse-large.jpg" */>}}
```

### 4 admonition

`admonition` shortcode 支持 **12** 种 帮助你在页面中插入提示的横幅.

*支持 Markdown 或者 HTML 格式.*

{{< admonition >}}
一个 **注意** 横幅
{{< /admonition >}}

{{< admonition abstract >}}
一个 **摘要** 横幅
{{< /admonition >}}

{{< admonition info >}}
一个 **信息** 横幅
{{< /admonition >}}

{{< admonition tip >}}
一个 **技巧** 横幅
{{< /admonition >}}

{{< admonition success >}}
一个 **成功** 横幅
{{< /admonition >}}

{{< admonition question >}}
一个 **问题** 横幅
{{< /admonition >}}

{{< admonition warning >}}
一个 **警告** 横幅
{{< /admonition >}}

{{< admonition failure >}}
一个 **失败** 横幅
{{< /admonition >}}

{{< admonition danger >}}
一个 **危险** 横幅
{{< /admonition >}}

{{< admonition bug >}}
一个 **Bug** 横幅
{{< /admonition >}}

{{< admonition example >}}
一个 **示例** 横幅
{{< /admonition >}}

{{< admonition quote >}}
一个 **引用** 横幅
{{< /admonition >}}

`admonition` shortcode 有以下命名参数:

* **type** *[可选]* (**第一个**位置参数)

    `admonition` 横幅的类型, 默认值是 `note`.

* **title** *[可选]* (**第二个**位置参数)

    `admonition` 横幅的标题, 默认值是 **type** 参数的值.

* **open** *[可选]* (**第三个**位置参数) {{< version 0.2.0 changed >}}

    横幅内容是否默认展开, 默认值是 `true`.

一个 `admonition` 示例:

```markdown
{{</* admonition type=tip title="This is a tip" open=false */>}}
一个 **技巧** 横幅
{{</* /admonition */>}}
或者
{{</* admonition tip "This is a tip" false */>}}
一个 **技巧** 横幅
{{</* /admonition */>}}
```

呈现的输出效果如下:

{{< admonition tip "This is a tip" false >}}
一个 **技巧** 横幅
{{< /admonition >}}

### 5 mermaid

`mermaid` shortcode 使用 [Mermaid](https://mermaidjs.github.io/) 库提供绘制图表和流程图的功能。[mermaid](https://mermaidjs.github.io/) 是一个可以帮助你在文章中绘制图表和流程图的库, 类似 Markdown 的语法。只需将你的 mermaid 代码插入 `mermaid` shortcode 中即可。

一个 **流程图** `mermaid` 示例:

```markdown
{{</* mermaid */>}}
graph LR;
    A[Hard edge] -->|Link text| B(Round edge)
    B --> C{Decision}
    C -->|One| D[Result one]
    C -->|Two| E[Result two]
{{</* /mermaid */>}}
```

呈现的输出效果如下:

{{< mermaid >}}
graph LR;
    A[Hard edge] -->|Link text| B(Round edge)
    B --> C{Decision}
    C -->|One| D[Result one]
    C -->|Two| E[Result two]
{{< /mermaid >}}

### 6 echarts

echarts` shortcode 使用 [ECharts](https://echarts.apache.org/) 库提供数据可视化的功能。**ECharts** 是一个生成交互式数据可视化的库。

只需在 `echarts` shortcode 中以 `JSON`/`YAML`/`TOML`格式插入 ECharts 选项即可。


`echarts` shortcode 有以下命名参数:

* **width** *[可选]* (**第一个**位置参数)

    {{< version 0.2.0 >}} 数据可视化的宽度, 默认值是 `100%`.

* **height** *[可选]* (**第二个**位置参数)

    {{< version 0.2.0 >}} 数据可视化的高度, 默认值是 `30rem`.

一个 `JSON` 格式的 `echarts` 示例:

```json
{{</* echarts */>}}
{
  "title": {
    "text": "折线统计图",
    "top": "2%",
    "left": "center"
  },
  "tooltip": {
    "trigger": "axis"
  },
  "legend": {
    "data": ["邮件营销", "联盟广告", "视频广告", "直接访问", "搜索引擎"],
    "top": "10%"
  },
  "grid": {
    "left": "5%",
    "right": "5%",
    "bottom": "5%",
    "top": "20%",
    "containLabel": true
  },
  "toolbox": {
    "feature": {
      "saveAsImage": {
        "title": "保存为图片"
      }
    }
  },
  "xAxis": {
    "type": "category",
    "boundaryGap": false,
    "data": ["周一", "周二", "周三", "周四", "周五", "周六", "周日"]
  },
  "yAxis": {
    "type": "value"
  },
  "series": [
    {
      "name": "邮件营销",
      "type": "line",
      "stack": "总量",
      "data": [120, 132, 101, 134, 90, 230, 210]
    },
    {
      "name": "联盟广告",
      "type": "line",
      "stack": "总量",
      "data": [220, 182, 191, 234, 290, 330, 310]
    },
    {
      "name": "视频广告",
      "type": "line",
      "stack": "总量",
      "data": [150, 232, 201, 154, 190, 330, 410]
    },
    {
      "name": "直接访问",
      "type": "line",
      "stack": "总量",
      "data": [320, 332, 301, 334, 390, 330, 320]
    },
    {
      "name": "搜索引擎",
      "type": "line",
      "stack": "总量",
      "data": [820, 932, 901, 934, 1290, 1330, 1320]
    }
  ]
}
{{</* /echarts */>}}
```

呈现的输出效果如下:

{{< echarts >}}
{
  "title": {
    "text": "折线统计图",
    "top": "2%",
    "left": "center"
  },
  "tooltip": {
    "trigger": "axis"
  },
  "legend": {
    "data": ["邮件营销", "联盟广告", "视频广告", "直接访问", "搜索引擎"],
    "top": "10%"
  },
  "grid": {
    "left": "5%",
    "right": "5%",
    "bottom": "5%",
    "top": "20%",
    "containLabel": true
  },
  "toolbox": {
    "feature": {
      "saveAsImage": {
        "title": "保存为图片"
      }
    }
  },
  "xAxis": {
    "type": "category",
    "boundaryGap": false,
    "data": ["周一", "周二", "周三", "周四", "周五", "周六", "周日"]
  },
  "yAxis": {
    "type": "value"
  },
  "series": [
    {
      "name": "邮件营销",
      "type": "line",
      "stack": "总量",
      "data": [120, 132, 101, 134, 90, 230, 210]
    },
    {
      "name": "联盟广告",
      "type": "line",
      "stack": "总量",
      "data": [220, 182, 191, 234, 290, 330, 310]
    },
    {
      "name": "视频广告",
      "type": "line",
      "stack": "总量",
      "data": [150, 232, 201, 154, 190, 330, 410]
    },
    {
      "name": "直接访问",
      "type": "line",
      "stack": "总量",
      "data": [320, 332, 301, 334, 390, 330, 320]
    },
    {
      "name": "搜索引擎",
      "type": "line",
      "stack": "总量",
      "data": [820, 932, 901, 934, 1290, 1330, 1320]
    }
  ]
}
{{< /echarts >}}

### 7 bilibili

`bilibili` shortcode 提供了一个内嵌的用来播放 bilibili 视频的响应式播放器.

如果视频只有一个部分, 则仅需要视频的 BV `id`, 例如:

```code
https://www.bilibili.com/video/BV1Sx411T7QQ
```

一个 `bilibili` 示例:

```markdown
{{</* bilibili BV1Sx411T7QQ */>}}
或者
{{</* bilibili id=BV1Sx411T7QQ */>}}
```

呈现的输出效果如下:

{{< bilibili id=BV1Sx411T7QQ >}}

如果视频包含多个部分, 则除了视频的 BV `id` 之外, 还需要 `p`, 默认值为 `1`, 例如:

```code
https://www.bilibili.com/video/BV1TJ411C7An?p=3
```

一个带有 `p` 参数的 `bilibili` 示例:

```markdown
{{</* bilibili BV1TJ411C7An 3 */>}}
或者
{{</* bilibili id=BV1TJ411C7An p=3 */>}}
```

呈现的输出效果如下:

{{< bilibili id=BV1TJ411C7An p=3 >}}

### 8 script

`script` shortcode 用来在你的文章中插入 **Javascript** 脚本.

{{< admonition >}}
脚本内容可以保证在所有的第三方库加载之后按顺序执行.
所以你可以自由地使用第三方库.
{{< /admonition >}}

一个 `script` 示例:

```markdown
{{</* script */>}}
console.log('Hello FixIt!');
{{</* /script */>}}
```

你可以在开发者工具的控制台中看到输出.

{{< script >}}
console.log('Hello FixIt!');
{{< /script >}}

### 9 raw

`raw` shortcode 用来在你的文章中插入原始 **HTML** 内容.

一个 `raw` 示例:

```markdown
行内公式: {{</* raw */>}}\(\mathbf{E}=\sum_{i} \mathbf{E}_{i}=\mathbf{E}_{1}+\mathbf{E}_{2}+\mathbf{E}_{3}+\cdots\){{</* /raw */>}}

公式块:

{{</* raw */>}}
\[ a=b+c \\ d+e=f \]
{{</* /raw */>}}

原始的带有 Markdown 语法的内容: {{</* raw */>}}**Hello**{{</* /raw */>}}
```

呈现的输出效果如下:

行内公式: {{< raw >}}\(\mathbf{E}=\sum_{i} \mathbf{E}_{i}=\mathbf{E}_{1}+\mathbf{E}_{2}+\mathbf{E}_{3}+\cdots\){{< /raw >}}

公式块:

{{< raw>}}
\[ a=b+c \\ d+e=f \]
{{< /raw >}}

原始的带有 Markdown 语法的内容: {{< raw >}}**Hello**{{< /raw >}}