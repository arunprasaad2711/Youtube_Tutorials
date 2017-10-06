# -*- coding: utf-8 -*-
"""
Created on Wed Sep  2 04:58:56 2015

@author: arun
"""

import numpy as np
from scipy.integrate.quadpack import quad
import matplotlib.pyplot as plt

# Function to be integrated!
def func(x):
    return np.array(x**2)

x = np.linspace(0, 10, 201)
integral, err = quad(func, 1, 5)
# Numerical quadrature that calculates the integral and error 

print "The integral is :", integral
print "The error is :", err

section = np.linspace(1, 5, 20)

plt.plot(x, func(x))
plt.fill_between(section, func(section), facecolor='red')