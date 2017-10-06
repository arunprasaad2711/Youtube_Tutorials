ls
rm *.exe *.o *~
ls
gfortran -c -mcmodel=large -fopenmp *.f95
#gfortran -mcmodel=large -c *.f95
ls
gfortran *.o -mcmodel=large -fopenmp -o workshare.exe
#gfortran *.o -mcmodel=large -o workshare.exe
ls
./workshare.exe
