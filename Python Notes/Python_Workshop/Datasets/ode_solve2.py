# -*- coding: utf-8 -*-
"""
Created on Wed Sep  2 07:46:00 2015

@author: arun
"""

import numpy as np
from scipy.integrate import odeint
import matplotlib.pyplot as plt

def lorentz(st, t):
    s = 10.0
    p = 28.0
    b = 8.0/3.0
    
    x0 = st[0] # x displacement
    y0 = st[1] # y displacement
    z0 = st[2] # z displacement
    
    xd = s*(y0-x0)
    yd = (p-z0)*x0 - y0
    zd = x0*y0 - b*z0
    
    return xd, yd, zd

init = [2.0, 3.0, 4.0]
t = np.arange(0.0, 60.0, 0.01)

st = odeint(lorentz, init, t)

lor = st

x = st[:,0]
y = st[:,1]
z = st[:,2]

from mpl_toolkits.mplot3d import Axes3D
fig = plt.figure()
ax = fig.gca(projection='3d')
ax.plot(x, y, z, 'r', label='Lorentz Butterfly')
ax.set_xlabel('x')
ax.set_ylabel('y')
ax.set_zlabel('z')
ax.legend()
plt.savefig('Lorentz_Butterfly.png', format='png', dpi=400)