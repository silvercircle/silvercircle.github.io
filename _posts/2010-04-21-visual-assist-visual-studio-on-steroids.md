---
title: Visual Assist = Visual Studio on steroids
date: 2010-04-21T19:57:08+00:00
modified: 2010-04-21T19:57:08+00:00
author: Admin
layout: default
tag: [first]
share: 1
disqus: 1
menucontext: blog
category: Development
backlink: /blog
excerpt: >
    Visual Assist is an add-on product for Microsoft Visual Studio that offers many features to 
    enhance the code editor and improve the general user experience. It can be a real time saver, 
    providing significant gains in productivity.

images:
    highlight:
        path: archive/2010/04/
        name: va_x_highlight.png
        desc: Improved syntax highlighting in Visual Assist X
    complete:
        path: archive/2010/04/
        name: va_x_complete.png
        desc: Visual Assist X running in Visual Studio 2010
    tooltip:
        path: archive/2010/04/
        name: va_x_tooltip.png
        desc: Visual Assist X smart tooltips
    outline:
        path: archive/2010/04/
        name: va_x_outline.png
        desc: Visual Assist X outline view
---
# Here is an excellent time saver for Visual Studio users

{% include post_header.html %}
{% include defs.md %}
{% include content/archive-warning.md %}

A <a href="http://msdn.microsoft.com/en-us/ff625297.aspx">new version of Visual Studio</a> was 
released recently, so it's time to talk about it. The 2010 release of this most popular IDE for 
Microsoft Windows adds a number of new features, a new language (F#), a overhauled WPF based user 
interface that looks and performs better, multi-monitor support (it was about time) a new browser 
based help system, a improved debugger (historical debugging can be incredibly useful, really), and 
a lot more. It also comes with a new .NET framework (version 4) and the ability to build for 
different platform toolsets - even in C++ it is possible to build for the old Visual C++ 2008 
version, thus avoiding the need for a new runtime at the user's end and new toolsets can be added 
with relative ease.
{% include gfx/BD.html image=page.images.complete borderclass="borderless" %}

Also, Visual Studio 2010 has a new extension system which should greatly simplify the development of 
add-ins (aka extensions). MEF (Managed Extensibility Framework) is the name for the new extension 
framework and one of the most useful extensions that did exist for previous versions has already 
been adopted. I'm talking about <a href="http://www.wholetomato.com">Visual Assist X</a>, a tool 
that aims at developers who need to write large amounts of code and have a strong demand for an 
improved code editor.

<p style="text-align: justify;">
  Like any software product, Visual Studio has a few weak points and one of them is, at least in my book, the code editor. While it is not exactly a <em>bad</em> editor, it always feels a bit basic to me in comparison to other editors, like Eclipse CDT or SlickEdit. Visual Studio 2010 introduces a few improvements to the editor with better outlining (the MS term for code folding) and slightly enhanced intellisense functionality.
</p>

<p style="text-align: justify;">
  Like I wrote in <a href="http://blog.miranda.or.at/development/eclipse-cdt-7-a-preview">this article</a>, I'm a Eclipse fan, simply because Eclipse, in combination with the C++ development tools (CDT), features one of the best code editors you can get. I really like it for its comprehensive code navigation, semantic code highlighting, real time syntax analysis and powerful code assistance.
</p>

## Features, the Visual Studio editor does lack in my opinion:

* advanced or like it is sometimes called, <em>semantic</em> code highlighting. Instead of only 
  highlighting basic language elements like keywords, strings and numbers, the editor will also 
  allow to highlight macro definitions, classes, methods, different kind of variables (global, 
  local) and more with different colors, making the code easier to read.

* code navigation. It is somewhat limited in Visual Studio.

* more intelligent code assistance - auto-complete suggestions while you type.

* Structural outline view of current file.

* automatic formatting of pasted code, automatic brace/parenthesis placement.

* some automatic correction features (identifier misspelling, case correction and such nifty little 
  helpers).

{% include gfx/BD.html image=page.images.highlight borderclass="borderless" %}

<p style="text-align: justify;">
  <strong><span style="color: #ff0000;"><span style="font-size: medium;">Visual Assist X</span></span></strong> adds all these nice features and much more to the editor and works seamlessly throughout Visual Studio. Currently, it supports C/C++, C#, ASP, Visual Basic, HTML, XML, JavaScript and VBScript. It also works in any version of Visual Studio, beginning with version 6 (aka Visual Studio 98) up to version 2008, <strong>except all Express editions </strong>(but this isn't their fault, it is because Express editions do not support this kind of extensions or add-ins).
</p>

Support for Visual Studio 2010 was added recently and is currently in release candidate state. This is the version I tested on my Visual Studio 2010 installation.

<p style="text-align: justify;">
  I'm writing this article from the view point of a C++ programmer and while there are competing solutions for C# and other .NET languages (examples: <a href="http://www.jetbrains.com/resharper/">JetBrains Resharper</a> or <a href="http://www.devexpress.com/Products/Visual_Studio_Add-in/Coding_Assistance/">CodeRush</a>), Visual Assist X is really the only major extension that does not ignore C and C++ developers.
</p>

<p style="text-align: justify;">
  VA's main job is to improve default intellisense with clever suggestions while you type and this works impressively well. In most cases, you'll just have to type 2 or 3 characters of a variable or function name and hit the TAB key to complete it. This works for local and global variables or functions and instantly at your fingertips. You'll rarely experience delays as Visual Assist performs nicely, even with large projects.
</p>

## Clever tooltips

{% include gfx/BD.html image=page.images.tooltip borderclass="borderless" nolink=1 %}

<p style="text-align: justify;">
  Tooltips are available for almost everything. They will appear when you hover a symbol or identifier and will pop up alongside the list of class/structure members when the auto-list members feature kicks in. The tool tips can be syntax colored, using the same colors as in the editor and may include comments that belong to the symbol or identifier. With syntax coloring, they are easier to read and the included comment(s) provide an additional level of help.
</p>

## Syntax analysis on the fly and a smarter editor

<p style="text-align: justify;">
  Visual Assist constantly watches what you type and can mark typing- or simple syntax errors with squiggly red underlines. Several <strong>auto-correct</strong> features are available as you type and their purpose is to correct simple typing errors or support your laziness :). For example, one auto-correct feature will replace a dot with the reference operator (<strong>-></strong>) when you (wrongly) use the object itself instead of a pointer (or vice versa). Another auto-correction will insert the underline character when you type a small <strong>m</strong> followed by pressing the SHIFT key (typical m_foo member variable).  Case correction is another auto-correct feature which allows you to type a camel case function- or identifier name in all lower case and let the editor correct it while you type.
