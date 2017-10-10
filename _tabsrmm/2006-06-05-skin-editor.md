---
title: Skin editor
date: 2006-06-05T19:24:37+00:00
modified: 2006-06-05T19:24:37+00:00
author: Admin
menucontext: topics
layout: topics_dyn
tag: first
excerpt: >
  Today, I made the decision to outsource the skin editor for clist_nicer+ and make it an extra plugin.
---
{% include content/tabsrmm_warning.md %}

# Clist_nicer skin editor outsourcing
Today, I made the decision to outsource the skin editor for clist_nicer+ and make it an extra plugin.

That means, the old Background+ page will soon vanish from clist_nicer+ and a new dialog will be added to the customize section when the skin editor plugin is loaded.

The reasons are quite simple: Since clist_nicer+ and tabSRMM share roughly the same skinning engine (+ skin file format), the skin editor can later be used for both plugins. Also, as an extra plugin it can save memory and other resources for people who don't want to edit skins but only want to load existing ones.

It also means, that I'll probably improve the skin editor with some features for editing image items and give it a better, more user-friendly user interface than it currently has (that Background+ page is really ugly and overloaded with UI elements now and badly needs some improvements...)
