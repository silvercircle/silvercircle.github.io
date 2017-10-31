---
title: Visualize the commit history of a project under version control
date: 2017-10-26T14:10:00+02:00
modified: 2017-10-26T14:10:00+02:00
author: AlexVie
excerpt: >
    Every now and then, you stumble over something cool. This time it is a piece of software to 
    visualize the history of source code repository.
layout: no_sidebar
tag: [first,GitHub,video]
collection: software
reduced: big
menucontext: topics
share: 1
disqus: 1
---

# Ideas matter
{% include post_header.html %}
{% include defs.md %}

Quite some years ago, I found an interesting piece of software in the now defunct google code 
community. While I do not know anything about the motivation behind this software, I kinda liked the 
idea. It shows creativity and inspiration. It's a pretty cool concept and something completely new 
(at least, it was back then when I first found it and I had never seen a similar piece of software 
before).
{:dc}

Now, several years later, it has found a [new home](http://gource.io) and has evolved quite a lot. 
It's still under active development and new versions are released on a regular base.

## What it does

It analyzes the version control history of a software project under the control of either SVN, Git 
or Mercurial version control systems and produces a visual representation of it. From the directory 
structure of a project, it creates a tree-like structure, presenting directories as branches and 
files as leaves. Activity in the project animates the tree - branches or leaves move when there is 
activity and disappear after they had been inactive for a while. Developers (people who commit 
changes to the project) can be seen moving along the branches of the tree, indicating which parts of 
the project they modified during a commit.
{:dc}

Various eye candy like bloom and glow effects are used to further enhance the animation and indicate 
activity in the project tree. The output can be controlled in many ways and you can choose the 
branch to display and specify a time range in form of start and end dates.
## Produce videos

By default, gource shows its animations in a desktop window (optionally, full screen) and cannot 
directly produce videos. The easiest way to get a video is probably by using a screen recording 
software of your choice. Because gource uses OpenGL for the display, **Fraps** works fine, but other 
screen recorders should also do the job. There are many parameters to control the output and since 
the tool is entirely command line driven (yes, it's made for nerds), reading the included 
documentation is a must.
{:dc}

Another method is to instruct gource to output a raw stream of images and pipe them into  `ffmpeg`, 
producing a video in the process.

```shell
gource -1280x720 -o - | ffmpeg -y -r 60 -f image2pipe -vcodec ppm -i - -vcodec libx264 -preset \
       ultrafast -pix_fmt yuv420p -crf 1 -threads 0 -bf 0 gource_out.mp4
```

While playing around with it, I've made a video, showing approximately one month of activity in the 
GitHub repository of this web page. The result is not as exciting as the demo videos on the 
project's home page, but since there are quite some options to choose from, it's probably just 
because I do not yet know how to take most advantage of all the parameters[^small].

{% include youtube.html id="v89Xbe4_wEk" %}

[^small]: and the fact that the project is relatively small and there is only one contributor
    (myself) working on it. More files, more contributors and more commits result in much more
    activity in the videos.
