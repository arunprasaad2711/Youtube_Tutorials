#! /bin/bash
clear
rm *.mod *.o *.exe
ls
gfortran -c dummy_vars4.f95
gfortran -c dummy_vars4_func.f95
gfortran *.o -o vars4.exe
./vars4.exe
