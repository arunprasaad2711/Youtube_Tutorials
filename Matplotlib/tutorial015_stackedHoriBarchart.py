# Plotting tutorials in Python
# stacked horizontal bar chart Plots
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
bar_Width = 5.0

# mid_vals = (range_vals[0:-1]+range_vals[1:])*0.5 - bar_Width*0.5 # for classic style
mid_vals = (range_vals[0:-1]+range_vals[1:])*0.5 # for default style
groups = ['g01', 'g02', 'g03', 'g04', 'g05', 'g06', 'g07', 'g08', 'g09', 'g10']

plt.barh(mid_vals, counts1, facecolor='chocolate', align='center', height=bar_Width, label='sample bar1', xerr=errors)
# plt.barh(mid_vals, counts2, facecolor='aquamarine', align='center', height=bar_Width, label='sample bar2', xerr=errors)
plt.barh(mid_vals, counts2, left=counts1, align='center', facecolor='aquamarine', height=bar_Width-1, label='sample bar2', xerr=errors)
plt.barh(mid_vals, counts3, left=counts1+counts2, color='beige', align='center',height=bar_Width-2, label='sample bar3', xerr=errors)

# plt.yticks(mid_vals+bar_Width*0.5) # for classic style
# plt.yticks(mid_vals) # for default style
# plt.yticks(mid_vals+bar_Width*0.5, groups, rotation='45') # for classic style
plt.yticks(mid_vals, groups, rotation='horizontal') # for default style

plt.ylabel('values')
plt.xlabel('Count/Fraction')
plt.title('Stacked Horizontal Bar chart')
plt.grid(True)
plt.legend()
# plt.axis([0, 100, -10, 10])
plt.show()