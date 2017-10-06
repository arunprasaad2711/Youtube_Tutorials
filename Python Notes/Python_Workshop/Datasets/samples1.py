# -*- coding: utf-8 -*-
"""
Created on Thu Aug  6 02:40:17 2015

@author: arun
"""

from netCDF4 import Dataset as dt
import matplotlib.pyplot as plt
import matplotlib
import numpy as np
import time
import scipy.io as sio
from subprocess import call

#lat1 = np.linspace(-90,90,37)
#lat2 = np.linspace(-87.5,87.5,36)
#lon1 = np.linspace(-180,180,73)
#lon2 = np.linspace(-177.5,177.5,72)
#top1 = np.linspace(1,53,53)
#top2 = np.linspace(1.5,52.5,52)

filestr = 'ncfile2.nc'

ncfile = dt(filestr, 'r')
#ZNU = np.array(ncfile.variables['ZNU'][:],order='F')
lat = np.array(ncfile.variables['latitude'][:],dtype=np.float32)
lon = np.array(ncfile.variables['longitude'][:],dtype=np.float32)
t = np.array(ncfile.variables['time'][:],dtype=np.int32)
u = np.array(ncfile.variables['u10'][:],dtype=np.float32)
v = np.array(ncfile.variables['v10'][:],dtype=np.float32)
T = np.array(ncfile.variables['t2m'][:],dtype=np.float32)
al = np.array(ncfile.variables['al'][:],dtype=np.float32)

#us = np.linspace(-20, 20, 11, endpoint=True)
#plt.contourf(lon,lat,u[5][:][:],us,cmap='seismic')
# plt.contourf(lat2,top2,x.T,40,linewidth=3,cmap='gist_heat_r',vmin=0,vmax=0.0035)
# Use seismic colour map as well
#plt.xlabel('Longitude', fontsize=10)
#plt.ylabel('Latitude', fontsize=10)
#plt.xticks(np.arange(0,360,30))
#plt.yticks(np.arange(-90,100,15))
#plt.title('Zonal Velocity in $ms^{-1}$')
#plt.suptitle("Random time")
#plt.grid(True)
#plt.axis()
#plt.colorbar(ticks=us)
#matplotlib.rcParams['contour.negative_linestyle'] = 'solid'
#CS = plt.contour(lon, lat, u[5][:][:], us, colors='k') # For plotting only contours
# The above is for making negative contours solid instead of dashed
# Adding color = 'k' will make all lines black
# plt.clabel(CS, inline=1, fontsize=10, manual=manual_locations)
# If manual is set to a list of pair of tuples, then the labels will be placed there
# plt.clabel(CS, inline=1, fontsize=10) # enable this for contour labels
#cbar = plt.colorbar()
# plt.savefig("TvsZ4.png", format='png', dpi=2000) # not recommended for heavy files
#plt.savefig("TvsZ4.eps", format='eps', dpi=2000)
#plt.show()

'''
    This section is for interactive
    plotting
'''

#i = 0
#plt.figure()
#while (i < 31):
for i in range(0, 31):
    plt.clf()
    us = np.linspace(-20, 20, 11, endpoint=True)
    plt.contourf(lon,lat,u[i][:][:],us,cmap='seismic')
    # plt.contourf(lat2,top2,x.T,40,linewidth=3,cmap='gist_heat_r',vmin=0,vmax=0.0035)
    # Use seismic colour map as well
    plt.xlabel('Longitude', fontsize=10)
    plt.ylabel('Latitude', fontsize=10)
    plt.xticks(np.arange(0,360,30))
    plt.yticks(np.arange(-90,100,15))
    plt.title('Zonal Velocity in $ms^{-1}$ at t = '+str(i))
    plt.suptitle("Random time")
    plt.grid(True)
    plt.axis()
    plt.colorbar(ticks=us)
    matplotlib.rcParams['contour.negative_linestyle'] = 'solid'
    CS = plt.contour(lon, lat, u[i][:][:], us, colors='k') # For plotting only contours
    #i += 1
    plt.pause(0.001)
