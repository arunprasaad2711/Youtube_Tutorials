# Matplotlib Plotting Tutorials
# barb plot - used in meteorology / weather maps for wind velocities

import numpy as np
import matplotlib.pyplot as plt

def vander_pol_oscillator(m, x, y):
    u, v = m*(x - x**3/3 - y), x/m
    return u, v

# half length of dimension in x and y axis
l = 8.0

# no. of points along x/y axis
n = 101

# Parameter
mu = 0.5

# X and Y dimensions
x1 = np.linspace(-l, l, n)
x2 = np.linspace(-l, l, n)

# Creating a mesh field
X1, X2 = np.meshgrid(x1, x2)

# Calculating velocities
U, V = vander_pol_oscillator(mu, X1, X2)

# Resultant velocity
vels = np.hypot(U, V)

# Slice interval for barbs
slice_interval = 4

# Slicer index for smoother barbs plot
skip = (slice(None, None, slice_interval), slice(None, None, slice_interval))

plt.figure()
# barbs = plt.barbs(X1, X2, U, V)
barbs = plt.barbs(X1[skip], X2[skip],
                  U[skip], V[skip],
                  vels[skip],
                  pivot='tip', # color='green',
                  cmap=plt.cm.jet,
                  barb_increments={'half':10, 'full':20, 'flag':50})
plt.colorbar(barbs)
plt.title("Van der pol Phase Portrait")
plt.xlabel("x")
plt.ylabel("y")
plt.xticks()
plt.yticks()
plt.axis([-l, l, -l, l])
plt.grid()
plt.show()