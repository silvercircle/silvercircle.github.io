---
title: Eclipse CDT 7 - a preview
date: 2010-04-08T02:40:31+00:00
modified: 2010-04-08T02:40:31+00:00
author: Admin
layout: no_sidebar
reduced: big
tag: first
category: Development
share: 1
disqus: 1
menucontext: blog
backlink: /blog
excerpt: >
    Eclipse is usually known as one of the premier tools for Java developers, but Eclipse is more 
    than just a Java IDE. It is a platform that can be used for many things and support for many 
    other programming languages exists in form of plug-ins. The CDT (short for C/C++ Development 
    Tools) converts Eclipse into a full featured C/C++ IDE.
images:
    screenshot:
        path: archive/2010/04/
        name: eclipse_cdt.png
        desc: Eclipse 3.x with the most recent version of CDT (7 preview) running.
    indexer:
        path: archive/2010/04/
        name: cdt7_options.png
        desc: The indexer options in CDT7
    analyzer:
        path: archive/2010/04/
        name: cdt7_codeanalysis.png
        desc: The indexer options in CDT7
---
# A good tool getting better

{% include post_header.html %}
{% include defs.md %}
{% include content/archive-warning.md %}
{% include gfx/BD.html image=page.images.screenshot borderclass="borderless" %}

I consider the C/C++ development tools (short: CDT) one of the best plugins for Eclipse. Since 
version 6, they are so good that Eclipse has become my favorite IDE for C and C++ development. The 
Eclipse code editor has always been good and CDT offers a host of nice features, like semantic 
highlighting (and this with good performance, even in large projects), excellent code navigation and 
very good code assistance. The CDT build system is flexible and does not force you to use one 
specific compiler (i.e. GCC) as it is perfectly possible to use the MS compilers and build tools.

Eclipse's integration of the Subversion version control system is also excellent and makes using SVN enjoyable.

# CDT version 7 is on the way

And I can tell you, it will be even better. I have installed the latest milestone (M5) release of 
CDT version 7 on my Eclipse 3.6 M6 installation, just to test it out a bit. Rather quickly, I 
realized that this is already a very mature, though not perfect, build and I'am now using it on a 
daily base with few or little issues.

## Much better indexer

{% include gfx/BD.html image=page.images.indexer borderclass="borderless" %}

Up to version 6, the CDT offered two different indexing methods. The <em>fast indexer</em> (which 
was the recommended one to use), optimized for good performance and the <em>full indexer</em> which 
was working slower but more accurate. The fast indexer was indeed fast, but sometimes failed to 
fully index your code which usually resulted in symbols or methods being unknown. As a consequence, 
unknown symbols are not properly highlighted nor are they available for the various content assist 
features. The full indexer had fewer issues with recognizing symbols except for the occasional 
problem with overloaded functions or functions with default parameters.

In CDT7, there is only one indexer and I have got the impression that it works more accurate and 
much faster than the old full indexer and, honestly, it doesn't appear to be slower than the old 
fast indexing method. First-time indexing of a huge project may still take a while, but once the 
initial index had been built, everything runs very smooth. Re-indexing a single file after doing 
some changes (i.e. adding a new method) happens in the background without noticeable delay in the 
editor and it usually takes less than a second until the newly added code will be properly 
highlighted and available in the content assist.

## More code analysis

{% include gfx/BD.html image=page.images.analyzer borderclass="borderless" %}

Also new is a feature that analyzes your code as you type and will warn you about some common errors 
like missing braces or the infamous <strong>if( foo = bar )</strong> typo. The warnings can be 
customized somewhat and will appear in the <em>General/Problems</em> view. It might not be as clever 
as the code inspection Eclipse offers for Java or what IntelliJ IDEA does for all languages it 
supports, but it does its job of detecting a number of very common mistakes. I also do not know if 
this feature is already complete in the current milestone as there is little documentation available 
at the moment.

### Conclusion

The new indexer alone will make this a good release as it solves most of the small issues the old 
code indexer had shown every now and then. The simple (but useful) problem analyzer is a nice goodie 
and complements the already good syntax checker.

<span style="text-decoration: underline;">If you want to try it out yourself</span>, you can get it 
<strong><a href="http://www.eclipse.org/cdt/">here</a></strong>. Of course, I strongly recommend to 
install this on a fresh extra Eclipse installation and leave your current environment untouched. I 
also believe, the CDT7 milestone build won't run on anything older than Eclipse 3.6 M6 (or maybe 
M5), so you need a new test install anyway, unless you are using the 3.6 milestones as production 
environment.
