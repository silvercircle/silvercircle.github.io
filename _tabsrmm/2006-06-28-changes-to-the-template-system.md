---
title: Changes to the template system
date: 2006-06-28T17:00:18+00:00
modified: 2006-06-28T17:00:18+00:00
author: Admin
menucontext: topics
layout: topics
tag: first
excerpt: >
  This article describes the changes which have recently been made to the message log system in tabSRMM and which may be of interest for the users.
---
{% include content/tabsrmm_warning.md %}

# Template system changes
<p style="text-align: justify;">
  This article describes the changes which have recently been made to the message log system in tabSRMM and which may be of interest for the users.
</p>

<p style="text-align: justify;">
  These changes will be fully available with the next tabSRMM release (most likely, the next Miranda nightly build).
</p>

<p style="text-align: justify;">
  Note that, especially the auto-bidi mode, may require that you update your configuration. You definately should reset your RTL template set (see below) to make it compatible with the auto-bidi operation.
</p>

<p style="text-align: justify;">
  The template documentation has been updated aswell and the new version is now "available":http://miranda.or.at/tabsrmm-articles/tabsrmm-message-log-templates/
</p>

<!--more|inline-->

### 1. Automatic bidirectional mode

<p style="text-align: justify;">
  This is an important change. It allows to have both LTR (left to right) and RTL (right to left) messages together in the message log. There is no need to switch to a manual RTL mode anymore. Currently, this works only with MSN, because MSN is the only protocol which can transmit and receive the text direction information alogside each message.
</p>

<p style="text-align: justify;">
  tabSRMM allows to send and receive this information. When the text input area is in RTL mode (RTL users can switch with Ctrl + Right Shift or Ctrl + Left Shift between RTL and LTR editing) *and* the message contains at least 2 characters of a valid RTL language (hebrew for example), tabSRMM will tell the protocol to send it as RTL message (currently, MSN can do it). This happens automatic and you don't need to activate RTL mode or anything else - it just detects RTL by analyzing the outgoing message.
</p>

Messages containing both RTL and LTR character sequences should also work fine.

<p style="text-align: justify;">
  However, the auto-bidi option will have some impact on the visual appearance of the message log, because of some technical limitations in the rich edit control, in particularly:
</p>

<p style="padding-left: 30px;">
  <strong>auto-bidi support only works in the unicode build of tabSRMM.</strong>
</p>

<p style="padding-left: 30px;">
  <strong>currently, it does NOT work with IEView, because IEView has no support for mixed LTR/RTL messages. This might be added by its author at a later time, but I don't know.</strong>
</p>

<p style="padding-left: 30px;">
  <strong>When the message log is in auto-bidi mode (which happens when the first RTL message is received), some of the advanced formatting options are limited or not available. This is due to limitations in the rich edit control and cannot be solved. It includes things like horizontal grid lines and multiple background colors for incoming and outgoing messages (they work, but limited to new messages arriving in the log). Other options like text indent, icons, symbols should work as normal. Bug reports about these limiations or requests to change them will be ignored, because auto-bidi mode currently works in the best possible way.</strong>
</p>

<p style="text-align: justify;">
  Maybe some of the limitations can be solved by using IEView when it gets auto-bidi implemented (no idea, if it is planned though).
</p>

<p style="text-align: justify;">
  The old (manual) RTL mode is still supported though, but is now emulated with the automatic bidi mode. The ANSI version can still use manual mode.
</p>

### 2. Changes to the template system.

  * the default template sets have been changed, mainly to support auto-bidi mode which affects the RTL template set more than the LTR. If auto-bidi produces strange results, then most likely because you have custom templates loaded from a theme or skin.
  * the template editor has a new button: \*Reset all templates\* - this allows you to reset your current template set to the default (hardcoded) templates with a single click. Previously, you could only reset single templates.
  * When loading a theme (.tabsrmm file), tabSRMM will no longer automatically overwrite your templates without asking.
  * When loading a skin, it will, by default, not overwrite your fonts, colors and templates, even if the skin has a theme file integrated. You can set the options on the *Message window skin" option page.
  * Loading a skin at startup will never overwrite any message log related things - no fonts, colors, templates.

### The "Simple" template

<p style="text-align: justify;">
  This is a new feature in the template parser. There are 2 new variable modifiers available. The <strong><span style="color: #3366ff;">? </span></strong>modifier will skip the following variable, when the template set has been set to <strong>simple</strong> mode. The <strong><span style="color: #3366ff;">\</span></strong> modifier will skip it when the template set is <strong>not</strong> in simple mode. Switching between simple and normal template mode is avaialable from the message log menu (toolbar or menubar).
</p>

<p style="text-align: justify;">
  With these 2 new modifiers, you can easily define a template which allows you to switch between 2 modes quickly. The first mode could be full display, including nickname, timestamp and so on, while the *simple* mode could skip these things and provide a more simple layout.
</p>