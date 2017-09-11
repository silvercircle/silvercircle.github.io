---
author: AlexVie
title: Publishing on GitHub
date: 2017-09-05 03:45:47+0200
modified: 2017-09-06 22:11:47+0200
layout: default
categories: [Site]
menucontext: blog
permalink: /articles/publishing-on-github
tag: [first, foo]
excerpt: >
    [GitHub](https://github.com) is not only the largest developer community on the net, they also offer lots of free services. Code repositories for free Open Source project are one thing, web hosting for simple static web sites another one. People might be curious whether such simple hosting without PHP, Java, Python or even a database really works.
    <br>
    It really depends on your needs, but I think, for the majority of simple blogs and/or personal homepages that are nowadays using Wordpress, it should work well.
image: logos/github-mark.png
image_width: 100px
image_align: right
image_title: GitHub Logo
---
{% include defs.md %}
# Publishing on GitHub
{% include post_header.html %}
For many years, I was running my own website, containing a blog, a Forum and a Wiki, all hosted on a dedicated server - a quite expensive solution 15 years ago, but all three parts were essential back in the days when I was working on a fairly popular open source project and used my web presence for all kind of documentation and collaboration. This was before the social net took off, when forums, instant messaging and group chats were the #1 way to interact on the Net.

It was a more or less pure *LAMP* solution (Linux, Apache, MySQL, PHP), with the exception that my OS of choice was always FreeBSD, but that makes little difference. Later, Apache got replaced by Nginx, MySQL by MariaDB, and I experimented a lot with Python-based software, but the PHP-centric approach stayed.

For the purpose of this article, I'm going to limit it to the blog part, which is probably the part I invested most time over the years. It started around 2002 or so with a software then named jBlog (or jLog), written in PHP, which was later renamed to Serendipity and is still around 15 years later in 2017. It was very basic, even more basic than WordPress 1.0 which appeared about a year after I decided to start a blog, but it was good enough to run a simple blog with nothing but articles and the odd image every now and then.

Eventually, I migrated to WordPress, because WP was hyped (and I was, admittedly, falling for the hype) and, to be honest, back then it was an excellent choice for a small personal weblog, because it did exactly what was needed.
 
## The advantages ("pros") 

* basically unlimited storage.
* free revision control. This means, you can never lose work as it always remains possible to revert changes or get older versions of a particular article back for reference. Revision control is a major feature of most modern CMS and Wiki authoring systems. With GitHub, you get it for free and for everything - not only for articles, but also for templates, style sheets, even images.
* very stable, reliable hosting. I've never experienced GitHub being down, slow or even unresponsive.
* no resource limits. Your hosting isn't limited in CPU power, RAM usage or number of database connections. It simply doesn't matter with static pages.
* You can use your own domain name. All you need is access to your DNS record.
* You do not have to adopt the particular work flow of the CMS of your choice. You write with your favorite editor on your local computer, you have all the files available locally with exactly the same structure as on the host.
* want to keep a change log for later reference? Well, no need to do it explicitly. GitHub does it for you. Just use commit messages.

Well, that's a lot of <<pros>> isn't it?. When there is so much light, there must be shadow, right? 

Of course. The fact that GitHub will only host static pages and does not allow PHP, Python, Ruby, Java or any other technology that would allow you to write dynamic web applications is a *con* of its own and for many it might very well be the only con that is need to rule out hosting on GitHub. Without server sided 

## How static publishing wit Jekyll works?
Fairly simple. You write content in markdown format, a plain text format that has become popular
among developers and blog authors over the years. MD is simple, yet powerful enough to create well
formatted postings and has features to embed images and other rich media content. It also can
output well formatted and syntax colored code in many programming languages which is a favorite
feature for many programmers. If you wish, you can write in HTML or mix Markdown and HTML in any
possible way.
{:cols}

It's also easy to use. No special software is required to create or edit markdown files; it's plain text and your preferred text editor will work. Since the format is so popular, it will likely provide a couple of features to make working with markdown files easier.

{% include gfx/block_image.html image="vscode.png" align="right" width="90%" title="A typical workflow when using Jekyll. A simple text editor is enough." %}

Once you are done with writing, you tell Jekyll to *build* the site. During this process, Jekyll takes your content and translates it from Markdown into HTML. The HTML is then fed into templates
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

