---
title: tabSRMM 0.9.9.100 available
date: 2006-03-05T15:00:48+00:00
modified: 2006-03-05T15:00:48+00:00
author: Admin
layout: topics_dyn
tag: first
collection: tabsrmm
excerpt: >
  I'am releasing a new "general" version of tabSRMM, that is, an extra release, basically for all people who don't use nightlys.
---
{% include content/tabsrmm_warning.md %}

## The noteworthy changes, compared to the last version, are:

  * a few small and one serious (possible crash/hangup) bug have been fixed.
<li style="text-align: justify;">
  It now supports a basic method of skinning the container interior. A sample skin is included in the download archive. Please refer to "this":http://miranda.or.at/tabsrmm-articles/39/ article for more information on the skinning system, limitations and format. You also need to install a %{color:blue}imgdecoder.dll% when you want to use .png images for skinning. You can find a link on the download page here. Skins are unrelated to themes (.tabsrmm files) - a theme changes the look of the message history log, while a skin changes the look of certain user interface elements.
</li>
<li style="text-align: justify;">
  A few UI improvements have been made - it is now easier to set the splitter in global mode, the toobar buttons can use both flat or normal mode and the message window can show xStatus icons if you want (refer to the "CHANGELOG":http://miranda.or.at/tabSRMM/tabsrmm-changelog/ for more info).
</li>
<li style="text-align: justify;">
  Some small changes have been made "under the hood" and tabSRMM can now send nuges by hitting the _CTRL-n_ key OR selecting the %{color:blue}Send nudge% entry from the send menu (the menu, attached to the drop down button just right of the send button).
</li>

<p style="text-align: justify;">
  The files are also available from here, as the official File Listing is currently down and no ETA was given for its re-appearing.
</p>

### Notes for installation

<p style="text-align: justify;">
  Both the ANSI and UNICODE version should work with the current stable Miranda build (0.4.0.3) as well as with nightlys. If you want to use the UNICODE version on Miranda-stable, you *MAY* need a new database plugin (tabSRMM will tell you this at startup, saying that it needs a database plugin 0.5.1.x or later). If you get this message at startup, use the included %{color:blue}dbx_3x.dll% and copy this file to your \plugins directory.
</p>

As always, you also need a **tabsrmm_icons.dll** copied to your plugins folder.

To see avatars, you also need the **loadavatars** plugin.