</p>

<p style="text-align: justify;">
  Visual Assist can automatically close all types of braces, properly indented of course and it will automatically reformat your code on paste. The latter one is quite handy when you paste larger pieces of code with different indentation levels. No more need to manually reformat the code after some copy/paste operations. By default, matching pairs of braces are highlighted whenever the cursor is between them (unlike in the default editor, which only highlights a matching brace when you position the cursor on its sibling).
</p>

# Additional views

{% include gfx/FD.html image=page.images.outline align="right" width="30%" %}
<p style="text-align: justify;">
  A hover-sensitive class view and a structured outline view are available as additional dockable windows. The first one is somewhat similar to the default class view, but offers a bit more features, while the second one presents the current file in a structured tree view with all the symbols, declarations and methods.
</p>

<p style="text-align: justify;">
  VA offers an improved navigation bar that can replace the default Visual Studio combo box bar at the top of the editor window. The VA version has more features, presents all content with syntax coloring and allows for easy search operations. It is the perfect companion for the new <em>"Navigate To..."</em> feature of Visual Studio 2010.
</p>

## Refactoring

<p style="text-align: justify;">
  No matter how good Visual Studio is in some areas, its code refactoring tools are poor and Visual Studio 2010 doesn't improve in that area. Not really a surprise that VA fixes most of these weaknesses as it offers <a href="http://www.wholetomato.com/products/featureRefactoring.asp">all basic refactoring functionality</a>. Doing some tests with a medium sized C++ project, I found no problems in the basic refactoring functionality.
</p>

## Much more

<p style="text-align: justify;">
  Here is <a href="http://www.wholetomato.com/products/default.asp">the complete feature matrix</a> which looks quite impressive. Note that Visual Assist is also highly customizable. Most features can be enabled or disabled selectively, and some more complex features have options to make them work exactly the way you want.
</p>

## Conclusion

<p style="text-align: justify;">
  For C++ developers using Visual Studio, this product is almost a must have. It brings the code editor of Visual Studio to a new level of usability and make it compare to or even surpass other excellent code editors like <a href="http://www.slickedit.com">SlickEdit</a> or Eclipse. Working with Visual Assist is almost always a pleasant experience - it doesn't stand in your way but simply works when you need it and you never get the feeling you have to fight the IDE to get some work done. Despite its vast amount of features, it performs nicely and I have not noticed significant performance penalties compared to a vanilla Visual Studio installation. In fact, some of its functions, like the "Find references" tool work faster than its default Visual Studio counterpart. Also, when using Visual Assist, you can disable some of Visual Studio's database functions to regain some speed, because VA maintains its own code database which appears to be much more efficiently designed than the intellisense database.
</p>

<p style="text-align: justify;">
  If you are not convinced by this article, there is a 30 day trial offer which you can download from <a href="http://www.wholetomato.com/downloads/downloadTrial.asp">WholeTomato's website</a>. Be warned though, once you get used to it, you will develop a strong affinity to it and you will definitely miss it when the trial period is over.
</p>

<p style="text-align: justify; padding-left: 30px;">
  <span style="font-size: medium;"><strong><span style="color: #800000;"><span style="font-size: large;">+ Pros</span></span></strong></span>
</p>

* advanced syntax coloring for better readable code.

* very clever code assistance and auto-correct features while you type

* comprehensive refactoring feature set

* improved code navigation, hovering tool tips for almost anything, structured outline view

* customizable

* no major impact on the IDE performance, even with most of its features enabled.

<p style="padding-left: 30px;">
  <strong><span style="color: #800000;"><span style="font-size: large;">- Cons</span></span></strong>
</p>

* Hard to find any in the implemented set of features, so I have to file the - in my opinion - 
missing things as cons :) Personally, I would like to see some more keyboard shortcuts for less 
important functions (all major features are, of course, available via keyboard commands). A VA-style 
call hierarchy would be another fine addition - I know that Visual Studio has such a feature, but it 
is slow and does not use a syntax colored view. They already offer a *Find References* replacement, 
which works better than the default one, so a replacement for the call hierarchy would appear 
logical.

## Price / Availability

The standard license goes for about $250 for a single seat which includes 1 year of support and free 
upgrades (with possible discounts when ordering for multiple seats). After that, you can 
(optionally) renew the license for $99 per year which will give you support and upgrades. For 
non-professional users, they offer a $99 personal license which includes 6 months of support and 
upgrades and is - unfortunately - not renewable.

