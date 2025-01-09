# Hugo/FixIt语法参考


此文章系Hugo以及FixIt主题所支持的Markdown语法规则参考及演示

&lt;!--more--&gt;

## 0 摘要

使用如下代码进行手动摘要分割：

```markdown
&lt;!--more--&gt;
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
&lt;h2&gt;h2 标题&lt;/h2&gt;
&lt;h3&gt;h3 标题&lt;/h3&gt;
&lt;h4&gt;h4 标题&lt;/h4&gt;
&lt;h5&gt;h5 标题&lt;/h5&gt;
&lt;h6&gt;h6 标题&lt;/h6&gt;
```

{{&lt; admonition note &#34;标题 ID&#34; &gt;}}
要添加自定义标题 ID, 请在与标题相同的行中将自定义 ID 放在花括号中:

```markdown
### 一个很棒的标题 {#custom-id}
```

输出的 HTML 看起来像这样:

```html
&lt;h3 id=&#34;custom-id&#34;&gt;一个很棒的标题&lt;/h3&gt;
```
{{&lt; /admonition &gt;}}

## 2 注释

注释是和 HTML 兼容的：

```html
&lt;!--
这是一段注释
--&gt;
```

**不能**看到以下的注释:

&lt;!--
这是一段注释
--&gt;

## 3 水平线

HTML 中的 `&lt;hr&gt;` 标签是用来在段落元素之间创建一个 &#34;专题间隔&#34; 的.
使用 Markdown, 你可以用以下方式创建一个 `&lt;hr&gt;` 标签:

* `___`: 三个连续的下划线
* `---`: 三个连续的破折号
* `***`: 三个连续的星号

呈现的输出效果如下:

___
---
***

## 4 段落

按照纯文本的方式书写段落, 纯文本在呈现的 HTML 中将用 `&lt;p&gt;`/`&lt;/p&gt;` 标签包裹.

如下段落:

```markdown
Lorem ipsum dolor sit amet, graecis denique ei vel, at duo primis mandamus. Et legere ocurreret pri,
animal tacimates complectitur ad cum. Cu eum inermis inimicus efficiendi. Labore officiis his ex,
soluta officiis concludaturque ei qui, vide sensibus vim ad.
```

输出的 HTML 看起来像这样:

```html
&lt;p&gt;Lorem ipsum dolor sit amet, graecis denique ei vel, at duo primis mandamus. Et legere ocurreret pri, animal tacimates complectitur ad cum. Cu eum inermis inimicus efficiendi. Labore officiis his ex, soluta officiis concludaturque ei qui, vide sensibus vim ad.&lt;/p&gt;
```

可以使用一个空白行进行**换行**.

## 5 内联 HTML 元素

如果你需要某个 HTML 标签 (带有一个类), 则可以简单地像这样使用:

```html
Markdown 格式的段落.

&lt;div class=&#34;class&#34;&gt;
    这是 &lt;b&gt;HTML&lt;/b&gt;
&lt;/div&gt;

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
&lt;strong&gt;渲染为粗体&lt;/strong&gt;
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
&lt;em&gt;渲染为斜体&lt;/em&gt;
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
&lt;del&gt;这段文本带有删除线.&lt;/del&gt;
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
&lt;em&gt;&lt;strong&gt;加粗和斜体&lt;/strong&gt;&lt;/em&gt;
&lt;del&gt;&lt;strong&gt;删除线和加粗&lt;/strong&gt;&lt;/del&gt;
&lt;del&gt;&lt;em&gt;删除线和斜体&lt;/em&gt;&lt;/del&gt;
&lt;del&gt;&lt;em&gt;&lt;strong&gt;加粗, 斜体和删除线&lt;/strong&gt;&lt;/em&gt;&lt;/del&gt;
```

## 7 引用

用于在文档中引用其他来源的内容块.

在要引用的任何文本之前添加 `&gt;`:

```markdown
&gt; **Fusion Drive** combines a hard drive with a flash storage (solid-state drive) and presents it as a single logical volume with the space of both drives combined.
```

呈现的输出效果如下:

&gt; **Fusion Drive** combines a hard drive with a flash storage (solid-state drive) and presents it as a single logical volume with the space of both drives combined.

输出的 HTML 看起来像这样:

```html
&lt;blockquote&gt;
  &lt;p&gt;
    &lt;strong&gt;Fusion Drive&lt;/strong&gt; combines a hard drive with a flash storage (solid-state drive) and presents it as a single logical volume with the space of both drives combined.
  &lt;/p&gt;
&lt;/blockquote&gt;
```

引用也可以嵌套:

```markdown
&gt; Donec massa lacus, ultricies a ullamcorper in, fermentum sed augue.
Nunc augue augue, aliquam non hendrerit ac, commodo vel nisi.
&gt;&gt; Sed adipiscing elit vitae augue consectetur a gravida nunc vehicula. Donec auctor
odio non est accumsan facilisis. Aliquam id turpis in dolor tincidunt mollis ac eu diam.
```

呈现的输出效果如下:

&gt; Donec massa lacus, ultricies a ullamcorper in, fermentum sed augue.
Nunc augue augue, aliquam non hendrerit ac, commodo vel nisi.
&gt;&gt; Sed adipiscing elit vitae augue consectetur a gravida nunc vehicula. Donec auctor
odio non est accumsan facilisis. Aliquam id turpis in dolor tincidunt mollis ac eu diam.

## 8 列表

### 无序列表

一系列项的列表, 其中项的顺序没有明显关系.

你可以使用以下任何符号来表示无序列表中的项:

```markdown
* 一项内容
- 一项内容
&#43; 一项内容
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
&lt;ul&gt;
  &lt;li&gt;Lorem ipsum dolor sit amet&lt;/li&gt;
  &lt;li&gt;Consectetur adipiscing elit&lt;/li&gt;
  &lt;li&gt;Integer molestie lorem at massa&lt;/li&gt;
  &lt;li&gt;Facilisis in pretium nisl aliquet&lt;/li&gt;
  &lt;li&gt;Nulla volutpat aliquam velit
    &lt;ul&gt;
      &lt;li&gt;Phasellus iaculis neque&lt;/li&gt;
      &lt;li&gt;Purus sodales ultricies&lt;/li&gt;
      &lt;li&gt;Vestibulum laoreet porttitor sem&lt;/li&gt;
      &lt;li&gt;Ac tristique libero volutpat at&lt;/li&gt;
    &lt;/ul&gt;
  &lt;/li&gt;
  &lt;li&gt;Faucibus porta lacus fringilla vel&lt;/li&gt;
  &lt;li&gt;Aenean sit amet erat nunc&lt;/li&gt;
  &lt;li&gt;Eget porttitor lorem&lt;/li&gt;
&lt;/ul&gt;
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
&lt;ol&gt;
  &lt;li&gt;Lorem ipsum dolor sit amet&lt;/li&gt;
  &lt;li&gt;Consectetur adipiscing elit&lt;/li&gt;
  &lt;li&gt;Integer molestie lorem at massa&lt;/li&gt;
  &lt;li&gt;Facilisis in pretium nisl aliquet&lt;/li&gt;
  &lt;li&gt;Nulla volutpat aliquam velit&lt;/li&gt;
  &lt;li&gt;Faucibus porta lacus fringilla vel&lt;/li&gt;
  &lt;li&gt;Aenean sit amet erat nunc&lt;/li&gt;
  &lt;li&gt;Eget porttitor lorem&lt;/li&gt;
&lt;/ol&gt;
```

{{&lt; admonition tip &gt;}}
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
{{&lt; /admonition &gt;}}

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

用 &lt;code&gt;`&lt;/code&gt; 包装行内代码段.

```markdown
在这个例子中, `&lt;section&gt;&lt;/section&gt;` 会被包裹成 **代码**.
```

呈现的输出效果如下:

在这个例子中, `&lt;section&gt;&lt;/section&gt;` 会被包裹成 **代码**.

输出的 HTML 看起来像这样:

```html
&lt;p&gt;
  在这个例子中, &lt;code&gt;&amp;lt;section&amp;gt;&amp;lt;/section&amp;gt;&lt;/code&gt; 会被包裹成 &lt;strong&gt;代码&lt;/strong&gt;.
&lt;/p&gt;
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
&lt;pre&gt;
  &lt;code&gt;
    // Some comments
    line 1 of code
    line 2 of code
    line 3 of code
  &lt;/code&gt;
&lt;/pre&gt;
```

### 围栏代码块

使用 &#34;围栏&#34; &lt;code&gt;```&lt;/code&gt; 来生成一段带有语言属性的代码块.

{{&lt; highlight markdown &gt;}}
```markdown
Sample text here...
```
{{&lt; / highlight &gt;}}

输出的 HTML 看起来像这样:

```html
&lt;pre language-html&gt;
  &lt;code&gt;Sample text here...&lt;/code&gt;
&lt;/pre&gt;
```

### 语法高亮

[GFM]^(GitHub Flavored Markdown) 也支持语法高亮.

要激活它，只需在第一个代码 &#34;围栏&#34; 之后直接添加你要使用的语言的文件扩展名,
&lt;code&gt;```js&lt;/code&gt;, 语法高亮显示将自动应用于渲染的 HTML 中.

例如, 在以下 JavaScript 代码中应用语法高亮:

{{&lt; highlight markdown &gt;}}
```js
grunt.initConfig({
  assemble: {
    options: {
      assets: &#39;docs/assets&#39;,
      data: &#39;src/data/*.{json,yml}&#39;,
      helpers: &#39;src/custom-helpers.js&#39;,
      partials: [&#39;src/partials/**/*.{hbs,md}&#39;]
    },
    pages: {
      options: {
        layout: &#39;default.hbs&#39;
      },
      files: {
        &#39;./&#39;: [&#39;src/templates/pages/index.hbs&#39;]
      }
    }
  }
};
```
{{&lt; / highlight &gt;}}

呈现的输出效果如下:

```js
grunt.initConfig({
  assemble: {
    options: {
      assets: &#39;docs/assets&#39;,
      data: &#39;src/data/*.{json,yml}&#39;,
      helpers: &#39;src/custom-helpers.js&#39;,
      partials: [&#39;src/partials/**/*.{hbs,md}&#39;]
    },
    pages: {
      options: {
        layout: &#39;default.hbs&#39;
      },
      files: {
        &#39;./&#39;: [&#39;src/templates/pages/index.hbs&#39;]
      }
    }
  }
};
```

{{&lt; admonition &gt;}}
**Hugo** 文档中的 [语法高亮页面](https://gohugo.io/content-management/syntax-highlighting/) 介绍了有关语法高亮的更多信息,
包括语法高亮的 shortcode.
{{&lt; /admonition &gt;}}

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
&lt;table&gt;
  &lt;thead&gt;
    &lt;tr&gt;
      &lt;th&gt;Option&lt;/th&gt;
      &lt;th&gt;Description&lt;/th&gt;
    &lt;/tr&gt;
  &lt;/thead&gt;
  &lt;tbody&gt;
    &lt;tr&gt;
      &lt;td&gt;data&lt;/td&gt;
      &lt;td&gt;path to data files to supply the data that will be passed into templates.&lt;/td&gt;
    &lt;/tr&gt;
    &lt;tr&gt;
      &lt;td&gt;engine&lt;/td&gt;
      &lt;td&gt;engine to be used for processing templates. Handlebars is the default.&lt;/td&gt;
    &lt;/tr&gt;
    &lt;tr&gt;
      &lt;td&gt;ext&lt;/td&gt;
      &lt;td&gt;extension to be used for dest files.&lt;/td&gt;
    &lt;/tr&gt;
  &lt;/tbody&gt;
&lt;/table&gt;
```

{{&lt; admonition note &#34;文本右对齐或居中对齐&#34; &gt;}}
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
{{&lt; /admonition &gt;}}

## 11 链接 {#links}

### 基本链接

```markdown
&lt;https://assemble.io&gt;
&lt;contact@revolunet.com&gt;
[Assemble](https://assemble.io)
```

呈现的输出效果如下 (将鼠标悬停在链接上，没有提示):

&lt;https://assemble.io&gt;

&lt;contact@revolunet.com&gt;

[Assemble](https://assemble.io)

输出的 HTML 看起来像这样:

```html
&lt;a href=&#34;https://assemble.io&#34;&gt;https://assemble.io&lt;/a&gt;
&lt;a href=&#34;mailto:contact@revolunet.com&#34;&gt;contact@revolunet.com&lt;/a&gt;
&lt;a href=&#34;https://assemble.io&#34;&gt;Assemble&lt;/a&gt;
```

### 添加一个标题

```markdown
[Upstage](https://github.com/upstage/ &#34;Visit Upstage!&#34;)
```

呈现的输出效果如下 (将鼠标悬停在链接上，会有一行提示):

[Upstage](https://github.com/upstage/ &#34;Visit Upstage!&#34;)

输出的 HTML 看起来像这样:

```html
&lt;a href=&#34;https://github.com/upstage/&#34; title=&#34;Visit Upstage!&#34;&gt;Upstage&lt;/a&gt;
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
## Chapter 1 &lt;a id=&#34;chapter-1&#34;&gt;&lt;/a&gt;
Content for chapter one.

## Chapter 2 &lt;a id=&#34;chapter-2&#34;&gt;&lt;/a&gt;
Content for chapter one.

## Chapter 3 &lt;a id=&#34;chapter-3&#34;&gt;&lt;/a&gt;
Content for chapter one.
```

{{&lt; admonition &gt;}}
定位标记的位置几乎是任意的. 因为它们并不引人注目, 所以它们通常被放在同一行了.
{{&lt; /admonition &gt;}}

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
![Alt text](https://octodex.github.com/images/stormtroopocat.jpg &#34;The Stormtroopocat&#34;)
```

![Alt text](https://octodex.github.com/images/stormtroopocat.jpg &#34;The Stormtroopocat&#34;)

像链接一样, 图片也具有脚注样式的语法:

```markdown
![Alt text][id]
```

![Alt text][id]

稍后在文档中提供参考内容, 用来定义 URL 的位置:

```markdown
[id]: https://octodex.github.com/images/dojocat.jpg  &#34;The Dojocat&#34;
```

[id]: https://octodex.github.com/images/dojocat.jpg  &#34;The Dojocat&#34;

{{&lt; admonition tip &gt;}}
**FixIt** 主题提供了一个包含更多功能的 [图片的 shortcode](../theme-documentation-extended-shortcodes#image).
{{&lt; /admonition &gt;}}

## 14 数学公式

**FixIt** 基于 [$\KaTeX$](https://katex.org/) 提供数学公式的支持.

在你的 [网站配置](../theme-documentation-basics#site-configuration) 中的 `[params.math]` 下面设置属性 `enable = true`,
并在文章的前置参数中设置属性 `math: true`来启用数学公式的自动渲染.
**$\KaTeX$** 根据 **特定的分隔符** 来自动渲染公式.

{{&lt; admonition tip &gt;}}
有一份 [$\KaTeX$ 中支持的 $\TeX$ 函数](https://katex.org/docs/supported.html) 清单.
{{&lt; /admonition &gt;}}

{{&lt; admonition &gt;}}
由于 Hugo 在渲染 Markdown 文档时会根据 `_`/`*`/`&gt;&gt;` 之类的语法生成 HTML 文档,
并且有些转义字符形式的文本内容 (如 `\(`/`\)`/`\[`/`\]`/`\\`) 会自动进行转义处理,
因此需要对这些地方进行额外的转义字符表达来实现自动渲染:

* `_` -&gt; `\_`
* `*` -&gt; `\*`
* `&gt;&gt;` -&gt; `\&gt;&gt;`
* `\(` -&gt; `\\(`
* `\)` -&gt; `\\)`
* `\[` -&gt; `\\[`
* `\]` -&gt; `\\]`
* `\\` -&gt; `\\\\`

**FixIt** 主题支持 [`raw` shortcode](../theme-documentation-extended-shortcodes#12-raw) 以避免这些转义字符,
它可以帮助您编写原始数学公式内容.

一个 `raw` 示例:

```markdown
行内公式: {{&lt;/* raw */&gt;}}\(\mathbf{E}=\sum_{i} \mathbf{E}_{i}=\mathbf{E}_{1}&#43;\mathbf{E}_{2}&#43;\mathbf{E}_{3}&#43;\cdots\){{&lt;/* /raw */&gt;}}

公式块:

{{&lt;/* raw */&gt;}}
\[ a=b&#43;c \\ d&#43;e=f \]
{{&lt;/* /raw */&gt;}}
```

呈现的输出效果如下:

行内公式: {{&lt; raw &gt;}}\(\mathbf{E}=\sum_{i} \mathbf{E}_{i}=\mathbf{E}_{1}&#43;\mathbf{E}_{2}&#43;\mathbf{E}_{3}&#43;\cdots\){{&lt; /raw &gt;}}

公式块:

{{&lt; raw&gt;}}
\[ a=b&#43;c \\ d&#43;e=f \]
{{&lt; /raw &gt;}}
{{&lt; /admonition &gt;}}

### 行内公式

默认的行内公式分割符有:

* `$ ... $`
* `\( ... \)` (转义的: `\\( ... \\)`)

例如:

```tex
$c = \pm\sqrt{a^2 &#43; b^2}$ 和 \\(f(x)=\int_{-\infty}^{\infty} \hat{f}(\xi) e^{2 \pi i \xi x} d \xi\\)
```

呈现的输出效果如下:

$c = \pm\sqrt{a^2 &#43; b^2}$ 和 \\(f(x)=\int_{-\infty}^{\infty} \hat{f}(\xi) e^{2 \pi i \xi x} d \xi\\)

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
$$ c = \pm\sqrt{a^2 &#43; b^2} $$

\\[ f(x)=\int_{-\infty}^{\infty} \hat{f}(\xi) e^{2 \pi i \xi x} d \xi \\]

\begin{equation*}
  \rho \frac{\mathrm{D} \mathbf{v}}{\mathrm{D} t}=\nabla \cdot \mathbb{P}&#43;\rho \mathbf{f}
\end{equation*}

\begin{equation}
  \mathbf{E}=\sum_{i} \mathbf{E}\_{i}=\mathbf{E}\_{1}&#43;\mathbf{E}\_{2}&#43;\mathbf{E}_{3}&#43;\cdots
\end{equation}

\begin{align}
  a&amp;=b&#43;c \\\\
  d&#43;e&amp;=f
\end{align}

\begin{alignat}{2}
   10&amp;x&#43;&amp;3&amp;y = 2 \\\\
   3&amp;x&#43;&amp;13&amp;y = 4
\end{alignat}

\begin{gather}
   a=b \\\\
   e=b&#43;c
\end{gather}

\begin{CD}
   A @&gt;a\&gt;&gt; B \\\\
@VbVV @AAcA \\\\
   C @= D
\end{CD}
```

呈现的输出效果如下:

$$ c = \pm\sqrt{a^2 &#43; b^2} $$

\\[ f(x)=\int_{-\infty}^{\infty} \hat{f}(\xi) e^{2 \pi i \xi x} d \xi \\]

\begin{equation*}
  \rho \frac{\mathrm{D} \mathbf{v}}{\mathrm{D} t}=\nabla \cdot \mathbb{P}&#43;\rho \mathbf{f}
\end{equation*}

\begin{equation}
  \mathbf{E}=\sum_{i} \mathbf{E}\_{i}=\mathbf{E}\_{1}&#43;\mathbf{E}\_{2}&#43;\mathbf{E}_{3}&#43;\cdots
\end{equation}

\begin{align}
  a&amp;=b&#43;c \\\\
  d&#43;e&amp;=f
\end{align}

\begin{alignat}{2}
   10&amp;x&#43;&amp;3&amp;y = 2 \\\\
   3&amp;x&#43;&amp;13&amp;y = 4
\end{alignat}

\begin{gather}
   a=b \\\\
   e=b&#43;c
\end{gather}

\begin{CD}
   A @&gt;a\&gt;&gt; B \\\\
@VbVV @AAcA \\\\
   C @= D
\end{CD}

{{&lt; admonition tip &gt;}}
你可以在 [网站配置](../theme-documentation-basics#site-configuration) 中自定义行内公式和公式块的分割符.
{{&lt; /admonition &gt;}}

### mhchem

**[mhchem](https://github.com/Khan/KaTeX/tree/master/contrib/mhchem)** 是一个 **$\KaTeX$** 的插件.

通过这个扩展, 你可以在文章中轻松编写漂亮的化学方程式.

```markdown
$$ \ce{CO2 &#43; C -&gt; 2 CO} $$

$$ \ce{Hg^2&#43; -&gt;[I-] HgI2 -&gt;[I-] [Hg^{II}I4]^2-} $$
```

呈现的输出效果如下:

$$ \ce{CO2 &#43; C -&gt; 2 CO} $$

$$ \ce{Hg^2&#43; -&gt;[I-] HgI2 -&gt;[I-] [Hg^{II}I4]^2-} $$

## 15 字符修饰

**FixIt** 主题支持多种 **字符修饰** Markdown 扩展语法:

```markdown
[Hugo]{?^}(一个开源的静态网站生成工具)

[99]{?/}[100]

&lt;abbr title=&#34;Graphics Interchange Format&#34;&gt;GIF&lt;/abbr&gt;是一种位图图片格式。

H&lt;sub&gt;2&lt;/sub&gt;O

X&lt;sup&gt;n&lt;/sup&gt; &#43; Y&lt;sup&gt;n&lt;/sup&gt; = Z&lt;sup&gt;n&lt;/sup&gt;

按下&lt;kbd&gt;&lt;kbd&gt;CTRL&lt;/kbd&gt;&#43;&lt;kbd&gt;ALT&lt;/kbd&gt;&#43;&lt;kbd&gt;Delete&lt;/kbd&gt;&lt;/kbd&gt;以访问任务管理器。

大多数&lt;mark&gt;口腔癌&lt;/mark&gt;都是由于不良的生活习惯导致的。
```

呈现的输出效果如下:

[Hugo]^(一个开源的静态网站生成工具)

[90]/[100]

&lt;abbr title=&#34;Graphics Interchange Format&#34;&gt;GIF&lt;/abbr&gt;是一种位图图片格式。

H&lt;sub&gt;2&lt;/sub&gt;O

X&lt;sup&gt;n&lt;/sup&gt; &#43; Y&lt;sup&gt;n&lt;/sup&gt; = Z&lt;sup&gt;n&lt;/sup&gt;

按下&lt;kbd&gt;&lt;kbd&gt;CTRL&lt;/kbd&gt;&#43;&lt;kbd&gt;ALT&lt;/kbd&gt;&#43;&lt;kbd&gt;Delete&lt;/kbd&gt;&lt;/kbd&gt;以访问任务管理器。

大多数&lt;mark&gt;口腔癌&lt;/mark&gt;都是由于不良的生活习惯导致的。

## 16 转义字符 {#escape-character}

在某些特殊情况下，文章内容会与 Markdown 的基本或者扩展语法冲突, 并且无法避免.

转义字符语法可以帮助你渲染出想要的内容:

```markdown
{{??}X} -&gt; X
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
{{&lt;/* figure src=&#34;https://octodex.github.com/images/minion.png&#34; title=&#34;Lighthouse (figure)&#34; */&gt;}}
```

呈现的输出效果如下:

{{&lt; figure src=&#34;https://octodex.github.com/images/minion.png&#34; title=&#34;Lighthouse (figure)&#34; &gt;}}

输出的 HTML 看起来像这样:

```html
&lt;figure&gt;
    &lt;img src=&#34;https://octodex.github.com/images/minion.png&#34;/&gt;
    &lt;figcaption&gt;
        &lt;h4&gt;Lighthouse (figure)&lt;/h4&gt;
    &lt;/figcaption&gt;
&lt;/figure&gt;
```

### 2 gist

一个 `gist` 示例:

```markdown
{{&lt;/* gist spf13 7896402 */&gt;}}
```

呈现的输出效果如下:

{{&lt; gist spf13 7896402 &gt;}}

输出的 HTML 看起来像这样:

```html
&lt;script type=&#34;application/javascript&#34; src=&#34;https://gist.github.com/spf13/7896402.js&#34;&gt;&lt;/script&gt;
```

### 3 highlight

一个 `highlight` 示例:

```markdown
{{&lt;/* highlight html */&gt;}}
&lt;section id=&#34;main&#34;&gt;
    &lt;div&gt;
        &lt;h1 id=&#34;title&#34;&gt;{{ .Title }}&lt;/h1&gt;
        {{ range .Pages }}
            {{ .Render &#34;summary&#34;}}
        {{ end }}
    &lt;/div&gt;
&lt;/section&gt;
{{&lt;/* /highlight */&gt;}}
```

呈现的输出效果如下:

{{&lt; highlight html &gt;}}
&lt;section id=&#34;main&#34;&gt;
    &lt;div&gt;
        &lt;h1 id=&#34;title&#34;&gt;{{ .Title }}&lt;/h1&gt;
        {{ range .Pages }}
            {{ .Render &#34;summary&#34;}}
        {{ end }}
    &lt;/div&gt;
&lt;/section&gt;
{{&lt; /highlight &gt;}}

## 18 扩展shortcode

### 1 style

`style` shortcode 用来在你的文章中插入自定义样式，它有两个位置参数.

第一个参数是自定义样式的内容. 它支持 [SASS](https://sass-lang.com/documentation/style-rules/declarations#nesting) 中的嵌套语法，并且 `&amp;` 指代这个父元素.

第二个参数是包裹你要更改样式的内容的 HTML 标签, 默认值是 `div`.

一个 `style` 示例:

```markdown
{{&lt;/* style &#34;text-align:right; strong{color:#00b1ff;}&#34; */&gt;}}
This is a **right-aligned** paragraph.
{{&lt;/* /style */&gt;}}
```

呈现的输出效果如下:

{{&lt; style &#34;text-align:right; strong{color:#00b1ff;}&#34; &gt;}}
This is a **right-aligned** paragraph.
{{&lt; /style &gt;}}

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
{{&lt;/* link &#34;https://assemble.io&#34; */&gt;}}
或者
{{&lt;/* link href=&#34;https://assemble.io&#34; */&gt;}}

{{&lt;/* link &#34;mailto:contact@revolunet.com&#34; */&gt;}}
或者
{{&lt;/* link href=&#34;mailto:contact@revolunet.com&#34; */&gt;}}

{{&lt;/* link &#34;https://assemble.io&#34; Assemble */&gt;}}
或者
{{&lt;/* link href=&#34;https://assemble.io&#34; content=Assemble */&gt;}}
```

呈现的输出效果如下:

* {{&lt; link &#34;https://assemble.io&#34; &gt;}}
* {{&lt; link &#34;mailto:contact@revolunet.com&#34; &gt;}}
* {{&lt; link &#34;https://assemble.io&#34; Assemble &gt;}}

一个带有标题的 `link` 示例:

```markdown
{{&lt;/* link &#34;https://github.com/upstage/&#34; Upstage &#34;Visit Upstage!&#34; */&gt;}}
或者
{{&lt;/* link href=&#34;https://github.com/upstage/&#34; content=Upstage title=&#34;Visit Upstage!&#34; */&gt;}}
```

呈现的输出效果如下 (将鼠标悬停在链接上，会有一行提示):

{{&lt; link &#34;https://github.com/upstage/&#34; Upstage &#34;Visit Upstage!&#34; &gt;}}

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
{{&lt;/* image src=&#34;/images/lighthouse.jpg&#34; caption=&#34;Lighthouse (`image`)&#34; src_s=&#34;/images/lighthouse-small.jpg&#34; src_l=&#34;/images/lighthouse-large.jpg&#34; */&gt;}}
```

### 4 admonition

`admonition` shortcode 支持 **12** 种 帮助你在页面中插入提示的横幅.

*支持 Markdown 或者 HTML 格式.*

{{&lt; admonition &gt;}}
一个 **注意** 横幅
{{&lt; /admonition &gt;}}

{{&lt; admonition abstract &gt;}}
一个 **摘要** 横幅
{{&lt; /admonition &gt;}}

{{&lt; admonition info &gt;}}
一个 **信息** 横幅
{{&lt; /admonition &gt;}}

{{&lt; admonition tip &gt;}}
一个 **技巧** 横幅
{{&lt; /admonition &gt;}}

{{&lt; admonition success &gt;}}
一个 **成功** 横幅
{{&lt; /admonition &gt;}}

{{&lt; admonition question &gt;}}
一个 **问题** 横幅
{{&lt; /admonition &gt;}}

{{&lt; admonition warning &gt;}}
一个 **警告** 横幅
{{&lt; /admonition &gt;}}

{{&lt; admonition failure &gt;}}
一个 **失败** 横幅
{{&lt; /admonition &gt;}}

{{&lt; admonition danger &gt;}}
一个 **危险** 横幅
{{&lt; /admonition &gt;}}

{{&lt; admonition bug &gt;}}
一个 **Bug** 横幅
{{&lt; /admonition &gt;}}

{{&lt; admonition example &gt;}}
一个 **示例** 横幅
{{&lt; /admonition &gt;}}

{{&lt; admonition quote &gt;}}
一个 **引用** 横幅
{{&lt; /admonition &gt;}}

`admonition` shortcode 有以下命名参数:

* **type** *[可选]* (**第一个**位置参数)

    `admonition` 横幅的类型, 默认值是 `note`.

* **title** *[可选]* (**第二个**位置参数)

    `admonition` 横幅的标题, 默认值是 **type** 参数的值.

* **open** *[可选]* (**第三个**位置参数) {{&lt; version 0.2.0 changed &gt;}}

    横幅内容是否默认展开, 默认值是 `true`.

一个 `admonition` 示例:

```markdown
{{&lt;/* admonition type=tip title=&#34;This is a tip&#34; open=false */&gt;}}
一个 **技巧** 横幅
{{&lt;/* /admonition */&gt;}}
或者
{{&lt;/* admonition tip &#34;This is a tip&#34; false */&gt;}}
一个 **技巧** 横幅
{{&lt;/* /admonition */&gt;}}
```

呈现的输出效果如下:

{{&lt; admonition tip &#34;This is a tip&#34; false &gt;}}
一个 **技巧** 横幅
{{&lt; /admonition &gt;}}

### 5 mermaid

`mermaid` shortcode 使用 [Mermaid](https://mermaidjs.github.io/) 库提供绘制图表和流程图的功能。[mermaid](https://mermaidjs.github.io/) 是一个可以帮助你在文章中绘制图表和流程图的库, 类似 Markdown 的语法。只需将你的 mermaid 代码插入 `mermaid` shortcode 中即可。

一个 **流程图** `mermaid` 示例:

```markdown
{{&lt;/* mermaid */&gt;}}
graph LR;
    A[Hard edge] --&gt;|Link text| B(Round edge)
    B --&gt; C{Decision}
    C --&gt;|One| D[Result one]
    C --&gt;|Two| E[Result two]
{{&lt;/* /mermaid */&gt;}}
```

呈现的输出效果如下:

{{&lt; mermaid &gt;}}
graph LR;
    A[Hard edge] --&gt;|Link text| B(Round edge)
    B --&gt; C{Decision}
    C --&gt;|One| D[Result one]
    C --&gt;|Two| E[Result two]
{{&lt; /mermaid &gt;}}

### 6 echarts

echarts` shortcode 使用 [ECharts](https://echarts.apache.org/) 库提供数据可视化的功能。**ECharts** 是一个生成交互式数据可视化的库。

只需在 `echarts` shortcode 中以 `JSON`/`YAML`/`TOML`格式插入 ECharts 选项即可。


`echarts` shortcode 有以下命名参数:

* **width** *[可选]* (**第一个**位置参数)

    {{&lt; version 0.2.0 &gt;}} 数据可视化的宽度, 默认值是 `100%`.

* **height** *[可选]* (**第二个**位置参数)

    {{&lt; version 0.2.0 &gt;}} 数据可视化的高度, 默认值是 `30rem`.

一个 `JSON` 格式的 `echarts` 示例:

```json
{{&lt;/* echarts */&gt;}}
{
  &#34;title&#34;: {
    &#34;text&#34;: &#34;折线统计图&#34;,
    &#34;top&#34;: &#34;2%&#34;,
    &#34;left&#34;: &#34;center&#34;
  },
  &#34;tooltip&#34;: {
    &#34;trigger&#34;: &#34;axis&#34;
  },
  &#34;legend&#34;: {
    &#34;data&#34;: [&#34;邮件营销&#34;, &#34;联盟广告&#34;, &#34;视频广告&#34;, &#34;直接访问&#34;, &#34;搜索引擎&#34;],
    &#34;top&#34;: &#34;10%&#34;
  },
  &#34;grid&#34;: {
    &#34;left&#34;: &#34;5%&#34;,
    &#34;right&#34;: &#34;5%&#34;,
    &#34;bottom&#34;: &#34;5%&#34;,
    &#34;top&#34;: &#34;20%&#34;,
    &#34;containLabel&#34;: true
  },
  &#34;toolbox&#34;: {
    &#34;feature&#34;: {
      &#34;saveAsImage&#34;: {
        &#34;title&#34;: &#34;保存为图片&#34;
      }
    }
  },
  &#34;xAxis&#34;: {
    &#34;type&#34;: &#34;category&#34;,
    &#34;boundaryGap&#34;: false,
    &#34;data&#34;: [&#34;周一&#34;, &#34;周二&#34;, &#34;周三&#34;, &#34;周四&#34;, &#34;周五&#34;, &#34;周六&#34;, &#34;周日&#34;]
  },
  &#34;yAxis&#34;: {
    &#34;type&#34;: &#34;value&#34;
  },
  &#34;series&#34;: [
    {
      &#34;name&#34;: &#34;邮件营销&#34;,
      &#34;type&#34;: &#34;line&#34;,
      &#34;stack&#34;: &#34;总量&#34;,
      &#34;data&#34;: [120, 132, 101, 134, 90, 230, 210]
    },
    {
      &#34;name&#34;: &#34;联盟广告&#34;,
      &#34;type&#34;: &#34;line&#34;,
      &#34;stack&#34;: &#34;总量&#34;,
      &#34;data&#34;: [220, 182, 191, 234, 290, 330, 310]
    },
    {
      &#34;name&#34;: &#34;视频广告&#34;,
      &#34;type&#34;: &#34;line&#34;,
      &#34;stack&#34;: &#34;总量&#34;,
      &#34;data&#34;: [150, 232, 201, 154, 190, 330, 410]
    },
    {
      &#34;name&#34;: &#34;直接访问&#34;,
      &#34;type&#34;: &#34;line&#34;,
      &#34;stack&#34;: &#34;总量&#34;,
      &#34;data&#34;: [320, 332, 301, 334, 390, 330, 320]
    },
    {
      &#34;name&#34;: &#34;搜索引擎&#34;,
      &#34;type&#34;: &#34;line&#34;,
      &#34;stack&#34;: &#34;总量&#34;,
      &#34;data&#34;: [820, 932, 901, 934, 1290, 1330, 1320]
    }
  ]
}
{{&lt;/* /echarts */&gt;}}
```

呈现的输出效果如下:

{{&lt; echarts &gt;}}
{
  &#34;title&#34;: {
    &#34;text&#34;: &#34;折线统计图&#34;,
    &#34;top&#34;: &#34;2%&#34;,
    &#34;left&#34;: &#34;center&#34;
  },
  &#34;tooltip&#34;: {
    &#34;trigger&#34;: &#34;axis&#34;
  },
  &#34;legend&#34;: {
    &#34;data&#34;: [&#34;邮件营销&#34;, &#34;联盟广告&#34;, &#34;视频广告&#34;, &#34;直接访问&#34;, &#34;搜索引擎&#34;],
    &#34;top&#34;: &#34;10%&#34;
  },
  &#34;grid&#34;: {
    &#34;left&#34;: &#34;5%&#34;,
    &#34;right&#34;: &#34;5%&#34;,
    &#34;bottom&#34;: &#34;5%&#34;,
    &#34;top&#34;: &#34;20%&#34;,
    &#34;containLabel&#34;: true
  },
  &#34;toolbox&#34;: {
    &#34;feature&#34;: {
      &#34;saveAsImage&#34;: {
        &#34;title&#34;: &#34;保存为图片&#34;
      }
    }
  },
  &#34;xAxis&#34;: {
    &#34;type&#34;: &#34;category&#34;,
    &#34;boundaryGap&#34;: false,
    &#34;data&#34;: [&#34;周一&#34;, &#34;周二&#34;, &#34;周三&#34;, &#34;周四&#34;, &#34;周五&#34;, &#34;周六&#34;, &#34;周日&#34;]
  },
  &#34;yAxis&#34;: {
    &#34;type&#34;: &#34;value&#34;
  },
  &#34;series&#34;: [
    {
      &#34;name&#34;: &#34;邮件营销&#34;,
      &#34;type&#34;: &#34;line&#34;,
      &#34;stack&#34;: &#34;总量&#34;,
      &#34;data&#34;: [120, 132, 101, 134, 90, 230, 210]
    },
    {
      &#34;name&#34;: &#34;联盟广告&#34;,
      &#34;type&#34;: &#34;line&#34;,
      &#34;stack&#34;: &#34;总量&#34;,
      &#34;data&#34;: [220, 182, 191, 234, 290, 330, 310]
    },
    {
      &#34;name&#34;: &#34;视频广告&#34;,
      &#34;type&#34;: &#34;line&#34;,
      &#34;stack&#34;: &#34;总量&#34;,
      &#34;data&#34;: [150, 232, 201, 154, 190, 330, 410]
    },
    {
      &#34;name&#34;: &#34;直接访问&#34;,
      &#34;type&#34;: &#34;line&#34;,
      &#34;stack&#34;: &#34;总量&#34;,
      &#34;data&#34;: [320, 332, 301, 334, 390, 330, 320]
    },
    {
      &#34;name&#34;: &#34;搜索引擎&#34;,
      &#34;type&#34;: &#34;line&#34;,
      &#34;stack&#34;: &#34;总量&#34;,
      &#34;data&#34;: [820, 932, 901, 934, 1290, 1330, 1320]
    }
  ]
}
{{&lt; /echarts &gt;}}

### 7 bilibili

`bilibili` shortcode 提供了一个内嵌的用来播放 bilibili 视频的响应式播放器.

如果视频只有一个部分, 则仅需要视频的 BV `id`, 例如:

```code
https://www.bilibili.com/video/BV1Sx411T7QQ
```

一个 `bilibili` 示例:

```markdown
{{&lt;/* bilibili BV1Sx411T7QQ */&gt;}}
或者
{{&lt;/* bilibili id=BV1Sx411T7QQ */&gt;}}
```

呈现的输出效果如下:

{{&lt; bilibili id=BV1Sx411T7QQ &gt;}}

如果视频包含多个部分, 则除了视频的 BV `id` 之外, 还需要 `p`, 默认值为 `1`, 例如:

```code
https://www.bilibili.com/video/BV1TJ411C7An?p=3
```

一个带有 `p` 参数的 `bilibili` 示例:

```markdown
{{&lt;/* bilibili BV1TJ411C7An 3 */&gt;}}
或者
{{&lt;/* bilibili id=BV1TJ411C7An p=3 */&gt;}}
```

呈现的输出效果如下:

{{&lt; bilibili id=BV1TJ411C7An p=3 &gt;}}

### 8 script

`script` shortcode 用来在你的文章中插入 **Javascript** 脚本.

{{&lt; admonition &gt;}}
脚本内容可以保证在所有的第三方库加载之后按顺序执行.
所以你可以自由地使用第三方库.
{{&lt; /admonition &gt;}}

一个 `script` 示例:

```markdown
{{&lt;/* script */&gt;}}
console.log(&#39;Hello FixIt!&#39;);
{{&lt;/* /script */&gt;}}
```

你可以在开发者工具的控制台中看到输出.

{{&lt; script &gt;}}
console.log(&#39;Hello FixIt!&#39;);
{{&lt; /script &gt;}}

### 9 raw

`raw` shortcode 用来在你的文章中插入原始 **HTML** 内容.

一个 `raw` 示例:

```markdown
行内公式: {{&lt;/* raw */&gt;}}\(\mathbf{E}=\sum_{i} \mathbf{E}_{i}=\mathbf{E}_{1}&#43;\mathbf{E}_{2}&#43;\mathbf{E}_{3}&#43;\cdots\){{&lt;/* /raw */&gt;}}

公式块:

{{&lt;/* raw */&gt;}}
\[ a=b&#43;c \\ d&#43;e=f \]
{{&lt;/* /raw */&gt;}}

原始的带有 Markdown 语法的内容: {{&lt;/* raw */&gt;}}**Hello**{{&lt;/* /raw */&gt;}}
```

呈现的输出效果如下:

行内公式: {{&lt; raw &gt;}}\(\mathbf{E}=\sum_{i} \mathbf{E}_{i}=\mathbf{E}_{1}&#43;\mathbf{E}_{2}&#43;\mathbf{E}_{3}&#43;\cdots\){{&lt; /raw &gt;}}

公式块:

{{&lt; raw&gt;}}
\[ a=b&#43;c \\ d&#43;e=f \]
{{&lt; /raw &gt;}}

原始的带有 Markdown 语法的内容: {{&lt; raw &gt;}}**Hello**{{&lt; /raw &gt;}}

---

> 作者: Francis Fu  
> URL: https://francisfu.com/posts/hugo%E9%9D%99%E6%80%81%E9%A1%B5%E9%9D%A2%E7%94%9F%E6%88%90%E5%99%A8%E6%8C%87%E5%8D%97/hugo-fixit%E8%AF%AD%E6%B3%95%E5%8F%82%E8%80%83/  

