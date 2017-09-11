---
title: Using flash in Miranda
date: 2006-02-27T05:40:35+00:00
modified: 2006-02-27T05:40:35+00:00
author: Admin
menucontext: topics
layout: topics
tag: first
excerpt: >
  This is not a really useful plugin. It is more like a small coding experiment which I created for testing various impacts of writing a MFC plugin for Miranda which can use ActiveX objects.
---
{% include content/tabsrmm_warning.md %}
# Embedding flash content in Miranda
<p style="text-align: justify;">
  Embedding flash movies in normal C or C++ applications is quite straightforward as long as you know how to use COM objects in your code. The flash player is such a control and can be embedded in any application which has been made ready to use COM objects.
</p>

<p style="text-align: justify;">
  In theory, it could be done in plain C/Win32, but it is much easier to do it with MFC or ATL. The additional C++/MFC overhead doesn't mean much as we are talking about embedding a rather big COM object anyway, so embedding the flash player will certainly increase the memory footprint of Miranda significantly. But, you know, everything has its price tag..
</p>

<p style="text-align: justify;">
  The example code doesn't do much. It creates a new frame on the contact list and will play a flash movie inside this frame. To run this plugin, you need a multiwindow-enabled contact list, like clist_mw, clist_modern or clist_nicer+ (that means, this plugin will *not* work on clist_classic).
</p>

<!--more-->

### Some limitations of this example code:

<p style="text-align: justify;">
  Don't use *HUGE* flash movies, because they will most likely slow down your miranda too much. I tested it with some smaller animations and it didn't affect performance too much. It may, however, cause a delay when loading miranda, because the plugin has to load the flash player control. This delay is worst when Windows has to load the flash object for the first time - it could really slow down Mirandas startup process by a couple of seconds, depending on the speed of your machine.
</p>

<p style="text-align: justify;">
  To solve this problem, multithreading will be useful, but this will make things more complex and since this is only an example and not a really useful plugin, I don't care about these limitations *at the moment*. I will think about a better solution for embedding a flash control when I can find a useful reason to do so (one might be the possibility to play flash avatars in the message window).
</p>