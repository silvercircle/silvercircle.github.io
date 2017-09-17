---
author: AlexVie
title: How to set global font scale for Qt applications
date: 2017-09-03 10:25:13+0200
modified: 2017-09-03 10:25:17+0200
layout: default
categories: [Development,Qt,C++]
menucontext: blog
tag: first
disqus: 1
share: 1
excerpt: >
    Sometimes, fonts appear to small in Qt applications. If that is the case, a simple solution is 
    possible, either globally for all Qt applications or per application.
image: logos/qt.png
image_width: 130px
image_align: right
image_title: Qt 5 Logo
---
# Set font scaling for Qt applications
{% include post_header.html %}
Qt is a great thing, for most parts, but sometimes it does not follow UI guidelines strictly enough. 
On Windows, Qt applications have a tendency of using non-standard fonts at non-standard sizes. For 
example, QtCreator uses the *Tahoma* font at a fairly small size - too small for standard DPI 
settings that are still widely in use on some older systems, mainly laptops.

But Qt also allows hassle free UI scaling at any desirable value that works fairly well and can be 
set globally or per application by defining an environment variable:
```
set QT_SCALE_FACTOR=2
qtcreator.exe
```
do this in a shell, and QtCreator will launch with everything scaled to twice its size. Fonts will 
appear bigger, but also all UI elements. Since this scaling is implemented in Qt at a very low 
level, it works consistently throughout the entire application.

So, you have the choice. You can set the `QT_SCALE_FACTOR` environment variable globally via the 
control panel, or use a `.cmd` file to set it before you launch a specific application. The value 
must be a **floating point number** and can be smaller than 1, so yes, it is possible to downscale 
the UI.

The following screen shot illustrates the difference between no scale and `QT_SCALE_FACTOR = 2`. It 
was taken at a resolution of 1920x1080 at the standard DPI setting under Windows.
{% include gfx/block_image.html image="qtcreator-fontscale.png" title="Screen shot showing the 
different scaling (click to enlarge)" borderclass="borderless" %}



