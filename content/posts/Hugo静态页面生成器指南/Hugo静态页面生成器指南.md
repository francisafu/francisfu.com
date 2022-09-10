---
title: Hugo静态页面生成器指南
toc: false
authors:
  - Francis Fu
tags:
categories:
series:
date: '2022-09-02'
thumbnail: "images/landscape.jpg"
math: true
draft: true
---

从Hexo到Statiq再到Hugo，三年的时间内我尝试了不同的几种静态页面生成器。最终选择了Hugo也是因为感觉到，它还是最方便好用的一种。在此记录一下Hugo的使用方式以及Anatole主题的搭建和配置。

<!--more-->

## 标题

同常规Markdown语法一样，依次提供 `<h1>`—`<h6>` HTML标签。

# H1
## H2
### H3
#### H4
##### H5
###### H6

## 段落

也和常规Markdown语法一样。比如这里是一段话。

空一行后的这里是另一段话。  
不空行并在句末加两个空格为另起一行。

## 引用

Eureka支持两种方式的引用，即附带注释和不带注释的引用。

#### 不带注释的引用

> 这是一段引用  
> **注意：** 你可以在引用中使用 *Markdown语法标记* 。

#### 附带注释的引用

> 度尽劫波兄弟在，相逢一笑泯恩仇。<br>
> — <cite>鲁迅 [^1]</cite>

