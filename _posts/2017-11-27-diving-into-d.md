---
author: Alex Vie
title: Diving into the D language
layout: default_dyn
reduced: big
date: 2017-11-28T17:51:07+0100
modified: 2017-11-28T17:51:07+0100
menucontext: blog
category: Development
collection:
share: 1
disqus: 1
tag: [first]
backlink: /blog
excerpt: >
    I'm currently in curious mode, trying out some new things. After learning the basics of Rust a 
    couple of months ago, I'm now back to a language I had first contact with many years ago - D. 
    <br>
    <br>
    Lots of progress has apparently been made in recent years and D presents itself as a complete 
    language with high productivity value. At least, that's what D apologets claim. 
    
media:
    slickedit:
        name: slickedit-d-mode.png
        path: /
        desc: SlickEdit as IDE for the D language
        long: |
            This screen shot shows SlickEdit, a multi-platform and multi-language text editor and IDE 
            for many languages, including D. It supports project management, intelligent code 
            completion (similar to Intellisense), sophisticated code navigation and much more.
---
# Diving into the D language
{% include post_header.html %}
{% include defs.md %}

When I first checked out D many years ago (in the days of D1), I found it an interesting concept, but 
the language had little value for practical use. The reference compiler was a fast moving and - at 
some times - fairly buggy and problematic piece of software. The same was true for the standard 
library, or should I say, **both** standard libraries, because there were in fact two and to make 
things worse, they were not really compatible.
{:dc}

The project was lacking in quality and direction and the most common reasons were given as following:

* the project was very ambitious from the beginning, maybe over-ambitious to some extent. No less than 
a successor for C++ was (and still is) the goal for D, set by its author, Walter Bright[^bright]. 
 
* lack of manpower. For a long time, D was basically a one man project by Bright himself and 
realistically, this isn't doable by a single person, no matter how qualified and skilled that person 
might be. It's simply too much work to be finished by a single person in any reasonable time frame.

Most of the issues are long solved and today D presents itself as a mature programming language with a 
stable reference compiler and standard library (Phobos). Additionally, two more compilers are 
available:
 
* GDC, a GCC based compiler that runs on many Unix-like systems, Windows and OS X in both 32- and 
64-bit versions.

* LDC, a DMD command line compatible compiler based on the LLVM infrastructure that supports 32- and 
64-bit targets on Linux, OS X, Windows and Android. Available for Linux, OS X and Windows. 
Cross-compiling is possible. 

While DMD remains the reference compiler, both GDC and LDC can produce significantly better optimized 
and thus faster code, particularly for 64bit targets, simply because GCC and LLVM are two highly 
tested and mature platforms.

## Template programming

This [excellent 
document](https://github.com/PhilippeSigaud/D-templates-tutorial/blob/master/D-templates-tutorial.md) 
about template programming in D, which is a bit more complex (but also much more powerful) than 
typical generics in other languages. The author of this long documents starts with the basic concepts 
and gradually dives deeper into the matter before showing how D's various features in the area can be 
used for meta programming and practical use cases. This is an excellent read for people who already 
understand the concepts of templates and generics and want to learn D's implementation of these 
concepts.
{:dc} 

http://www.semitwist.com/articles/EfficientAndFlexible/SinglePage/

## Environments

Since D still lacks popularity, the number of high quality tools for programming in D is somewhat 
limited. Many modern editors do support syntax highlighting for D, but more advanced support for 
auto-completion and error checking is still rare. There is an 
[add-on](https://marketplace.eclipse.org/content/ddt) for Eclipse and an 
[extension](http://rainers.github.io/visuald/visuald/StartPage.html) for Visual Studio. Other possible 

{% include gfx/BD.html image=page.media.slickedit borderclass="borderless" %}

[^bright]: [Walter Bright](https://en.wikipedia.org/wiki/Walter_Bright) is a renowned expert on
    programming languages, particularly compiler design with 3 decades of experience in the area. With 
    Zortech C++, Bright authored the first C++ compiler for the Windows operating system, at a time 
    when Microsoft's own compiler only understood ANSI C. 
