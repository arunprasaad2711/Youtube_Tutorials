# Matplotlib Plotting Tutorials
# Subplots - using subplot2grid
# Specify the plot position and span as grids
# No multiple configurations! Single Configuration!
# Replication of figure from https://matplotlib.org/users/gridspec.html

import numpy as np
import matplotlib.pyplot as plt

## Simple figure - no spans
# Create the figure
fig1 = plt.figure(1)

# Axis handle for the plot 1
ax1 = plt.subplot2grid(shape=(2,2), loc=(0,0))
# x, y, coordinates, string, vertical alignment, horizontal alignment
ax1.text(x=0.5, y=0.5, s="ax1", va="center", ha="center")

# Axis handle for the plot 2
ax2 = plt.subplot2grid(shape=(2,2), loc=(0,1))
ax2.text(0.5, 0.5, "ax2", va="center", ha="center")

# Axis handle for the plot 3
ax3 = plt.subplot2grid(shape=(2,2), loc=(1,0))
ax3.text(0.5, 0.5, "ax3", va="center", ha="center")

# Axis handle for the plot 4
ax4 = plt.subplot2grid(shape=(2,2), loc=(1,1))
ax4.text(0.5, 0.5, "ax4", va="center", ha="center")

plt.suptitle("Subplot via Grids")
plt.tight_layout()
plt.subplots_adjust(top=0.90)
plt.show()

## Figure with row/column spans
# Create the figure
fig2 = plt.figure(2)

# Axis handle for plot 1
ax1 = plt.subplot2grid(shape=(3,3), loc=(0,0), rowspan=1, colspan=3)
ax1.text(x=0.5, y=0.5, s="ax1", va="center", ha="center")

# Axis handle for plot 2
ax2 = plt.subplot2grid(shape=(3,3), loc=(1,0), rowspan=1, colspan=2)
ax2.text(x=0.5, y=0.5, s="ax2", va="center", ha="center")

# Axis handle for plot 3
ax3 = plt.subplot2grid(shape=(3,3), loc=(1,2), rowspan=2, colspan=1)
ax3.text(x=0.5, y=0.5, s="ax3", va="center", ha="center")

# Axis handle for plot 4
ax4 = plt.subplot2grid((3,3), (2, 0))
ax4.text(x=0.5, y=0.5, s="ax4", va="center", ha="center")

# Axis handle for plot 5
ax5 = plt.subplot2grid((3,3), (2, 1))
ax5.text(x=0.5, y=0.5, s="ax5", va="center", ha="center")

plt.suptitle("Subplot via Grids and spans")
plt.tight_layout()
plt.subplots_adjust(top=0.90)
plt.show()