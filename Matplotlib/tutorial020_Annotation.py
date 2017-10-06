# Plotting tutorials in Python
# Adding Annotation in Plots
# https://matplotlib.org/api/pyplot_api.html#matplotlib.pyplot.annotate
# For the arrow properties
# https://matplotlib.org/api/patches_api.html#matplotlib.patches.FancyArrowPatch

import numpy as np
import matplotlib.pyplot as plt
import matplotlib as mpl
mpl.style.use('default')

x = np.linspace(0, 2.0*np.pi, 101)
C, S = np.cos(x), np.sin(x)

plt.plot(x, C, color='r', label='Cosine')
plt.plot(x, S, color='g', label='Sine')

plt.plot(0.5*np.pi, np.sin(0.5*np.pi), 'bo')
plt.plot(1.5*np.pi, np.sin(1.5*np.pi), 'ko')
# plt.plot(0.0*np.pi, np.cos(0.0*np.pi), 'ko')
# plt.plot(1.0*np.pi, np.cos(1.0*np.pi), 'ko')

plt.annotate(s='sine local maxima',                                   # text to display
             xy=(0.5*np.pi, np.sin(0.5*np.pi)),                       # point to annotate
             xytext=(1.0*np.pi, 0.75),                   # the coordinate for the text to start
             arrowprops=dict(facecolor='blue', shrink=1.0),         # arrow properties dictionary
             )
plt.annotate(s='sine local minima',
             xy=(1.5*np.pi, np.sin(1.5*np.pi)),
             xytext=(1.5*np.pi-0.5, np.sin(1.5*np.pi)+0.5),
             arrowprops=dict(facecolor='black', shrink=0.05),
            )

plt.grid()
plt.legend()
plt.title('Sample Sine and Cosine curves')
plt.show()