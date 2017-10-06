ls
rm *.exe *.o *~
ls
#gfortran -c *.f95
gfortran -c -mcmodel=large -fopenmp *.f95
#gfortran -mcmodel=large -c *.f95
ls
#gfortran *.o -o sections.exe
gfortran *.o -mcmodel=large -fopenmp -o sections.exe
#gfortran *.o -mcmodel=large -o sections.exe
ls
./sections.exe
