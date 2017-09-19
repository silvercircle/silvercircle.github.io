---
layout: default
author: alex
blog: true
date: 2017-08-22 16:30:00+0200
modified: 2017-08-28 05:12:58+0200
categories: [Jekyll]
menucontext: blog
disqus: 1
share: 1
backlink: /blog
tag: [first, Jekyll]
excerpt: >
  The big question is: WHY? Why should someone give up all the innovations of the last 20 years or so that made the Web a dynamic, lively and social place and go back to publishing static HTML pages something we did 25 years ago? Doesn't sound very logical, nor does it seem to make any sense, does it?
image: logos/jekyll.png
image_width: 130px
image_align: right
image_title: Jekyll Logo (CC-BY 4.0)
---

# Blogging with a static site generator
{% include post_header.html %}

The big question is: **WHY?** Why should someone give up all the innovations of the last 20 years or 
so that made the Web a dynamic, lively and social place and go back to publishing static HTML pages 
- something we did 25 years ago? Doesn't sound very logical, nor does it seem to make any sense, 
does it?

## A not so short history lesson

Back, in the 90's, when the web was still young, it was a very static place. 
Most pages were simple HTML documents with the rare image added every now and 
then. CSS didn't exist, markup was added in form of attributes to HTML tags, 
scripts were a rare thing, even in the late 90's, because JavaScript was, in 
its early years, a troubled technology suffering from many problems. The big 
thing, that entered the game in the second half of the 90's to make the web 
more dynamic was actually Java, not JavaScript. Applets were the big deal back 
then.

Today, we know it was a flawed technology that failed. Replaced - for some 
time - by other flawed technologies, namely Flash and later Silverlight. The 
latter never gained greater acceptance, while the former got its years of 
glory and must be given credit for some progress that wouldn't have been 
possible without Flash. For many years, Flash was the only way to play videos 
embedded in a browser and the technology that made sites like YouTube possible in the first places.

While Java, Flash and Silverlight were client sided things, at about the same time server sided scripting started to take off while Java applets tried to conquer the web and ultimately failed. CGI scripts, the very basic form of server sided dynamic content creation, had existed for a while, but their usefulness was limited and even back then, they were a security and performance nightmare for every webmaster. PERL was the language of choice for early CGI development in the 90's, but Perl never was a very approachable language - a powerful one in the right hands for sure, but also a messy one. Other options to write CGI scripts were C and obviously the omnipresent shell script dialect of choice.

Everything changed in 1995 though, when a Canadian programmer released a software to simplify form driven web applications and called it Personal Home Page tools - PHP was born. Initially, it was not planned to create a completely new and independent programming language, but that is exactly what happened and the rest is history. Despite its flaws and ugliness (a result of a merely chaotic and organic development process without a clear design until about PHP version 4 many years later), PHP took the Web by surprise and quickly became the most important tool for creating dynamic web content.

The fact that MySQL - a free and open source RDBMS - appeared at about the same time did help a lot of course, because a database is almost mandatory for web applications that build content dynamically.

Looking back into the evolution of the dynamic web, it's quite interesting to 
see how that evolution iterated over a couple of steps with the big goal 
always being the same: *more dynamic, less static content*. The final 
iteration (or at least, the most recent step we currently know) manifested 
itself in two things:

* The evolution of JavaScript from a slow, interpreted, troubled and insecure 
  programming language into a powerful first class language that is nowadays 
  one of the most popular languages globally, offers great performance and has 
  left behind most of its inherent troubles that plagued it in its early days.

