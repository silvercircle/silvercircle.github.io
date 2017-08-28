---
author: AlexVie
title: Build a GitHub page locally with Jekyll
date: 2017-08-28 10:02:37+0200
modified: 2017-08-28 10:02:42+0200
layout: default
categories: [Jekyll,site]
blog: true
excerpt: >
  How to build your site locally with your own Jekyll installation and deploy it on github using different branches.
---

# Build your github Jekyll page locally
{% include post_header.html %}
Github supports Jekyll as site generator and in most cases, this is good enough. Some more advanced pages may require additional Jekyll plugins that are not available on Github. In that case, the site must be built with a local Jekyll installation and pushed to the GitHub repository.

A personal homepage can only be served from content in the master branch, therefore the master branch must contain the output of Jekyll's built command which normally goes to `_site`. Everything else is considered source code and has no business in the master branch. The separation into branches is necessary, because some files will exist twice but with different contents. The `index.html` in the source root is very likely different from the `index.html` in the compiled site.

We can leave intact the default directory structure with `_site` as our build target and do the following:

* create the project.
* `git init`
* create a `.nojekyll` file in the root directory.
* create a `_site` folder and add it to `.gitignore` (in the root)
* in the root folder of your project, create a new branch. I called mine `source` but it's really up to you. The important thing is that `_site` should be part of your source branch and must be on master, otherwise github won't serve the page.
* `cd _site`
* `git init`
* `git remote add origin git@github.com:username/username.github.io.git`
* `git checkout -b master` (switch to master, this step should be optional)

Now, begin adding content to the root directory. Commit and push this to the `source` branch. Do a `jekyll build` to build your site, thereafter go to the `_site` directory, add, commit and push everything to master.

Go to your GitHub repository and verify that everything is correct:

* The `source` branch should contain all your source files, but no `_site` folder. 
* The `master` branch should contain the generated site and there shouldn't be a `_site` folder at all, because GitHub serves from the root directory, so everything that is in `_site` locally (on your computer where you build it) must be in the root directory on GitHub. That's why different branches are needed.

That should do it. You can now build your site locally and use every Jekyll plugin you want.

{% include disqus_fragment.html %}