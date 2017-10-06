clear
ls
rm *.mod *.exe *.o
ls
gfortran -c maths_mod.f95
ls
gfortran -c gauss_elimination.f95
ls
gfortran *.o -o gauss_el.exe
ls
./gauss_el.exe
