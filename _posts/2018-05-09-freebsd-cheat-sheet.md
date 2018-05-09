---
author: Alex Vie
title: FreeBSD Cheat Sheet
layout: default_dyn
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
    This is a personal collection of items I took note of for later reference. It's by no
    means complete and probably totally useless for anyone except myself.
    <br><br> 
    May not be useful at all
image:
    source: freebsd
    width: 130px
    align: right
media:
    logo:
        name: freebsd-logo-small.png
        path: logos/
---

# FreeBSD Cheat Sheet
{% include defs.md %}
{% include post_header.html %}

{% include gfx/FD.html align="right" image=page.media.logo width="200px" nolink="1" borderclass="borderless" %}
This is a personal collection of items I took note of for later reference. It's by no
means complete and probably totally useless for anyone except myself.
{:dc}
Anyway, most of these tips were collected on the net 
## Fetch source code archive for running version
```sh
fetch -o ~ ftp://ftp.freebsd.org/pub/`uname -s`/releases/`uname -m`/`uname -r | cut -d'-' -f1,2`/relsrc.txz
```
This will download a complete source archive and save it as `relsrc.tgz` in your
$HOME. Un-tar this to / to get a fully populated `/usr/src`.
<br>
<br>
## Install papirus icons (there is no pkg or port yet)
```sh
wget -qO- https://raw.githubusercontent.com/PapirusDevelopmentTeam/papirus-icon-theme/master/install.sh | DESTDIR="/usr/local/share/icons" sh
```

## Mount VMware share:

VMWare shared folders are supported via the `fuse` filesystem, particularly the `vmhgfs-fuse`
utility, which is part of the `open-vm-tools` port/package. The old method via the `vmhgfs`
kernel module (`mount -t vmhgfs ...`) is no longer supported.

```sh
   kldload fuse  (or load_fuse="YES" in /boot/loader.conf)
   /usr/local/bin/vmhgfs-fuse .host:/NET_DATA/mnt/darkstar -o allow_other
   
   Warning: the share (NET_DATA in this example) name is CASE SENSITIVE and must 
   match the name as defined in VMware
```
<br>
## Upgrading strategy

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
Then reboot, rebuild your custom kernel (if needed) and install it to
`/boot/YOURKERNEL`. Reboot again, done. The output of freebsd-update fetch will tell,
whether kernel source under `/usr/src/sys` was changed.

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
