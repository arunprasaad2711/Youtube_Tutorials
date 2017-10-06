# Matplotlib Plotting Tutorials
# Plot Animation
# 1D Heat equation

import numpy as np
import matplotlib.pyplot as plt

L = 10                          # Length of rod
nx = 100                        # number of points on the rod
T = 500                         # Total time for simulation
nt = 500                        # number of time steps
alpha = 5e-3                    # Diffusion Coefficient

x = np.linspace(0, L, nx+1)     # points on the rod
dx = x[1] - x[0]                # Spacing between points
t = np.linspace(0, T, nt+1)     # instances in time
dt = t[1] - t[0]                # time step
F = alpha*dt/dx**2              # diffusion parameter
fac = 1.0 - 2.0*F               # constant in the equation

# Set initial condition: a sine wave
Temp_init = 100*np.sin(2*np.pi*x/L)

Temp_old = np.copy(Temp_init)   # known T at old time level
Temp_new = np.zeros(nx+1)       # unknown T at the present time level

# To enable interactive plotting
plt.ion()
plt.figure()

for n in range(0, nt):
    print('time t=',t[n])
    # Compute temperature at all the points
    Temp_new[1:-1] = fac*Temp_old[1:-1] + F*(Temp_old[0:-2] + Temp_old[2:])

    # Update temperature before next step
    Temp_old[:]= Temp_new

    plt.clf()  # Clear the figure
    plt.plot(x, Temp_init, color='xkcd:black', label='Initial Temperature profile')
    plt.plot(x, Temp_old, color='xkcd:salmon', label='Current Temperature profile')  # Contour plotting the values
    plt.xlabel('Length', fontsize=10)  # X axis label
    plt.ylabel('Temperature in $^o C$', fontsize=10)  # Y axis label
    plt.title('Temperature Diffusion in a 1D rod')
    # string = " ".join(['Time $t$ = ', str(t[n]), ' s, $T_{max}$ = ', str(np.amax(Temp_old)), ' $^o C$, $T_{min}$ = ', str(np.amin(Temp_old)), '$^o C$'])
    string = 'Time $t$ = '+str(t[n])+' s, $T_{max}$ = '+str(np.amax(Temp_old))+' $^o C$, $T_{min}$ = '+str(np.amin(Temp_old))+'$^o C$'
    plt.suptitle(string)
    plt.legend()
    plt.grid(True)  # Enabling gridding
    plt.axis((-0.1, 10.1, -105, 105))  # Making axis rigid
    plt.pause(0.01)
