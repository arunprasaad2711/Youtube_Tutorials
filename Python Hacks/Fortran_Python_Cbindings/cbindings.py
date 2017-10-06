from ctypes import CDLL, POINTER, c_int, c_float
import numpy as np
import time

fort_mod = CDLL('./matops1.so')

fort_mod.matmul1.argtypes = [ POINTER(c_float), 
                                 POINTER(c_float), 
                                 POINTER(c_float),
                                 POINTER(c_int),
                                 POINTER(c_int),
                                 POINTER(c_int) ]

fort_mod.matadd1.argtypes = [ POINTER(c_float), 
                                 POINTER(c_float), 
                                 POINTER(c_float),
                                 POINTER(c_int),
                                 POINTER(c_int)]

# Setup    
M1   = 10
N1M2 = 50
N2   = 10

a = np.empty((M1,N1M2), dtype=c_float)
b = np.empty((N1M2,N2), dtype=c_float)
c = np.empty((M1,N2), dtype=c_float)
d = np.empty((M1,N2), dtype=c_float)

a[:] = np.random.rand(M1,N1M2)
b[:] = np.random.rand(N1M2,N2)


# Fortran call
start = time.time()
fort_mod.matmul1( a.ctypes.data_as(POINTER(c_float)), 
                     b.ctypes.data_as(POINTER(c_float)), 
                     c.ctypes.data_as(POINTER(c_float)), 
                     c_int(M1), c_int(N1M2), c_int(N2) )
fort_mod.matadd1( c.ctypes.data_as(POINTER(c_float)), 
                     c.ctypes.data_as(POINTER(c_float)), 
                     d.ctypes.data_as(POINTER(c_float)), 
                     c_int(M1), c_int(N2))
stop = time.time()
print('Fortran took ',(stop - start)*1000000,'micro-seconds')

# Numpy
start = time.time()
c = np.dot(a,b)
d = c+c
stop = time.time()
print('Numpy took ',(stop - start)*1000000,'micro-seconds')
