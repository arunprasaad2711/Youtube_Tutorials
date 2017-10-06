ls
rm *.exe *.o *~
ls
#gfortran -c -fopenmp *.f95
gfortran -c *.f95
ls
#gfortran *.o -fopenmp -o shared.exe
gfortran *.o -o shared.exe
ls
./shared.exe
