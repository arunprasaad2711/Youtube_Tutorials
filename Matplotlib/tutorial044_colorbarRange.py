
'''
Code taken from https://stackoverflow.com/questions/33873397/nonlinear-colormap-with-matplotlib?lq=1

README:
    I do not claim to be the owner of this PiecewiseNorm class. It belongs to the author (ali_m) and I am merely using
    his code. Since the code is available in Stackoverflow, my understanding is that the author has no issue with people
    using this code. Anyway, as a token of appreciation, I would have linked this youtube tutorial as a thank you in the
    comment section of his answer in the Stackoverflow page, and to acknowledge and give due credit to his work.

    If this code works for you, do not thank me! Thank him!

    However, if it does not work, drop a comment in my channel or in the github page and at what circumstances it did not
    work. I'll work on it more / search extensively and come back to you.

    I tried my best to understand it and got some rudimentary understanding. But, it is incomplete. Being sleep-deprived
    when I made this tutorial, I decided to not push myself after reading and understanding this and other answers and
    documentations for 6 straight hours.

    If I find or make a simpler method, I will make a new video.

    That being said, I tested this code for contours with random numbers and mathematical functions and it works well.
    Added to that, I manually tested this code for the specified colormaps and mentioned my observations.

    As the author claims, this normalization works well for any colormap and if the plot turns shabby or ugly, it is
    primarily due to the choice of colormap or the distribution of data in the contour plot.

    On a final note, This was a bugging topic for me! I am glad I found a fix! Hopefully, in the near future, I understand
    the details behind it even better.

Supplementary reads:
    https://matplotlib.org/api/_as_gen/matplotlib.pyplot.contourf.html#matplotlib.pyplot.contourf
    https://matplotlib.org/api/_as_gen/matplotlib.colors.Normalize.html#matplotlib.colors.Normalize
    https://matplotlib.org/api/_as_gen/matplotlib.colors.PowerNorm.html
    https://matplotlib.org/examples/color/colormaps_reference.html
'''

'''
# Matplotlib Plotting Tutorials
# Custom Tweaking colorbar ranges

To adjust the tick marks and colour - data ranges as per user requirement for enhanced plots.
- Custom linear and non-linear ranges
- User control of limits
- Best use of the colormap
- Aesthetically pleasing, readable, and distinct plots

'''

import numpy as np
import matplotlib.pyplot as plt
from matplotlib.colors import Normalize


class PiecewiseNorm(Normalize):
    def __init__(self, levels, clip=False):
        # the input levels
        self._levels = np.sort(levels)
        # corresponding normalized values between 0 and 1
        self._normed = np.linspace(0, 1, len(levels))
        Normalize.__init__(self, None, None, clip)

    def __call__(self, value, clip=None):
        # linearly interpolate to get the normalized value
        return np.ma.masked_array(np.interp(value, self._levels, self._normed))

# Setting up grid points
x = np.linspace(-3, 3, 101)
y = np.linspace(-3, 3, 101)
xx, yy = np.meshgrid(x, y)

# Sample Data
field = 500.0 * np.exp( -(xx**2 + yy**2) / 2.0 )

# Settings for levels in contour plot
# levels = np.linspace(0, 500, 11)
# levels = [0, 20, 40, 60, 80, 100, 150, 200, 250, 300, 350, 400, 410, 420, 430, 470, 500]
# levels = [0, 20, 40, 60, 80, 100, 200, 300, 400, 450, 500]
levels = [0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 150, 200, 250, 300, 350, 400, 450, 500]
levels_ticks = [0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 150, 200, 250, 300, 350, 400, 450, 500]
# levels_ticks = [10, 30, 50, 70, 90, 150, 250, 350, 450]

# Colormap - Levels mapping normalizer object
norm_levels = PiecewiseNorm(levels)

# variables inside the mapping class
print(norm_levels._levels)
print(norm_levels._normed)
print(norm_levels(levels))

# Colorbar / Colormap limits
clim = [0, 500]

# colormap
# # Perceptually uniform Sequential Colormaps - mixed results
# cmap = "plasma"
# cmap = "viridis"
#
# # Sequential Colormaps - Poor distinction by default - best test case for distinction
# cmap = "Greys"
# cmap = "GnBu"
# cmap = "YlOrBr"
#
# # Sequential 2 Colormaps - Poor distinction by default - best test case for distinction
# cmap = "gist_heat"
# cmap = "summer"
# cmap = "cool"
#
# # Diverging colormaps - Hit/miss distinctions - Distinctions become sharper or poorer based on colormap
# cmap = "seismic" # poor distinction
# cmap = "PuOr" # sharp distinction
# cmap = "RdYlGn" # sharp distinction
# cmap = "Spectral" # sharp distinction
#
# # Qualitative - Interesting choices.
# cmap = "Pastel2"
# cmap = "Set3"
#
# # Misc. colormaps - moderate to sharp distinctions
# cmap = "ocean"
# cmap = "terrain"
# cmap = "gnuplot2"
# cmap = "prism" # this is an interesting colormap
cmap = "jet"

plt.figure()

# Default setting plot
# Good for simple plots.
# Works well for linear ranges
# But, if the range changes the behavior modifies
# accordingly. Causes aesthetic problems for user and is inconsistent
# when limits change dynamically.
plt.subplot(2,2,1)
plt.contourf(xx, yy, field, cmap=cmap)
plt.title("Default Setting - no user control")
plt.colorbar()

# Increased more levels and bounds
# Ticks and bounds make the plots consistent
# Works well for linear ranges
# Distinction suffers for non-linear tickmarks
# Linear colormap is mapped linearly to a linear levels list
# Hence, we need to manually specify levels or make levels non-linear
plt.subplot(2,2,2)
plt.contourf(xx, yy, field, 11, clim=clim, cmap=cmap)
plt.title("Distinction worse for close ranges")
plt.colorbar(ticks=levels)

# Manually specified levels and bounds
# Using levels as ticks and bounds make the plots consistent
# Works well for linear and non-linear ranges
# Distinction is better than previous, But we do not use the full colormap
# Distinction inequality
# Linear colormap is mapped linearly to a non-linear/manually specified levels list
# Hence, we need to re-adjust the colormap colours to map better.
plt.subplot(2,2,3)
plt.contourf(xx, yy, field, levels, clim=clim, cmap=cmap)
plt.title("Distinction unbalanced; partial colourmap used")
plt.colorbar(ticks=levels)

# Manually specified levels and bound with piecewise normalization.
# Normalized levels to match with the colormap
# Linear colormap is mapped non-linearly to a non-linear/manually specified levels list
# Using levels as ticks and bounds make the plots consistent
# Works well for linear and non-linear ranges
# Distinctions clear!
plt.subplot(2,2,4)
plt.contourf(xx, yy, field, levels, clim=clim, cmap=cmap, norm=norm_levels)
# plt.colorbar(ticks=levels)
plt.colorbar(ticks=levels_ticks)
plt.title("Perfect Customization")
plt.tight_layout()
plt.show()


