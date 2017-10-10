---
title: tabSRMM merge, part 2
date: 2006-03-22T18:44:36+00:00
modified: 2006-03-22T18:44:36+00:00
author: Admin
layout: topics_dyn
menucontext: topics
tag: first
excerpt: >
  The progress is faster than I first expected it to be and many things are already working (it is basically already possible to use the merged plugin for all kind of chats within miranda) and a you can expect a first testing release within the next few days (maybe a week or so, max). This release will also contain a more or less finished version of the container skinning engine, including the ability to skin the window frame and title bar and a sample skin.
---
{% include content/tabsrmm_warning.md %}

# The merge, part 2

<p style="text-align: justify;">
  The progress is faster than I first expected it to be and many things are already working (it is basically already possible to use the merged plugin for all kind of chats within miranda) and a you can expect a first testing release within the next few days (maybe a week or so, max). This release will also contain a more or less finished version of the container skinning engine, including the ability to skin the window frame and title bar and a sample skin.
</p>

It is also pretty stable right now and doesn't crash (at least, it didn't so far for the last few days...)

### A few design decisions which have been already made:

<p style="text-align: justify;">
  <strong>No IEView support will be added to chat rooms</strong>. Simple as it is, that won't happen. There are many technical reasons, most importantly the fact that IEView is WAY too slow to handle busy IRC channels which can generate a few events *per second*. Joining such an IRC channel may crash and burn Miranda within a short period of time - the memory requirements by the embedded Internet explorer control are way too high and it is also way too slow - imagine what will happen in a very busy channel with a complex template like satin :) Miranda will eat 100% CPU and consume memory like insane.
</p>

<p style="text-align: justify;">
  Since this feature is dangerous and may even open potential security risks (it HAS the potential to be abused as a possible "Denial of Service" attack against Miranda users in IRC channels), it is not going to happen, not even as an option. This is not open for discussion, so please don't ask.
</p>

<p style="text-align: justify;">
  Sorry, if this disappoints you, but it really doesn't make sense. I know that it is *NOT* IEViews fault as the author of IEView has done a great job to make the plugin as efficient as possible, but the real problem is the slow HTML rendering engine of IE (it is even slower when building pages dynamically which is exactly what happens in IEView).
</p>

<p style="text-align: justify;">
  Of course, normal instant message sessions won't be affected. IEView support in tabSRMM will stay as it currently is and there are no plans to remove it in the future. So, don't panic :) The above decision will only affect chat rooms (IRC channels and such), but *not* IRC queries (they will continue to work as they currently do and use normal IM tabs).
</p>

<p style="text-align: justify;">
  <strong>Send on double enter+ is back</strong>. This is another positive side-effect of the merge - the code which handles sending a message will be unified so that the way how you configure sending a message will work in all tabs, so you can send on double enter in both chat rooms and normal IM sessions. It is also no longer needed to configure it for both plugins. That also affects the "Alt-S" hotkey for sending a message which will then also work for chat rooms.
</p>

<p style="text-align: justify;">
  <strong>The large send button is gone</strong> - sorry if you liked it. I don't as it is WAY too MSN-ish and looks weird with a bigger input area. Instead, a tabSRMM-style send button has been added to the toolbar.
</p>

<p style="text-align: justify;">
  <strong>Icon pack changes -</strong> I've made the decision to merge all the icons into a single icon pack. Some of the chat-specific icons have been merged with tabSRMM icons to give the button bar a consistent look and feel and to eliminate resource usage. This step will require changes in the icon pack format, unfortunately. This will further reduce the size of the tabSRMM DLL by about 50K and simplify icon pack customization (one icon pack for everything...). Of course, IcoLib support is available for all icons.
</p>

<p style="text-align: justify;">
  Icon pack customization is now also easier, because icons have been logically divided into groups and are no longer all mixed together within a single IcoLib section.
</p>

<p style="text-align: justify;">
  <strong>Theme changes -</strong> TabSRMM message log themes (.tabsrmm files) will also import and export the look of the group chat window, including all fonts and colors, and the look of the info panel fields (fonts, colors, background). All font configuration has been merged into a single dialog (but there are sections to make the now rather long font list easier to navigate).
</p>

A container skin can hold a reference to a .tabsrmm theme file so it is now really possible to change the look of the message container by just loading a skingle skin file.
