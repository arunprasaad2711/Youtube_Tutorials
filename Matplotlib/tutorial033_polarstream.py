# Matplotlib Plotting Tutorials
# Polar stream plot

import numpy as np
import matplotlib.pyplot as plt

# Domain details
Rmin = 0.0
Rmax = 4.0
theta_min = 0.0
theta_max = 2.0*np.pi

# Number of points in domain direction
n = 101

# Radius, theta
rad   = np.linspace(Rmin, Rmax, n)
theta = np.linspace(theta_min, theta_max, n)

# Grid values
theta_matrix, radius_matrix = np.meshgrid(theta,rad)

# flows/velocities
# U = radial, V = Tangential
U, V = radius_matrix*(1.0-radius_matrix**2.0)*(4.0-radius_matrix**2.0), 2.0-radius_matrix**2.0
# U, V = np.ones((n,n)), np.ones((n,n))

# resultant velocities
vels = (U**2.0 + (V*radius_matrix)**2.0)**0.5

# Line width parameter
lw = 3*vels/np.max(vels)

# Get an axes handle/object
ax1 = plt.subplot(111, polar=True)

# transverse coordinate, radial coordinate, transverse/tangential velocity, radial velocity
stream = ax1.streamplot(theta_matrix, radius_matrix, V, U,
               arrowsize=2,             # arrow size
               arrowstyle='->',          # arrow style
               color='xkcd:azure',           # single colour, cmap not needed
               # color=vels,            # colour vector field, cmap needed
               density=1,               # density of streamlines
               # density=(0.5,1),          # density along theta and rad directions - 2 value array
               linewidth=1,             # line width
               # linewidth=lw,
               # cmap=plt.cm.jet  # colour map
               )

## Main tweaks
# Radius limits
ax1.set_ylim(0, 4)
# Radius ticks
ax1.set_yticks(np.linspace(0, 4, 5))
# Radius tick position in degrees
ax1.set_rlabel_position(135)
# Angle ticks
ax1.set_xticks(np.linspace(0, 2.0*np.pi, 17)[:-1])

# Additional Tweaks
plt.grid(True)
# plt.colorbar(stream.lines)
# plt.legend() - no label option, hence no legend
plt.title("Polar Stream Plots")

plt.show()