# Matplotlib Plotting Tutorials
# Custom Colourmaps Linear

import numpy as np
import matplotlib
import matplotlib.pyplot as plt
from matplotlib.colors import LinearSegmentedColormap, to_rgb

# Steps in creating your own custom linear colourmap
# Step 1 : Create a list or tuple of colour coordinates in RGB - normalized to 1.0

# Illustration
# colours = (
#     (0.5, 0.7, 0.9), (0.7, 0.1, 1.0)
# )

# xkcd colours
# https://xkcd.com/color/rgb/
colours1 = (
    to_rgb("#ff81c0"), # pink
    to_rgb("#cea2fd"), # lilac
    to_rgb("#000000"), # black
    to_rgb("#a83c09"), # rust
    to_rgb("#ffffff"), # white
    to_rgb("#1e488f"), # cobalt
    to_rgb("#b66a50"), # clay
)

# Step 2 : Call the linear segmented colourmap class
mycmap1 = LinearSegmentedColormap.from_list("", colours1, N=len(colours1), gamma=1.0)


# custom colour map creator function
def colourmap_from_list(fname, fpath="/home/arun/anaconda3/lib/ncarg/colormaps/", skiprows=2):
    import numpy as np
    from matplotlib.colors import LinearSegmentedColormap

    colour_list_file = fpath + fname

    colours = np.loadtxt(colour_list_file, skiprows=skiprows) / 255.0
    cmap = LinearSegmentedColormap.from_list("", colours, N=len(colours), gamma=1.0)

    return  cmap

# Imported colourmap
mycmap2 = colourmap_from_list(fname = "precip2_17lev.rgb", skiprows=6)

n1 = 101
n2 = 101

x1 = np.linspace(0, 2.0*np.pi, n1)
x2 = np.linspace(0, 2.0*np.pi, n2)

X1, X2 = np.meshgrid(x1, x2)

Z = np.sin(X1)*np.cos(X2)

breaks = np.linspace(-1.0, 1.0, 30)

matplotlib.rcParams['contour.negative_linestyle'] = 'solid'

plt.figure()
CS1 = plt.contour(x1, x2, Z,
                 breaks,
                 # cmap='seismic',
                 colors='k',
                 # colors=('r', 'g', 'b', 'c', 'm', 'y', 'k', 'xkcd:chocolate', 'xkcd:beige', 'xkcd:salmon', 'xkcd:azure'),
                 extend='both', vmin=-1.0, vmax=1.0
                 )
CS2 = plt.contourf(x1, x2, Z,
                   breaks,
                 # cmap='RdBu_r',
                   cmap=mycmap2,
                 # colors='k',
                 # colors=('r', 'g', 'b', 'c', 'm', 'y', 'k', 'xkcd:chocolate', 'xkcd:beige', 'xkcd:salmon', 'xkcd:azure'),
                   extend='both', vmin=-1.0, vmax=1.0
                   )
plt.colorbar(ticks=breaks, orientation='vertical')
plt.clabel(CS1, inline=1, fontsize=10,
                # manual = manual_locations, # Pass a list of tuples for coordinates of labels
                )
plt.xlabel('angles 1')
plt.ylabel('angles 2')
plt.grid()
plt.title('Sine Cosine Wave')
plt.show()
