# Matplotlib Plotting Tutorials
# Quiverplots

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

# Slice interval for quiver
slice_interval = 4

# Slicer index for smoother quiver plot
# General note: Adjust the slice interval and scale accordingly to get the required arrow size.
# Also, the units, and angles units are also responsible.
skip = (slice(None, None, slice_interval), slice(None, None, slice_interval))

plt.figure()
Quiver = plt.quiver(X1[skip], X2[skip],
                    U[skip], V[skip],
                    vels[skip],
                    units='height',
                    angles='uv',
                    scale=250,
                    pivot='mid',
                    # color='blue',
                    cmap=plt.cm.seismic
                    )
plt.title("Van der pol Phase Portrait")
plt.xlabel("x")
plt.ylabel("y")
plt.quiverkey(Quiver, 1.01, 1.01, 10, label='10m/s', labelcolor='blue', labelpos='N',
                   coordinates='axes')
plt.colorbar(Quiver)
plt.xticks()
plt.yticks()
plt.axis([-l, l, -l, l])
plt.grid()
plt.show()
