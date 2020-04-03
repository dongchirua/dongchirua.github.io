---
layout: post
title: Dalat Ultra Trail (21K) Statistic
categories: [Explore]
tags: [pandas, matplotlib, seaborn, histogram]
fullview: true
comments: true
---
Last March, I attended an ultra trail in Dalat, Lam Dong, Vietnam. I felt good at my performance but wondering how good others did. I managed to crawl data and visualize DUT's data.

![]({{ site.url }}/_imgs/2019-06-27/DUT2019.png){:class="img-responsive"}

Generated above figure quite easy, check my notebook out at [`here`]({{ site.url }}/_notebooks/DUT 2019 - 21KM.ipynb) or below snippet

{% highlight python %}
import matplotlib.pyplot as plt
plt.style.use('seaborn-deep')
plt.hist(male.time, bins, alpha=0.5, label='male')
plt.hist(female.time, bins, alpha=0.5, label='female')
plt.legend(loc='upper right')
plt.xlabel('duration (minutes)')
plt.ylabel('#participants')
plt.title('Dalat Ultra Trail 2019 - 21K')
plt.axvline(x=365, color='r', ls='--')
plt.show()
{% endhighlight %}