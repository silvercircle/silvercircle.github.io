---
title: The merge, part 1
date: 2006-03-17T19:25:45+00:00
modified: 2006-03-17T19:25:45+00:00
author: Admin
layout: topics
tag: first
excerpt: >
  A few days ago I posted the idea of creating a unified message window for all kind of chats - normal IM sessions and group chats like IRC channels. Now, a few days later, the first part is done and the resulting plugin is already working. Overall, I'am quite satisfied with the result - the UNICODE DLL is <strong>less than 500 K</strong> (dynamically linked) which is quite good, given the fact, that it also includes the almost complete skinning engine, including frame skinning.
---
{% include content/tabsrmm_warning.md %}

<p style="text-align: justify;">
  A few days ago I posted the idea of creating a unified message window for all kind of chats - normal IM sessions and group chats like IRC channels. Now, a few days later, the first part is done and the resulting plugin is already working. Overall, I'am quite satisfied with the result - the UNICODE DLL is <strong>less than 500 K</strong> (dynamically linked) which is quite good, given the fact, that it also includes the almost complete skinning engine, including frame skinning.
</p>

<p style="text-align: justify;">
  These 500 k still contain quite a lot of icon resources, because chat icons have not yet been outsourced to the icon pack DLL. My guess is, that a dynamically linked UNICODE build can be as small as 450k (that's quite <strong>some</strong> code saved compared to separated tabSRMM and CHAT plugins). I think, the size can be cut down even more, because there is still quite a lot of duplicated code, especially in the rich edit control and popup support.
</p>

<p style="text-align: justify;">
  The chat windows integrate nicely into tabSRMMs container system, although some features are not yet working (like notifications). Font + color configuration is already merged into one dialog box where you can setup all the fonts and colors needed by IM or group chat sessions. tabSRMM theme support is planned for group chat windows, of course.
</p>

### Long time goals...

<p style="text-align: justify;">
  In the long run, I plan to create a message window control which can accept and handle almost any kind of message event - no matter whether it came from a normal instant message session or from a group chat session. The message window control should be able to adopt itself - for example, showing or hiding the nick list and/or the info panel when needed, modifiying the layout of the toolbar "on the fly" to reflect the current state of the session and more. The unified user interface will make it more user friendly, and the merged configuration will eliminate quite a lot of stuff which currently needs to be customized separately for both plugins, making this a quite time consuming and unintuitive process, especially for new users who may find it hard to understand, why they have to configure so much chat-window related stuff twice. Finally, I should say that the idea of creating a unified chat window is not new. We've already discussed that more than a year ago and even some code was written back then, but it never got anywhere near to be useful.
</p>