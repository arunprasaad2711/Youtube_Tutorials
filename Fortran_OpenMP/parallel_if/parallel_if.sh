ls
rm *.o *~ *.exe
ls
gfortran -c -fopenmp *.f95
#gfortran -c *.f95
ls
gfortran *.o -fopenmp -o parallel_if.exe
#gfortran *.o -o parallel_if.exe
ls
./parallel_if.exe
