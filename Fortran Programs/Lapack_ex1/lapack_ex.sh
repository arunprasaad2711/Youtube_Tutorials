rm *.o *.exe *.mod
gfortran -c lapack_ex2.f95
gfortran *.o  -L$HOME/libf77/$ARCH -llapack -lblas
mv a.out lapack_ex.exe
./lapack_ex.exe
