---
author: Alex Vie
title: Build simple galleries with Jekyll
layout: default
date: 2017-09-18T05:18:14+0200
modified: 2017-09-18T05:18:23+0200
menucontext: about
share: 1
tag: [first, jekyll]
disqus: 1
excerpt: >
    Building simple galleries using includes and Jekyll YAML data files.
---

# Testpage (Gallery)
<br>
Build a gallery from information held in a yaml file in `_data`.

<div class="gallery" markdown="1">
{% for image in site.data.galleries.default.testgallery %}
  {% assign this_image = image[1] %}
  {% include gfx/GITEM.html image=this_image %}
{% endfor %}
</div>
<div class="clear"></div>

### The Code
{% raw %}
```liquid
<div class="gallery" markdown="1">
{% for image in site.data.galleries.default.testgallery %}
  {% assign this_image = image[1] %}
  {% include gfx/GITEM.html image=this_image %}
{% endfor %}
</div>
```
{% endraw %}

### The data file
`_data/galleries/default.yaml`
```yaml
testgallery:
    image1:
      url: "...."
    image2:
      url: "...."
    image3:
      url: "...."
    image4:
      url: "...."
      desc: "Image 4"
    image5:
      url: "...."
      desc: "Image 5"
```