[^1]: 这句话出自鲁迅的[《题三义塔》](https://so.gushiwen.cn/shiwenv_7917bc0ef7c4.aspx) ，作于1933年6月21日。

## 列表

和常规Markdown列表语法基本相同。

#### 有序列表

1. 第一项
2. 第二项
3. 第三项

#### 无序列表

* 有一个列表项
* 另一个列表项
* 第三个列表项

#### 层级列表

* 水果
  * 苹果
  * 橘子
  * 香蕉
* 清单
  * 牛奶
  * 鸡蛋

## 代码

```html
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>Example HTML5 Document</title>
</head>
<body>
  <p>Test</p>
</body>
</html>
```

## 表格

表格并不是Markdown基础语法的一部分，但是Hugo原生支持建立表格，并且可以在表格中使用Markdown语法。

| 斜体       | 粗体     | 代码    |
| --------  | -------- | ------ |
| *italics* | **bold** | `code` |

## 科学公式

- To enable KaTex globally set the parameter `math` to `true` in a project's configuration
- To enable KaTex on a per page basis include the parameter `math: true` in content files

Eureka支持使用KaTeX渲染科学公式，比如可以使用行内公式：\\(E=mc^2\\) 。

也可以渲染复杂的公式，比如：

<div>
\[ \int u \frac{dv}{dx}\, dx=uv-\int \frac{du}{dx}v\,dx \]
</div>


矩阵：

<div>
\[ \begin{pmatrix} a&b\\c&d \end{pmatrix} \quad
\begin{bmatrix} a&b\\c&d \end{bmatrix} \quad
\begin{Bmatrix} a&b\\c&d \end{Bmatrix} \quad
\begin{vmatrix} a&b\\c&d \end{vmatrix} \]
</div>

多行公式：

<div>
\[\begin{aligned}
x ={}& a+b+c+{} \\
&d+e+f+g
\end{aligned}\]
</div>

## 图表

Eureka支持使用Mermaid渲染图表。为了能够正确渲染表格、图表和流程图，请确保`config.yaml`中的`markup.goldmark.renderer.unsafe`的值为true。

Mermaid流程图渲染示例:

```mermaid
sequenceDiagram
    participant Alice
    participant Bob
    Alice->>John: Hello John, how are you?
    loop Healthcheck
        John->>John: Fight against hypochondria
    end
    Note right of John: Rational thoughts <br/>prevail!
    John-->>Alice: Great!
    John->>Bob: How about you?
    Bob-->>John: Jolly good!
```

## 其他元素——缩写，脚标，角标，键盘按键，高亮标记

<abbr title="Graphics Interchange Format">GIF</abbr>是一种位图图片格式。

H<sub>2</sub>O

X<sup>n</sup> + Y<sup>n</sup> = Z<sup>n</sup>

按下<kbd><kbd>CTRL</kbd>+<kbd>ALT</kbd>+<kbd>Delete</kbd></kbd>以访问任务管理器。

大多数<mark>口腔癌</mark>都是由于不良的生活习惯导致的。

## 行内HTML和CSS

<svg class="canon" xmlns="http://www.w3.org/2000/svg" overflow="visible" viewBox="0 0 496 373" height="373" width="496"><g fill="none"><path stroke="#000" stroke-width=".75" d="M.599 372.348L495.263 1.206M.312.633l494.95 370.853M.312 372.633L247.643.92M248.502.92l246.76 370.566M330.828 123.869V1.134M330.396 1.134L165.104 124.515"></path><path stroke="#ED1C24" stroke-width=".75" d="M275.73 41.616h166.224v249.05H275.73zM54.478 41.616h166.225v249.052H54.478z"></path><path stroke="#000" stroke-width=".75" d="M.479.375h495v372h-495zM247.979.875v372"></path><ellipse cx="498.729" cy="177.625" rx=".75" ry="1.25"></ellipse><ellipse cx="247.229" cy="377.375" rx=".75" ry="1.25"></ellipse></g></svg>

[The Van de Graaf Canon](https://en.wikipedia.org/wiki/Canons_of_page_construction#Van_de_Graaf_canon)

{{< css.inline >}}
<style>
.canon { background: white; width: 100%; height: auto; }
</style>
{{< /css.inline >}}

## 图像代码

Hugo has `figure` shortcode built-in, so you can easily add figure captions or hyperlink rel attributes to images. Documentations can be found here:

https://gohugo.io/content-management/shortcodes/#figure

This theme has 3 CSS classes made for figure elements:

- `big`: images will break the width limit of main content area.
- `left`: images will float to the left.
- `right`: images will float to the right.

If a figure has no class set, the image will behave just like a normal markdown image: `![]()`.

Here are some examples; please be aware that these styles only take effect when the page width is over 1300px.

{{< figure src="https://via.placeholder.com/1600x800" alt="image" caption="figure-normal (without any classes)" >}}

{{< figure src="https://via.placeholder.com/1600x800" alt="image" caption="figure-big" class="big" >}}

{{< figure src="https://via.placeholder.com/1600x800" alt="image" caption="figure-medium" class="medium" >}}

{{< figure src="https://via.placeholder.com/1600x800" alt="image" caption="figure-small" class="small" >}}

Pellentesque posuere sem nec nunc varius, id hendrerit arcu consequat. Maecenas commodo, sapien ut gravida porttitor, dolor risus facilisis enim, eget pharetra nibh nisl porttitor sapien. Proin finibus elementum ligula sit amet hendrerit. Praesent et erat sodales ante accumsan pharetra non eu nulla. Sed vehicula consequat lorem, a fermentum ante faucibus quis. Aliquam erat volutpat. In vitae tincidunt dui. Proin sit amet ligula sodales, elementum tortor et, venenatis sem. Maecenas non nisl erat. Curabitur nec velit eros. Ut cursus lacus nisi, non pretium libero euismod et. Fusce luctus in nisi quis sollicitudin. Aenean nec blandit ligula. Duis ac felis lorem. Proin tellus tellus, dictum nec tempus sit amet, venenatis ac felis. Sed in pharetra nulla, non mollis sem.

{{< figure src="https://via.placeholder.com/1600x800" alt="image" caption="figure-tiny" class="tiny" >}}

{{< figure src="https://via.placeholder.com/400x280" alt="image" caption="figure-left" class="left" >}}

In a libero varius, luctus ligula et, bibendum tortor. Sed sit amet dui malesuada, mattis justo id, ultricies enim. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aliquam sollicitudin cursus feugiat. Vivamus suscipit ipsum eget lobortis sollicitudin. Fusce vehicula neque tellus. Integer eu posuere quam, id laoreet tortor. Mauris sit amet turpis urna. Donec venenatis tempor dolor, nec laoreet orci aliquet et. Sed condimentum elit eu tristique aliquam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc luctus ipsum sit amet nisl maximus pellentesque.

{{< figure src="https://via.placeholder.com/400x280" alt="image" caption="figure-right" class="right" >}}

Pellentesque eu consequat nunc. Vivamus eu eros ut nulla dapibus molestie in id tortor. Cras viverra ligula erat, tincidunt hendrerit diam blandit nec. Cras id urna vel dolor dictum mattis. Vestibulum congue erat ac eros molestie accumsan. Maecenas lorem nibh, maximus vel justo eget, facilisis egestas lectus. Mauris eu est ut odio blandit consequat id feugiat eros. Fusce id suscipit mi, et lacinia lectus. Mauris a arcu placerat dolor iaculis feugiat nec non mi. Ut porttitor elit tortor, eget tempus velit mollis eu. Aliquam sem nulla, dictum cursus mauris ac, semper ullamcorper leo.

## Rich Content Short Code

Hugo ships with several [Built-in Shortcodes](https://gohugo.io/content-management/shortcodes/#use-hugos-built-in-shortcodes) for rich content, along with a [Privacy Config](https://gohugo.io/about/hugo-and-gdpr/) and a set of Simple Shortcodes that enable static and no-JS versions of various social media embeds.

## <!--more-->

## YouTube Privacy Enhanced Shortcode

{{< youtube ZJthWmvUzzc >}}

<br>

---

## Twitter Simple Shortcode

{{< twitter_simple 1085870671291310081 >}}

<br>

---

## Vimeo Simple Shortcode

{{< vimeo_simple 48912912 >}}

The notice shortcode supports three different types of disclaimers. These are as following:

## Info Notice

```
{{%/* notice info */%}}
Lorem Impsum..
{{%/* /notice */%}}
```

{{< notice info >}}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
{{< /notice >}}

## Update Notice

```
{{%/* notice update */%}}
Lorem Impsum..
{{%/* /notice */%}}
```

{{< notice update >}}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
{{< /notice >}}

## Warning Notice

```
{{%/* notice warning */%}}
Lorem Impsum..
{{%/* /notice */%}}
```

{{< notice warning >}}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
{{< /notice >}}

## Redirect

Front Matter:

```
redirectUrl="https://gohugo.io"
```
In page:

```
Forwarding to [gohugo](https://gohugo.io) using 'redirectUrl'
{{%/* loading */%}}
```