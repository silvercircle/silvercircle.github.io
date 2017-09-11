---
title: Source code questions
date: 2006-03-25T04:32:31+00:00
modified: 2006-03-25T04:32:31+00:00
author: Admin
layout: topics
menucontext: topics
tag: first
excerpt: >
  Recently, I've got a few questions about tabSRMMs source code, why there are 2 different repositories and similar things
---
{% include content/tabsrmm_warning.md %}

# Source code questions

<p style="text-align: justify; padding-left: 30px;">
  <strong><span style="color: #808080;">Recently, I've got a few questions about tabSRMMs source code, why there are 2 different repositories and similar things.</span></strong>
</p>

### So, a few things to explain

<p style="text-align: justify;">
  Yes, there are 2 repositories. I consider "SVN":https://svn.berlios.de/svnroot/repos/mimplugins/trunk/tabsrmm/ as the *master* repository - that's the most recent code base and I commit at least once a day. SVN code *might* be in bad shape every once in a while - it should compile, but it may contain completely non-working or unfinished features, serious bugs or other evil things :)
</p>

<p style="text-align: justify;">
  CVS is updated less often and I only sync it when the plugin is in a more or less stable state. The reason is that the CVS copy of tabSRMM is in Mirandas main repository and will be available in nightly builds whenever one gets released. Obviously, I don't want these builds to be in a unusable state and that's why CVS is updated less often.
</p>

<p style="text-align: justify;">
  At the moment, big changes are comitted to the SVN repository almost every day, because of the chat integration. The CVS will stay untouched until these things start to stabilize, so that a new Miranda nightly may contain an older (but more stable) tabSRMM.
</p>

<p style="text-align: justify;">
  Also, the SVN repository only contains up-to-date project files for Visual Studio +2005+ - all others are no longer maintained.
</p>