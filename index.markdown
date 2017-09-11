---
author: AlexVie
title: Home
layout: no_sidebar
menucontext: home
date: 2017-08-25 06:35:00+0200
modified: 2017-08-25 06:35:07+0200
---
# So, what's this all about?
{: style="margin-bottom:20px;"}
<div class="two_cols" markdown="1">
Well, right now it's not much. It's some sort of playground to test [Jekyll](https://jekyllrb.com),
a static page generator that has enough flexibility to build a blog or documentation site with it,
but leaves out all the bloat that makes modern content management systems slow and prone to
security problems. It also significantly lowers the requirements for hosting to a simple webserver that can serve static files (essentially, what basically **all** web servers can).

With Jekyll, there is no need for a database or complex web server configuration. The only thing
needed is a working ruby and Jekyll installation on either your local development machine or the
server machine itself and a web server that can serve static files.

I'm using Jekyll to convert parts of my old WordPress blog, that was unmaintained for years and I decided to take down, after some clever guy found a way to abuse it for sending a couple ten-thousand spam mails, successfully listing my server in all kind RBLs :) Which is precisely why I think, that WordPress isn't exactly suitable for casual publishing. While it can do great things, it also needs **a lot** of attention and maintenance for which I do not want to invest more time than absolutely necessary.

Jekyll, on the contrary, might have a steeper learning curve, particularly if you come from a traditional CMS background, but once a Jekyll site is set up like you want it, it requires little to none maintainance other than adding new content.
</div>
<hr class="blueline">
<div class="boxcontainer" markdown="1">
<div class="contentbox" markdown="1">
<div class="contentbox_inner" style="font-size:smaller;" markdown="1">
### Blog
{: .cbox_header}
<div class="cbox_body">
 {% assign counter = 1 %}
 {% assign this_posts = site.posts | where: "tags", "first" | sort: 'modified' | reverse %}
 {% for post in this_posts %}
   {% assign ttags = post.tags | join:'|' | append:'|' %}
   {% if post.isfollowup and post.isfollowup == 1 %}
   {% continue %}
   {% endif %}
   <h3 class="text-ellipsis sidebar_listheader"><a href="{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a></h3>
   <div class="author" style="float:right;">
     <span class="date">
        {% if post.modified %}
        <time class="timeago" datetime="{{ post.modified | date: '%Y-%m-%dT%H:%M:%S%z' }}">{{ post.modified }}</time>
        {% else %}
        <time class="timeago" datetime="{{ post.date | date: '%Y-%m-%dT%H:%M:%S%z' }}">{{ post.date }}</time>
        {% endif %}
     </span>
   </div>
   <span class="author">
   {{post.author}}
   </span>
   <br>
   {% assign counter = counter | plus: 1 %}
   {% if counter > 5 %}
   {% break %}
   {% endif %}   
 {% endfor %}
<div style="float:right"><a href="{{site.baseurl}}/blog/">Show all blog posts</a></div>
<div style="clear:both;"></div>
<br>
</div>
</div>
</div>
<div class="contentbox" markdown="1">
<div class="contentbox_inner" markdown="1">
### Topics
{: .cbox_header}
<div class="cbox_body">
   <h3 class="text-ellipsis sidebar_listheader"><a href="{{ site.baseurl }}/webdev">Web development</a></h3>
   <h3 class="text-ellipsis sidebar_listheader"><a href="{{ site.baseurl }}/software">Software</a></h3>
   <h3 class="text-ellipsis sidebar_listheader"><a href="{{ site.baseurl }}/tabsrmm">TabRSMM / Miranda IM (archived content)</a></h3>
   <h3 class="text-ellipsis sidebar_listheader"><a href="{{ site.baseurl }}/category/development">Development</a></h3>
   <h3 class="text-ellipsis sidebar_listheader"><a href="{{ site.baseurl }}/category/fun">Fun and entertainmentt</a></h3>
   <h3 class="text-ellipsis sidebar_listheader"><a href="{{ site.baseurl }}/category/jekyll">Jekyll static site generator</a></h3>   
   <h3 class="text-ellipsis sidebar_listheader"><a href="{{ site.baseurl }}/category/got">Game of Thrones</a></h3>
   <h3 class="text-ellipsis sidebar_listheader"><a href="{{ site.baseurl }}/category/got/theories">Game of Thrones theories</a></h3>
   <h3 class="text-ellipsis sidebar_listheader"><a href="{{ site.baseurl }}/category/c++">C++ programming.</a></h3>
</div>
</div>
</div>
<div class="contentbox" markdown="1">
<div class="contentbox_inner" markdown="1">
### More...
{: .cbox_header}
<div class="cbox_body" markdown="1">
   <h3 class="text-ellipsis sidebar_listheader"><a href="{{ site.baseurl }}/software/Transylvania-theme-for-sublimetext-3/">Transylvania Theme for Sublime Text 3</a></h3>
   {% include gfx/block_image.html image="st-transylvania.png" title="Click to enlarge" borderclass="borderless" %}
</div>
</div>
</div>
</div>
