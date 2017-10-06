cimport numpy as np

def matmul1(np.ndarray[double, ndim=2] mat1, np.ndarray[double, ndim=2] mat2, np.ndarray[double, ndim=2] r):
    
    cdef unsigned int i, j, k, r1, r2, c2
    
    r1 = mat1.shape[0]
    r2 = mat2.shape[1]
    c2 = mat2.shape[1]
    
    for i in range(0, r1):
        for j in range(0, c2):
            r[i][j] = 0
            for k in range(0, r2):
                r[i][j] += mat1[i][k]*mat2[k][j]
