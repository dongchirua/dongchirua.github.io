---
layout: post
title: Incremental Average
categories: [Algorithm, Maths]
tags: [Average, TimeSeries, Efficient]
fullview: true
comments: true
---
Recently, I have played with time-series in a real-time production. In my case, every single time, there are new data points appended makes my series longer. Gradually, its length will exceed computer memory which leads an obstacle to any computing using the entire array as an input. I found an alternative way at [`wiki`](https://en.wikipedia.org/wiki/Algorithms_for_calculating_variance) and [`stackexchange`](https://math.stackexchange.com/questions/106700/incremental-averageing), below I show a note to elaborate.

Say, I managed to compute

$$  \hat{x}_n = \frac{x_1 + \dots + x_{n}} {n}  $$ 

Obviously, $$ \hat{x} $$ does need values that start from beginning to current time-point. It's worth in following an incremental manner in which result is updated repeatedly. For that reason, let me change above formula slightly.

$$
\begin{align}
\hat{x}_n &= \frac{x_1 + \dots + x_{n-1} + x_n} {n} \\
        &= \frac{n-1}{n-1} \times \frac{x_1 + \dots + x_{n-1} + x_n} {n} \\
        &= \frac{(n-1)\times(x_1 + \dots + x_{n-1}) + (n-1) \times x_n} {(n-1) \times n} \\
        &= \frac{(n-1)\times(x_1 + \dots + x_{n-1})} {(n-1) \times n} + \frac{(n-1) \times x_n} {(n-1) \times n} \\
        &= \frac{(n-1) \times \hat{x}_{n-1}} {n} + \frac{x_n} {n}
\end{align}
$$ 

It can be seen that average value at time point $$n$$ can be calculated by using new value $$x_n$$ and previous average value $$\hat{x}_{n-1}$$. In other words, I can save a great amount of memory and it's very convenient. :+1: