# Matplotlib Tutorials
# hill shading and topographic shading
# used for displaying topography better

import numpy as np
import matplotlib.pyplot as plt
from netCDF4 import Dataset as dt
from matplotlib.colors import LightSource

# File name
filestr = 'etopo2io.nc'

# Creating a file pointer to open the file in read mode
ncfile = dt(filestr, 'r')

# Extracting variables and type casting them as numpy arrays
lon = np.array(ncfile.variables['LON1_2758'][:], dtype=np.float64)
lat = np.array(ncfile.variables['LAT1_2099'][:], dtype=np.float64)
time = np.array(ncfile.variables['TIME'][:], dtype=np.float64)
TOPO2 = np.array(ncfile.variables['TOPO2'][0,:], dtype=np.float32)

# replacing all the occurance of 1e33 with NaN (not a number)
TOPO2[TOPO2 == 1e33] = np.NaN
print('data generated')

plt.figure()
# measure azimuth angle in ccw. North=0, West=90, South=180, East=270
# Sun position or light at north-east direction (az=315 degrees), elevation=45 degrees from ground
ls = LightSource(azdeg=270, altdeg=20)
# plt.imshow(TOPO2, origin='lower', cmap=plt.cm.gist_earth)
# plt.imshow(ls.hillshade(TOPO2, vert_exag=10), origin='lower', cmap=plt.cm.gist_earth)
# plt.imshow(ls.hillshade(TOPO2, vert_exag=10), origin='lower', cmap=plt.cm.gray)
# plt.imshow(ls.shade(TOPO2, cmap=plt.cm.gist_earth, vert_exag=10, blend_mode='hsv'), origin='lower')
plt.imshow(ls.shade(TOPO2, cmap=plt.cm.gist_earth, vert_exag=1, blend_mode='soft'), origin='lower')
# plt.imshow(ls.shade(TOPO2, cmap=plt.cm.gist_earth, vert_exag=1, blend_mode='overlay'), origin='lower')
# plt.contourf(TOPO2)
# plt.contour(TOPO2, colors='k')

plt.show()
