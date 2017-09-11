---
title: Clist_nicer+ currently unstable in CVS
date: 2006-03-09T02:20:19+00:00
modified: 2006-03-09T02:20:19+00:00
author: Admin
layout: topics
menucontext: topics
tag: first
excerpt: >
  This is a small warning for all people who are using (or building) CVS builds of Miranda and/or components.
---
{% include content/tabsrmm_warning.md %}

# Warning for current clist_nicer

This is a small warning for all people who are using (or building) CVS builds of Miranda and/or components.

Today (March, 8, 2006) a big chunk of changes was commited for clist_nicer+ The changes were made to get a UNICODE safe genmenu system (configureable menus and all related stuff). 

It is planned to test these changes on clist\_nicer+ first, and, once they are stable enough, transfer them into the core part of the contact list so that all contact list plugins (including clist\_classic) will then get a configureable and unicode-safe menu system.

As of now, clist\_nicer+ is highly unstable (there are quite a few bugs to fix and some of them can \_\*cause serious crashes\*_ and/or may \_\*screw up your current menu configuration\*\_). So please don't use current CVS builds for a while and don't report bugs, because we know it is not stable :)
