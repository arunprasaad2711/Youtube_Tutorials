import numpy as np
import time

import matmul_cython

M1   = 10
N1M2 = 500
N2   = 10

a = np.empty((M1,N1M2), dtype=np.float64)
b = np.empty((N1M2,N2), dtype=np.float64)
c = np.empty((M1,N2), dtype=np.float64)

a[:] = np.random.rand(M1,N1M2)
b[:] = np.random.rand(N1M2,N2)

# Cython call
start = time.time()
matmul_cython.matmul1( a, b, c )
stop = time.time()
print('Cython took ',(stop - start)*1000,'milli-seconds')

c = np.empty((M1,N2), dtype=np.float64)

# Numpy
start = time.time()
c = np.dot(a,b)
stop = time.time()
print('Numpy took ',(stop - start)*1000,'milli-seconds')

c = np.zeros((M1,N2), dtype=np.float64)

# Python
start = time.time()
for i in range(0, M1):
    for j in range(0, N2):
        for k in range(0, N1M2):
            c[i,j] += a[i,k]*b[k,j]

stop = time.time()
print('Python took ',(stop - start)*1000,'milli-seconds')
