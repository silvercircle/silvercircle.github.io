---
author: Alex Vie
title: Site documentation
layout: default_dyn
sidebarcontent: sbar_default
date: 2017-09-12T11:42:19+0200
modified: 2017-09-12T11:42:29+0200
menucontext: about
permalink: /help/docs
---

# Site documentation
{% include post_header.html %}
{% include defs.md %}
The following is meant to be a cheat sheet for the site owner. It documents various template 
fragments (includes) and outlines conventions that are valid site-wide.

## Conventions

* all file names should be all-lowercase. This applies to template fragment in `_includes` as well 
as for all kind of embed able content (images, style sheets, scripts).
* The template includes for embedding images assume that all media resides below `assets/gfx`. File 
names must be relative to this location, file names, including sub-folders and extensions, should be 
all-lowercase.
* menu templates for entire menu systems are expected in `_includes/menus`. The `site_header` 
template expects the parameter as base name only, without the .HTML extension and the path prefix.
* menu templates for (optional) pull down menus must be in `_includes/menus/custom`. Other than 
that, all the rules listed for menu systems apply here. The custom menu name **must**{:ul} be passed 
to the site header template as `custom_menu` parameter, but may be an empty string in which case no 
optional menu will be rendered.

## URL schemes

Most posts, articles and automated lists (tags, categories) use the `pretty` scheme with the 
document, category or tag name as a sub folder and the document itself using `index.html`. The 
exception of this rule are site documents like `/help/contact.html` for example.

The site is designed both protocol- and base path agnostic. The variable {{site.baseurl}} is always 
used, so it should be easy to transfer the entire site to a prefixed url (e.g. 
**http://mysite.foo/** to **http://mysite.foo/blog/**).

## Frontmatter variables for posts and articles

The following variables are supported 

* `first` - This is mandatory for all posts and pages that should appear in listings and indexes. 
  Basically, every page should set it to the value **1**, unless it should be excluded from indexes. 
  One example would be followup pages in long articles wit multiple pages.

* `disqus` - Set to **1** if disqus should be embedded for the article/post.

* `share` - Set to **1** if a share bar should appear below the content.

* `menucontext` - which entry of the menu bar should be highlighted. Can be `home, about, contact, 
  blog, topics or got`.

* `share_url` - will be used instead of `page.url` when present. Useful for followup pages when the 
  first page should be the target to share.
*
## Disqus thread identifier

This identifier is built from the author's name and the post's date (the `date:` variable, not the 
`modified:` time). For followup pages, it is therefore *important* to have the *exact same* author 
name and post date.

