---
title: Sound Volume updated somewhat
date: 2006-02-22T01:49:49+00:00
modified: 2006-02-22T01:49:49+00:00
menucontext: topics
author: Admin
layout: topics
tag: first
excerpt: >
  Recently, I discovered a new plugin for Miranda which made me want to revise a somewhat older and partially unmaintained plugin...
---
{% include content/tabsrmm_warning.md %}
<p style="text-align: justify;">
  Recently, I discovered a new plugin for Miranda which made me want to revise a somewhat older and partially unmaintained plugin. I'am talking about <strong><a href="http://www.miranda.kom.pl/dev/bankrut/index.php?id=63">mRadio</a>,</strong> a quite new plugin which can play mp3 and various other audio streams from the basically does the same as Winamp or ITunes, but uses a lot less resources, because it is not an entire application - only a small plugin loaded into Miranda.
</p>

<p style="text-align: justify;">
  The <strong>SndVol</strong> plugin is a well known extension for all multiwindow - enabled contact lists. In its basic form, it provides only 2 simple features:
</p>

  * Set the volume for event sounds (for example, the "incoming message sound"
  * Provide a button to mute and unmute the event sounds

<p style="text-align: justify;">
  While this is not much, the plugin does its job well. It creates a small frame on the contact list containing the mute button and a slider control for setting the volume. My changes are basically a few new features which allow <strong>SndVol</strong> to control the mRadio plugin. You can now quickly set the mRadio volume using the slider on the contact list and the mute feature does work with mRadio. And finally, I added an option to change the background color of the frame. That's all.
</p>