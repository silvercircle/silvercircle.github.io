---
author: Alex Vie
title: FreeBSD Cheat Sheet
layout: no_sidebar
date: 2018-05-09T02:02:30+0100
modified: 2018-05-09T02:02:36+0100
menucontext: blog
share: 1
disqus: 1
reduced: big
tag: [first,freebsd]
category: [Development]
backlink: /blog
excerpt: >
    This is a personal collection of items I took note of for later reference, after I
    recently picked up FreeBSD again.
    <br><br> 
    May not be useful at all for anyone except myself and is kept here for personal
    reference mainly. 
image:
    source: freebsd
    width: 130px
    align: right
media:
    logo:
        name: freebsd-logo-small.png
        path: logos/
    screen:
        name: freebsd.screen.png
        thumb: 1
        width: 320px
        align: right
        desc: Fresh installed and a bit customized.
        long: |
            FreeBSD 11.1-RELEASE, running inside a VMware Workstation VM. MATE desktop and
            some custom applications are running.
            <br>
            Note the low memory consumption via the sytem monitor in the panel (green bar
            shows memory load). This VM has just *512 MB* (yes, that's half a Gig)
            of RAM and 2 CPU cores. Pretty impressive.
---

# FreeBSD Cheat Sheet
{% include defs.md %}
{% include post_header.html %}

{% include gfx/FD.html align="right" image=page.media.screen borderclass="borderless" %}
I recently came back to FreeBSD after many years (the last version I used was 6.1 a decade
or so ago) and found a lot of things have changed, but it still feels very familiar and
somewhat „home”, even after so many years. Kudos to the devs for keeping the traditional
BSD-ish feeling alive and rocking. Installation (in a VMWare virtual machine to begin
with) went smooth and everything felt like I had left it only recently. Except that it now
has binary packages, similar to most Linux distributions, switched from GCC to clang[^clang] and
got the most impressive and powerful [filesystem](https://en.wikipedia.org/wiki/ZFS) ever
designed for an OS.
{:dc}
This is a personal collection of items I took note of for later reference. It's by no
means complete and probably totally useless for anyone except myself.

## Fetch source code archive for running version
Normally, the source code can be installed during system installation from the
installation media and `freebsd-update` will keep it up-to-date with patches. Source
installation is optional though and can be performed later. When doing so, it is important
to fetch the source code that matches the current *release*. The following command will do
this:
{:dc}
```sh
fetch -o ~ ftp://ftp.freebsd.org/pub/`uname -s`/releases/`uname -m`/`uname -r | 
    cut -d'-' -f1,2`/src.txz
```
This will download a complete source archive and save it as `src.tgz` in your
$HOME. Un-tar this to / to get a fully populated `/usr/src`.
<br>

## Install papirus icons (there is no pkg or port yet)

Papirus is a popular and modern - looking icon theme for desktop environments. It works
with GNOME, MATE, Xfce, KDE and others and contains an impressive number of icons for all
kind of purposes. Papirus icons come in different color variations so its sub-themes can
be used with either light or dark backgrounds. These icons looks particularly nice on flat
and minimalistic themes, like Arc or Deepin.
{:dc}
```sh
wget -qO-
https://raw.githubusercontent.com/PapirusDevelopmentTeam/papirus-icon-theme/master/install.sh
    | DESTDIR="/usr/local/share/icons" sh
```

## Mount VMware share:

VMWare shared folders are supported via the `fuse` filesystem, particularly the `vmhgfs-fuse`
utility, which is part of the `open-vm-tools` port/package. The old method via the `vmhgfs`
kernel module (`mount -t vmhgfs ...`) is no longer supported.
{:dc}
```sh
   kldload fuse  (or fuse_load="YES" in /boot/loader.conf)
   /usr/local/bin/vmhgfs-fuse .host:/NET_DATA/mnt/darkstar -o allow_other
   
   Warning: the share (NET_DATA in this example) name is CASE SENSITIVE and must 
   match the name as defined in VMware
```

## Upgrading strategy

Upgrading FreeBSD has become surprisingly easy. The exhaustive `freebsd-update` script
will take care of most things, including minor (e.g. 11.1 -> 11.2) and major (e.g. 11.x ->
12.0) upgrades. It will also keep the security patch level (that's the -pX part behind the
version number) current within a given release.
{:dc}

The script does have some caveats when you need (or just want) to run a custom
kernel. Normally, `make installkernel` installs a custom built kernel in `/boot/kernel`,
which is the default location. The old kernel will be backed up to `/boot/kernel.old`.

In order to identify the patch level of the running system, freebsd-update needs a GENERIC
kernel in `/boot/kernel`. This is the kernel that ships with binary releases and which can
be built by doing a `make buildkernel KERNCONF=GENERIC`. It's configuration is 
`/usr/src/sys/<arch>/conf/GENERIC`.

I've found the following strategy works well enough with a custom kernel. It totally
ignores the default directories in `/boot` so freebsd-update can do its work and will never
ever see the custom kernel.

* Leave the GENERIC kernel in `/boot/kernel` alone. The freebsd-update script easily gets
  confused with a custom kernel in default location(s) 
  
* If you really need a custom kernel, install it in `/boot/MYKERNEL` or any directory of
  your choice (e.g. /boot/kernel.$HOSTNAME) and tell the boot loader to load it as default kernel:

* modify /boot/loader.conf:
```sh
   # kernel options
   kernels="kernel kernel.old kernel.NEXUS"
   kernel="kernel.NEXUS"
   
   # other options...
   fuse_load="YES"
   vmxnet ="YES"
   [...]
```

* This instructs the loader to load `kernel.NEXUS` from `/boot/kernel.NEXUS` by default.
* Make sure `/boot/loader.rc` contains the following 2 lines:

```sh
   include /boot/loader.4th
   start
```
Otherwise, `/boot/loader.conf` will not be used.
```sh
   freebsd-update fetch
   freebsd-update install
```

The output of freebsd-update will tell you whether the kernel needs to be recompiled. If
patches were applied to `/usr/src/sys` then you should rebuild your custom kernel.

Additionally, the daily 3:00am housekeeping cron job will check whether kernel and
userland are in sync.

## Install kernel to custom directory
```sh
   make buildkernel   KERNCONF=NEXUS INSTKERNNAME=kernel.NEXUS
   make installkernel KERNCONF=NEXUS INSTKERNNAME=kernel.NEXUS
```
Builds and installs a custom kernel to `/boot/kernel.NEXUS` - the *INSTKERNNAME* is an
undocumented make option. This is preferable and simplifies updating. Just keep the GENERIC kernel
in `/boot/kernel` and adjust `/boot/loader.conf` accordingly (see above) to boot the custom kernel from
its own directory. If anything goes wrong, a GENERIC kernel will always be available as
backup.

## Check the identity of the running kernel

The following command can be used to check the IDENT string of the running kernel. This is
the same string that appears in the kernel configuration file and is set to GENERIC by
default. A custom kernel should have its own identity string to distinguish it from the
generic kernel that ships with the OS.
{:dc}
```sh
    sysctl kern.conftxt | grep ident
```

[^clang]: This is something you won't even notice unless you know it. Clang behaves
    almost exactly like GCC, mimics its options and even most of the error messages.
