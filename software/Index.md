---
layout: topics
author: AlexVie
date: 2017-09-01 06:31:32+0200
modified: 2017-09-01 06:31:36+0200
title: My Vim collection
permalink: /software/index.html
menucontext: topics
collection: software
disqus: 1
excerpt: >
    My collection of useful links, snippets and tips on various pieces of software. Including, Vim, 
    Sublime Text, Mozilla Thunderbird, Firefox among others. Not much here, right now, I'm still 
    collecting.
---

# My Vim Collection

Not much here at the moment, I'm still collecting stuff from my old blog, converting it into 
Markdown so it fits the new page.

### My .vimrc

It is available as [public 
gist](https://gist.github.com/silvercircle/c86efd6ce26025faa0b95cb5ea316240). It is fairly well 
commented and depends only on very few plugins.

### My userChrome.css for Thunderbird

{% include gfx/float_image.html image="tbird_custom.png" align="right" width="50%" title="Some UI customizations for Thunderbird 52" %}

Even though there are many alternatives today, I still use Thunderbird as my personal e-mail client 
of choice. While it does have its own set of problems, it's still one of the best remaining desktop 
e-email applications in terms of flexibility, security and user experience. It is also free and Open 
Source and enjoys a huge community.

Since I'm quite picky when it comes to UI design, I've made a few changes that improve the look of 
Thunderbird. Nothing spectacular, just a couple of minor changes:

* alternating colors for the folder- and message tree control
* rectangular tabs, less padding, less waste of space
* minor changes to the message preview- and header area.
* includes some minor styling changes for the Thunderbird-Conversations add-on.

The file is available as [public gist](https://gist.github.com/silvercircle/023bded0da891872f956b02b55a581ee).

#### To install

* find your TB profile folder
* If it does not already exist, create a new folder and name it `chrome`.
* Copy the `userChrome.css` that you'll find inside the .ZIP you downloaded from GitHub into that 
* folder. Under Linux, the case matters, the `C` must be capital, the extension lower case. The 
* folder `chrome` must be all lowercase.

To activate it, you have to restart Thunderbird. If anything goes wrong and TB looks strange, you 
can simply remove that file from its folder. It does not change anything outside itself. No special 
settings are required and the modification is only tested on Thunderbird 52 or newer under Windows.

<div class="clear"></div>
<br>
### Transylvania for ST3

{% include gfx/float_image.html image="st-transylvania.png" width="50%" align="right" title="Sublime text 3 with the Transylvania theme" %}
This theme is inspired by the very popular [Dracula theme](https://draculatheme.com/) that is 
available for many text editors and IDEs. While they do provide a full syntax highlighting color 
scheme for ST3, there is no "UI Theme", so I decided to make one. I based my work on the popular 
Soda theme (from the Sublimetext 2 era) and modified it accordingly.

It is currently work in progress and only available [via 
GitHub](https://github.com/silvercircle/ST_Transylvania). It also has its [own 
page]({{site.baseurl}}/software/Transylvania-theme-for-sublimetext-3/).

<div class="clear"></div>
