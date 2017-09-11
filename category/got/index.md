---
layout: default
menucontext: blog
title: "Category: Game of Thrones - overview"
pagination:
  enabled: true
  category: GoT
  permalink: '/category/jekyll/page:num/'
  sort_field: modified
  sort_reverse: true
  per_page: 10
  tag: first
---

{% include paginator_header.html %}
{% include content/got-spoiler-warning.md %}
<br>
<div class="blog-index">
    {% for post in paginator.posts %}
    {% include paginator_body.html %}
    {% endfor %}
    {% include paginator_trail.html %}  
</div>
