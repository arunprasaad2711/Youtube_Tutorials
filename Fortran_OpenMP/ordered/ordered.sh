ls
rm *.o *~ *.exe
ls
gfortran -c -fopenmp *.f95
#gfortran -c *.f95
ls
gfortran *.o -fopenmp -o ordered.exe
#gfortran *.o -o ordered.exe
ls
./ordered.exe
