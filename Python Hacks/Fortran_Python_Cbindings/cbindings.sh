gfortran -O3 -funroll-loops -ffast-math -floop-strip-mine -shared -fPIC \
         -o matops1.so matops.f90
echo "Running in Python 3"
python cbindings.py
source activate py27env # This is for my system only!
echo "Running in Python 2"
python cbindings.py
