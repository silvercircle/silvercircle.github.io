---
title: Transylvania - a theme for Sublime Text 3
author: AlexVie
date: 2017-09-02T06:18:35+02:00
modified: 2017-09-05T02:05:43+02:00
collection: software
layout: topics
---

# Transylvania Theme for Sublime Text 3.
{% include post_header.html %}
This is a UI theme for Sublime Text 3 that goes well with the [Dracula syntax coloring scheme](https://draculatheme.com/).

{% include gfx/block_image.html image="st-transylvania.png" title="Sublime Text 3 with the Transylvania theme and Dracula syntax coloring scheme" %}

It is work in progress and you can currently only obtain it from its [GitHub repo](https://github.com/silvercircle/ST_Transylvania) or this page. You need to install it manually, but once it's done and I'm fully satisfied (which can take quite some time), I'm going to submit it to package control.

## How to install manually

* [Download]({{site.baseurl}}/assets/download/Theme - Transylvania.zip) the file.
* Find your **packages** folder. The easiest way is to ask Sublime Text by navigating to ```Preferences -> Browse Packages...```. This will open a explorer window with the base folder of all installed packages.
* Unzip the downloaded file to this folder. Make sure, **you unzip it with full path name**, creating a ```Theme - Transylvania``` folder in the packages directory. This folder name is case sensitive under Linux.
* Navigate to ```Preferences -> Theme...``` and activate **Transylvania.sublime-theme** from the list of available themes.
* Navigate to ```Preferences ->Color Scheme...``` and activate **Transylvania** from the list of available color schemes.

If you do not like the included syntax highlighting scheme, you can always use the Dracula scheme which I used as a base. My modifications are minor, the overall color schemes harmonize well enough.

## Use git to install / update

Alternatively, you can always create the ```Theme - Transylvania``` folder in your packages root and then clone the theme with git into that folder. Makes updating a bit easier.

## Bugs, issues, wishes

The theme's home on the web is [on GitHub](https://github.com/silvercircle/ST_Transylvania) and its issue tracker should be used for all inquiries.

{% include disqus_fragment.html %}