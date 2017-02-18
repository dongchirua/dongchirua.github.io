---
layout: post
title: Dockerize My Blog
categories: [Engineering]
tags: [Jekyll, Docker]
fullview: true
comments: true
---
I feel a little bitter 😱 to install `Jekyll` again after a long period. Indeed, I don’t remember either steps or dependencies for different environments. My memory leads me to dockerize because I use daily `Docker`, anyway 🤔.
Let me share mime.

{% gist dongchirua/1274482895bad4c5499ab8a0de7cb0bc %}

**Usage:**

1. Firstly, build images `docker build -t jekyll .` and name it `jekyll`
2. Run container `blog` from `jekyll`

  - `docker run -d -p 4000:4000 -v [path/to/blog]:/src:rw --name blog jekyll`
    - e.g `docker run -d -p 4000:4000 -v /Users/quy/dongchirua:/src:rw --name blog jekyll`

After running container, Jekyll won't bother me anymore 😋. Besides, every change will be synced automatically to the container, just refresh my browser at http://localhost:4000 (I use docker for Mac).
