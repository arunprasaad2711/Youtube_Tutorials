ls
rm *.o *~ *.exe
ls
gfortran -c -fopenmp *.f95
#gfortran -c *.f95
ls
gfortran *.o -fopenmp -o no_wait.exe
#gfortran *.o -o no_wait.exe
ls
./no_wait.exe
