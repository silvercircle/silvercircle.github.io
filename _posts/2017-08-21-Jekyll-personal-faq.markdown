---
author: AlexVie
title: Jekyll personal FAQ
permalink: /help/jekyll-personal-faq.html
date: 2017-08-22 22:45:00+0200
modified: 2017-09-04 04:57:40+0200
layout: default
categories: [Jekyll,Site]
menucontext: topics
excerpt: >
  This is a list of questions (and answers) I stumbled over while designing this site. It is by no means a complete list and will most likely cover topics that are already documented elsewhere. I found many answers on [stackoverflow questions tagged with Jekyll](https://stackoverflow.com/questions/tagged/jekyll) and links are given when still available. As almost always with such matter, stackoverflow is the #1 resource for such questions.
image: logos/jekyll.png
image_width: 130px
image_align: right
image_title: Jekyll Logo (CC-BY 4.0)
---

# Jekyll personal FAQ
{% include post_header.html %}

This is a list of questions (and answers) I stumbled over while designing this 
site. It is by no means a complete list and will most likely cover topics that 
are already documented elsewhere. I found many answers on [stackoverflow 
questions tagged with 
Jekyll](https://stackoverflow.com/questions/tagged/jekyll) and links are given 
when still available. As almost always with such matter, stackoverflow is the 
#1 resource for such questions.

## How to filter posts in a loop

Suppose you want to iterate over the collection of posts in the paginator and 
filter by a some criteria defined by the page's FrontMatter. Here we are 
looking for posts which have a variable *myvariable* defined and set to true 
in their FrontMatter block. 

{% highlight liquid linenos %}
{% raw %}
{% for post in paginator.posts | where:"myvariable",true %}
    [...]
{% endfor %}
{% endraw %}
{% endhighlight %}

This won't work, because filters are not allowed in the for loop. 

{% highlight liquid linenos %}
{% raw %}
{% assign posts = paginator.posts | where:"blog",true %}
{% for post in posts %}
    [...]
{% endfor %}
{% endraw %}
{% endhighlight %}

The fix is first assign the filtered collection to a new variable and then iterate over it.

## Parse markdown in HTML content
<div class="two_cols" markdown="1">
Markdown allows the usage of HTML tags and therefore to mix HTML and ordinary 
text within a single post or article. By default, markdown will not parse 
inside HTML tags, which is usually the desired behavior, but sometimes you may 
want the exact opposite and parse inside HTML tags. Consider, you want to use 
a `<div>` section for highlighting a paragraph with a custom CSS class or 
similar purpose like I did in this paragraph for which I assigned a 2-column 
CSS layout by simply wrapping it in `<div>` tags.
</div>

{% highlight html linenos %}
<div class="myclass">
    the paragraph's content (written in markdown)
</div>
   <!-- content above will be taken as raw HTML, no markdown processing will happen. -->

<div class="myclass" markdown="1">
    the paragraph's content
</div>
   <!-- here, markdown will parse it.-->  
{% endhighlight %}

Note that the above only works with the kramdown markdown converter, not with 
alternatives like redcarpet. Kramdown is the default in Jekyll 3, so you 
shouldn't need to worry

## Escape liquid tags when highlighting code

If you need to highlight a code block containing liquid tags, you have to 
"escape" it. By default, liquid tags are parsed in markdown content and this 
includes a block defined for syntax highlighting. You have to enclose the 
liquid code in [% raw %] ... [% endraw %] tags (note, I have to use square 
brackets here, otherwise the tags wouldn't show up) to prevent it from being 
parsed instead of just highlighted. The raw tag was a plugin in older versions 
of Jekyll but is now included in Jekyll 3.

## Accessing front matter variables in the post

All variables defined in the FrontMatter are available as members of the 
*page* object. If FrontMatter defines the title then you can access it via {% 
raw %} **{{ page.title }}** {% endraw %} in the post. In a similar way you can 
access these variables when iterating over post collections in a loop.

All configuration variables defined in the site configuration (*_config.yaml*) are available in the `site` namespace.

## When exactly is a FrontMatter block necessary?

Basically, for all pages that become content pages. It doesn't matter whether 
the page is a markdown document or plain HTML - if it's going to become its 
own page, it needs a FrontMatter block. Layouts do not need any and neither do 
fragments that are included, because technically, they become a part of the 
page that includes them..

## Check whether the current item is the last in an iteration

{% highlight liquid linenos %}
{% raw %}
{% unless forloop.last %},&nbsp;{% endunless %}
{% endraw %}
{% endhighlight %}

The *unless* statement outputs everything between it and the next *endunless* as long as the condition does **not** evaluate to true.

## Iterate over categories and capture the name

{% highlight liquid linenos %}
{% raw %}
{% for category in site.categories %}
   <h3><a href="[....]{{ category | first | strip_html | downcase}}/index.html">{{ category | first | strip_html | tolower}}</a></h3>
{% endfor %}
{% endraw %}
{% endhighlight %}

## Parse markdown in a Frontmatter variable.

Normally, front matter content is not parsed, but you can always use the ```markdownify``` filter to parse anything you want. 

Let's assume, you have defined an excerpt via front matter, a couple of lines and you want to include a hyperlink and some simple markup.

#### Solution:
{% raw %}
```liquid
   {{ post.excerpt }}                 // raw content, "as is"
   {{ post.excerpt | markdownify }}   // fully parsed
```   
{% endraw %}

{% include disqus_fragment.html %}