ls
rm *.o *~ *.exe
ls
gfortran -c -fopenmp master1.f95
#gfortran -c master1.f95
ls
gfortran *.o -fopenmp -o master1.exe
#gfortran *.o -o master1.exe
ls
./master1.exe
