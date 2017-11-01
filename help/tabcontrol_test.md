---
author: Alex Vie
title: Site FAQ
layout: no_sidebar
reduced: yes
sidebarcontent: sbar_default
date: 2017-11-01T17:48:55+0100
modified: 2017-11-01T17:48:44+0100
menucontext: about
permalink: /help/tabcontrol-test/
share: 1
disqus: 1
lang: de-DE
tabs:
    tab1:
        name: foobar
        title: haha
        source: source1
    tab2:
        name: affen
        title: affenscheisse
        source: source2
    tab3:
        name: idioten
        title: idioten
        class: active
        source: source3
---
# Tabcontrol Test
{% include post_header.html %}
{% include defs.md %}

Testpage
{% include gfx/FD.html image=site.data.images.got.old_hodor align="right" width="40%" %}
{% assign tabs1 = page.tabs %}
{% include tabcontrol.html tabs=tabs1 id="foo" default="source3" %}

<div class="hidden" id="source1" markdown="1">
Well, right now it's not much. It's some sort of playground to test [Jekyll](https://jekyllrb.com),
a static page generator that has enough flexibility to build a blog or documentation site,
but leaves out all the bloat that makes modern content management systems slow and prone to
security problems. It also significantly lowers the requirements for hosting to a simple web server 
that can serve static files.
{:dc}

Jekyll is also supported by [GitHub pages](https://pages.github.com/) who give you essentially 
unlimited free web hosting, but won't allow you to run PHP, Python, Java or whatever else on their 
servers. But you can use Jekyll either locally to build your static site or let GibHub run it 
whenever you change content.

Plus, you get free awesome revision control for your entire site. Never lose a change or important 
article again.
</div>

<div class="hidden" id="source2" markdown="1">
source2
</div>

<div class="hidden" id="source3" markdown="1">
Consider this entry is within `_data/images.yaml`, then the image record will be available in 
templates as `site.data.images.testgallery.remoteimage`. Its attributes are accessible as 
`site.data.images.testgallery.remoteimage.url` and so on.

Of course, it's possible to omit the `testgallery` part and organize images differently. One file 
per gallery, or any combination is possible. It just needs to be somewhat hierarchical and following 
the conventions you have defined.
</div>


