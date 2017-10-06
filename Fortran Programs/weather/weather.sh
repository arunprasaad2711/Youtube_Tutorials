clear
ls
rm *.o *.exe *.mod
ls
gfortran -c weather.f95
ls
gfortran weather.o -o weather.exe
ls
./weather.exe
