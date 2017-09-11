---
layout: default
menucontext: blog
title: "Game of Thrones - Season 8 theories"
pagination:
  enabled: true
  category: GoT
  permalink: '/category/got/theories/page:num/'
  sort_field: modified
  sort_reverse: true
  per_page: 10
  tag: first, got, theory
---
{% include paginator_header.html %}

<p>This is a list of theories about the next and final season of Game of Thrones. While the premiere probably won't <span>happen before at</span> least one year from now, there is already a lot of activity in the GoT community.<p>
<p>
</p>
{% include content/got-spoiler-warning.md %}
<div class="blog-index">
    {% for post in paginator.posts %}
    {% include paginator_body.html showspoiler=1 %}
    {% endfor %}
    {% include paginator_trail.html %}  
</div>
