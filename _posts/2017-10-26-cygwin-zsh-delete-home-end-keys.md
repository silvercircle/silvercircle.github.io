---
title: Cygwin and ZSH - Delete, Home and End keys
date: 2017-10-26T15:09:07+0200
modified: 2017-10-26T15:09:18+0200
author: AlexVie
layout: no_sidebar
reduced: big
tag: first
category: Development
share: 1
disqus: 1
menucontext: blog
backlink: /blog
excerpt: >
    Under certain configurations, the Home, End and Delete keys will insert arbitrary characters (in 
    most cases, the tilde symbol) when using the popular ZSH under Cygwin.
    <br>
    <br>
    This is caused by a wrong or missing keyboard configuration and easy to fix by adding a few 
    lines to the `.zshrc.`
---

# Cygwin and ZSH - Delete, Home and End keys
{% include post_header.html %}
{% include defs.md %}

Under certain configurations, the *Home*, *End* and *Delete* keys will insert arbitrary characters 
(in most cases, the tilde symbol) when using the popular ZSH under Cygwin. The issue is caused by a 
wrong or missing keyboard configuration and easy to fix by adding a few lines to the `.zshrc.`
{:dc}

```shell
# ctrl-left and ctrl-right
bindkey "\e[1;5D" backward-word
bindkey "\e[1;5C" forward-word

# ctrl-bs and ctrl-del
bindkey "\e[3;5~" kill-word
bindkey "\C-_"    backward-kill-word

# del, home and end
bindkey "\e[3~" delete-char
bindkey "\e[H"  beginning-of-line
bindkey "\e[F"  end-of-line

# alt-bs
bindkey "\e\d"  undo
```

The above section will add keyboard shortcuts for traversing through words as well as fix the 
`Home`and `End` keys. It will also fix the backspace and delete key behavior by adding properly 
configured sequences for deleting the next and previous words.

