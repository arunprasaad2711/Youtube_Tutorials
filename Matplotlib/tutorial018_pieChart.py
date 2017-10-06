# Plotting tutorials in Python
# Pie Chart
# Linux Users in an online survey
# Source:
# https://brashear.me/blog/2015/08/24/results-of-the-2015-slash-r-slash-linux-distribution-survey/

import numpy as np
import matplotlib.pyplot as plt
import matplotlib as mpl
mpl.style.use('default')

'''
Arch Linux  	881
Ubuntu      	697	  
Debian	        308	  
Fedora	        262	  
Linux Mint	    209	  
Xubuntu	        117	  
Kubuntu	        99	  
Gentoo	        97	  
OpenSUSE	    58	  
Other	        366	  
'''

# Slice names
Distros = \
[
    'Arch Linux', 'Ubuntu', 'Debian',
    'Fedora', 'Linux Mint', 'Xubuntu',
    'Kubuntu', 'Gentoo', 'OpenSUSE', 'Other'
]

# Slice Colours
Colours = \
[
    'blue', 'orange', 'red', 'purple', 'green',
    'chocolate', 'beige', 'cyan', 'magenta', 'grey'
]

# Slice Data
Users = np.array([881, 697, 308, 262, 209, 117, 99, 97, 58, 366])

# Slice cut array
Explodes = np.zeros(10)
Explodes[1] = 0.1
# Explodes[5] = 0.2
# Explodes[6] = 0.3

# Default
# plt.pie(Users, labels=Distros)
# Centre is at (0, 0), Default pie radius = 1

# plt.axis([-1.5, 1.5, -1.5, 1.5])
# plt.pie(Users,                    # Slice Data
#         labels=Distros,           # Slice labels
#         colors=Colours,           # Slice Colours
#         startangle=90 ,            # Start angle for pie chart in ccw
#         shadow=True,              # Enable, disable shadow
#         explode=Explodes,         # Explode pieces
#         radius=1.0,                 # radius of pie chart
#         autopct='%2.3f%%',        # percentage format to display
#         pctdistance=0.6,          # distance from centre to display percentage
#         labeldistance=1.1,        # distance from centre to display label
#         counterclock=False,       # pie chart formation sense
#         frame=True               # fancy frame
#           )

# Function to display values and percentage
# Source:
#   http://stackoverflow.com/questions/6170246/how-do-i-use-matplotlib-autopct
def make_autopct(values):
    def my_autopct(pct):
        total = sum(values)
        val = int(round(pct*total/100.0))
        return '{p:.2f}%  ({v:d})'.format(p=pct,v=val)
    return my_autopct


plt.pie(Users,                    # Slice Data
        labels=Distros,           # Slice labels
        colors=Colours,           # Slice Colours
        startangle=90,            # Start angle for pie chart in ccw
        shadow=True,              # Enable, disable shadow
        explode=Explodes,         # Explode pieces
        radius=1,                 # radius of pie chart
        autopct=make_autopct(Users), # place percentage and number
        pctdistance=0.6,          # distance from centre to display percentage
        labeldistance=1.1,        # distance from centre to display label
        counterclock=False,       # pie chart formation sense
        frame=True)              # fancy frame

plt.title('Piechart: Linux Distro Popularity in a community')
# plt.axes(aspect=1)                # to make the chart circular
plt.axis('equal')                   # to make the chart circular
# plt.legend()
plt.xticks([])
plt.yticks([])
plt.show()