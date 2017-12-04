---
layout: post
title: Brief Configs of Zsh on MacOS
categories: [Setup]
tags: [zsh, MacOS]
fullview: true
comments: false
---

MacOS, as well as Linux, has its own default shell but [`Zsh`](http://www.zsh.org/) is an awesome alternative because of its capability to customize following my preference. This note was planned to share steps of installation and my selected configurations, in addition to, I will introduce some tools that I have been using to have on my machine recently. The prerequisite of this blog is [`brew`](https://brew.sh/), like `apt-get` on Ubuntu, to install some packages without lifting fingers.

This [`article`](https://gist.github.com/derhuerst/12a1558a4b408b3b2b6e) was well written, easy to install for MacOS.
Next step is to install [`auto-suggestion`](https://github.com/zsh-users/zsh-autosuggestions) which its name tells a fact, supporting to type a command super fast by reminding usage history.

<a href="https://asciinema.org/a/37390" target="_blank"><img src="https://asciinema.org/a/37390.png" width="400" /></a>

I need something is fancy enough that I can easily recognize commands and associated parameters, [`syntax-highlight`](https://github.com/zsh-users/zsh-syntax-highlighting) fits my need. Again, brew helps me a lot `brew install zsh-syntax-highlighting`.

Another cool plugin is [`zsh-autosuggestions`](https://github.com/zsh-users/zsh-completions) but using `brew`, it seems that I don't need to bother, explore [`here`](https://unix.stackexchange.com/questions/126785/zsh-completion-of-brew-formulas)

[`oh-my-zsh`](http://ohmyz.sh/) is the last addon that I manage to post here. Using this plugin, we have a good way to colorize your terminal through a bunch of [themes](https://github.com/robbyrussell/oh-my-zsh/wiki/Themes) and a relatively big community. For instance, my favorite shell was captured below
<img src="https://cloud.githubusercontent.com/assets/2618447/6316718/51a2fd9a-ba00-11e4-845a-24bed6ae9210.png">

Zsh isn't applied unless I invoke it hence the last step is to change default shell. This part in MacOS is [`tricky`]((https://stackoverflow.com/questions/31034870/making-zsh-default-shell-in-macosx) because it requires detecting the location of Zsh shell then register it to `/etc/shells`. My command was
{% highlight bash %}
sudo echo "$(which zsh)" >> /etc/shells && chsh -s $(which zsh)
{% endhighlight %}

Last but not least, I highly recommend to use [`autoenv`](https://github.com/kennethreitz/autoenv) since I want to get rid of tedious procedures to change projects' environmental variable frequently. Furthermore, [`iterm2`](https://www.iterm2.com/) gives a more flexible way to adjust theme and open tabs, split windows expeditiously.

Here is my example configs of `oh-my-zsh`, {% gist dongchirua/ca0210b5e954bb2c49831939397e2b47 %}