---
layout: post
title: Hello World!
categories: [Setup]
tags: [Jekyll]
fullview: true
comments: false
---

***Quy's Notepad++*** is my playground. In here, I would like to share interested stuffs. This blog is underconstruction. I will update very soon.

My blog is hosted by **GitHub**, uses **dbyll** theme, you can find theme source in GitHub on
<a class="btn btn-default" href="https://github.com/dbtek/dbyll">Grab your copy now!</a>

---
*updated* 10/10/2015 3:34:51 PM
My page can use \\( \LaTeX  \\)

*updated* 10/11/2015 6:26:31 PM
My page can highlight code
{% highlight python %}
# Python
import pandas as pd
print "Hello, i'm a message"
{% endhighlight %}

{% highlight C++ %}
/* C/C++ */
#include <iostream>

namespace __hidden__ {
  struct print {
    bool space;
    print() : space(false) {}
    ~print() { std::cout << std::endl; }

    template <typename T>
    print &operator , (const T &t) {
      if (space) std::cout << ' ';
      else space = true;
      std::cout << t;
      return *this;
    }
  };
}

#define print __hidden__::print(),

int main() {
  int a = 1, b = 2;
  print "this is a test";
  print "the sum of", a, "and", b, "is", a + b;
  return 0;
}
{% endhighlight %}
