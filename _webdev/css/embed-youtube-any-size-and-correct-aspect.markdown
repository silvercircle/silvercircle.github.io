---
layout: topics_dyn
author: alex
title: YouTube embedding with correct aspect and any width
date: 2017-08-31T23:56:26+02:00
modified: 2017-08-31T23:56:30+02:00
menucontext: topics
tag: [first,css]
disqus: 1
share: 1
collection: webdev
excerpt: >
  This is a HowTo and deals with the problem of embedding YouTube videos at any desired size. The size of the video should be determined by the surrounding container. No fixed width and height values are needed.
---

# Embed YouTube videos - the flexible way
{% include post_header.html %}

It should be noted that this works on modern browsers only, where modern means anything newer than 
IE8 or so. Any modern version of Firefox, Chrome, Opera, Safari, IE, Edge and the zillion of 
Chromium based browsers will work. 

It does not use `object` or `embed` tags, but instead embeds videos in an `iframe` element, which is 
the preferred way to embed a video that does not use flash.

### The problem

We want a video that adopts to a given width and adjusts it's height. We assume the aspect ratio at 
16:9 (which is safe, because the YouTube player always uses it and videos of different format will 
be cropped or letterboxed accordingly) and the height should be set automatically from the given 
width.

#### Case 1, the video should take all available width.

```html
<div class="ytcontainer">
	<iframe class="ytframe" frameborder="0" allowfullscreen src="https://www.youtube.com/embed/[ID]"></iframe>
</div>
```
The [ID] is a placeholder for the video ID on YouTube, which is the part that normally goes behind 
`watch?v=` in the full video URL.

##### The CSS
```css
div.ytcontainer {
    width: 100%;
    height: 0;
    padding-bottom: 56.25%;
    position: relative;
}

iframe.ytframe {
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    position: absolute;
}
```
##### What does it mean?

The magic is in `ytcontainer`, particularly in the zero height and the somewhat magic bottom padding 
value of 56.25 percent, which is **exactly the aspect ratio of a 16:9 rectangle**. The rectangle 
will have a content height of zero, but the padding will set its overall height to 56% of its width.

The other important thing to note is the `position: absolute` given to the iframe. This allows the 
iframe to fill the padding space in the enclosing div element and inherit the 16:9 ascpect ratio of 
the box.

#### Case 2, we want a custom width:

This isn't much more difficult. The only thing you need to do is to wrap the above construct in one 
more `div` element and set its width to whatever you want.
```html
<div style="width: 50%; margin: auto;">
	<div class="ytcontainer">
		<iframe class="ytframe" frameborder="0" allowfullscreen src="https://www.youtube.com/embed/[ID]"></iframe>
	</div>
</div>
```
This will do it. You get a centered (because of the `margin: auto;`) box at 50% of the available 
width with a properly sized video element.

