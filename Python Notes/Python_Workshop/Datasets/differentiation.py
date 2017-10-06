# -*- coding: utf-8 -*-
"""
Created on Wed Sep  2 06:54:56 2015

@author: arun
"""

import numpy as np
import matplotlib.pyplot as plt

x = np.linspace(0, 2.0*np.pi, 101)
y = np.sin(2*x)
y1 = np.gradient(y, x[1]-x[0]) # Calculates the Differential
y2 = np.gradient(y1, x[1]-x[0])

plt.plot(x, y, label='sin(2*x)')
plt.plot(x, y1, label='2cos(2x)')
plt.plot(x, y2, label='-4sin(2x)')
plt.legend(framealpha=0.5)
# Set 1.0 for opaque, 0.0 for transparency, between 0 and 1 for transclusent
plt.grid()
plt.savefig('Differentiation.png', format='png', dpi=400)