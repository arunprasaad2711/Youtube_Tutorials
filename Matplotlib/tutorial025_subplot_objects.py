# Matplotlib Plotting Tutorials
# Subplots - part 2 - using objects

import numpy as np
import matplotlib.pyplot as plt
import matplotlib as mpl

mpl.style.use('default')

n = 101
x = np.linspace(0, 4.0*np.pi, n)
y1 = np.sin(x)
y2 = np.cos(x)
r = np.random.random(n)

# Create a figure handle
# Default figure size : l times w = 8x6 inch squared.
fig = plt.figure(figsize=(15, 10))

# Plot 1
ax1 = fig.add_subplot(121)
ax1.scatter(x, r, color='xkcd:salmon', marker='o', label='random scatter')
ax1.set_title('Random Scatter')
ax1.set_xlabel('Angle', color='r')
ax1.set_ylabel('Magnitude', color='r')
ax1.tick_params(axis='x', colors='xkcd:grey')
ax1.tick_params(axis='y', colors='xkcd:grey')
ax1.grid(True)
ax1.legend()

# Plot 2
ax2 = fig.add_subplot(322)
ax2.plot(x, y1, color='xkcd:aquamarine', linestyle='-', label='sine plot')
ax2.set_title('sine')
ax2.set_xlabel('Angle')
ax2.set_ylabel('Magnitude')
ax2.grid(True)
ax2.legend()

# Plot 3
ax3 = fig.add_subplot(324)
ax3.scatter(x, y2, color='xkcd:azure', linestyle='-', label='cosine scatter')
ax3.set_title('cosine Scatter')
ax3.set_xlabel('Angle')
ax3.set_ylabel('Magnitude')
ax3.grid(True)
ax3.legend()

# Plot 4
ax4 = fig.add_subplot(326)
ax4.plot(x, y1+y2, color='xkcd:magenta', linestyle='-', label='sine+cosine plot')
ax4.set_title('sine+cosine plot')
ax4.set_xlabel('Angle')
ax4.set_ylabel('Magnitude')
ax4.grid(True)
ax4.legend()

# To space out the figure
plt.tight_layout()

# To make the super title appear prominently
plt.subplots_adjust(top=0.94)

# Create a Super title
fig.suptitle("Sample Sinusoidal curves")

# To save the figures
plt.savefig('sinusoidal_plots1.png', format='png', dpi=400, bbox_inches='tight') # packs properly, no extra spaces
# plt.savefig('sinusoidal_plots.png', format='png', dpi=400) # leaves extra spaces.

# To show the figure
plt.show()
