# -*- coding: utf-8 -*-
"""
Created on Mon Aug 17 08:30:33 2015

@author: arun
"""

import numpy as np
import scipy.io as sio

filemat = 'mat1.mat'

filedict1 = sio.loadmat(filemat)

lon = np.array(filedict1['lon'])

print lon