# Matplotlib Plotting Tutorials
# Polar quiver plot

import numpy as np
import matplotlib.pyplot as plt

# Slice interval for quiver
slice_interval = 5

# Half Domain length from origin along x/y axis
Rmin = 0.0
Rmax = 4.0
theta_min = 0.0
theta_max = 2.0*np.pi

# Number of points in domain along rad/theta axis
n = 101

# Radius, theta
rad   = np.linspace(Rmin, Rmax, n)
theta = np.linspace(theta_min, theta_max, n)

# Grid values
theta_matrix, radius_matrix = np.meshgrid(theta,rad)

# flows/velocities
# U = radial, V = Tangential
# U, V = radius_matrix*(1.0-radius_matrix**2.0)*(4.0-radius_matrix**2.0), 2.0-radius_matrix**2.0
U, V = np.ones((n,n)), np.ones((n,n))

# resultant velocities
vels = (U**2.0 + (V*radius_matrix)**2.0)**0.5

# Slicer index for smoother quiver plot
skip = (slice(None, None, slice_interval), slice(None, None, slice_interval))

# Converting velocities to cartesian coordinates
# U = radial, V = Tangential
Xnew = U[skip]*np.cos(theta_matrix[skip]) - V[skip]*np.sin(theta_matrix[skip])
Ynew = U[skip]*np.sin(theta_matrix[skip]) + V[skip]*np.cos(theta_matrix[skip])

# Get an axes handle/object
ax1 = plt.subplot(111, polar=True)

# ax1.quiver(theta_matrix[skip], radius_matrix[skip], V[skip], U[skip]) - won't work - wrong plot
# general tip: adjust slice interval and scale to get the best quiver plot
Quiver = ax1.quiver(theta_matrix[skip], radius_matrix[skip], Xnew, Ynew, vels[skip],
                    units='width',
                    angles='uv',
                    scale=50,
                    pivot='mid',
                    # color='blue',
                    cmap=plt.cm.jet
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
plt.quiverkey(Quiver, 1.01, 1.01, 3, label='3 m/s', labelcolor='blue', labelpos='N',
                   coordinates='axes')
plt.colorbar(Quiver)
# plt.legend() - no label option, hence no legend
plt.title("Polar Quiver Plots")

plt.show()