---
layout: post
title: Query Video With A Keyword
categories: [Explore, Algorithm]
tags: [OpenCV, Pytorch, Tesseract, LSTM]
fullview: true
comments: true
---


<img src="https://media.giphy.com/media/IhPDeuUS6MPi92Yxii/giphy.gif" />

Above video consists of several topics with multiple choices, all presented in a rectangle. Each question has a keyword included in its body; different questions have different keywords. I define a task to retrieve all frames display a wanted question based on a keyword I input. After that, I will select a concrete frame where it can exhibit my wanted question and associated answers to my query. For example, my expectation if I use **Wine** as the keyword is bellow. 

Output video: <img src="https://media.giphy.com/media/kbWm3OCVwG4FETLbo2/giphy.gif" /> 

Output image: <img src="{{ site.url }}/_notebooks/output.jpg" />

**TL;DR**

My notebook is at [`github` (https://github.com/dongchirua/dongchirua.github.io/blob/master/_notebooks/VideoQueryExplore.ipynb)](https://github.com/dongchirua/dongchirua.github.io/blob/master/_notebooks/VideoQueryExplore.ipynb)

I used pre-trained models from [`CRAFT`](https://github.com/clovaai/CRAFT-pytorch) and `Tesseract` for text extractions. As this was my quick attempt, my pipeline is not optimal in terms of running time because it handles image by image on CPU. In the post's scope,  I used a sampling strategy and binary search to find an appropriate video segment, hence, running time indeed is still acceptable (less than 15 minutes).

## Observation

There are some observations can help

1. a segment can be divided into 2 phases, one of them is when no answer is given. There are short periods where the box contains question doesn't change much in terms of size, colors to give time for responses. 
2. detect rectangle and its size can track phases, potentially support to finalize a frame
3. the question box has a transparent color, strongly influenced by colors from the background hence it is hard for image processing techniques such as Canny edge detector, Hough transform.
4. from point #1, we can leverage the difference between frames

## Method

1. Sampling video
2. For image in sampled frames
+ Pass sampled frames to text detector + text recognization (treat the image as a single word)
+ If a frame consist input keyword --> append to **target_indexes** 
3. Find leftmost and rightmost index from **target_indexes** 
4. Expand left and right to cover all frames have keyword
5. Compute **hist_diff** and find local minima
6. Return interested frame & the part of video
