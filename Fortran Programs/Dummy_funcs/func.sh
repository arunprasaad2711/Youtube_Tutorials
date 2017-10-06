rm *.o *.exe
gfortran -c *.f95
gfortran *.o -o func.exe
./func.exe
