---
layout: default
author: alex
blog: true
date: 2017-08-22 16:30:00
modified: 2017-08-23 23:30:00
---

# Blogging with a static site generator
<br>
The big question is: **WHY?** Why should someone give up all the innovations 
of the last 20 years or so that made the Web a dynamic, lively and social 
place and go back to publishing static HTML pages - something we did 25 years 
ago? Doesn't sound very logical, nor does it seem to make any sense, does it?

## Some history lesson

Back, in the 90's, when the web was still young, it was a very static place. 
Most pages were simple HTML documents with the rare image added every now and 
then. CSS didn't exist, markup was added in form of attributes to HTML tags, 
scripts were a rare thing, even in the late 90's, because JavaScript was, in 
its early years, a troubled technology suffering from many problems. The big 
thing, that entered the game in the second half of the 90's to make the web 
more dynamic was actually Java, not JavaScript. Applets were the big deal back 
then.

Today, we know, it was a flawed technology that failed. Replaced - for some 
time - by other flawed technologies, namely Flash and later Silverlight. The 
latter never gained greater acceptance, while the former got its years of 
glory and must be given credit for some progress that wouldn't have been 
possible without Flash. For many years, Flash was the only way to play videos 
embedded in a browser, but that's only one thing.

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
  cumbersome to use, because of its lack of style

These two steps made all other innovations like Flash, Silverlight and Java 
basically obsolete. With HTML and JavaScript, it is now possible to build a 
dynamic experience that does not rely on any third party software. High 
quality implementations of these two technologies are part of all modern 
browsers, available on a wide range of different devices. Be it PC, tablet, 
smartphone or even a gaming console - the

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
different from pages that were created with a full grown CMS.

Authoring static sites doesn't mean you have to forget **all** the cool things 
like pretty picture galleries. These things are usually implemented on the 
client's side via JavaScript and all you have to do as a site author is to 
include some scripts and CSS in your pages and format your content in a way 
that allows the scripts to find and transform it. Since Jekyll is fully 
template driven, it gives you all the necessary freedom to include almost any 
JavaScript feature you want.

In some way, it is also more flexible. Most CMS only allow subsets of HTML 
and/or CSS in content, while Jekyll allows basically everything (except 
scripts), but that flexibility comes with a price, as most things do. As an 
author, you have to adopt your workflow and leave the comfortable WYSIWY(P)G 
(the 'P' stands for probably) world you may be used to. It's not that 
difficult though and if you have any experience with Wiki authoring, then 
markdown won't pose a big challenge as it's remarkably similar.

## There are cons, there must be, right?

Well, of course, there are. The total absence of dynamic site building 
abilities (with the exception of some client-sided Ajax/JavaScript tricks) 
implies a lot of downsides. Whether or not they are significant enough to work 
as a valid argument against using a static site generator is up to the site 
owner. The decision might not be an easy one, because the cons are 
counter weighted by quite some pros. 

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
such features and they are generally well accepted by users.

**Without** a database, however, even simple things like a full text search 
becomes difficult, but again, like in the above example with a comment system, 
3rd party providers may come to rescue. It's simple to add a customized google 
search box to your site, giving you all of Google's knowledge on searching web 
pages for free (well, there be ~~dragons~~ ads, of course).

