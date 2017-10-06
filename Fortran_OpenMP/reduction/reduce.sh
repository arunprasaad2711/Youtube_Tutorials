ls
rm *.o *~ *.exe
ls
gfortran -c -fopenmp *.f95
#gfortran -c *.f95
ls
gfortran *.o -fopenmp -o reduce.exe
#gfortran *.o -o reduce.exe
ls
./reduce.exe
