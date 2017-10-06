# Plotting tutorials in Python
# stacked bar chart Plots
# illustration

import numpy as np
import matplotlib.pyplot as plt
import matplotlib as mpl
mpl.style.use('classic')

range_vals = np.linspace(0, 100, 11)

counts1 = np.random.rand(10)*4.0
counts2 = np.random.rand(10)*8.0
counts3 = np.random.rand(10)*2.0
errors = np.ones(10)*0.5
bar_Width = 3.0

mid_vals = (range_vals[0:-1]+range_vals[1:])*0.5 - bar_Width*0.5 # for classic style
# mid_vals = (range_vals[0:-1]+range_vals[1:])*0.5 # for default style
groups = ['g01', 'g02', 'g03', 'g04', 'g05', 'g06', 'g07', 'g08', 'g09', 'g10']

plt.bar(mid_vals, counts1, facecolor='chocolate', width=bar_Width, label='sample bar1', yerr=errors)
# plt.bar(mid_vals, counts2, facecolor='aquamarine', width=bar_Width, label='sample bar2', yerr=errors)
plt.bar(mid_vals, counts2, bottom=counts1, color='aquamarine', width=bar_Width, label='sample bar2', yerr=errors)
plt.bar(mid_vals, counts3, bottom=counts1+counts2, color='beige', width=bar_Width, label='sample bar3', yerr=errors)


plt.xticks(mid_vals+bar_Width*0.5) # for classic style
# plt.xticks(mid_vals) # for default style
plt.xticks(mid_vals+bar_Width*0.5, groups, rotation='45') # for classic style
# plt.xticks(mid_vals, groups, rotation='45') # for default style
# plt.xticks(mid_vals, groups, rotation='vertical')

plt.xlabel('values')
plt.ylabel('Count/Fraction')
plt.title('Stacked Bar chart')
plt.grid(True)
plt.legend()
# plt.axis([0, 100, -10, 10])
plt.show()