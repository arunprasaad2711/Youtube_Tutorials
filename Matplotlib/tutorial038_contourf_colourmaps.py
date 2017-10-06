# Matplotlib Plotting Tutorials
# Colour Maps in Matplotlib
# Reference : https://matplotlib.org/examples/color/colormaps_reference.html

'''
==================
Colormap reference
==================

Reference for colormaps included with Matplotlib.

This reference example shows all colormaps included with Matplotlib. Note that
any colormap listed here can be reversed by appending "_r" (e.g., "pink_r").
These colormaps are divided into the following categories:

Sequential:
    These colormaps are approximately monochromatic colormaps varying smoothly
    between two color tones---usually from low saturation (e.g. white) to high
    saturation (e.g. a bright blue). Sequential colormaps are ideal for
    representing most scientific data since they show a clear progression from
    low-to-high values.

Diverging:
    These colormaps have a median value (usually light in color) and vary
    smoothly to two different color tones at high and low values. Diverging
    colormaps are ideal when your data has a median value that is significant
    (e.g.  0, such that positive and negative values are represented by
    different colors of the colormap).

Qualitative:
    These colormaps vary rapidly in color. Qualitative colormaps are useful for
    choosing a set of discrete colors. For example::

        color_list = plt.cm.Set3(np.linspace(0, 1, 12))

    gives a list of RGB colors that are good for plotting a series of lines on
    a dark background.

Miscellaneous:
    Colormaps that don't fit into the categories above.

# Have colormaps separated into categories:
# http://matplotlib.org/examples/color/colormaps_reference.html
cmaps = [('Perceptually Uniform Sequential', [
            'viridis', 'plasma', 'inferno', 'magma']),
         ('Sequential', [
            'Greys', 'Purples', 'Blues', 'Greens', 'Oranges', 'Reds',
            'YlOrBr', 'YlOrRd', 'OrRd', 'PuRd', 'RdPu', 'BuPu',
            'GnBu', 'PuBu', 'YlGnBu', 'PuBuGn', 'BuGn', 'YlGn']),
         ('Sequential (2)', [
            'binary', 'gist_yarg', 'gist_gray', 'gray', 'bone', 'pink',
            'spring', 'summer', 'autumn', 'winter', 'cool', 'Wistia',
            'hot', 'afmhot', 'gist_heat', 'copper']),
         ('Diverging', [
            'PiYG', 'PRGn', 'BrBG', 'PuOr', 'RdGy', 'RdBu',
            'RdYlBu', 'RdYlGn', 'Spectral', 'coolwarm', 'bwr', 'seismic']),
         ('Qualitative', [
            'Pastel1', 'Pastel2', 'Paired', 'Accent',
            'Dark2', 'Set1', 'Set2', 'Set3',
            'tab10', 'tab20', 'tab20b', 'tab20c']),
         ('Miscellaneous', [
            'flag', 'prism', 'ocean', 'gist_earth', 'terrain', 'gist_stern',
            'gnuplot', 'gnuplot2', 'CMRmap', 'cubehelix', 'brg', 'hsv',
            'gist_rainbow', 'rainbow', 'jet', 'nipy_spectral', 'gist_ncar'])]

'''

import numpy as np
import matplotlib.pyplot as plt
import matplotlib

matplotlib.style.use('default')

n1 = 101
n2 = 51

x1 = np.linspace(0, 2.0*np.pi, n1)
x2 = np.linspace(0, 2.0*np.pi, n2)

X1, X2 = np.meshgrid(x1, x2)

Z = np.sin(X1)*np.cos(X2)

breaks1 = np.linspace(-1.0, 1.0, 10)
breaks2 = np.linspace(0.0, 2.0, 10)

matplotlib.rcParams['contour.negative_linestyle'] = 'solid'

plt.figure(figsize=(12,8))
plt.subplot(221)
CS1 = plt.contour(x1, x2, Z,
                 breaks1,
                 # cmap='seismic',
                 colors='k',
                 # colors=('r', 'g', 'b', 'c', 'm', 'y', 'k', 'xkcd:chocolate', 'xkcd:beige', 'xkcd:salmon', 'xkcd:azure'),
                 extend='both', vmin=-1.0, vmax=1.0
                 )
