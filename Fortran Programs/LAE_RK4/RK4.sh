rm *.exe *.txt *.mod *.o
gfortran -c lae_rk4.f95
gfortran -c sub_lae_rk4.f95
gfortran sub_lae_rk4.o  lae_rk4.o -o rk4.exe
./rk4.exe
