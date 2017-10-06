# Matplotlib Plotting Tutorials
# Contour hatching
# Reference: https://matplotlib.org/examples/pylab_examples/contourf_hatching.html
# Legend manipulation: https://stackoverflow.com/questions/4700614/how-to-put-the-legend-out-of-the-plot

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

breaks = np.linspace(-1.0, 1.0, 5)

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
                   cmap='seismic',
                 # colors='k',
                 # colors=('r', 'g', 'b', 'c', 'm', 'y', 'k', 'xkcd:chocolate', 'xkcd:beige', 'xkcd:salmon', 'xkcd:azure'),
                   extend='both', vmin=-1.0, vmax=1.0,
                   hatches=['.', '\\', None, '*', '\\\\']
                   )
plt.colorbar(ticks=breaks, orientation='vertical')
# plt.clabel(CS1, inline=1, fontsize=10,
#                 # manual = manual_locations, # Pass a list of tuples for coordinates of labels
#                 )
artists, labels = CS2.legend_elements()
plt.legend(artists, labels, handleheight=2, loc='lower center',
           ncol=3, framealpha=1.0, fancybox=True, shadow=True,
           bbox_to_anchor=(0.5, -0.4))
plt.xlabel('angles 1')
plt.ylabel('angles 2')
plt.grid()
plt.title('Sine Cosine Wave')
plt.subplots_adjust(bottom=0.26)
plt.show()