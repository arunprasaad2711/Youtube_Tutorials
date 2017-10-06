rm *.o *.exe *~
gcc -c -Wall quadrant.c
gcc -o quadrant.exe quadrant.o -Wall -lm
./quadrant.exe

# General Procedure
# gcc -c [flags] filename1.c 
# gcc -c [flags] filename2.c 
# ...............
# gcc -c [flags] filenameN.c
# gcc -o executable [set of *.o files] [flags]
# ./executable
