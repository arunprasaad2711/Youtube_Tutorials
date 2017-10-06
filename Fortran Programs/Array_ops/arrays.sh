clear
ls
rm *.mod *.o *.exe
ls
gfortran -c maths_mod.f95
ls
gfortran -c array_funcs.f95
ls
gfortran array_funcs.o maths_mod.o -o arrays.exe
ls
./arrays.exe
