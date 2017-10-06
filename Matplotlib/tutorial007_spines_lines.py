# Plotting tutorials in Python
# Moving X and Y axis positions

import numpy as np
import matplotlib.pyplot as plt

x = np.linspace(-2.0*np.pi, 2.0*np.pi, 201)
y = np.sin(x)
z = np.cos(x)

plt.plot(x, y, color='r', label='sin')
plt.plot(x, z, color='g', label='cos')

# push the x axis up
plt.axes().spines['bottom'].set_position(('data', 0))

# push the y axis right
plt.axes().spines['left'].set_position(('data', 0))

# add a horizontal line at the bottom
# plt.axhline(y=-1)
plt.axhline(y=plt.ylim()[0], color='k') # plt.ylim() returns a tuple (ymin, ymax)
# k - black; or just black

# add a vertical line at the left
# plt.axvline(x=-7)
plt.axvline(x=plt.xlim()[0], color='black') # plt.xlim() returns a tuple (xmin, xmax)
# k - black; or just black

plt.xlabel('angle')
plt.ylabel('magnitude')
plt.title('plot of sine and cosine')
plt.grid()
plt.legend()
plt.show()