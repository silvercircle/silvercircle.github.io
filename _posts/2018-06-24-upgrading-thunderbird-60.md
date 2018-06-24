---
author: Alex Vie
title: Upgrading to Thunderbird 60
date: 2018-06-24T17:00:30+0200
modified: 2018-06-24T17:00:36+0200
layout: no_sidebar
menucontext: blog
share: 1
disqus: 1
reduced: big
tag: [first]
category: [Site]
backlink: /blog
excerpt: >
    Thunderbird has been my e-mail client of choice for many years on various operating
    systems and has been doing well so far. 
    <br><br>
    The next major version (60) is just lurking around the corner and will bring quite a
    number of new things, particularly under the hood. 
image:
    source: tb_screenshot
    width: 20%
    align: right
    link: 1
media:
    tb60:
        name: tb60_customized.png
        desc: "Thunderbird 60 screenshot"
        link: 1
    tb60_default:
        name: tb60_default_theme.png
        desc: "Thunderbird 60 default without any customisation"
        link: 1
---

# Upgrading to Thunderbird version 60
{% include defs.md %}
{% include post_header.html %}

Mozilla Thunderbird has been my e-mail client and PIM of choice for many years on various operating
systems, including Windows, Linux and FreeBSD. It has been a reliable piece of software, generally
doing what it's supposed to do and causing little problems. Once, many years ago, Thunderbird was a
first class citizen for the *Mozilla Foundation* and got the same amount of attention as the
Foundation's flagship product, Firefox. In recent years however, the development pace has slowed
down considerably due to lack of manpower and maybe lack of direction, resulting in a piece of
software that only got minor refinements instead of major new features and overhauls. Since
Thunderbird has always been fairly feature-rich, this is not really a problem. Apart from maybe MS
Outlook, it can still be considered the most flexible and feature-complete e-mail client for desktop
operating systems.
{:dc}
{:cols}

## Extension woes

Like its big brother, the web browser Firefox with which it shares a large part of its code base,
Thunderbird supports extensions, a feature that allows the user to tailor the application to one's
personal needs by adding new features or changing existing ones. At the same time, the ability to
use extensions has been the source for many issues and frustration in the history of Firefox and
Thunderbird. With every major upgrade, extension compatibility became a problem, because the
extension API was never stable across major versions. As a result, extensions needed to be
maintained and updated for new major releases, often sacrificing backwards compatibility, while
unmaintained extensions frequently stopped working with a new Thunderbird release.
{:dc}
{:cols}

## Version 60 new things

Version 60 will be the next major release with long term support, which means it will be the direct
successor of version 52, the current one which was released over a year ago. The versions 53-59 were
basically development versions not meant to be used by end users. AS of writing this article, the
8th (and presumably last) beta version of Thunderbird 60 is the most recent one and from what I've
heard, the final will be out soon, likely unchanged from this beta.
{:dc}
{:cols}

{% include gfx/FD.html image=I.tb_screenshot align="right" width="45%" borderclass="borderless" %}
{% include gfx/FD.html image=page.media.tb60 align="left" width="45%" borderclass="borderless" %}

<div class="clear"><br></div>
<div class="two_cols" markdown="1">
The screenshots above show Thunderbird 60 (left) and the older version
52 (right) side-by-side. Both are [using the same `userChrome.css` modifications]({{site.baseurl}}{%
link _software/user-chrome-thunderbird.md %}) with the default theme. As you can see, the
differences are marginal at best, the major new thing is the new icon set that provides a better
contrast and a slightly modified theme that blends well with the trend of minimalist and *flat*
operating system themes.
{:dc}

The following screen shot below shows Thunderbird 60 without any UI customization at all. The new
theme, taken from Firefox *„Quantum”* with square tabs and completely flat tool bars is clearly
visible and gone are the curved tabs that were introduced with the Australis UI redesign a couple of
years ago. 
</div>

{% include gfx/BD.html image=page.media.tb60_default borderclass="borderless" %}

## Extension compatibility

