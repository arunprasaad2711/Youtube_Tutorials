# -*- coding: utf-8 -*-
"""
Created on Thu Aug  6 08:05:21 2015

@author: arun

Program to calculate the Fibonacci Series
"""

import numpy as np

n = input("Enter the number of terms in the series:")

f = np.zeros(n+1, dtype=np.int16)
#f[1] = 1
#
#for i in range(2, n+1):
#    f[i] = f[i-1] + f[i-2]

a = 0
b = 1

for i in range(1, n+1):
    a, b = b, a+b # Swap and Unpack
    f[i] = a

print "The fibonacci series upto {} terms is:".format(n), f