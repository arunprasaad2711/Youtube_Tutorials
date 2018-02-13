#!/bin/bash

# Shell Script to run the code

# Remove old executable
rm *.exe

# Compile and Build the executable
/usr/bin/mpif90 -o ping_pong.exe ping_pong.f95

# Run the executable with 4 processes
/usr/bin/mpirun -n 32 ./ping_pong.exe
