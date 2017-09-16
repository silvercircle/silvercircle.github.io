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
<div markdown="1">
<div class="floatbox right" style="width: 40%;margin-top:0;" markdown="1">
### Featured
{: .cbox_header}
{% include gfx/block_image.html image="st-transylvania.png" borderclass="borderless" 
title="Transylvania Theme for ST 3" omitbottomcaption=1 %}
[ST-Transylvania]({{site.baseurl}}/software/Transylvania-theme-for-sublimetext-3) is a theme for 
Sublime Text 3 that harmonizes well with the dracula color scheme.
{: style="font-size:100%;text-align:center;"}
</div>
Well, right now it's not much. It's some sort of playground to test [Jekyll](https://jekyllrb.com),
a static page generator that has enough flexibility to build a blog or documentation site,
but leaves out all the bloat that makes modern content management systems slow and prone to
security problems. It also significantly lowers the requirements for hosting to a simple web server 
that can serve static files (essentially, what basically **all** web servers can).

With Jekyll, there is no need for a database or complex web server configuration. The only thing
needed is a working ruby and Jekyll installation on either your local development machine or the
server machine itself and a web server that can serve static files.

Jekyll is also supported by [GitHub pages](https://pages.github.com/) who give you essentially 
unlimited free web hosting, but won't allow you to run PHP, Python, Java or whatever else on their 
servers. But you can use Jekyll either locally to build your static site or let GibHub run it 
whenever you change content.

Plus, you get free awesome revision control for your entire site. Never lose a change or important 
article again.
</div>
<div class="clear"></div>
<hr class="blueline">
<div class="boxcontainer" markdown="1">
<div class="contentbox" markdown="1">
<div class="contentbox_inner" style="font-size:smaller;" markdown="1">
### Recent blog
{: .cbox_header}
<div class="cbox_body">
 {% assign this_posts = site.posts | where: "tags", "first" | sort: 'modified' | reverse %}
 {% for post in this_posts limit: 5 %}
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
 {% endfor %}
<div style="float:right"><a href="{{site.baseurl}}/blog/">Show all blog posts</a></div>
<div style="clear:both;"></div>
<br>
</div>
</div>
</div>
<div class="contentbox" markdown="1">
<div class="contentbox_inner" markdown="1">
### Recent articles
{: .cbox_header}
<div class="cbox_body">
 {% assign docs = site.documents | where: 'tags', 'first' | sort: 'modified' | reverse %}
 {% assign counter = 1 %}
 {% for page in docs %}
 {% if page.menucontext == 'blog' or page.blog == 1 or page.blog == true %}
    {% continue %}
 {% endif %}
 {% include sidebar/document_entry.html %}
 {% assign counter = counter | plus: 1 %}
 {% if counter > 6 %}
 {% break %}
 {% endif %}
 {% endfor %}
</div>
</div>
</div>
<div class="contentbox" markdown="1">
<div class="contentbox_inner" markdown="1">
### All site topics
{: .cbox_header}
<div class="cbox_body">
   <h3 class="text-ellipsis sidebar_listheader"><a href="{{ site.baseurl }}/webdev">Web 
   development</a></h3>
   <h3 class="text-ellipsis sidebar_listheader"><a href="{{ site.baseurl }}/software">Software</a></h3>
   <h3 class="text-ellipsis sidebar_listheader"><a href="{{ site.baseurl }}/tabsrmm">TabRSMM / Miranda IM (archived content)</a></h3>
   <h3 class="text-ellipsis sidebar_listheader"><a href="{{ site.baseurl }}/category/development">Development</a></h3>
   <h3 class="text-ellipsis sidebar_listheader"><a href="{{ site.baseurl }}/category/fun">Fun and entertainmentt</a></h3>
   <h3 class="text-ellipsis sidebar_listheader"><a href="{{ site.baseurl }}/category/jekyll">Jekyll static site generator</a></h3>   
   <h3 class="text-ellipsis sidebar_listheader"><a href="{{ site.baseurl }}/category/got">Game of Thrones</a></h3>
   <h3 class="text-ellipsis sidebar_listheader"><a href="{{ site.baseurl }}/got-theories">Game of 
   Thrones theories</a></h3>
   <h3 class="text-ellipsis sidebar_listheader"><a href="{{ site.baseurl }}/category/c++">C++ 
   programming.</a></h3>
   
   </div>
</div>
</div>
</div>
