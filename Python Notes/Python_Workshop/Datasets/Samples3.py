# -*- coding: utf-8 -*-
"""
Created on Mon Aug 17 08:23:36 2015

@author: arun
"""

import numpy as np
# import matplotlib.pyplot as plt
import scipy.io as sio
from netCDF4 import Dataset as dt

filestr = 'ncfile2.nc'

ncfile = dt(filestr, 'r')
#ZNU = np.array(ncfile.variables['ZNU'][:],order='F')
lat = np.array(ncfile.variables['latitude'][:],dtype=np.float32)
lon = np.array(ncfile.variables['longitude'][:],dtype=np.float32)
u = np.array(ncfile.variables['u10'][:],dtype=np.float32)
v = np.array(ncfile.variables['v10'][:],dtype=np.float32)
T = np.array(ncfile.variables['t2m'][:],dtype=np.float32)

'''
To save in mat files, first you need a dictionary having all the values as keys
Second, you need to specify a proper key values to them.
Finally, you need the sio.savemat() option to save them!
'''

mat = {}
mat['lat'] = lat
mat['lon'] = lon

um = np.mean(u, axis=0)
vm = np.mean(v, axis=0)

mat['um'] = um
mat['vm'] = vm

filemat = 'mat1.mat'

sio.savemat(filemat, mat)
# Pass the filename as a string, and the dictionary
