---
title: Rendering to a device context with AGG (AntiGrain)
date: 2010-09-24T22:36:38+00:00
modified: 2010-09-24T22:36:38+00:00
author: AlexVie
layout: default
categories: [C++, Development]
tag: first
disqus: 1
excerpt: >
  AGG is a cross-platform, high performance and high-quality 2d vector graphics library. It is written in C++ and comes as a collection of template classes with no dependencies except STL.
image: archive/2010/09/agg_logo.jpg
image_width: 70
image_align: right
image_nolink: 1
image_title: The AGG Logo
---

# Rendering with AGG under Windows
{% include post_header.html %}
{% include gfx/float_image.html align="right" image="archive/2010/09/agg_logo.jpg" width="71px" title="AGG Logo" nolink=1 borderclass="borderless" %}

Quite a few years ago, I discovered [AntiGrain Geometry](http://www.antigrain.com), a high-performance, high-quality, platform-independent generic library for rendering 2d vector graphics.

AGG is fast, lightweight, implemented as a set of C++ classes, makes heavy use of templates and is fairly easy to integrate into a project. There is no need to build and link against libraries as you just add the files to your project and make sure you include the necessary headers. Clean and simple.

It can serve as a replacement for GDI+ and usually produces better results at higher speeds. It is also somewhat similar to cairo graphics, but has less features. It is perfect when you need to draw filled or outlined shapes, deal with all kinds of gradients or draw antialiased lines.

However, AGG also has a fairly steep learning curve as it follows a completely different approach. It's all about creating and managing rendering pipelines and, at first, this can be a bit overwhelming when you are used to the simple approach of GDI+ that does everything with a Graphics object. I still think that learning to use AGG can be rewarding in the end.

The following paragraphs will try to explain how to actually produce visible output, using AGG on Windows. While AGG is fairly mature and complete, its documentation is lacking and the best way to learn is to read the source code of the countless examples that are included when you download it. So the very first question I had after learning how to set up a rendering pipeline was: 

> How the hell can I render the output to a typical Windows device context?

### So how do I render to a DC?

Well, you don't :) A device context is not a real render target, it is just a data structure *holding information about a render target*. When you use a GDI function to render to a DC, the function will only use the DC to obtain information how and where it has to set its pixels. The actual render target is a in-memory bitmap which is *selected* into the device context. In GDI terminology, objects like brushes, pens and bitmaps are selected into a device context and any selected object becomes active, so when you select a memory bitmap into a device context, it becomes the active render target and any GDI function that draws to that DC will actually manipulate the bitmap that is selected into this DC.

That said, it should already be clear how to use AGG for rendering to a DC - you don't render to the DC but to the bitmap that is selected into the DC.

###  But how?

Basically, you create a ```agg::rendering_buffer``` object and attach it to the memory buffer that represents the bitmap's pixels. The *agg::rendering_buffer* is a simple abstract class that can be attached to any memory buffer and serves as the lowest level base object of an AGG rendering pipeline. Once done, you can attach the remaining parts of your rendering pipeline to the rendering buffer and do the actual drawing.

###  The bloody details

For the following examples, we assume that all rendering must be done in 32bit color depth with a valid alpha channel (thus, 4 bytes per pixel). It is important to agree on the actual pixel format, because if your AGG pipeline uses a pixel format that doesn't match the bitmap's format, the results will look very broken. Windows bitmaps can use a variety of formats, but for the examples we will use a 32bit BGRa format. Windows reverts the color order from aRGB to BGRa for performance and other reasons, but since you do not have to manipulate pixels directly, you don't have to care - just make sure to use the same pixel format when setting up your AGG rendering pipeline.

First, we must create a 32bit BGRa memory bitmap. The only information we need are the dimensions of the bitmap - usually the dimensions of your rendering area - for example, the client area of a window. Both are passed to this function as ```cx``` and ```cy```.

{% highlight c++ lineos %}
{
  BITMAPINFO dib = {0};

  dib.bmiHeader.biSize = sizeof(BITMAPINFOHEADER);
  dib.bmiHeader.biWidth = cx;
  dib.bmiHeader.biHeight = -cy;			// use a "topdown" bitmap (0,0 = left, top corner)
  dib.bmiHeader.biPlanes = 1;
  dib.bmiHeader.biBitCount = 32;
  dib.bmiHeader.biCompression = BI_RGB;

  return(CreateDIBSection(0, &dib, DIB_RGB_COLORS, NULL, NULL, 0 ));
}
{% endhighlight %}

If all goes well, the function will return a valid handle for your new bitmap. You can now use this handle to select the bitmap into your DC and I won't get into detail about this, because it should be well-known.

Next, you need to attach a ```agg::rendering_buffer``` to your new bitmap. The prototype for the ```agg::rendering_buffer::attach()``` method looks like this:

{% highlight c++ lineos %}
  void attach(T* buf, unsigned width, unsigned height, int stride)
{% endhighlight %}

  * ```buf``` is the memory buffer that holds the pixel data. Should be clear and I will explain shortly how to obtain it from your bitmap.
  * ```width``` and ```height``` are the same ```cx``` and ```cy``` - the dimensions of the bitmap and your corresponding drawing area.
  * ```stride``` is important. Basically, it is the length of a single pixel scan line of your bitmap in **BYTES**. One would assume that for a 32bit BGRa bitmap, *stride* would be ```(4 * width)```, but that is not always true. Because of performance reasons, Windows may round up the width of a bitmap to be WORD or DWORD aligned, so the in-memory bitmap can actually be 1-3 pixels wider than the drawing area, and this is why stride is so important. It tells the rendering buffer, how many bytes must be added (or subtracted) to or from a pointer when you step exactly ONE pixel (scanline) up or down.

  The following code will attach a rendering buffer object to a memory bitmap. ```m_rbuf``` is our ```agg::rendering_buffer``` object and **hbm** is the bitmap handle.
{% highlight c++ lineos %}
  ::GetObject(hbm, sizeof(bm), &bm);
  m_rbuf.attach((unsigned char*)bm.bmBits, bm.bmWidth, bm.bmHeight, bm.bmWidthBytes);
{% endhighlight %}

We use ```GetObject()``` Win32 API to obtain information about our bitmap. It fills a structure from which we can use the ```bmBits```, ```bmWith```, ```bmHeight``` and ```bmWidthBytes``` members for using it in ```agg::rendering_buffer::attach()```. The *bmWidthBytes* member is our *stride* (see above) - it indicates the internal width of the bitmap in bytes, so it is important to use this instead of calculating your own stride value from the width.

Note that this code is just an **incomplete example** only showing the basic principle. It lacks safety checks which you should add when using it. At least, check the return value from ```GetObject()``` and make sure you do NOT attach the rendering buffer to a non existing pixel buffer. Doing so will lead to a crash as soon as you attach your rendering pipeline to the rendering buffer.

Basically, that's it. You now have a rendering buffer that uses a memory bitmap and to which you can attach your rendering pipeline. Make sure, your pipeline uses ```agg::pixfmt_bgra32``` to be compatible with the pixel format of your bitmap. When using colors, use ```agg::rgba8``` and make sure to set the alpha value(s), otherwise you'll most likely render fully transparent pixels, because the default alpha value is always 0 when you initialize a ```agg::rgba8``` olor object.

Next time, I'll show how to do it when using Windows Vista or later buffered paint API which allows you to paint flickerfree without creating your own memory bitmaps and device contexts.

