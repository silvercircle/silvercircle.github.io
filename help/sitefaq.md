---
author: Alex Vie
title: Site FAQ
layout: no_sidebar
reduced: yes
sidebarcontent: sbar_default
date: 2017-09-16T14:05:09+0200
modified: 2017-09-16T14:05:26+0200
menucontext: about
permalink: /help/faq/
share: 1
disqus: 1
---

# Site frequently asked questions
{% include post_header.html %}
{% include defs.md %}
This is a FAQ concerning the site itself and the software behind it.
#### What's behind this site, which CMS?

No CMS at all. The site is created with [Jekyll](https://jekyllrb.com), a so-called static site 
generator written in [Ruby](https://www.ruby-lang.org/en/).

#### But this is so 90's, what's the point?

Basically, it is indeed "so 90's", because the web started as static, using a markup language with 
only [18 tags](https://www.w3.org/History/19921103-hypertext/hypertext/WWW/MarkUp/Tags.html). Of 
course, ever since then technologies have evolved exponentially, so we do have a bit more 
flexibility now. HTML5, CSS and JavaScript are powerful, even in static content.

The point is that it's good enough for the job and hosting static content is incredibly cheap and 
easy. No need to worry about overloaded servers, security nightmares like WordPress (the software 
itself is fine, but the plugins are sometimes horrible) and other problems.

#### It's hosted on GitHub, sounds cool, can I haz it?

Sure. Everyone can. Sign up at GitHub and [get started with hosting a page for 
free](https://help.github.com/articles/what-is-github-pages/). Resource limits are generous (though 
not unlimited) and it's totally free.

Note that they won't host a database and you cannot run any server-sided code. No PHP, no Java, no 
Python, just HTML, CSS and JavaScript.

#### What about CSS, frameworks, anything?

Nope, CSS is a modified version of the [jekyll-architect](https://github.com/pages-themes/architect) 
theme. The gallery functionality is provided by [fancybox](http://fancybox.net/). The site uses 
parts of [Font Awesome](http://fontawesome.io/) (for the social icons in the share bar), 
[jQuery](https://jquery.com/), and the [jQuery Timeago](http://timeago.yarp.com/) plugin for 
relative time stamps.

#### What Jekyll plugins are used

* [jekyll-paginate-v2](https://github.com/sverrirs/jekyll-paginate-v2) for awesome pagination of 
  everything.

* jekyll-feed for the XML feed

* jekyll-redirect-from (allows multiple URLs for posts and pages).

* jekyll-seo-tag (inserts a block of SEO markup in the header)

* jekyll-sitemap (you guessed correct, it builds a site map :) )

* jekyll-mentions (support for mentions on GitHub)

* jekyll-include-cache (speed up building by caching reusable include fragments.

#### What fonts are used?

* [Roboto Condensed](https://fonts.google.com/specimen/Roboto+Condensed) for headlines in the 
main content area and sidebar areas. As the name implies, it's a condensed version of the popular 
Roboto font, ideal for longer headlines.

* [Lato](https://fonts.google.com/specimen/Lato) for most parts except article text. It's a modern 
sans serif font that provides good readability at small to medium sizes.

I have not yet decided on the typeface for the article text, there are a few candidates. I 
particularly like the Cormorant family, consisting of:

* [Cormorant Garamond](https://fonts.google.com/specimen/Cormorant+Garamond). An 
easy and lightweight *old style* serif font of the [Garamond 
family](https://en.wikipedia.org/wiki/Garamond) of french origin.

* [Cormorant Infant](https://fonts.google.com/specimen/Cormorant+Infant). A variation of the 
Garamond style with some alternate glyphs.

#### Other favorite serif fonts on Google fonts:

* [Vollkorn](https://fonts.google.com/specimen/Vollkorn).

* [Lora](https://fonts.google.com/specimen/Lora)

All fonts are implemented as web fonts, so it should look the same on all platforms.

