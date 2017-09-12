---
layout: got
menucontext: got
title: "Category: Game of Thrones - overview"
pagination:
  enabled: true
  category: GoT
  permalink: '/category/got/page:num/'
  sort_field: modified
  sort_reverse: true
  per_page: 10
  tag: first
---

{% include paginator_header.html %}

<p>This is a list of articles and blog posts about Game of Thrones. It avoids listing theories and 
other spoiler-heavy content. If you are interested in fan theories, <a 
href="{{site.baseurl}}/got-theories">go here.</a></p>

{% include content/got-spoiler-warning.md %}
<br>
<div class="blog-index">
    {% for post in paginator.posts %}
    {% include paginator_body.html showspoiler=1 %}
    {% endfor %}
    {% include paginator_trail.html %}  
</div>
