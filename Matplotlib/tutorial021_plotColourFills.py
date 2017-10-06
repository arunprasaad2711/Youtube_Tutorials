# Plotting tutorials in Python
# Fill colours inside plots

import numpy as np
import matplotlib.pyplot as plt
import matplotlib as mpl
mpl.style.use('default')

x = np.linspace(-2.0*np.pi, 2.0*np.pi, 201)
C, S = np.cos(x), np.sin(x)

plt.plot(x, C, color='g', label='Cosine')
plt.plot(x, S, color='r', label='Sine')

# Upper value fill: xvalues, Boundary Curve 1 and Boundary Curve 2
# curves can be in any order
# Simply: area above the curve from a reference above the curve
# plt.fill_between(x, S, 1)

# mid value fill: xvalues, Boundary Curve 1 and Boundary Curve 2
# Simply: area under the curve with the reference intersecting the curve
# plt.fill_between(x, 0, S)

# lower value fill: xvalues, Boundary Curve 1 and Boundary Curve 2
# Simply: area below the curve from a reference below the curve
# plt.fill_between(x, -1, S)

# Area between curves
# Simply: Area between the curves
# plt.fill_between(x, S, C, color='orange', alpha=0.3)

# Area between curves
# Limited regions
# plt.fill_between(x[20:41], C[20:41], S[20:41], color='red', alpha=0.7)

# Using where option
# plt.fill_between(x, C, S, where=C>=S, color='green', alpha=0.3)
# plt.fill_between(x, C, S, where=C<=S, color='red', alpha=0.3)

# using interpoldiff = C-S
plt.fill_between(x, C, S, where=(C>=S), color='green', alpha=0.3, interpolate=True)
plt.fill_between(x, C, S, where=(C<=S), color='red', alpha=0.3, interpolate=True)

plt.grid()
plt.legend()
plt.title('Sample Sine and Cosine curves')
plt.show()