* The evolution of HTML from a very limited markup language that was 
  cumbersome to use into a collection of related tools that allow to build 
  complex documents with advanced layouts and embedded multimedia content - 
  all without any third party plugins. HTML5 can do simple animations, vector 
  graphics, can embed images and videos, and can, together with JavaScript, 
  build attractive and easy-to-use user interfaces. Sites like Google Docs 
  and desktop applications built with the very same web technologies like [Visual Studio Code](https://code.visualstudio.com/) showcase what these technologies can really do.

These two steps made all other innovations like Flash, Silverlight and Java 
basically obsolete. With HTML5 and JavaScript, it is now possible to build a 
dynamic experience that does not rely on any third party software. High 
quality implementations of these technologies are part of all modern browsers, 
available on a wide range of different devices. Be it desktop computer, 
portable notebook, tablet, smartphone or even a gaming console - these 
standardized web technologies work everywhere and the only thing you need is a 
modern browser, because it includes all that's really needed.

## But... aren't static websites anti-social?

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

## It is more difficult to maintain a static site

Arguably, that is indeed true. Most modern CMS do not require authors to 
understand more than just basics about the technologies that drive them. There 
is little need to understand HTML or CSS, let alone more complex things like 
JavaScript or a template language. As an author, you write content the way you 
do it in a word processor. In fact, many CMS allow authors to write content in 
Microsoft Word and can accept the Word document format.

{% include gfx/float_image.html image="vim.png" align="right" width="300px" 
title="This is how a post can be written in Jekyll - with a simple text 
editor" %}In Jekyll, you write posts using the markdown language. While the 
basics of it are easy to learn, creating more advanced posts require either a 
site administrator who can help or more learning. Either way, it's a bit more 
complex than taking an image and dragging it into your post, but it is 
possible and as you can see here on this site, the results don't look 
different from pages that were created with a full grown CMS.

Authoring static sites doesn't mean you have to forget **all** the cool things 
like pretty picture galleries or fancy "relative" and dynamic time stamps. 
These things are usually implemented on the client's side via JavaScript and 
all you have to do as a site author is to include the scripts and CSS in your 
pages and format your content in a way that allows the scripts to find and 
transform it. Since Jekyll is fully template driven, it gives you all the 
necessary freedom to include almost any JavaScript feature you want.

In some way, it is also more flexible. Most CMS only allow subsets of HTML 
and/or CSS in content, while Jekyll allows basically everything (except 
scripts), but that flexibility comes with a price, as most things do. As an 
author, you have to adopt your workflow and leave the comfortable WYSIWY(P)G 
(the 'P' stands for probably) environment you may be used to. It's not that 
difficult though and if you have any experience with Wiki authoring, then 
markdown won't pose a big challenge as it's remarkably similar.

## Performance and security

Here we have the two most important advantages of using static pages 
publishing. First, delivering static HTML pages and their linked resources is 
the bread and butter for any web server software. On modern hardware, a HTTP 
server like nginx can satisfy ten-thousands of static page requests every 
second and the limiting factor will almost always be the available network 
bandwidth. With static pages, even a low end server can saturate 100MBit with 
ease. CPU and memory load are irrelevant when serving static pages, because 
you'll hit the network and/or storage transfer limit way faster than you can 
fully load even a single core of a modern CPU.

So, the first advantage is that you save hosting fees, simply, because a low 
spec server hardware will certainly do it, as long as you have enough network 
capacity. Publishing with Wordpress, Drupal, Joomla or similar piece of 
software, much more powerful thus more expensive hardware will be needed for 
satisfying **performance and stability requirements**. Also, you need PHP and 
a database on the server - by today, both have become de-facto standard, but 
hardware that is powerful enough has not yet, particularly not in the low cost 
hosting business where hardware is often overloaded.

**Security** is the second big argument and might be even more important. 
While a miserably performing Wordpress site can be annoying, it won't directly 
do any harm other than maybe pissing off some of your potential customers. A 
site that crashed under high load is a different thing though and may have 
potential to really hurt your business. But then, if your financial income 
depends on the availability of your website(s), you should look for decent 
hosting anyway. Even static pages won't be reachable when the server is 
hopelessly overloaded or crashed.

One of the biggest threats are security holes in web applications. While the 
situation has improved a bit over the last couple of years, mainly because 
more and more developers understand how basic attack vectors like XSS and SQL 
injections work and how to fend off attacks against them, there are still 
countless vulnerable web applications in the wild. With static pages, however, the risk is almost completely eliminated, because the majority of attack vectors vanish with the absence of code execution and database interaction. 

## Revision control

Wiki authors probably know the deal. Every article is managed by some kind of revision control system. This has a number of advantages:

* **Transparent changes**. The revision history can be used to see all changes made to the article.

* **Easy way to revert**. Any change to an article, template, CSS or any other file can be undone with ease. Just revert to an earlier version.


## There are cons, there must be, right?

Well, of course, there are. The total absence of dynamic site building abilities (with the exception of some client-sided Ajax/JavaScript tricks) 
implies a lot of downsides. Whether or not they are significant enough to work 
as a valid argument against using a static site generator is up to the site 
owner. The decision might not be an easy one, because the cons are 
counter weighted by quite some pros. 

### Lack of interaction

Without dynamic content, even simple features like a flat comment system is 
difficult to implement. Not impossible, but still difficult and no matter how 
well you do it, it will never be as feature-rich and powerful as a database 
driven forum or comment system. Third party solutions like 
[Disqus](https://www.disqus.com) can fill the gap and can be added to static 
sites, but it basically means you're giving it out of your hands, which might 
not be what you want.

For sharing and social media interaction, such features can be embedded in 
static sites without problems. Facebook like buttons are everywhere on the net 
and it's even possible to add comments from Facebook to a static page.

### Organizing content

With a database, things like full text search, categorizing and tagging are 
easy to implement standard features nowadays. Every blog or CMS software has 
such features and they are generally well accepted by users.

**Without** a database, however, even simple things like a full text search 
becomes difficult, but again, like in the above example with a comment system, 
3rd party providers may come to rescue. It's simple to add a customized google 
search box to your site, giving you all of Google's knowledge on searching web 
pages for free (well, there be ~~dragons~~ ads, of course).

