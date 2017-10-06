# -*- coding: utf-8 -*-
"""
Created on Wed Aug 19 14:20:15 2015

@author: arun
"""

import numpy as np
import sample as sp


a = np.zeros((10, 10), dtype=np.int64, order='F')

sp.add1(a)

print(a)





