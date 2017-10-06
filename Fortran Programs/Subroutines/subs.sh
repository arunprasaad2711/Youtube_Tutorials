clear
ls
rm *.o *.mod *.exe
ls
gfortran -c *.f95
ls
gfortran *.o -o subs.exe
ls
./subs.exe
