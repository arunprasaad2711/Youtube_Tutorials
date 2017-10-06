clear
ls
rm *.mod *.o *.exe
ls
gfortran -c fact1.f95
ls
gfortran -c fact_fun.f95
ls
gfortran fact_fun.o fact1.o -o fact.exe
ls
./fact.exe
