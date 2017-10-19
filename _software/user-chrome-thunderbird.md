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
---
# My userChrome.css for Thunderbird
{% include post_header.html %}
{% include defs.md %}

Even though there are many alternatives today, I still use Thunderbird as my personal e-mail client 
of choice. While it does have its own set of problems, it's still one of the best remaining desktop 
e-email applications in terms of flexibility, security and user experience. It is also free and Open 
Source and enjoys a huge community.
{:dc}
{% include gfx/FD.html image=I.tb_screenshot align="right" width="50%" %}

Since I'm quite picky when it comes to UI design, I've made a few changes that improve the look of 
Thunderbird. Nothing spectacular, just a couple of minor changes:

* alternating colors for the folder- and message tree control

* rectangular tabs, less padding, less waste of space

* minor changes to the message preview- and header area.

* includes some minor styling changes for the Thunderbird-Conversations add-on.

**Here is the code (embedded gist, if that does not show up for some reason, the [public 
gist](https://gist.github.com/silvercircle/023bded0da891872f956b02b55a581ee) is available on 
GitHub**.
<script src="https://gist.github.com/silvercircle/023bded0da891872f956b02b55a581ee.js"></script>

## To install

* find your TB profile folder

* If it does not already exist, create a new folder and name it `chrome`.

* Copy the `userChrome.css` that you'll find inside the .ZIP you downloaded from GitHub into that 
 
* folder. Under Linux, the case matters, the `C` must be capital, the extension lower case. The 
 
* folder `chrome` must be all lowercase.

To activate it, you have to restart Thunderbird. If anything goes wrong and TB looks strange, you 
can simply remove that file from its folder. It does not change anything outside itself. No special 
settings are required and the modification is only tested on Thunderbird 52 or newer under Windows.


