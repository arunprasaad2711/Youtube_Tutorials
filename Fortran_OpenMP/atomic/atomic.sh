ls
rm *.exe *.o *~
ls
gfortran -c -fopenmp *.f95
#gfortran -c *.f95
ls
gfortran *.o -fopenmp -o atomic.exe
#gfortran *.o -o atomic.exe
ls
./atomic.exe
