# -*- coding: utf-8 -*-
"""
Created on Wed Sep  2 04:11:35 2015

@author: arun
"""

import numpy as np

A = np.array([[5., 6, 2, 3, 3],[8, 9, 8, 8, -45],[8, 2, 8, 6, 5],[4, 1, -12, 1, 2],[8, 2, -4, -5, 5]])
# Input Matrix or Co-efficient Matrix
b = np.array((19, -12, 29., -4, 6))
# RHS matrix
x = np.linalg.solve(A, b)
# Solution
# np.linalg.lstsq(a,b) if A is rectangular
print "The solution is: ", x
print np.allclose(np.dot(A, x), b)

A1 = np.array(A)
A2 = np.array(A)

M1 = np.matrix(A)
M2 = np.matrix(A)

print np.dot(A1, A1) # Matrix multiplication and Dot product for arrays and Matrices
print np.multiply(M1, M1) # Element multiplication for arrays and matrices
print np.dot(M1, M1)
print np.multiply(A1, A1)

# Arrays:
# * and np.multiply(A1, A2) for element-wise multiplication
# np.dot(A1, A2) for matrix multiplication

# Matrices:
# * and np.dot(M1, M2) for matrix multiplication
# np.multiply(M1, M2) for element-wise multiplication