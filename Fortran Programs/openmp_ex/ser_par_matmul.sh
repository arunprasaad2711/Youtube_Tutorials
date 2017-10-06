rm *.o *.exe
ls

echo "Running in Serial"

gfortran -c matmul_omp.f95
gfortran matmul_omp.o -o ser_matmul.exe
./ser_matmul.exe

rm *.o *.exe
ls

echo "Running in Parallel"

gfortran -fopenmp -c matmul_omp.f95
gfortran -fopenmp matmul_omp.o -o par_matmul.exe
./par_matmul.exe
