---
layout: default
author: alex
blog: true
date: 2017-08-22 16:30:00
modified: 2017-08-23 22:16:00
---

# Blogging with a static site generator
<br>
Back, in the 90's, when the web was still young, it was a very static place. 
Most pages were simple HTML documents with 
## Aren't static websites anti-social?

Well, in some ways they were considered anti-social before the Web 2.0 
revolution with social media and dynamic sites took off many years ago. The 
main argument was that static web sites do not allow readers to interact with 
authors, but this was only half the truth. In fact, many authors and site 
publishers offered plenty of interaction but the methods were different in the 
pre-social networking era. E-mail was obviously the most popular method, but 
other ways did exist. [Instant 
messaging](https://en.wikipedia.org/wiki/Instant_messaging)  was gaining 
popularity in the late 90's and many publishers added their ICQ or MSN 
profiles to their sites. Others allowed users to interact in chat rooms or on 
IRC
<!--more-->

## It is more difficult to maintain a static site

Arguably, that is indeed true. Most modern CMS do not require authors to 
understand more than just basics about the technologies that drive them. There 
is little need to understand HTML or CSS, let alone more complex things like 
JavaScript or a template language. As an author, you write content the way you 
do it in a word processor. In fact, many CMS allow authors to write content in 
Microsoft Word and can accept the Word document format.

{% include gfx/float_image.html image="vim.png" align="right" width="300" 
title="This is how a post can be written in Jekyll - with a simple text 
editor" %}In Jekyll, you write posts using the markdown language. While the 
basics of it are easy to learn, creating more advanced posts require either a 
site administrator who can provide the macros to easily embed images and other 
rich media content OR some HTML and CSS knowledge. Either way, it's a bit more 
complex than taking an image and dragging it into your post, but it is 
possible and as you can see here on this site, the results don't look 
different from pages that were created with a full grown CMS..

In some way, it is also more flexible. Most CMS only allow subsets of HTML 
and/or CSS while Jekyll allows basically everything (except scripts).

## There are cons, there must be, right?

Well, of course, there are. The total absence of dynamic site building 
abilities (with the exception of some client-sided Ajax/JavaScript tricks) 
implies a lot of downsides.

### Lack of interaction

Without dynamic content, even simple features like a flat comment system is 
difficult to implement. Not impossible, but still difficult and no matter how 
well you do it, it will never be as feature-rich and powerful as a database 
driven forum or comment system. Third party solutions like 
[Disqus](https://www.discuss.com) can fill the gap and can be added to static 
sites, but it basically means you're giving it out of your hands, which might 
not be what you want.

For sharing and social media interaction, such features can be embedded in 
static sites without problems. Facebook like buttons are everywhere on the net 
and it's even possible to add comments from Facebook to a static page.

### Organizing content

With a database, things like full text search, categorizing and tagging are 
easy to implement standard features nowadays. Every blog or CMS software has 
such features and they are generally well accepted by users 
