# -*- coding: utf-8 -*-
"""
Created on Wed Sep  2 08:03:56 2015

@author: arun
"""

import numpy as np
import matplotlib.pyplot as plt
from scipy.fftpack import fft, ifft
# This is necessary!

N = 64 # Number of points
T = 1/64.0 # Spacing between points
# if T is time/distance, 1/T is frequency/wavenumber

x = np.linspace(0, 2*np.pi*N*T, N)
# Let's take X as time, so 1/X is frequency!
y1 = np.cos(20*x)
y2 = np.sin(10*x)
y3 = np.sin(5*x)

y = y1 + y2 + y3 # Produces a random signal

fy = fft(y) # Finds the FFT
xf = np.linspace(0.0, 1.0/(2.0*T), N/2)

plt.figure(1)
plt.plot(xf, (2.0/N)*np.abs(fy[0:N/2])) 
# Only half is valid. The other half is replica!

plt.figure(2)
y4 = ifft(fy) # Gets the inverse FFT
plt.plot(x, y4, 'r')
plt.plot(x, y, 'b')