---
layout: post
title: Multiply Matrices in Python
categories: [Algorithm, Maths]
tags: [Python]
fullview: true
comments: true
---
> Multiplying Matrices is a good way to practice what you understand about Python

Formular $$ c_{ij} = \sum_{k}^{n}{a_{ik}b_{kj}} $$

Example:
$$ 
\begin{bmatrix} 1 & 2 & 3\\ 4 & 5 & 6 \\ \end{bmatrix} 
\times 
\begin{bmatrix} 7 & 8\\ 9 & 10 \\ 11 & 12 \\ \end{bmatrix}
= 
\begin{bmatrix} 58 & 64\\ 139 & 154 \\ \end{bmatrix}  
$$

***Approach #1***
{% highlight python %}
def multipleMatrixes(A, B):
    B = list(zip(*B))
    return [[sum(ai * bj for ai, bj in zip(Ai, Bj)) for Bj in B] for Ai in A]
#[[58, 64], [139, 154]]
multipleMatrixes([[1,2,3],[4,5,6]], [[7,8],[9,10],[11, 12]]) 
{% endhighlight %}
&sect; `zip([iterable, ...])`[^zip] returns a list of tuples, where the i-th tuple contains the i-th element from each of the argument sequences or iterables

&sect; `*`[^unpack] is unpack operator, `def test(A, B): print A, B`, `test(*[[1,2],[3,4]])`


***Approach #2***
{% highlight python %}
def multipleMatrixes(A, B):
    return [[sum(x * B[i][col] for i,x in enumerate(row)) 
    		for col in range(len(B[0]))] for row in A]
#[[58, 64], [139, 154]]
multipleMatrixes([[1,2,3],[4,5,6]], [[7,8],[9,10],[11, 12]]) 
{% endhighlight %}
&sect; `enumerate(sequence, start=0)`[^enumerate] returns an enumerate object

***Approach #3***
{% highlight python %}
def multipleMatrixes(A, B):
	result = [[0] * len(A) for _ in range(len(B[0]))]
	for i in range(len(A)):
		for j in range(len(B[0])):
			for k in range(len(B)):
				result[i][j] += A[i][k] * B[k][j]
	return result
#[[58, 64], [139, 154]]
multipleMatrixes([[1,2,3],[4,5,6]], [[7,8],[9,10],[11, 12]]) 
{% endhighlight %}
&sect; `[0] * 3` becomes `[0,0,0]`

**Approach #4: Using Numpy**
{% highlight python %}
import numpy as np
#array([[ 58,  64],
#       [139, 154]])
np.dot([[1,2,3],[4,5,6]], [[7,8],[9,10],[11, 12]]) 
{% endhighlight %}

[^zip]: [`zip()`](https://docs.python.org/2/library/functions.html#zip)
[^enumerate]: [`enumerate()`](https://docs.python.org/2/library/functions.html#enumerate)
[^unpack]: [`*`](https://codeyarns.com/2012/04/26/unpack-operator-in-python/)

Source [`here`](http://rosettacode.org/wiki/Matrix_multiplication#Python)