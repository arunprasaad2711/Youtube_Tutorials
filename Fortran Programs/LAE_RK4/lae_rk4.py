# Program for doing an RK4 on lae. Plot in python, crunch in fortran

import numpy as np
import time
import matplotlib.pyplot as plt
from os import system
plt.ion()

system("f2py3 -m py_lae_rk4.f95 -c py_lae_rk4")
system("mv *.so lae_rk4.so")
import lae_rk4

ts = 4001
sp = 1001

u = np.zeros((ts, sp), dtype=float)

ud = np.zeros(sp)
k1 = np.zeros(sp)
k2 = np.zeros(sp)
k3 = np.zeros(sp)
k4 = np.zeros(sp)
x = np.zeros(sp)

c = 2.0
l = 1000.0
t = 1000.0

dx = l/float(sp-1)
dt = t/float(ts-1)

CFL = c*dt/dx

for i in range(0, sp):
    x[i] = dx*i

u[0, :] = np.sin(2*np.pi*x[:]/l)
plt.plot(x, u[0, :])
plt.show()

print("The CFL is:", CFL)

for i in range(1, ts):
    ud = u[i-1, :]

    lae_rk4.sub_lae_rk4(c, k1, ud, dx, dt, sp)
    lae_rk4.sub_lae_rk4(c, k2, ud+k1/2.0, dx, dt, sp)
    lae_rk4.sub_lae_rk4(c, k3, ud+k2/2.0, dx, dt, sp)
    lae_rk4.sub_lae_rk4(c, k4, ud+k3/2.0, dx, dt, sp)

    u[i, :] = ud + (k1+2.0*k2+2.0*k3+k4)/6.0
    u[i, 0] = u[i-1, sp-1]
    plt.clf()
    plt.plot(x, u[i, :])
    plt.show()
    time.sleep(0.005)


