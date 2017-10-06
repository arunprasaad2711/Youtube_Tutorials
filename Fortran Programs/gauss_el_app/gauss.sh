#! /bin/bash
# Shell Script to run the gauss elimination program

clear
ls
rm *.o *.mod *.exe
gfortran -c gel1.f95
gfortran -c gauss_el_app.f95
gfortran gel1.o gauss_el_app.o -o gauss.exe
ls
./gauss.exe 
