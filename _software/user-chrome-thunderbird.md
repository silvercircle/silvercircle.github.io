---
title: My thunderbird userChrome modifications
author: AlexVie
date: 2017-10-18T01:33:37+0200
modified: 2017-10-18T01:33:53+0200
collection: software
layout: no_sidebar
reduced: big
menucontext: topics
tag: first
disqus: 1
share: 1
excerpt: >
    A small `userChrome.css` File to change some visual aspects of Mozilla Thunderbird. Works with 
    TB version 52 or later (tested, *may* also work with older versions)
    <br>
    <br>
    Available as [public 
    gist](https://gist.github.com/silvercircle/023bded0da891872f956b02b55a581ee) on GitHub.

image:
    source: tb_screenshot
    width: 20%
    align: right
    link: 1
media:
    tb60:
        name: tb60_customized.png
        desc: "Thunderbird 60 screenshot"
        link: 1
---
# My userChrome.css for Thunderbird
{% include post_header.html %}
{% include defs.md %}

<div class="note blue" >
<h3 class="alert">Warning</h3>
<p markdown="1">
This has been updated for Thunderbird 60 which has been released recently. Do **not** use it for
older versions of TB, it may break your layout.
</p>
</div>

Even though there are many alternatives today, I still use Thunderbird as my personal e-mail client 
of choice. While it does have its own set of problems, it's still one of the best remaining desktop 
e-email applications in terms of flexibility, security and user experience. It is also free and Open 
Source and enjoys a huge community.
{:dc}
{% include gfx/FD.html image=page.media.tb60 align="right" width="50%" borderclass="borderless" %}

Since I'm quite picky when it comes to UI design, I've made a few changes that improve the look of 
Thunderbird. Nothing spectacular, just a couple of minor changes:

* alternating colors for the folder- and message tree control
* rectangular tabs, less padding, less waste of space
* minor changes to the message preview- and header area.
* includes some minor styling changes for the Thunderbird-Conversations add-on.

<br>
<br>
**Here is the code (embedded gist, if that does not show up for some reason, the [public 
gist](https://gist.github.com/silvercircle/023bded0da891872f956b02b55a581ee) is available on 
GitHub**.
<script src="https://gist.github.com/silvercircle/023bded0da891872f956b02b55a581ee.js"></script>

## To install

* find your TB profile directory.

* If it does not already exist, create a new directory in your profile and name it `chrome` (all lower 
case). 

* Copy the `userChrome.css` that you'll find inside the .ZIP you downloaded from GitHub into that 
freshly created directory. Under Linux, the case matters, the `C` must be capital, the extension lower 
case. The folder `chrome` must be all lowercase. 

To activate it, you have to restart Thunderbird. If anything goes wrong and TB looks strange, you 
can simply remove that file from its folder. It does not change anything outside itself. No special 
settings are required and the modification is only tested on Thunderbird 52 or newer under Windows.

## Compatibility notes

This was initially written for Thunderbird on Windows, but it should work on Linux or OS X. You may
want to change the fonts, unless you have Verdana installed on Linux, which is entirely possible but
beyond the scope of this document.

If unsure, use `sans` for the font, this will usually be a shortcut for your default UI desktop font
on most Linux distributions.
