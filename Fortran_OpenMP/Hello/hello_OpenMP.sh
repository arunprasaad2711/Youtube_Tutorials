ls
rm *.o *~ *.exe
ls
gfortran -c -fopenmp *.f95
#gfortran -c *.f95
ls
gfortran *.o -fopenmp -o hello.exe
#gfortran *.o -o hello.exe
ls
./hello.exe
