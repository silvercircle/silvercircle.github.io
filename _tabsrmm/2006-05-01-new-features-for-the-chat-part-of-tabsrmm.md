---
title: New features for the chat part of tabSRMM
date: 2006-05-01T04:06:23+00:00
modified: 2006-05-01T04:06:23+00:00
author: Admin
layout: topics
tag: first
excerpt: >
  This is a short list of new features which I plan or already have added to the group chat window implementation. Most of them are IRC specific and might not be so useful for other group chats, but then.. they don't hurt in any way.
---
{% include content/tabsrmm_warning.md %}

# New features in the group chat part of TabSRMM

This is a short list of new features which I plan or already have added to the group chat window implementation. Most of them are IRC specific and might not be so useful for other group chats, but then.. they don't hurt in any way.

* Classic IRC style nick marking. Symbols like @, % or + in front of the nickname. These symbols will appear both in the nick list and chat log instead of the status icon we currently have.

* Clickable nicknames in the chat log (single click will open the user details dialog, double click will open a query window). When nicknames are clickable, they will appear with the hyperlink color - this is something which cannot be changed, as the rich edit control does not allow to change the colors for hyperlinks (they are defined in the system color scheme).

<div style="margin-left:10px;margin-right:10px;background-color:#f5eeee;border:1px solid #a0a0a0;padding:4px;">
  *Note:* This feature (clickable nicknames) will be reconsidered, because it can slow down the chat history - seems that the rich edit control doesn't like to have many hyperlinks in a single document. So, currently it is unsure whether this feature will make it or will be deleted again.
</div>

\* Colorized nicknames for the nick list AND the chat log (colors can be configured for 5 different user modes - op, halfop, voice and 2 special modes which are used on some IRC networks with different meaning - the ! and \* user modes. Note that colorized nicknames and clickable nicks cannot work together (well, they can, but a clickable nickname will always appear with the color of a hyperlink).

* text symbols instead of icons in the chat log. This should be known from tabSRMM using the Webdings font for showing symbols. This method is much faster and uses less memory and other resources than putting an icon in front of each event. Might be interesting for high traffic channels and/or when your chat logs grow a lot.

* icon downsizing for the chat log. It is now possible to use 16 x 16 event icons instead of the small 10x10 icons. This will improve the look of the icons on the contact list, the system tray and the message window caption bar.