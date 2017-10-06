# Shell program to automatically install all tar.bz2 files

for f in `ls *.bz2`
do
    conda install -y $f
done
