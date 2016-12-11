---
layout: post
title: How to build a docker image having Nodejs, Ruby, Python on Ubuntu:16.04
categories: [Engineering]
tags: [note, tutorial, setup, Docker, Nodejs, Python, Ubuntu, Ruby]
fullview: true
comments: true
---
Beforehand, please install Docker on your machine. If you use `macOS`, I highly recommend using Docker for Mac[^native] version (my term is native version) instead of docker-machine because I'm using native version to demonstrate. In case you might wonder why, please read [here](https://www.quora.com/I-am-confused-by-Docker-Toolbox-and-Docker-for-Mac-what-exactly-the-difference-between-them).

**Step 1 - Preparing**

A Dockerfile which is a set of instructions to make an image. Dockerfile syntax[^syntax] isn't complicated so I put [mine](https://gist.github.com/dongchirua/657447d1d3174b653373f9aa55977483) to demonstrate and explain thorough comments.

I start with ubuntu 16:04
{% highlight dockerfile %}
FROM ubuntu:16.04
{% endhighlight %}

Installing my desire components like
{% highlight dockerfile %}
RUN apt-get update && \
    apt-get install -y --force-yes --no-install-recommends\
    apt-transport-https \
    ssh-client \
    build-essential \
    curl \
    ca-certificates \
    git \
    libicu-dev \
    'libicu[0-9][0-9].*' \
    lsb-release \
    python-all \
    rlwrap \
    apt-utils \
    build-essential \
    libssl-dev \
    curl \
    graphicsmagick --fix-missing \
    imagemagick --fix-missing \
    git \
    telnet
{% endhighlight %}

Making a default executable for my image with `CMD`[^whyCMD]
{% highlight dockerfile %}
CMD ["bash"]
{% endhighlight %}

**Step 2 - Run it**

What you need to do next is to change directory as same level as Dockerfile and run `docker build -t demo .` then you can check `docker images` to see your demo image is there.

***What I Learnt***

Finding instructions to build an image is usually annoying because some lines in Dockerfile may occur errors and a trial consumes time. To understand, suppose my Dockerfile had 3 lines, I observed an error had happened at last line. Obviously, I would have to fix, run and wait. As I mentioned, emotion is problematic hence I think about acceleration.

The fact is Docker caches preceding layers[^layer] so I do follow suggestions from [the best docker practices](https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices). But I want more than that so I have an idea which I will build on a correct images. It means I break Dockerfile into parts, for lines from beginning don't cause error will be a correct one, rest of lines are on working Dockerfile. These parts have been connected by `FROM my_image:previous_correct`

For instance, correct part is
{% highlight dockerfile %}
FROM ubuntu:16.04
RUN apt-get update && apt-get install -y
{% endhighlight %}
then I build and name it as based image `docker build -t mine:based .`. Next I just focus on working part like
{% highlight dockerfile %}
FROM mine:based
RUN apt-get install ... # line may get error
{% endhighlight %}
Eventually, everything is correct, I'm able to make a single final file.

Another thing, inside container of Ubuntu:16.04, you're not to use `sudo` at begining[^why], example `RUN apt-get update && apt-get install -y`

**References**

[^native]: [Docker Toolbox vs Docker for Mac](https://docs.docker.com/docker-for-mac/docker-toolbox/)
[^syntax]: [Dockerfile Syntax](https://docs.docker.com/engine/reference/builder/)
[^whyCMD]: [What is CMD](https://www.ctl.io/developers/blog/post/dockerfile-entrypoint-vs-cmd/)
[^layer]: [Each command such as `RUN`, Docker creates a layer and caches](http://stackoverflow.com/questions/31222377/what-are-docker-image-layers)
[^why]: [Explain why we don't need to use `sudo` inside container of Ubuntu:16.04](https://github.com/tianon/docker-brew-ubuntu-core/issues/48)
