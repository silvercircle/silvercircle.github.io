---
title: 'Nightly #51 and tabSRMM'
date: 2006-04-25T04:44:52+00:00
modified: 2006-04-25T04:44:52+00:00
author: Admin
layout: topics
tag: first
excerpt: >
  Unfortunately, the tabSRMM coming with that build has a few problems. It was mistakenly built from outdated sources older than 2 weeks and we are still investigating why it happend (either, my last CVS commit came too late or we have another CVS issue - it wouldn't be the first one, SF.net CVS had quite a few problems lately).
---
{% include content/tabsrmm_warning.md %}

# Miranda Nightly #51 and problems
Yesterday, "Nightly build #51 was released - http://www.miranda-im.org/2006/04/23/miranda-im-v0430-build-51/

<p style="text-align: justify;">
  Unfortunately, the tabSRMM coming with that build has a few problems. It was mistakenly built from outdated sources older than 2 weeks and we are still investigating why it happend (either, my last CVS commit came too late or we have another CVS issue - it wouldn't be the first one, SF.net CVS had quite a few problems lately).
</p>

<p style="text-align: justify;">
  Anyway, this build basically works, but you should expect some troubles with the following things:
</p>

<li style="text-align: justify;">
  smileyadd / ieview (ieview itself works, but smileyadd may not, or the smiley button will do nothing).
</li>

  * minor bugs like a few menu items not working, maybe a few broken keyboard shortcuts.

<p style="text-align: justify;">
  All these things are the result of using the outdated sources, so the issues are actually fixed and working, but the built which was released with Nightly #51 is somewhat broken.
</p>