clear
ls
rm *.mod *.exe *.o
ls
gfortran -c maths_mod.f95
ls
gfortran -c cramer.f95
ls
gfortran  *.o -o crammer.exe
ls
./crammer.exe
