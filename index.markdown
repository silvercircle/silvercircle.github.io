---
author: alex
title: Home
layout: default
---
# Welcome

## So, what's this all about?

Well, right now it's not much. It's some sort of playground to test 
[Jekyll](https://jekyllrb.com), a static page generator that has enough 
flexibility to build a blog or documentation site with it, but leaves out all 
the bloat that makes modern content management systems slow and prone to 
security problems.

With Jekyll, there is no need for a database or complex web server 
configuration. The only thing needed is a working ruby and Jekyll installation 
on either your local development machine or the server machine itself and a 
web server that can serve static files (basically, the role model of all web 
servers).
## How it works?
Fairly simple. You write content in markdown format, a plain text format that 
has become popular among developers and blog authors over the years. MD is 
simple, yet powerful enough to create well formatted postings and has features 
to embed images and other rich media content. It also can output well 
formatted and syntax colored code in many programming languages which is a 
favorite feature for many programmers.

Once you are done with writing, you tell Jekyll to *build* the site. During 
this process, Jekyll takes your content and translates it from markdown into 
HTML. The HTML is then fed into templates which are processed by the template 
compiler. It spits out ready-to-serve static HTML pages. Jekyll comes with its 
own simple web server which you can use locally on your development machine to 
test your site, but on your host, you'll most likely use the already installed 
web server software. Be it Apache, nginx, IIS or something completely 
different - it will work, because serving static pages is the bread and butter 
of all web servers. 

So, in order to deploy, you upload the generated site folder. This is not a 
problem as long as the site is small, but for big sites with hundreds, 
possibly thousands of pages, it's not an option to upload the entire site 
after each change. An alternative workflow is necessary.

The easiest method is to upload only the source files (your content written in 
markdown and custom templates, style sheets, scripts and resources) and then 
build on the server itself. By default, Jekyll builds into a predefined 
directory called *_site*, but it can be told to build anywhere in the file 
system, including a sub directory of your webserver's document root, which is 
exactly what we want. In order for this to work, you need a host that allows 
you to install Jekyll and its required infrastructure, namely Ruby. Chances 
are, Ruby is already installed, because it's a popular choice for web 
applications via Rails, but if it's not then you will either have to install 
it yourself (if you have the rights on your host) or ask support to do it for 
you.

If you cannot build on the server, then you need to install Jekyll on your own 
machine and build your site locally, then synchronized the built site.
 
{% include disqus_fragment.html %}
