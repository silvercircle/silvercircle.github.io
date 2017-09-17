---
title: Using AGG with buffered paint
date: 2010-09-30T11:02:28+00:00
modified: 2010-09-30T11:02:28+00:00
author: AlexVie
layout: default
categories: [C++, Development]
tag: first
excerpt: >
  AGG is a cross-platform, high performance and high-quality 2d vector graphics library. It is written in C++ and comes as a collection of template classes with no dependencies except STL.

  In this example, we look how we can use it with the buffered paint API in Windows.
image: archive/2010/09/agg_logo.jpg
image_width: 70
image_align: right
image_nolink: 1
image_title: The AGG Logo
disqus: 1
share: 1
---

# Rendering with AGG and buffered paint.
{% include post_header.html %}
{% include gfx/float_image.html align="right" image="archive/2010/09/agg_logo.jpg" width="71px" title="AGG Logo" nolink=1 borderclass="borderless" %}
In the [last article]({{site.baseurl}}{% post_url 2010-09-24-rendering-to-a-device-context-with-agg-antigrain %}), I explained how to render to a Windows device context, using the AGG 2d graphics library. As promised, I want to explain how to do it when using the Buffered Paint API, available on Windows Vista or later.

[Buffered Paint](http://msdn.microsoft.com/en-us/library/bb773257%28v=VS.85%29.aspx">) is a set of 
new APIs allowing an application to perform flicker free painting without the overhead of creating 
memory device contexts and bitmaps. It is only available on Windows Vista or later and is part of 
the UxTheme library. Using it will either make your application incompatible with Windows XP or 
earlier or will require using the `GetProcAddress()` method on Vista or later while providing a 
fallback method when the buffered paint API is not available.

When using buffered paint, there is no need to create your own memory DC and bitmaps - you simply 
use `BeginBufferedPaint()` and `EndBufferedPaint()` APIs to obtain a device context handle for 
drawing. The back buffer is managed by Windows itself and the window is automatically updated when 
you flush a buffered paint operation by calling *EndBufferedPaint()*.

###  How to obtain the bitmap pixel buffer

As explained in the last article, we need the bitmap memory buffer so we can attach a AGG rendering buffer to it. Fortunately, this is a very easy thing to do, because there is a special API for it:

{% highlight c++ lineos %}
  GetBufferedPaintBits(
        HPAINTBUFFER hBufferedPaint,
        __out  RGBQUAD **ppbBuffer,
        __out  int *pcxRow
);
{% endhighlight %}

We simply pass our handle and two pointers to this function. The first parameter, ```hBufferedPaint```, is the handle we got from *BeginBufferedPaint()*. The next parameter has to be a pointer to an array of ```RGBQUAD```structures - nothing special here, the ```RGBQUAD``` is just a simplification for an array of 4 bytes, representing a single pixel in BGRa format. AGG doesn't know about it and will access the buffer as a simple array of bytes, so we can just pass ```ppbBuffer``` to the ```attach()``` method of our AGG rendering buffer. The third parameter is the width of our buffered paint surface in pixels. From it we can calculate our **stride** as ```4 * pxcRow``` - it is that simple, because a buffered paint bitmap is always properly aligned, so our stride is always 4 times its width for a 32bit BGRa bitmap.

{% highlight c++ lineos %}
  m_rbuf.attach((unsigned char *)ppbBuffer, pcxRow, height, pcxRow * 4);
{% endhighlight %}

Will attach our AGG rendering buffer in ```m_rbuf``` to the buffered paint device context bitmap. Keep in mind the things I said in my first article about AGG about using the proper pixel format and colors. Buffered paint defaults to a 32bit BGRa format which makes rendering pretty simple.

###  A note about buffered paint and RTL

There is one thing to note when using buffered paint in general. This isn't exactly related to AGG, but nevertheless it is important when your application must be able to deal with RTL rendering and you are using the GDI ```SetLayout()``` API. According to MSDN, the real width of a buffered paint back buffer is usually greater than the width of the rendering area (for example, the client area of your window). When you use the ```SetLayout()``` function to mirror the device context you obtained from ```BeginBufferedPaint()```, things will go awry, because of the difference in width. When doing left-to-right rendering, it doesn't matter, because the POINT(0,0) will always be top left, but when mirroring the device context, the point(0,0) will now be **outside** of your client area.

I ran into this problem in one of my apps where RTL is a requirement and I didn't want to give up using buffered paint because of the obvious performance advantages, so I had to find a solution. It's actually pretty simple: From ```GetBufferedPaintBits()``` we know the real width of the back buffer and we can calculate the difference to the actual width of our rendering area. We can then use the difference as an offset value for all our coordinates while the rendering direction is mirrored due to ```SetLayout(hdc, LAYOUT_RTL)```. Don't forget to only add the offset when the mirroring is active, otherwise it will screw up left-to-right rendering.

