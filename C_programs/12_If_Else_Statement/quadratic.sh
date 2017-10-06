rm *.o *.exe *~
gcc -c -Wall quadratic.c
gcc -o quadratic.exe quadratic.o -Wall -lm
./quadratic.exe

# General Procedure
# gcc -c [flags] filename1.c 
# gcc -c [flags] filename2.c 
# ...............
# gcc -c [flags] filenameN.c
# gcc -o executable [set of *.o files] [flags]
# ./executable
