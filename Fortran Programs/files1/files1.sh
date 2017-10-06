ls
rm *.o *.txt files1
ls
gfortran -c *.f95
gfortran *.o -o files1
./files1
