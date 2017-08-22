---
author: alex
title: Home
layout: default
---
# Welcome

#### So, what's this all about?

Well, right now it's not much. It's some sort of playground to test [Jekyll](https://jekyllrb.com), a static page generator that has enough flexibility to build a blog or documentation site with it, but leaves out all the bloat that makes modern content management systems slow and prone to security problems.

With Jekyll, there is no need for a database or complex web server configuration. The only thing needed is a working ruby and Jekyll installation on either your local development machine or the server machine itself and a web server that can serve static files (basically, the role model of all web servers).
#### How it works?
Fairly simple. You write content in markdown format, a plaintext format that has become popular among developers and blog authors over the years. MD is simple, yet powerful enough to create well formatted postings and has features to embed images and oher rich media content. It also can output well formatted and syntax colored code in many programming languages which is a favorite feature for many programmers.

Once you are done with writing, you tell Jekyll to *build* the site. During this process, Jekyll takes your content and translates it from markdown into HTML. The HTML is then fed into templates which are processed by the template compiler. It spits out ready-to-serve static HTML pages. Jekyll comes with its own simple webserver which you can use locally on your development machine to test your site, but on the server you'll most likely use the already installed web server software. Be it Apache, nginx, IIS or something completely different - it will work, because serving static pages is the bread and butter of all web servers. 

So, in order to deploy, you upload the generated site folder. This is not a problem as long as the site is small, but for big sites with hundreds, possibly thousands of pages, this isn't an option.
 
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus vel faucibus magna, in maximus lorem. Nullam nunc tellus, ullamcorper quis venenatis eget, scelerisque quis lorem. In bibendum eros laoreet blandit viverra. Donec venenatis id est eu ornare. Etiam dictum egestas lectus nec interdum. Nullam efficitur ipsum eget vehicula aliquet. Fusce nunc massa, pretium vel laoreet quis, efficitur at libero. Donec in semper velit, sit amet volutpat sapien.
### Level 3 header
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus vel faucibus magna, in maximus lorem. Nullam nunc tellus, ullamcorper quis venenatis eget, scelerisque quis lorem. In bibendum eros laoreet blandit viverra. Donec venenatis id est eu ornare. Etiam dictum egestas lectus nec interdum. Nullam efficitur ipsum eget vehicula aliquet. Fusce nunc massa, pretium vel laoreet quis, efficitur at libero. Donec in semper velit, sit amet volutpat sapien.
#### Level 4 header
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus vel faucibus magna, in maximus lorem. Nullam nunc tellus, ullamcorper quis venenatis eget, scelerisque quis lorem. In bibendum eros laoreet blandit viverra. Donec venenatis id est eu ornare. Etiam dictum egestas lectus nec interdum. Nullam efficitur ipsum eget vehicula aliquet. Fusce nunc massa, pretium vel laoreet quis, efficitur at libero. Donec in semper velit, sit amet volutpat sapien.
