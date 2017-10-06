# Program to solve the Linear Advection Equation using RK4
# We are using numba to see how well the execution takes place

from time import time
import numpy as np
from numba import jit

def rk4_1(c, u, dx, dt, sp, ts):

    ud = np.zeros((sp))
    k1 = np.zeros((sp))
    k2 = np.zeros((sp))
    k3 = np.zeros((sp))
    k4 = np.zeros((sp))
    
    for i in range(1,ts-1):
        ud = u[i-1][:]
        for j in range(1,sp-1):
            k1[j] = -c*dt*(ud[j]-ud[j-1])/dx
            k2[j] = -c*dt*(ud[j]+k1[j]*0.5-ud[j-1]-k1[j-1]*0.5)/dx
            k3[j] = -c*dt*(ud[j]+k2[j]*0.5-ud[j-1]-k2[j-1]*0.5)/dx
            k4[j] = -c*dt*(ud[j]+k3[j]*0.5-ud[j-1]-k3[j-1]*0.5)/dx
        u[i][:] = ud + (k1+2.0*k2+2.0*k3+k4)/(6.0)
        u[i][0] = u[i-1][sp-1]

@jit
def rk4_2(c, u, dx, dt, sp, ts):

    ud = np.zeros((sp))
    k1 = np.zeros((sp))
    k2 = np.zeros((sp))
    k3 = np.zeros((sp))
    k4 = np.zeros((sp))
    
    for i in range(1,ts-1):
        ud = u[i-1][:]
        for j in range(1,sp-1):
            k1[j] = -c*dt*(ud[j]-ud[j-1])/dx
            k2[j] = -c*dt*(ud[j]+k1[j]*0.5-ud[j-1]-k1[j-1]*0.5)/dx
            k3[j] = -c*dt*(ud[j]+k2[j]*0.5-ud[j-1]-k2[j-1]*0.5)/dx
            k4[j] = -c*dt*(ud[j]+k3[j]*0.5-ud[j-1]-k3[j-1]*0.5)/dx
        u[i][:] = ud + (k1+2.0*k2+2.0*k3+k4)/(6.0)
        u[i][0] = u[i-1][sp-1]
    
    
ts = 4001
sp = 1001
u = np.zeros((ts, sp))
x = np.zeros((sp))
    
c = 2.0
l = 1000.0
pi = np.pi
t = 1000.0

dx = l/(sp-1)
dt = t/(ts-1)
print("The CFL is:", c*dt/dx)

x = np.linspace(0, l, sp)
u[0][:] = np.sin(2*pi*x/l)

start1 = time()
rk4_1(c, u, dx, dt, sp, ts)
stop1 = time()
print("Normal RK4 process took ",stop1-start1," seconds!")

x = np.linspace(0, l, sp)
u = np.zeros((ts, sp))
u[0][:] = np.sin(2*pi*x/l)

start2 = time()
rk4_2(c, u, dx, dt, sp, ts)
stop2 = time()
print("Numba jit RK4 process took ",stop2-start2," seconds!")
