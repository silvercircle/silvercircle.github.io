---
author: Alex Vie
title: About this page
layout: default
date: 2017-09-12T11:42:19+0200
modified: 2017-09-12T11:42:29+0200
menucontext: about
permalink: /help/docs/
---

# Site documentation
{% include post_header.html %}
{% include defs.md %}
The following is meant to be a cheat sheet for the site owner. It documents various template 
fragments (includes) and outlines conventions that are valid site-wide.

## Conventions

* all file names should be all-lowercase. This applies to template fragment in `_includes` as well 
as for all kind of embedable content (images, style sheets, scripts).
* The template includes for embedding images assume that all media resides below `assets/gfx`. File 
names must be relative to this location, file names, including sub-folders and extensions, should be 
all-lowercase.
* menu templates for entire menu systems are expected in `_includes/menus`. The `site_header` 
template expects the parameter as base name only, without the .HTML extension and the path prefix.
* menu templates for (optional) pull down menus must be in `_includes/menus/custom`. Other than 
that, all the rules listed for menu systems apply here. The custom menu name **must**{:ul} be passed 
to the site header template as `custom_menu` parameter, but may be an empty string in which case no 
optional menu will be rendered.

