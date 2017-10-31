# Program to visualize the data

import numpy as np
from netCDF4 import Dataset as dt
import matplotlib.pyplot as plt
import matplotlib
from mpl_toolkits.mplot3d import Axes3D
from scipy.interpolate import griddata

fname = 'datas_small_rotation.nc'
fp = dt(fname, 'r')

# print(fp.variables)

x = np.array(fp.variables['X Distance'][:])
y = np.array(fp.variables['Y Distance'][:])
t = np.array(fp.variables['T Time'][:])
h = np.array(fp.variables['H_Level'][:])
u = np.array(fp.variables['U_Velocity'][:])
v = np.array(fp.variables['V_Velocity'][:])

uv = (u**2.0 + v**2.0)**0.5

# regridding data for smoother values

X, Y = np.meshgrid(x,y)

# X, Y = np.mgrid[0:10:1001j, 0:10:1001j]
# H = np.zeros((10001,1001,1001))
'''
for i in range(0, 10001):
    H[i,:,:] = griddata(x, y, h[i,:,:], (X, Y), method='linear')
'''

fig = plt.figure()


ax = fig.gca(projection='3d')

##plot_args = {'rstride': 1, 'cstride': 1, 'facecolor':
##             'blue', 'linewidth': 0.01, 'antialiased': True,
##             'shade': True}

plot_args = {'rstride': 1, 'cstride': 1, 'cmap':
             'coolwarm', 'linewidth': 0.01, 'antialiased': True,
             'shade': True}

for i in range(0, 10001, 10):
    ax.clear()
    surf = ax.plot_surface(X, Y, h[i,:,:], **plot_args)
    ax.set_xlabel('y')
    ax.set_ylabel('x')
    ax.set_zlabel('h')
    ax.set_zlim([0.98, 1.02])
    plt.pause(1e-3)
    print(i)


#matplotlib.rcParams['contour.negative_linestyle'] = 'solid'

#vmax = np.amax(h)
#vmin = np.amin(h)

#contours = np.linspace(vmin, vmax, 11)

#for i in range(1, 10001, 10):
#    plt.clf()
#    # plt.contourf(x,y,h[i,:,:], cmap='coolwarm')
#    plt.contourf(x,y,uv[i,:,:], cmap='coolwarm')
#    plt.xlabel('x axis')
#    plt.ylabel('y axis')
#    plt.suptitle('t = {} s'.format(i*0.1))
#    # plt.colorbar(ticks=contours)
#    plt.colorbar()
#    # plt.contour(x,y,h[i,:,:], colors='black')
#    plt.contour(x,y,uv[i,:,:], colors='black')
#    plt.title('Wave motion')
#    plt.pause(1e-3)
    
