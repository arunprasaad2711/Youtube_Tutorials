#!/bin/bash

# Shell Script to run the code

# Remove old executable
rm *.exe

# Compile and Build the executable
/usr/bin/mpif90 -o send_recv.exe send_recv.f95

# Run the executable with 4 processes
/usr/bin/mpirun -n 4 ./send_recv.exe
