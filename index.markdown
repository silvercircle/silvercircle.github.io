---
author: AlexVie
title: Home
layout: default
menucontext: home
date: 2017-08-25 06:35:00+0200
modified: 2017-08-25 06:35:07+0200
---
# So, what's this all about?
<br>
Well, right now it's not much. It's some sort of playground to test [Jekyll](https://jekyllrb.com),
a static page generator that has enough flexibility to build a blog or documentation site with it,
but leaves out all the bloat that makes modern content management systems slow and prone to
security problems.

With Jekyll, there is no need for a database or complex web server configuration. The only thing
needed is a working ruby and Jekyll installation on either your local development machine or the
server machine itself and a web server that can serve static files (basically, the role model of
all web servers).

## How it works?
Fairly simple. You write content in markdown format, a plain text format that has become popular
among developers and blog authors over the years. MD is simple, yet powerful enough to create well
formatted postings and has features to embed images and other rich media content. It also can
output well formatted and syntax colored code in many programming languages which is a favorite
feature for many programmers. If you wish, you can write in HTML or mix Markdown and HTML in any
possible way.

It's also easy to use. No special software is required to create or edit markdown files; it's plain text and your preferred text editor will work. Since the format is so popular, it will likely provide a couple of features to make working with markdown files easier.

{% include gfx/block_image.html image="vscode.png" title="A typical workflow when using Jekyll. A simple text editor is enough." %}

Once you are done with writing, you tell Jekyll to *build* the site. During this process, Jekyll
takes your content and translates it from Markdown into HTML. The HTML is then fed into templates
which are processed by the template compiler. It spits out ready-to-serve static HTML pages. Jekyll
comes with its own simple web server which you can use locally on your development machine to test
your site, but on your host, you'll most likely use the already installed web server software. Be
it Apache, nginx, IIS or something completely different - it will work, because serving static
pages is the bread and butter of all web servers.

More advanced features in Jekyll will help with the creation of indexes, paginations, tag lists, category indexes and all other things a website will need. Since you have full control over the entire structure, there are almost no limits. Also, everything is built from theme templates, which you can override with your own, modified variants.

To deploy, you upload the generated site to your host into the document root folder. There is no
need to install, set up a database, configure folder permissions or do any other fancy things. You
deploy like we deployed our first web pages more than 20 years ago, except that we weren't using
**S**FTP, but you seriously should.

The cool thing is that a static website works on every possible configuration and web server software you'll find. There is no need to install add-on modules, no need for special configuration steps, if your server can serve HTML and recognize a `index.html` file as the index for an entire folder, everything will work.

Jekyll is a fairly unproblematic piece of software. It works on Windows, OS X and every flavor of Unix for which `ruby` (the programming language) is available. It does not need a particularly powerful system nor any prerequisites. Install-and-run is how it works.