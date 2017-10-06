ls
rm *.o *~ *.exe
ls
gfortran -c -fopenmp *.f95
#gfortran -c *.f95
ls
gfortran *.o -fopenmp -o matmul.exe
#gfortran *.o -o matmul.exe
ls
./matmul.exe
