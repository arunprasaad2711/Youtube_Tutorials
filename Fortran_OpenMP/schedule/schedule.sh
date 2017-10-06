ls
rm *.exe *.o *~
ls
gfortran -c -fopenmp *.f95
#gfortran -c *.f95
ls
gfortran *.o -fopenmp -o schedule.exe
#gfortran *.o -o schedule.exe
ls
./schedule.exe