<div class="two_cols" markdown="1">
Like Firefox Quantum, Thunderbird supports the new [web
extensions](https://developer.mozilla.org/en-US/Add-ons/WebExtensions) API. This basically means
that all old (so-called *legacy extensions*) extensions that were written for the old API would stop
working in Thunderbird 60 with a complete rewrite of the extension as the only solution to the
problem. Since the Thunderbird extension ecosystem suffers from very little active development and
therefore contains many unmaintained projects, this compatibility problem could have a potentially
catastrophic impact on Thunderbird, because many users would probably stop using TB should essential
add-ons no longer be available.
{:dc}

Fortunately, there is a solution to the problem. Thunderbird 60 supports old extensions, but this
feature must be enabled. So the first thing after upgrading you should do is to open the
configuration editor and change the following setting to **false**.

```
    extensions.strictCompatibility
```

You can find the configuration editor on the **Advanced** page of the options dialog. Click on the
**Config editor** button and use the search box in the dialog to find the setting. After changing
the setting, Thunderbird must be restarted. With that setting active, most extensions that were
compatible with Thunderbird 52 should work with version 60. A few (one example would be the Google
Calendar connector) still require an update.

I'am not an extension nut, so the number of add-ons I use is fairly limited, but here is the list of
my extensions and all of them are, in fact, working on TB 60.

* Dorando keyconfig
* Provider for Google Calendar (required an update)
* Quick Filter Watched Threads (simply adds a toolbar button on the filter bar)
* Signature switch
* Smart Template4

Like mentioned above, only the Calendar Provider needed some attention to obtain and install the
manual update which has not yet been released. I assume, this extension update will be available when
Thunderbird 60 reaches final release status, which should be by the end of June.

</div>

## Other observations

<div class="two_cols" markdown="1">
First, before updating **backup your profile**. This is mandatory, because backwards compatibility
is not always guaranteed. Essentially this means, there is a possibility that after upgrading to
Thunderbird 60 your profile might become incompatible with older versions, so you would not be able
to go back to TB 52, should the upgrade cause too many issues for you. Best practice is to follow
[this guide](https://support.mozilla.org/en-US/kb/profiles-where-thunderbird-stores-user-data) which
explains how to find and backup your Thunderbird profile.
{:dc}

With my relatively short list of extensions (see above), I did not run into troubles at all. The
upgrade went smooth, with one exception: I had to obtain a beta version of the [Google Calendar
Provider](https://addons.mozilla.org/en-US/thunderbird/addon/provider-for-google-calendar/) to make
Lightning work again with my Google Calendar. If you have troubles finding it, [here is a
link](http://ftp.mozilla.org/pub/calendar/lightning/candidates/6.2b6-candidates/build1/win32/gdata-provider-4.1b6.en-US.win32.xpi)
to the XPI.
</div>

## Noteworthy improvements

<div class="two_cols" markdown="1">
* When composing a message, it's now easy to toggle the attachment bar by using the ```Alt-M``` keyboard
  shortcut at any time. 

* It is now possible to compact IMAP folders while the account is connected.

* Existing accounts / folders can be converted from MBOX to Maildir format (and presumably vice
  versa even though that does not make much sense). The Maildir format stores messages in one file
  per message and is more robust than MBOX which stores all messages in a single large file. Be
  warned though, the conversion from MBOX to Maildir can take a lot of time and my Thunderbird was
  consuming insane amounts of memory (up to 2.5gig) while doing the conversion of my INBOX.

* The Calendar add-on (Lightning) was improved considerably with new features to handle invitations
  and notifications for collaborative events better.
  
* A dark theme is available.

* The EFAIL problem, what affected practically all ways to send encrypted mail, has been fixed
  completely
  
On top of this, many smaller issues have been fixed. Overall, TB 60 also feels faster, more
responsive and seemingly uses less memory than TB 52. It also appears to be stable, none of the 3
beta versions I've been testing over the last couple of weeks, crashed even once.
</div>

## So, is an upgrade advisable?

I would say, yes, absolutely. The EFAIL fix alone is worth the upgrade, particularly for users who
do need encryption or digital signatures. The extension apocalypse can be mitigated by using the
method described above, so most extensions should continue to work. Overall, the few improvements
and new features might appear meager, but they do add some value to Thunderbird. A modernized and
arguably more attractive user interface is something that is always welcome among users
{:dc}
{:cols}
