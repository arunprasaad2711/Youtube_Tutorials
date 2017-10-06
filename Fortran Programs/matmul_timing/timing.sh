clear
ls
rm *.o *.exe *.mod
gfortran -c *.f95
gfortran *.o -o timing.exe
time ./timing.exe
