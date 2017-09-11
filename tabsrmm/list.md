---
title: TabSRMM - Article List
author: AlexVie
date: 2017-09-07T09:04:05+02:00
modified: 2017-09-07T09:04:01+02:00
collection: tabsrmm
layout: topics
menucontext: topics
pagination:
  enabled: true  
  sort_field: modified
  sort_reverse: true
  per_page: 10
  collection: tabsrmm
  permalink: '/page:num.html'
  tag: first
---

<div class="blog-index">
    {% for post in paginator.posts %}
    <a href="{{post.url}}"><h3 class="listheading" style="margin: 10px 0 0 0;">{{ post.title }}</h3></a>
    <div class="author" style="float:right;font-size:smaller;">
    Last modified: <time class="timeago" datetime="{{post.modified | date: '%Y-%m-%dT%H:%M:%S%z'}}">{{post.modified}}</time>
    </div>
    <div class="author" style="font-size:smaller;">
        Written by {{post.author}}{% if post.categories %}{% for cat in post.categories %}{% if forloop.first %}&nbsp;in&nbsp;{% endif %}<a href="{{site.baseurl}}/category/{{cat | strip | strip_html | downcase}}/index.html">{{cat | strip | strip_html}}</a>{% unless forloop.last %},&nbsp;{% endunless %}{% endfor %}{% endif %} | {{post.date | date: '%a, %d. %B %Y, %H:%M'}}
    </div>
    <div class="clearfix"></div>
    <hr class="separator">
    <div class="content excerpt">
      {% if post.image and post.image != '' %}
      {% if post.image_link and post.image_link == 1 %}
        {% assign this_nolink = 0 %}
      {% else %}
        {% assign this_nolink = 1 %}
      {% endif %}
      {% include gfx/float_image.html image=post.image align=post.image_align width=post.image_width title=post.image_title borderclass="borderless" omitbottomcaption=1 nolink=this_nolink %}
      {% endif %}
      {% if post.excerpt and post.exceprt != '' %}
        {{ post.excerpt | markdownify }}
      {% else %}
      No article excerpt found.
      {% endif %}
    </div>
    <div style="float:right;">
      <a href="{{site.baseurl}}{{post.url}}">Read more...</a>
    </div>
    <div class="clear"></div>
    <br>
    {% endfor %}
    {% include paginator_trail.html %}
</div>
<br>