CS2 = plt.contourf(x1, x2, Z,
                   breaks1,
                   cmap='seismic',
                 # colors='k',
                 # colors=('r', 'g', 'b', 'c', 'm', 'y', 'k', 'xkcd:chocolate', 'xkcd:beige', 'xkcd:salmon', 'xkcd:azure'),
                   extend='both', vmin=-1.0, vmax=1.0
                   )
plt.colorbar(ticks=breaks1, orientation='vertical')
plt.clabel(CS1, inline=1, fontsize=10,
                # manual = manual_locations, # Pass a list of tuples for coordinates of labels
                )
plt.xlabel('angles 1')
plt.ylabel('angles 2')
plt.grid()
plt.title('Sine Cosine Wave - Diverging')

plt.subplot(222)
CS1 = plt.contour(x1, x2, Z+1,
                 breaks2,
                 # cmap='seismic',
                 colors='k',
                 # colors=('r', 'g', 'b', 'c', 'm', 'y', 'k', 'xkcd:chocolate', 'xkcd:beige', 'xkcd:salmon', 'xkcd:azure'),
                 extend='both', vmin=0.0, vmax=2.0
                 )
CS2 = plt.contourf(x1, x2, Z+1,
                   breaks2,
                 # cmap='RdBu_r',
                   cmap='Greys',
                 # colors='k',
                 # colors=('r', 'g', 'b', 'c', 'm', 'y', 'k', 'xkcd:chocolate', 'xkcd:beige', 'xkcd:salmon', 'xkcd:azure'),
                   extend='both', vmin=0.0, vmax=2.0
                   )
plt.colorbar(ticks=breaks2, orientation='vertical')
plt.clabel(CS1, inline=1, fontsize=10,
                # manual = manual_locations, # Pass a list of tuples for coordinates of labels
                )
plt.xlabel('angles 1')
plt.ylabel('angles 2')
plt.grid()
plt.title('Sine Cosine Wave - Sequential')

plt.subplot(223)
CS1 = plt.contour(x1, x2, Z,
                 breaks1,
                 # cmap='seismic',
                 colors='k',
                 # colors=('r', 'g', 'b', 'c', 'm', 'y', 'k', 'xkcd:chocolate', 'xkcd:beige', 'xkcd:salmon', 'xkcd:azure'),
                 extend='both', vmin=-1.0, vmax=1.0
                 )
CS2 = plt.contourf(x1, x2, Z,
                   breaks1,
                   cmap='Accent',
                 # colors='k',
                 # colors=('r', 'g', 'b', 'c', 'm', 'y', 'k', 'xkcd:chocolate', 'xkcd:beige', 'xkcd:salmon', 'xkcd:azure'),
                   extend='both', vmin=-1.0, vmax=1.0
                   )
plt.colorbar(ticks=breaks1, orientation='vertical')
plt.clabel(CS1, inline=1, fontsize=10,
                # manual = manual_locations, # Pass a list of tuples for coordinates of labels
                )
plt.xlabel('angles 1')
plt.ylabel('angles 2')
plt.grid()
plt.title('Sine Cosine Wave - Qualitative')

plt.subplot(224)
CS1 = plt.contour(x1, x2, Z+1,
                 breaks2,
                 # cmap='seismic',
                 colors='k',
                 # colors=('r', 'g', 'b', 'c', 'm', 'y', 'k', 'xkcd:chocolate', 'xkcd:beige', 'xkcd:salmon', 'xkcd:azure'),
                 extend='both', vmin=0.0, vmax=2.0
                 )
CS2 = plt.contourf(x1, x2, Z+1,
                   breaks2,
                 # cmap='RdBu_r',
                   cmap='rainbow',
                 # colors='k',
                 # colors=('r', 'g', 'b', 'c', 'm', 'y', 'k', 'xkcd:chocolate', 'xkcd:beige', 'xkcd:salmon', 'xkcd:azure'),
                   extend='both', vmin=0.0, vmax=2.0
                   )
plt.colorbar(ticks=breaks2, orientation='vertical')
plt.clabel(CS1, inline=1, fontsize=10,
                # manual = manual_locations, # Pass a list of tuples for coordinates of labels
                )
plt.xlabel('angles 1')
plt.ylabel('angles 2')
plt.grid()
plt.title('Sine Cosine Wave - Miscellaneous')

plt.tight_layout()
plt.show()