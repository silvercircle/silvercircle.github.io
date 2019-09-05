---
author: AlexVie
title: Publishing on GitHub
date: 2017-09-05 03:45:47+0200
modified: 2017-09-11 16:58:16+0200
layout: no_sidebar
reduced: big
categories: [Site]
menucontext: blog
permalink: /articles/publishing-on-github.html
tag: [first, Jekyll, GitHub]
disqus: 1
share: 1
backlink: /blog
excerpt: >
    [GitHub](https://github.com) is not only the largest developer community on the net, they also offer lots of free services. Code repositories for free Open Source project are one thing, web hosting for simple static web sites another one. People might be curious whether such simple hosting without PHP, Java, Python or even a database really works.
    <br>
    It really depends on your needs, but I think, for the majority of simple blogs and/or personal homepages that are nowadays using Wordpress, it should work well.
image:
  source: jekyll
  width: 100px
  align: right
---
{% include defs.md %}
# Publishing on GitHub
{% include post_header.html %}
For many years, I was running my own website, containing a blog, a Forum and a Wiki, all hosted on a 
dedicated server - a quite expensive solution 15 years ago, but all three parts were essential back 
in the days when I was working on a fairly popular open source project and used my web presence for 
all kind of documentation and collaboration. This was before the social net took off, when forums, 
instant messaging and group chats were the #1 way to interact on the Net.

It was a more or less pure *LAMP* solution (Linux, Apache, MySQL, PHP), with the exception that my 
OS of choice was always FreeBSD, but that makes little difference. Later, Apache got replaced by 
Nginx, MySQL by MariaDB, and I experimented a lot with Python-based software, but the PHP-centric 
approach stayed.

For the purpose of this article, I'm going to limit it to the blog part, which is probably the part I invested most time over the years. It started around 2002 or so with a software then named jBlog (or jLog), written in PHP, which was later renamed to Serendipity and is still around 15 years later in 2017. It was very basic, even more basic than WordPress 1.0 which appeared about a year later, but it was good enough to run a simple blog with nothing but articles and the odd image every now and then.

Eventually, I migrated to WordPress, because WP was hyped (and I was, admittedly, falling for the hype) and, to be honest, back then it was an excellent choice for a small personal weblog, because it did exactly what was needed. It worked reasonably well for a couple of years, but I always found upgrading a bit of a pain, particularly because add-ons and themes very often needed small adjustments and in some cases, features stopped working or started to behave strangely.

The final blow came, when some cracker decided to take over my blog to abuse it for spamming, listing my server in all imaginable e-mail black lists in the process. My fault was using an add-on that was vulnerable, but since it was an old and not a very widespread add-on, the vulnerability was not well known, so I missed it. The damage was not very big and certainly manageable, but I had no intention to repeat the experience.

### This showed me one thing

Running a blog requires attention and willingness to maintain it constantly. I could have outsourced that, but I always preferred to run things on my own server. The consequence was to take it down, because I wasn't willing to invest more time than absolutely needed. It was a hobby and it never generated a single cent of income (which was never the goal anyway). In fact, it did cost me for hosting, but that lies in the nature of most hobbies: *They are not free*. Because of all this, I decided to not have a blog at all. **Until now**.

## Going static for a comeback

Static site generators have become popular over the last couple of years.

Static publishing means one thing: No scripts on the server, no database, no complex configuration. You publish HTML pages and resources like style sheets, Javascript- and media files, like we did in the old days. The main difference is how the pages are created. In the old days, we authored them manually and while we did have software that made HTML authoring easier, it was still a cumbersome task.

A static site generator like Jekyll simplifies the task. It is a piece of software that generates pages from content, which is defined as:

* articles written in some simple markup (**Markdown** is very popular, but others can be used)
* Media files (images mainly)
* Style sheets (.css files that define how your site looks)
* Scripts that run on the client. jQuery is such an example.

The site generator will take all the content, translate it to HTML, inject the result into templates 
that define the overall look of your site and spit out an organized directory structure filled with 
HTML, CSS and all the other files. This folder structure is what you upload to your host's document 
root folder.

## How static publishing wit Jekyll works?
Fairly simple. You write content in markdown format, a plain text format that has become popular
among developers and blog authors over the years. MD is simple, yet powerful enough to create well
formatted postings and has features to embed images and other rich media content. It also can
output well formatted and syntax colored code in many programming languages which is a favorite
feature for many programmers. If you wish, you can write in HTML or mix Markdown and HTML in any
possible way.

Once you are done with writing, you tell Jekyll to *build* the site. During this process, Jekyll takes your content and translates it from Markdown into HTML. The HTML is then fed into templates
which are processed by the template compiler. It spits out ready-to-serve static HTML pages. Jekyll
comes with its own simple web server which you can use locally on your development machine to test
your site, but on your host, you'll most likely use the already installed web server software. Be
it Apache, nginx, IIS or something completely different - it will work, because serving static
pages is the bread and butter of all web servers.

More advanced features in Jekyll and most other static site generators will help with the creation of indexes, paginations, tag lists, category indexes and all other things a website will need. Since you have full control over the entire structure, there are almost no limits. Also, everything is built from theme templates, which you can override with your own, modified variants.

It's a bit like software development using a compiled language. You write your page(s) as source code and the site generator can be seen as the compiler. Whenever you change something, you need to run the compiler. Once the site has been compiled, it must be uploaded to the web server, though this depends on the type of work flow you favorite.

### Different work flows

This is by no means complete, but some possible work flows are listed here:

* build locally on a PC / laptop and upload the "compiled" site via FTP/SFTP to your host. Can be difficult for a huge site to keep track of all changes, so automatic directory synchronization and/or mirroring is definitely a must-have feature for this kind of work flow. For Windows users, I recommend [WinSCP](https://winscp.net/eng/index.php). This work flow requires that you install Ruby, Jekyll and all dependencies on your computer which is beyond of the scope for this article.

* Upload / synchronize your source code only and build on the server. The site generator and all its dependencies must be installed on the server machine. It will build directly into the document root.

* Use a version control system and configure your server to serve from the repository root. This is a more advanced setup that requires knowledge on how to configure the version control system on your server. This is also beyond the scope of this article and this work flow is what you will use when you publish on GitHub.

* Use GitHub and their Jekyll support. This work flow doesn't need a local or remote installation of Jekyll on your side. GitHub supports Jekyll and all you need to do is to push the source code of your site to the repository. GitHub will run Jekyll and build your site, though it is still possible to buld locally and push the results directly. The latter method gives you the freedom to use any Jekyll plugin you want while GitHub only supports a few.

## Using GitHub to publish

GitHub offers free web hosting for personal home pages and project pages, but they only accept static content. On GitHub, you cannot run a WordPress blog or PHP-based forum software. You can only let it serve static HTML pages and supporting files.

### The advantages ("pros") 

* generous resource limits (it's not unlimited, but what you [get for 
free](https://help.github.com/articles/what-is-github-pages/#usage-limits) is still very 
impressive).
* free revision control. This means, you can never lose work as it always remains possible to revert changes or get older versions of a particular article back for reference. Revision control is a major feature of most modern CMS and Wiki authoring systems. With GitHub, you get it for free and for everything - not only for articles, but also for templates, style sheets, even images.
* very stable, reliable hosting. I've never experienced GitHub being down, slow or even unresponsive.
* no resource limits. Your hosting isn't limited in CPU power, RAM usage or number of database connections. It simply doesn't matter with static pages.
* You can use your own domain name. All you need is access to your DNS record.
* You do not have to adopt the particular work flow of the CMS of your choice. You write with your favorite editor on your local computer, you have all the files available locally with exactly the same structure as on the host.
* want to keep a change log for later reference? Well, no need to do it explicitly. GitHub does it for you. Just use commit messages.

Well, that's a lot of <<pros>> isn't it?. When there is so much light, there must be shadow, right? 

Of course. The fact that GitHub will only host static pages and does not allow PHP, Python, Ruby, Java or any other technology that would allow you to write dynamic web applications is a *con* of its own and for many it might very well be the only con that is need to rule out hosting on GitHub. 

### Some cons

* absolutely no server-sided dynamic content.
* no database. This means advanced queries for retrieving content is difficult if not impossible to implement. You can have tags, categories and similar things with static pages, but you cannot run a simple query to retrieve all articles that are tagged with 2 terms for example.
* no access control. GitHub does not allow this. If you host static pages on your own server, it is possible to use basic HTTP auth, but not on GitHub. This implies, all pages are public.
* no author profiles, unless you create static pages for them. Also, no user or member registration and no roles.
* site-wide full text search is difficult. Unless you let google do it and integrate a custom search box. Like I did here.
* not much interactive features. You can embed [Disqus](https://www.disqus.com) if you want, but you won't have full control over all submitted content.

## And further....?

What I personally like is the simple work flow. A text editor like Visual Studio Code or Sublime Text is enough. No need to deal with thorny CMS features.

* works on every simple web server. Even if GitHub would decide to stop hosting personal home pages, it wouldn't take long to find a new (and cheap) home.
* absolute freedom. Every single line of HTML code is your own. It's very easy to add features as client sided Javascript code.
* security. No one will hack your GitHub page. Seriously, no one will hack a static page anyway, no matter where it is hosted.
* Git. Did I say Git? It's by far the easiest way to synchronize and have version control for all files.

{% include gfx/block_image.html image="vscode.png" align="right" width="90%" title="A typical workflow when using Jekyll. A simple text editor is enough." %}

Jekyll is a fairly unproblematic piece of software. It works on Windows, OS X and every flavor of Unix for which `ruby` (the programming language) is available. It does not need a particularly powerful system nor any prerequisites. Install-and-run is how it works.

