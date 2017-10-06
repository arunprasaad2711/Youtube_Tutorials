ls
rm *.exe *.o *~
ls
gfortran -c -fopenmp *.f95
#gfortran -c *.f95
ls
gfortran *.o -fopenmp -o bar_single.exe
#gfortran *.o -o bar_single.exe
ls
./bar_single.exe
