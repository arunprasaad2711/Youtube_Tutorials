rm *~ *.so *.c
echo "Running in Python 3"
python setup.py build_ext --inplace
mv *.so matmul_cython.so
python matmul_cyexp.py
rm *~ *.so *.c
source activate py27env
echo "Running in Python 2"
python setup.py build_ext --inplace
mv *.so matmul_cython.so
python matmul_cyexp.py
source deactivate
