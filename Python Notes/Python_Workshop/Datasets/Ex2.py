# -*- coding: utf-8 -*-
"""
Created on Thu Aug  6 09:16:53 2015

@author: arun
"""

import numpy as np
from matplotlib import pyplot as plt

Zkm = np.array((0, 0.1, 0.3, 0.5, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10))
RH100 = np.array((60, 70, 80, 75, 60, 50, 80, 90, 60, 40, 20, 5, 2, 1))

RH = RH100*0.01
Z = Zkm*1000

Ps = 1e5
Ts = 30
g = 9.806
Cp = 1005
L = 2.5006e6
A = 2.53e11
B = 5420
R = 287
v0 = 100
Zs = R*(Ts+273.15)/g

Tk = np.zeros(len(Zkm))
T = np.array(Tk)
P = np.array(T)
es = np.array(T)
e = np.array(T)
q = np.array(T)
r = np.array(T)
W = np.array(T)
h = np.array(T)
MSE = np.array(T)
v = np.array(T)
TE = np.array(T)

#for i in range(0, len(Zkm)):
#    Tk[i] = (Ts+273.15) - (g*Z[i]/Cp)
#    T[i] = Tk[i] - 273.15
#    P[i] = Ps*np.exp(-g*Z[i]/(R*Tk[i]))
#    es[i] = A*np.exp(-B/Tk[i])
#    e[i] = RH[i]*es[i]
#    q[i] = 0.622*e[i]/P[i]
#    r[i] = P[i]/(R*Tk[i])
#    W[i] = r[i]*q[i]
#    h[i] = L*q[i] +Cp*Tk[i]
#    MSE[i] = h[i] + g*Z[i]
#    v[i] = v0*(np.exp(Z[i]/Zs)-1)
#    TE[i] = MSE[i] + 0.5*v[i]**2

Tk = (Ts+273.15) - (g*Z/Cp)
T = Tk - 273.15
P = Ps*np.exp(-g*Z/(R*Tk))
es = A*np.exp(-B/Tk)
e = RH*es
q = 0.622*e/P
r = P/(R*Tk)
W = r*q
h = L*q +Cp*Tk
MSE = h + g*Z
Zs = R*(Ts+273.15)/g
v = v0*(np.exp(Z/Zs)-1)
TE = MSE + 0.5*v**2

#plt.plot(RH,Z,label='RH')
#plt.plot(Tk,Z,label="T")
#plt.plot(P,Z,label='P')
#plt.plot(es,Z,label='es')
#plt.plot(e,Z,label='e')
#plt.plot(q,Z,label='q')
#plt.plot(r,Z,label='$\rho$')
#plt.plot(W,Z,label='W')
#plt.plot(h,Z,label='h')
#plt.plot(MSE,Z,label='MSE')
#plt.plot(v,Z,label='v')
#plt.plot(TE,Z,label='TE')
#plt.ylabel("Altitude")
#plt.title("Vertical Profiles")
#plt.axis()
#plt.legend()
#plt.grid('on')


