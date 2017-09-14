---
layout: topics
author: AlexVie
title: Strange unwanted padding around images and how to fix
date: 2017-09-04 12:19:58+0200
modified: 2017-09-04 12:20:02+0200
menucontext: topics
collection: webdev
tag: first
disqus: 1
excerpt: >
    Sometimes, images enclosed by divs or other block level elements show apparently strange and unwanted 2-3 pixels of padding on the bottom edge even though the containing element has no padding set at all.
---
# Strange unwanted padding around images and how to fix
{% include post_header.html %}
## The problem:
... is best demonstrated by example. The container, a ```div```element with a red border and a padding of 4 pixel, shall contain an image. We want equal padding on all 4 sides and a one pixel wide border around the container.

<div style="margin:auto; border:1px solid red; padding: 4px;width:50%;">
<img src="{{site.baseurl}}/assets/gfx/thumb_vim.png" alt="image" style="margin:0; padding:0;">
</div>
<br>
As you can clearly see, the padding below the image is larger than on the other three sides even 
though the padding for the surrounding container is set to **4px** on all sides and the margin for 
the `img` element is set to zero.

At first, it looks like a browser issue or some rogue CSS margin or padding attribute affecting the 
placement, but it's not. You can verify that it will look the same in all modern browsers and the 
rogue CSS theory can be counteracted by explicitly setting all margins and paddings to zero via 
*style* attributes (which is exactly what I did in the example above).

This happens, because `img` elements are __inline__ elements by default. Such elements are treated 
like text and therefore the browser will align them to the baseline of the surrounding text grid. 
Inline elements will receive automatic vertical padding, that depends on their alignment and 
placement. So what the browser does is correct and required by specifications.

### The fix is fairly easy. Just make the image a __block__ element.
```html
<img src="/assets/gfx/thumb_vim.png" alt="image" style="display:block;">
```
<div style="margin:auto; border:1px solid red; padding: 4px;width:50%;">
<img src="{{site.baseurl}}/assets/gfx/thumb_vim.png" alt="image" style="display:block;">
</div>
<br>
Now, the unwanted additional padding on the bottom edge is gone. The image behaves like a block 
element and will perfectly fit in the surrounding box model.

