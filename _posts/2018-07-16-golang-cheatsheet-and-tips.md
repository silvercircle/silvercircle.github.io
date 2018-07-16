---
author: Alex Vie
title: Go cheat sheet and tips
date: 2018-07-15T22:00:30+0200
modified: 2018-07-15T22:00:30+0200
layout: no_sidebar
menucontext: blog
share: 1
disqus: 1
reduced: big
tag: [first]
category: [Site,Development]
backlink: /blog
excerpt: >
    A curated list of things I encountered when using the Go language. Most of this stuff is
    probably mentioned elsewhere, so this should be seen as some kind of personal reference. You may
    or may not find anything useful here.
    <br><br>
    This will be updated frequently or occasionally, depending on what I may find noteworthy.
---

# Golang cheat sheet and various tips
{% include defs.md %}
{% include post_header.html %}

## GCC-GO linker errors

Sometimes, when using Gcc-go instead of the default Go compiler, an error message like the following
may appear during the build command.

```
[...] $WORK/b001/_pkg1_.a(_x009.o): undefined reference to symbol 'pthread_mutexattr_settype@@GLIBC_2.1'
      /lib/libpthread.so.0: error adding symbols: DSO missing from command line
      collect2: error: ld returned 1 exit status
```

This indicates a missing LDFLAG, in our case, the instruction to link against `libpthread` is
missing from the linker command line. It's easy to fix, just pass the missing `-pthread` via
`-gccgoflags` to the build command. The -pthread option not only instructs the linker to link
against libpthreads, it also defines all macros that are needed to ensure re-entrant code is
produced during compilation.
```
[alex@warpcore:/home/alex/go/src/testgo]$> go-8 build -gccgoflags=-pthread dbtest.go
```

## Getting gocode and go-mode in Emacs to work

This is for Go version 1.10. First, install the mdempsky fork of gocode as the old gocode might be
incompatible with Go 1.10 due to changes in the binary package format.

* [https://github.com/mdempsky/gocode](https://github.com/mdempsky/gocode) - do a `go get
  github.com/mdempsky/gocode` to install.

The resulting binary will be in `$GOPATH/bin` (usually `~/go/bin` on *iX systems), so you can either
add this directory to your `$PATH` or copy **gocode** to `~/bin` or `/usr/bin` if you have permissions.

In Emacs, it's just a matter of installing `go-mode`. Assuming, you have a working MELPA setup,
simply do a `M-x package-install <RET> go-mode <RET>`. For auto-complete, I prefer `company-mode`, in
which case, the Go backend `company-go` is required. Install it like `go-mode` before. Go-mode itself
requires minimal configuration - if `gocode` is in your $PATH it will be found and used
automatically.

It's important to have `$GOPATH` set properly, otherwise *gocode* won't work at all. Also, *gocode* only
recognizes packages built and installed with the default go compiler. Personally, I use gccgo only
for release builds and usually install all packages with both compilers.
