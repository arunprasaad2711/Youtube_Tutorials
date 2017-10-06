# Plotting tutorials in Python
# Line colours

"""
Colouring options:
    one of {'b',    'g',     'r',   'c',    'm',       'y',      'k'    , 'w'}
    one of {'blue', 'green', 'red', 'cyan', 'magenta', 'yellow', 'black', 'white'}
    an RGB or RGBA tuple of float values in [0, 1] (e.g., (0.1, 0.2, 0.5) or (0.1, 0.2, 0.5, 0.3))
    a hex RGB or RGBA string (e.g., '#0F0F0F' or '#0F0F0F0F')
    a string representation of a float value in [0, 1] inclusive for gray level (e.g., '0.5')
    a X11/CSS4 color name
    a name from the xkcd color survey prefixed with 'xkcd:' (e.g., 'xkcd:sky blue')
    one of {'C0', 'C1', 'C2', 'C3', 'C4', 'C5', 'C6', 'C7', 'C8', 'C9'}
    one of {'tab:blue', 'tab:orange', 'tab:green', 'tab:red', 'tab:purple', 'tab:brown',
            'tab:pink', 'tab:gray', 'tab:olive', 'tab:cyan'}
    which are the Tableau Colors from the ‘T10’ categorical palette (which is the default color cycle).
"""
"""
Sources:
    https://matplotlib.org/users/colors.html
    https://matplotlib.org/api/colors_api.html
    https://xkcd.com/color/rgb/
    https://www.w3.org/TR/css-color-4/
    https://matplotlib.org/examples/color/named_colors.html
"""

import numpy as np
import matplotlib.pyplot as plt
import matplotlib._color_data as mcd
import matplotlib as mpl

x = np.linspace(-2.0*np.pi, 2.0*np.pi, 201)
y = np.sin(x)

# axis line
plt.axhline(y=0, color='k')
plt.axvline(x=0, color='k')

# short hand standard colour notation
# plt.plot(x, y, color='g', label='sin')

# full hand standard colour notation
# plt.plot(x, y, color='blue', label='sin')

# RGB values: 0 - no colour, 1 - full colour
# plt.plot(x, y, color=(0.5, 0.1, 1), label='sin')

# RGB normalization - divide each entry by 255
# plt.plot(x, y, color=(183/255, 20/255, 169/255), label='sin')

# RGBA values: 1 - opaque, 0 - full transparency
# plt.plot(x, y, color=(0.5, 0.4, 0.1, 0.5), label='sin')

# RGBA normalization - divide RGB values by 255, and transparency by 100
# plt.plot(x, y, color=(183/255, 20/255, 169/255, 10/100), label='sin')

# RGB/RGBA hex string values - both upper and lower cases
# plt.plot(x, y, color='#B714A9', label='sin')
# plt.plot(x, y, color='#b714a945', label='sin')

# Gray scale: 0 - black, 1 - white
# plt.plot(x, y, color='0', label='sin')

# CSS4 Colours
# plt.plot(x, y, color=mcd.CSS4_COLORS['chocolate'], label='sin')
# plt.plot(x, y, color='chocolate', label='sin')
# print(mcd.CSS4_COLORS.items())

# Tableau Colours
# plt.plot(x, y, color=mcd.TABLEAU_COLORS['tab:olive'], label='sin')
# plt.plot(x, y, color='tab:beige', label='sin')
# print(mcd.TABLEAU_COLORS.items())

# XKCD Colours
# plt.plot(x, y, color=mcd.XKCD_COLORS['xkcd:navy blue'], label='sin')
# plt.plot(x, y, color='xkcd:navy blue', label='sin')
# print(mcd.XKCD_COLORS.items())

# Plot style colours
# 'C0', 'C1', 'C2', 'C3', 'C4', 'C5', 'C6', 'C7', 'C8', 'C9'
# mpl.style.use('ggplot')
plt.plot(x, y, color='C0', label='sin')
# print(mpl.style.available)

plt.xlabel('angle')
plt.ylabel('magnitude')
plt.title('plot of sine and cosine')
plt.grid()
plt.legend()
plt.show()