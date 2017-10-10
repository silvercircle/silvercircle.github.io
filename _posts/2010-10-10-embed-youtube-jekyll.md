---
author: Alex Vie
title: Embedding YouTube videos in Jekyll
layout: default_dyn
date: 2017-10-10T19:41:31+0200
modified: 2017-10-10T19:42:02+0200
menucontext: blog
category: Jekyll
share: 1
disqus: 1
tag: [first,jekyll,css,video]
backlink: /blog
sidebarcontent: sbar_default
excerpt: >
    A include-able fragment that allows to embed youtube videos by video ID. The video will be sized 
    properly to the available width using CSS only. No Javascript or other dependencies needed.
    <br>
    <br>
    This is HTML/CSS only, should work for any static site generator with an include feature similar 
    to Jekyll's.
image:
    source: jekyll
    width: 130px
    align: right
---

# Embedding YouTube videos in Jekyll
{% include post_header.html %}
{% include defs.md %}

Throughout this site, I use the following HTML fragment to include videos from YouTube, passing only 
the video ID as a parameter. The `IFRAME` is wrapped into two `DIV` elements, the outer one being 
responsible for setting the overall width of the element and the inner one containing the CSS 
"magic" that let it maintain correct aspect ratio.
{:dc}

{% highlight html linenos %}
{% raw %}
{% if include.width != '' %}
  <div style="width: {{include.width}}; margin:0 auto;">
{% else %}
  <div>
{% endif %}
  <div class="ytcontainer">
    <iframe class="yt" allowfullscreen src="https://www.youtube.com/embed/{{include.id}}"></iframe>
  </div>
</div>
{% endraw %}
{% endhighlight %}

###### Use it with:
{% raw %}
```liquid
{% include youtube.html id="8lsvjdkQ" %}
```
{% endraw %}

**Specify an optional width for the outer container:**
{% raw %}
```liquid
{% include youtube.html id="8lsvjdkQ" width="80%" %}
```
{% endraw %}
<br>
## The required CSS

The following CSS is required for smooth and responsive embedding of a video element. The resulting 
video will use all the available width of the parent container and resize itself accordingly to use 
a 16:9 aspect ratio (which is the default for the YouTube video player). The available width is, by 
default, set to 100% of the parent element, but can be specified as percentile or absolute width by 
passing it in the `width` parameter..
{:dc}

The CSS and how it works is explained in more detail in [this post]({{site.baseurl}}{% link 
_webdev/css/embed-youtube-any-size-and-correct-aspect.markdown %}).{{_}}

{% highlight css linenos %}
div.ytcontainer {
    position: relative;
    width: 100%;
    height: 0;
    padding-bottom: 56.25%;
}
iframe.yt {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    border: 0;
}
{% endhighlight %}

## Example

As you can test, it is fully responsive and will adjust its width while maintaining correct aspect 
ratio.
{% include youtube.html id="1ST9TZBb9v8" %}


