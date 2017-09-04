---
layout: topics
author: AlexVie
title: Strange unwanted padding around images and how to fix
date: 2017-09-04 12:19:58+0200
modified: 2017-09-04 12:20:02+0200
menucontext: topics
excerpt: >
    Sometimes, images enclosed by divs or other block level elements show apparently strange and unwanted 2-3 pixels of paddng on the bottom edge even though the containing element has no padding set at all.
---
# Strange unwanted padding around images and how to fix
{% include post_header.html %}
## The problem:
... is best demonstrated by example. The container, a ```div```element with a red border and a padding of 4 pixel, shall contain an image. We want equal padding on all 4 sides and a one pixel wide border around the container..

<div style="margin:auto; border:1px solid red; padding: 4px;width:50%;">
<img src="{{site.baseurl}}/assets/gfx/thumb_vim.png" alt="image">
</div>
<br>
As you can clearly see, the padding below the image is larger than on the other three sides even though the padding for the sourrounding container is set to **4px** on all sides.

This happens, because ```img``` elements are __inline__ elements by default. Such elements are treated like text and therefore the browser will align them to the baseline of the sourrounding text grid.

### The fix is fairly easy. Just make the image a __block__ element.
```html
<img src="/assets/gfx/thumb_vim.png" alt="image" style="display:block;">
```
<div style="margin:auto; border:1px solid red; padding: 4px;width:50%;">
<img src="{{site.baseurl}}/assets/gfx/thumb_vim.png" alt="image" style="display:block;">
</div>
<br>
As you can see, the uneven padding on the bottom edge is gone. The image now behaves like a block alement, that is like the sourrounding ```div``` element.

{% include disqus_fragment.html %}