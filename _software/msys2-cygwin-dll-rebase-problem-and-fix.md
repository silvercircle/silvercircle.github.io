---
title: Fix DLL rebasing problems in Cygwin and MSYS2
author: AlexVie
date: 2017-10-18T01:33:37+0200
modified: 2017-10-18T01:33:53+0200
collection: software
layout: no_sidebar
reduced: big
menucontext: topics
tag: first
disqus: 1
share: 1
excerpt: >
    Sometimes, when launching new programs under Cygwin or MSYS2, you may encounter an error like 
    this:
    <br>
    <br>
    0 [main] zsh 8712 child_info_fork::abort: address space needed by 'datetime.dll' (0x3F0000) is 
    already occupied
    <br>
    <br>
    This means, a by default non-rebaseable DLL cannot be loaded into the address space it wants to 
    go.
---

# Fix the DLL (re)basing problem in Cygwin / MSYS2
{% include post_header.html %}
{% include defs.md %}

<div class="floatbox right" style="width:40%; margin-top:0;" markdown="1">
* can affect Cygwin and MSYS2
* is much more likely to occur in the 32bit versions
* can be fixed easily
</div>
DLL memory management problems are known issues that plague Cygwin and MSYS2 for quite a while and 
particularly affect the 32bit versions. The 64bit versions benefit from the much larger address 
space, so collisions are less likely to occur. It is therefore strongly recommended to use the 64bit 
versions of Cygwin or MSYS2 whenever possible. The requirements for the 64bit versions are not 
steep, it's basically just a 64bit Windows OS and slightly more RAM than the 32bit versions would 
use.
{:dc}

I ran into the problem when I recently installed MSYS2 on an old laptop which still runs 32bit 
Windows 7 and has only 4 GB of RAM, so using the 64bit version of MSYS2 was not an option. Upgrading 
the OS to a 64bit variant does not make a lot of sense nor would it bring benefits to that somewhat 
ancient hardware.

## The error message

```
0 [main] zsh 8712 child_info_fork::abort: address space needed by 'parameter.dll' (0x3F0000) is already occupied
/home/myusername/.zsh/tools/check_for_upgrade.sh:37: fork failed: resource temporarily unavailable
```
Obviously, the process names and address values can vary and it can occur with any process that 
tries to load a DLL, that is not re-baseable, into memory. The virtual address space it claims being 
already occupied by another process is the most (or only) common cause for the error.

## Easily fixable

Fortunately, the issue is easily fixable and only requires that the DLL in question must be marked 
as re-baseable, which can be done using the `peflags` and `rebase` commands. These should be part of 
every standard Cygwin / MSYS2 installation.
```shell
$ peflags -d1 /usr/lib/zsh/5.4.2/zsh/parameter.dll
$ rebase /usr/lib/zsh/5.4.2/zsh/parameter.dll
```
Note that in order to mark a DLL as re-baseable, it must not be in use, so for best results, you 
should do this using `/usr/bin/dash` (a minimalistic shell that does not depend on DLLs).
```
/usr/lib/zsh/5.4.2/zsh/parameter.dll: skipped because could not open
```
When using `peflags` or `rebase` on it is a good sign for a DLL being in use. To fix, terminate all 
running Cygwin/MSYS2 processes, start `/usr/bin/dash` (from windows desktop or command line) and try 
again.

The command `peflags` accepts wild cards and instead of `rebase` you can use `rebaseall -v` which 
will try to re-base every executable file that is marked as re-baseable.

