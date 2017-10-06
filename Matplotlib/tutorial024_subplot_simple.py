# Matplotlib Plotting Tutorials
# Subplots - part 1 - simple controls

import numpy as np
import matplotlib.pyplot as plt
import matplotlib as mpl

mpl.style.use('default')

n = 201
x = np.linspace(0, 4.0*np.pi, n)
y1 = np.sin(x)
y2 = np.cos(x)
y3 = y1 + y2

# Opening a figure
# Not needed for this example, but preferred for organization
plt.figure()

# Plot 1 - sine curve
plt.subplot(311) # plt.subplot(3,1,1)
plt.plot(x, y1, color='xkcd:azure', linestyle='--', label='sine')
# plt.title("Simple Sine Plot")
plt.title("Simple Sine, Cosine Plot")
# plt.xlabel('Angle')
plt.ylabel('Magnitude')
plt.grid()
plt.legend()

# Plot 2 - cosine curve
plt.subplot(312) # plt.subplot(3,1,2)
plt.plot(x, y2, color='xkcd:salmon', linestyle='-', label='cosine')
# plt.title("Simple Cosine Plot")
# plt.xlabel('Angle')
plt.ylabel('Magnitude')
plt.grid()
plt.legend()

# Plot 3 - sine+cosine curve
plt.subplot(313) # plt.subplot(3,1,3)
plt.plot(x, y2, color='xkcd:green', marker='o', label='sine+cosine')
# plt.title("Simple Sine+Cosine Plot")
plt.xlabel('Angle')
plt.ylabel('Magnitude')
plt.grid()
plt.legend()

# To make plots spread out evenly
plt.tight_layout()

# Use it once per figure
plt.show()
