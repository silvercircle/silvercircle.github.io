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

# Build simple galleries with Jekyll.
{% include post_header.html %}
Data files are a fairly powerful feature in Jekyll. They can be used to store all kind of structured 
data in as many different files and multiple formats. Currently supported are:

>**CSV, YAML and JSON**

For example, I started using data files to store all information about images, both local uploads 
and remote (linked) images, after I realized that passing a single handle is easier than remembering 
the exact location of an image in the file system (and then screw up case sensitivity in the 
process). Such an entry might look like this:

```yaml
testgallery:
    remoteimage:
        url: "https://path.to/image.png"
        title: "A cool image"
        desc: "Telling us why the image is cool"
    localimage:
        name: "logo.png"     # the presence of name indicates a local image
        path: "site/logos/"
        title: "A cool local image"
        desc: "Telling us... well, you get it"
```
Consider this entry is within `_data/images.yaml`, then the image record will be available in 
templates as `site.data.images.testgallery.remoteimage`. Its attributes are accessible as 
`site.data.images.testgallery.remoteimage.url` and so on.

Of course, it's possible to omit the `testgallery` part and organize images differently. One file 
per gallery, or any combination is possible. It just needs to be somewhat hierarchical and following 
the conventions you have defined.

<div class="gallery" markdown="1">
{% for image in site.data.galleries.default.testgallery %}
  {% assign this_image = image[1] %}
  {% include gfx/GITEM.html image=this_image %}
{% endfor %}
</div>
<div class="clear"></div>

### The Code

This assumes, the images are in `_data/galleries/default.yaml` organized as children of the main 
node `testgallery`.
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


