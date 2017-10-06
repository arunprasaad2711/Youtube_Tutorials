ls
rm *.o *~ *.exe
ls
gfortran -c -fopenmp *.f95
#gfortran -c *.f95
ls
gfortran *.o -fopenmp -o num_threads.exe
#gfortran *.o -o num_threads.exe
ls
./num_threads.exe
