#! /bin/bash
# A comment in shell script
# echo command is used for printing strings

clear
ls
echo "Removing .mod, .o and .exe files"
rm *.mod *.o *.exe
ls
echo "Compiling module file"
gfortran -c where_func.f95
ls
echo "Building an executable"
gfortran where_func.o -o where_rand.exe
ls
echo "Running the executable"
./where_rand.exe
