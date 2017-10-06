rm *.o *.mod *.exe *.txt
gfortran -c *.f95
gfortran *.o -o vars.exe
./vars.exe
