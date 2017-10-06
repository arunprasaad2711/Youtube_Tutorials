# Plotting tutorials in Python
# Plot Styles

import numpy as np
import matplotlib.pyplot as plt
import matplotlib as mpl
mpl.style.use('ggplot')
print(mpl.style.available)

x = np.linspace(-2.0*np.pi, 2.0*np.pi, 201)
y = np.sin(x)
z = np.cos(x)

plt.plot(x, y, color='r', label='sin')
plt.plot(x, z, color='g', label='cos')

plt.xlabel('angle')
plt.ylabel('magnitude')
plt.title('plot of sine and cosine')
plt.grid(True)
plt.legend()
plt.show()