ls
rm *.o *~ *.exe
ls
gfortran -c -fopenmp *.f95
#gfortran -c *.f95
ls
gfortran *.o -fopenmp -o clauses.exe
#gfortran *.o -o clauses.exe
ls
./clauses.exe
