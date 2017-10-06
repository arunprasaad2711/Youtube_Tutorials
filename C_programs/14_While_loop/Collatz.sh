rm *.o *.exe *~
gcc -c -Wall Collatz.c
gcc -o Collatz.exe Collatz.o -Wall
./Collatz.exe

# General Procedure
# gcc -c [flags] filename1.c 
# gcc -c [flags] filename2.c 
# ...............
# gcc -c [flags] filenameN.c
# gcc -o executable [set of *.o files] [flags]
# ./executable
