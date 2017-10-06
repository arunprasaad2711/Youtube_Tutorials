# Plotting tutorials in Python
# Adding Multiple plots by twin x axis
# Good for plots having different y axis range
# Separate axes and figure objects
# replicate axes object and plot curves
# use axes to set attributes

import numpy as np
import matplotlib.pyplot as plt

x = np.linspace(0, 2.0*np.pi, 101)
y = np.sin(x)
z = np.sinh(x)

# values for making ticks in x and y axis
xnumbers = np.linspace(0, 7, 15)
ynumbers1 = np.linspace(-1, 1, 11)
ynumbers2 = np.linspace(0, 300, 7)

# separate the figure object and axes object
# from the plotting object
fig, ax1 = plt.subplots()

# Duplicate the axes with a different y axis
# and the same x axis
ax2 = ax1.twinx() # ax2 and ax1 will have common x axis and different y axis

# plot the curves on axes 1, and 2, and get the axes handles
curve1, = ax1.plot(x, y, label="sin", color='r')
curve2, = ax2.plot(x, z, label="sinh", color='b')

# Make a curves list to access the parameters in the curves
curves = [curve1, curve2]

# add legend via axes 1 or axes 2 object.
# one command is usually sufficient
# ax1.legend() # will not display the legend of ax2
# ax2.legend() # will not display the legend of ax1
ax1.legend(curves, [curve.get_label() for curve in curves])
# ax2.legend(curves, [curve.get_label() for curve in curves]) # also valid

# x axis label via the axes
# one command is usually sufficient
ax1.set_xlabel("Angle/Value", color=curve1.get_color())
# ax2.set_xlabel("Angle/Value", color=curve2.get_color()) # also valid # does not work
# ax2 has no property control over x axis w.r.t. label, grid, and colour

# y axis label via the axes
ax1.set_ylabel("Magnitude", color=curve1.get_color())
ax2.set_ylabel("Magnitude", color=curve2.get_color()) # also valid

# y ticks - make them coloured as well
ax1.tick_params(axis='y', colors=curve1.get_color())
ax2.tick_params(axis='y', colors=curve2.get_color())

# x axis ticks via the axes
# one command is usually sufficient
ax1.tick_params(axis='x', colors=curve1.get_color())
# ax2.tick_params(axis='x', colors=curve2.get_color()) # also valid # does not work
# ax2 has no property control over x axis

'''
# Alternate approach
# colour for x axis labels
# since this is common, use global or figure properties
ax1.xaxis.label.set_color(curve1.get_color())
ax2.xaxis.label.set_color(curve2.get_color()) # also valid

# colour for y axis labels
ax1.yaxis.label.set_color(curve1.get_color())
ax2.yaxis.label.set_color(curve2.get_color())
'''

# set x ticks
# one command is usually sufficient
ax1.set_xticks(xnumbers)
# ax2.set_xticks(xnumbers) # also valid # surprisingly works

# set y ticks
ax1.set_yticks(ynumbers1)
ax2.set_yticks(ynumbers2)

# Grids via axes 1 # use this if axes 1 is used to
# define the properties of common x axis
ax1.grid(color=curve1.get_color())

# To make grids using axes 2
# ax1.grid(color=curve2.get_color())
# ax2.grid(color=curve2.get_color())
# ax1.yaxis.grid(False)

# Global figure properties
plt.title("Plot of sine and hyperbolic sine")
plt.show()