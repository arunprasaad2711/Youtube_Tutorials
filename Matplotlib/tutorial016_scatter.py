# Plotting tutorials in Python
# Scatter Plot Illustration
# sine scatter plot

import numpy as np
import matplotlib.pyplot as plt
import matplotlib as mpl
mpl.style.use('default')

N = 1001
X = np.linspace(-2.0*np.pi, 2.0*np.pi, N)
# Y = np.sin(X)
Y = np.random.normal(0, 1, N) + np.sin(X)

# Default
# plt.scatter(X, Y)

# Some additions : label, marker, marker colour
# For different Marker styles : https://matplotlib.org/api/markers_api.html
plt.scatter(X, Y, label='sine scatter', marker='*', c='chocolate')

# marker size = in area of pixels! not mere size of pixel
# More fancier additions: marker size, edge colour, transparency, edgewidth
# marker size is in area of pixels! so, specify a large value
# plt.scatter(X, Y, label='sine scatter', marker='p', c='chocolate',
#            s=1000, edgecolors='blue', alpha=0.5,
#            linewidths=1.5)

plt.xlabel('Angles')
plt.ylabel('Plots')
plt.title('Sample Scatter Plot: ')
plt.grid(True)
plt.legend()
plt.show()