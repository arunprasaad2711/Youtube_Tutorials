clear
ls
rm *.o *.exe *.mod
ls
gfortran -c *.f95
ls
#gfortran per_com.o fact_per_com_func.o -o percom.exe
gfortran *.o -o percom.exe
ls
./percom.exe
