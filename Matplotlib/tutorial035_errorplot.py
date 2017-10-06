# Matplotlib Plotting Tutorials
# Error Plot

import numpy as np
import matplotlib.pyplot as plt

a = 0
b = 10
n = 11

x = np.linspace(a, b, n)
y = x[::-1]
xerr = np.random.rand(n)
yerr = np.random.rand(n)

'''
matplotlib.pyplot.errorbar(x, y, yerr=None, xerr=None, fmt='', ecolor=None, elinewidth=None, capsize=None, 
                            barsabove=False, lolims=False, uplims=False, xlolims=False, xuplims=False, 
                            errorevery=1, capthick=None, hold=None, data=None, **kwargs)
'''

plt.errorbar(x, y,
             xerr=xerr,
             yerr=yerr,
             label='trend',
             fmt='-', color='g',
             ecolor='xkcd:salmon', elinewidth=1.5,
             capsize=5,
             capthick=2,
             errorevery=2
             )
plt.xlabel("Values")
plt.ylabel("Magnitude")
plt.title("Plot of some functions")
plt.xticks()
plt.yticks()
plt.legend()
plt.grid()
plt.show()