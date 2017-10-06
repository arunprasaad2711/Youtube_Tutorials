ls
rm *.o *~ *.exe
ls
gfortran -c -fopenmp master0.f95
#gfortran -c master0.f95
ls
gfortran *.o -fopenmp -o master0.exe
#gfortran *.o -o master0.exe
ls
./master0.exe
