clear
ls
rm *.o *.exe *.mod
ls
gfortran -c sq_func.f95
ls
gfortran -c func_example.f95 
ls
gfortran func_example.o sq_func.o -o area.exe
ls
./area.exe
