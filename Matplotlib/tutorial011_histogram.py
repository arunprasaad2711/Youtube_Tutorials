# Plotting tutorials in Python
# Histogram Plots
# IQ distribution of a random normal population

import numpy as np
import matplotlib.pyplot as plt
import matplotlib as mpl
mpl.style.use('classic')

mean = 100
sd = 15
N = 1000
binsize = 20
IQ = np.random.normal(mean, sd, N)

# plt.hist(IQ, binsize, facecolor='chocolate', label='IQs', normed=True)
counts, bins, extras = plt.hist(IQ, binsize, facecolor='chocolate', label='IQs', normed=False)
plt.plot((bins[1:]+bins[0:-1])*0.5, counts, label='series', color='xkcd:navy blue')
plt.xlabel('IQ')
plt.ylabel('Count/Fraction')
plt.xticks(bins)
plt.title('IQ Distribution Histogram')
plt.grid(True)
plt.legend()
plt.show()