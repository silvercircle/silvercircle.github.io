---
author: Alex Vie
title: Site documentation
layout: no_sidebar
reduced: big
sidebarcontent: sbar_default
date: 2017-09-12T11:42:19+0200
modified: 2017-09-12T11:42:29+0200
menucontext: about
permalink: /help/docs/
share: 1
disqus: 1
---

# Site documentation
{% include post_header.html %}
{% include defs.md %}
The following is meant to be a cheat sheet for the site owner. It documents various template 
fragments (includes) and outlines conventions that are valid site-wide.

## Browser compatibility

The theme should be compatible with all modern browsers that are not older than about 2 years, 
including Firefox, Opera, all Chromium-derived browser, Internet Explorer 11, Edge, Safari and 
basically all modern mobile browsers. It does use CSS3 features and things like hyphenation, sticky 
positions and advanced font rendering properties, but these are optional. The site does not depend 
on such features.

## Javascript usage.

Usage of Javascript is moderate and depends on jQuery (which is included). It's used for dynamically 
loading side bar content via Ajax requests and UX enhancements like tool tips and hidden spoiler 
content. It's also used for converting time stamps into relative ("ago") format and the fancybox 
image and gallery viewer.

## Conventions

* all file names should be all-lowercase. This applies to template fragment in `_includes` as well 
  as for all kind of embed able content (images, style sheets, scripts).

* The template includes for embedding images assume that all media resides below `assets/gfx`. File 
names must be relative to this location, file names, including sub-folders and extensions, should be 
all-lowercase. It is possible, though not recommended, to specify the prefix explicitly as a 
parameter for `gfx/BD.html` and `gfx/FD.html`.

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

Collection and category root folders must have a `sbar.html` document with front matter. This will 
define the dynamically retrieved (via ajax requests) side bar when using the modern layout without a 
static side bar. Consequently, it should list related documents in the same category / collection. 
The implementation simply includes `sidebar/dyn_cat_list.html` and `sidebar/dyn_topic_list.html` 
respectively, passing the category or topic name as parameter.

## Frontmatter variables for posts and articles

The following variables are supported 

* `first` - This is mandatory and must be **set as a TAG** for all posts and pages that should 
appear in listings and indexes. Basically, every page should have this tag unless it's either hidden 
or a followup page that should *not* appear in listings or indexes.

* `disqus` - Set to **1** if disqus should be embedded for the article/post.

* `share` - Set to **1** if a share bar should appear below the content.

* `menucontext` - which entry of the menu bar should be highlighted. Can be `home, about, contact, 
  blog, topics or got`. Defaults to 'blog'.

* `share_url` - will be used instead of `page.url` when present. Useful for followup pages when the 
  first page should be the target to share.

* `reduced` - if present, the content will be wrapped in a `DIV` element using the CSS classes 
  `reduced foo` where **foo** is the value of the variable in the front matter.  

  Example: `reduced: big` will result in the content being wrapped in a `<div class="reduced big">`. 
  The CSS definitions should be in `content.css`. It's useful to wrap the content in **DIVs** for 
  adding margins and padding to reduce the maximum text width for better readability.

* `wrapperclass` - CSS class(es) added to the `#content-wrapper` DIV element. Can be useful to set 
  custom backgrounds.

* `header` - Custom header block. Default is `headers/default.html`. The name must be given without 
  path and extension, so `header: foo` will include `headers/foo.html` as the header block. Note 
  that this is only the top header bar without the menu, but including the site title and contact 
  button bar.

* `modified` - **mandatory** time stamp of last modification. Can be the same as `date`. This is 
  always used to sort lists and indexes, so it's required. Always. Format *must* be ISO.

* `date` - date of first publishing. **Mandatory** for all content without the date specified in the 
file name, so basically for everything except blog posts. **Must** be in ISO format.

## Disqus thread identifier

This identifier is built from the author's name and the post's date (the `date:` variable, not the 
`modified:` time). For followup pages, it is therefore *important* to have the *exact same* author 
name and post date.

## Image handling

The main includes for embedding images are `gfx/FD.html` (for floating images aligned to the left or 
right) and `gfx/BD.html` for block images taking usually the full width. The includes accept the 
following parameters:
* `image`: A data element, either in `site.data` or in the page itself. The element is **required** 
  to have the following fields:

  * `name:` The name of the image, without path name but including its extension. Case sensitive on 
    some systems.
  
  * `path:` The path relative to the base, which is `assets/gfx` unless otherwise specified (see 
    below). Must end with a / character.
  
  * `desc:` A short description that will appear below the image and as ALT text.

  * `long:` **Optional** - when present, a info symbol will be overlaid over the image. Hovering it 
    will reveal a tool tip with the long description. This can be markdown text and will be fed 
    through the `markdownify` filter.

  * `url:` For linked images, the URL of the image. When present, `name` and `path` will be ignored.

  * `thumb:` For local images only (does not worked for linked images using `url`). When set to 1, a 
    thumbnail version of the image is **expected** to exist in the same folder, prefixed with 
    `thumb_`.

* `align` The alignment, either **left** or **right**. Only for `FD.html` (floating images).

* `width` The width of the image, including the unit. Example: "250px" or "50%".

* `prefix` The file system prefix when the default (assets/gfx) should not be used for whatever 
  reason.

* `nolink` Can be set to 1, if the embedded image should not link to the full size version. This 
  will disable the fancybox link, so the image won't be view-able in full size.

* `omitbottomcaption` Do not show the caption below the image. It will still be set as ALT text.
