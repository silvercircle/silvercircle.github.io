---
author: AlexVie
title: Jekyll peronal FAQ
permalink: /help/jekyll-personal-faq.html
date: 2017-08-22 22:45:00
modified: 2017-08-23 00:45:00
layout: no_sidebar
---

# Jekyll personal FAQ

<br>
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

Markdown allows you to use HTML tags and therefore mix HTML and ordinary text 
within a single post or article. By default, markdown will not parse inside 
HTML tags, which is usually what you want, but sometimes you would want the 
exact opposite of the default behavior and parse inside HTML tags. Consider, 
you want to use a DIV section for highlighting a paragraph with a custom CSS 
class or similar purpose.

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
parsed instead of just highlighted.
