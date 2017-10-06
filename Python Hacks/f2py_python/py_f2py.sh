rm *~ *.so *.o
f2py3 -m matmul1 -c matmul1.f90
mv *.so matmul1.so
echo "Running Python 3"
python py_f2py.py
rm *~ *.so *.o
f2py -m matmul1 -c matmul1.f90
source activate py27env
echo "Running Python 2"
python py_f2py.py
source deactivate
