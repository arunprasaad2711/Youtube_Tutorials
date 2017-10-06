# Matplotlib Plotting Tutorials
# Subplots - using gridspec
# Specify the plot position and span as grids
# No multiple configurations! Single Configuration!
# Replication of figure from https://matplotlib.org/users/gridspec.html

import numpy as np
import matplotlib.pyplot as plt
import matplotlib.gridspec as gs

# ## Simple figure - no spans
# # Create the figure
# fig1 = plt.figure(1)
#
# # Create a gridspec object
# gs1 = gs.GridSpec(nrows=2, ncols=2)
#
# # Axis handle for plot 1
# ax1 = plt.subplot(gs1[0, 0])
# ax1.text(x=0.5, y=0.5, s="ax1", va="center", ha="center")
#
# # Axis handle for plot 2
# ax2 = plt.subplot(gs1[0, 1])
# ax2.text(x=0.5, y=0.5, s="ax2", va="center", ha="center")
#
# # Axis handle for plot 3
# ax3 = plt.subplot(gs1[1, 0])
# ax3.text(x=0.5, y=0.5, s="ax3", va="center", ha="center")
#
# # Axis handle for plot 4
# ax4 = plt.subplot(gs1[1, 1])
# ax4.text(x=0.5, y=0.5, s="ax4", va="center", ha="center")
#
# plt.suptitle("Subplot via Gridspec")
# plt.tight_layout()
# plt.subplots_adjust(top=0.90)
# plt.show()

# ## Figure with row/column spans
# # Create the figure
# fig2 = plt.figure(2)
#
# # Create a gridspec object
# gs2 = gs.GridSpec(nrows=3, ncols=3)
#
# # Axis handle for plot 1
# ax1 = plt.subplot(gs2[0, 0:3]) # figure spans 3 columns
# # ax1 = plt.subplot(gs2[0, :]) # same as above
# ax1.text(x=0.5, y=0.5, s="ax1", va="center", ha="center")
#
# # Axis handle for plot 2
# ax2 = plt.subplot(gs2[1, 0:2]) # figure spans 2 columns
# # ax2 = plt.subplot(gs2[1, :-1]) # same as above
# ax2.text(x=0.5, y=0.5, s="ax2", va="center", ha="center")
#
# # Axis handle for plot 3
# ax3 = plt.subplot(gs2[1:3, 2]) # figure spans 2 rows
# # ax3 = plt.subplot(gs2[1:, 2]) # same as above
# ax3.text(x=0.5, y=0.5, s="ax3", va="center", ha="center")
#
# # Axis handle for plot 4
# ax4 = plt.subplot(gs2[2, 0])
# ax4.text(x=0.5, y=0.5, s="ax4", va="center", ha="center")
#
# # Axis handle for plot 5
# ax5 = plt.subplot(gs2[2, 1])
# ax5.text(x=0.5, y=0.5, s="ax5", va="center", ha="center")
#
# plt.suptitle("Subplot via Gridspec with spans")
# plt.tight_layout()
# plt.subplots_adjust(top=0.90)
# plt.show()

## Figure with multiple gridspecs
# Create the figure
fig3 = plt.figure(3)

# Create a gridspec object 1
gs3 = gs.GridSpec(nrows=3, ncols=3)
gs3.update(left=0.05, right=0.48, hspace=0.05)

# Axis handle for plot 1
ax1 = plt.subplot(gs3[0:2, 0:3]) # figure spans 2 rows and 3 columns
# ax1 = plt.subplot(gs2[:2, :]) # same as above
ax1.text(x=0.5, y=0.5, s="ax1", va="center", ha="center")

# Axis handle for plot 2
ax2 = plt.subplot(gs3[2, 0:2]) # figure spans 2 columns
# ax2 = plt.subplot(gs2[2, :-1]) # same as above
ax2.text(x=0.5, y=0.5, s="ax2", va="center", ha="center")

# Axis handle for plot 3
ax3 = plt.subplot(gs3[2, 2]) # figure spans 2 rows
ax3.text(x=0.5, y=0.5, s="ax3", va="center", ha="center")

# # Create a gridspec object 2
gs4 = gs.GridSpec(nrows=3, ncols=3)
gs4.update(left=0.55, right=0.98, hspace=0.05)

# Axis handle for plot 1
ax4 = plt.subplot(gs4[0:2, 0:3]) # figure spans 2 rows and 3 columns
# ax4 = plt.subplot(gs2[:2, :]) # same as above
ax4.text(x=0.5, y=0.5, s="ax4", va="center", ha="center")

# Axis handle for plot 2
ax5 = plt.subplot(gs4[2, 0:2]) # figure spans 2 columns
# ax5 = plt.subplot(gs2[2, :-1]) # same as above
ax5.text(x=0.5, y=0.5, s="ax5", va="center", ha="center")

# Axis handle for plot 3
ax6 = plt.subplot(gs4[2, 2]) # figure spans 2 rows
ax6.text(x=0.5, y=0.5, s="ax6", va="center", ha="center")

plt.suptitle("Subplot via multiple Gridspec with spans")
# plt.tight_layout()
plt.subplots_adjust(top=0.90)
plt.show()