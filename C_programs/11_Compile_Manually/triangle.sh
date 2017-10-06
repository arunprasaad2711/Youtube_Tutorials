rm *.o *.exe *~
gcc -c triangle.c
gcc -o triangle.exe triangle.o -lm
./triangle.exe

# General Procedure
# gcc -c [flags] filename1.c 
# gcc -c [flags] filename2.c 
# ...............
# gcc -c [flags] filenameN.c
# gcc -o executable [set of *.o files] [flags]
# ./executable
