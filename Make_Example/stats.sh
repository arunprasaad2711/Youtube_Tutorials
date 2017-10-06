#! /bin/bash
# A comment in shell script
# echo command is used for printing strings

clear
ls
echo "Removing .mod, .o and .exe files"
rm *.mod *.o *.exe
ls
echo "Compiling module file"
gfortran -c stat_funcs.f95
ls
echo "Compiling main file"
gfortran -c stats.f95
ls
echo "Building an executable"
gfortran *.o -o stats.exe
ls
echo "Running the executable"
./stats.exe
