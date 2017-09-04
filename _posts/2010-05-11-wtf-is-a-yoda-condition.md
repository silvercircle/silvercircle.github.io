---
title: WTF is a Yoda condition?
date: 2010-05-11T07:18:08+00:00
modified: 2010-05-11T07:18:08+00:00
author: AlexVie
layout: default
categories: [Development,Fun]
menucontext: blog
excerpt: >
  What is a "Yoda condition" and do I really need it? In short, it is a reverse notation of certain conditional statements in C/C++.
---
# In short words...
{% include post_header.html %}
 It's a jargon term for writing an if condition in a programming language using bad looking grammar while keeping it syntactically correct. Pretty much the same thing that [Yoda](https://en.wikipedia.org/wiki/Yoda) does when he speaks :) He screws up grammar, but his statements are still making sense and can be understood by most people familiar with the language he uses.

### **So, instead of writing**
```c
if ( foo == 0 )
```
### .. some C and C++ programmers insist on writing
```c
if ( 0 == foo )
```
While this may look wrong, it is perfectly fine - it will compile and produce correct code. Moreover, In C and C++ **using this syntax has a major advantage**: It will protect you from an infamous and very common typing error:
```c
if ( foo = 0 )
```
...still compiles fine but will, in almost every case, produce a major bug. While most modern C++ compilers will throw a warning when they see such a code fragment, some won't and happily accept that code (because it is syntactically correct - an assignment can be part of a condition).
```c
if ( 0 = foo )
```
 however, will **not** compile, because it is an invalid assignment. The compiler will throw an error and you'll have to correct the code.

It should be obvious that using this <em>Yoda notation</em> for conditions will only reliably work for simple conditions with variables and constants, but because it works and can help with avoiding a very common typing error, it is widely in use by C programmers.

### So, where does the term "Yoda condition" come from

The whole thing originated in a [poll on stack overflow](http://stackoverflow.com/questions/2349378/new-programming-jargon-you-coined) that asked visitors to submit their favorite jargon terms for typical scenarios in software development. The thread quickly developed into something that could very well become a completely new jargon for programmers. Now, that wouldn't be the first hacker or programmer jargon for sure, but according to the original thread, most of the terms should be fairly new, because people were asked to submit their own creations rather than already existing ones.

There are a number of nice submissions on that thread and being a C/C++ programmer myself, I particularly like the Yoda condition - in fact, I have been using it quite often and while knowing, that it looks a bit weird and some people absolutely hate to see it (especially those without a C or C++ background), it has developed into some sort of (maybe bad) habit.

The thread has a number of other cool terms and a guy from globalnerdy has [compiled a list of terms](http://www.globalnerdy.com/2010/05/09/new-programming-jargon/) from the original stack overflow thread.

{% include disqus_fragment.html %}