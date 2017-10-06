rm *.o *.exe *~
gcc -c -Wall factorial.c
gcc -o factorial.exe factorial.o -Wall
./factorial.exe

# General Procedure
# gcc -c [flags] filename1.c 
# gcc -c [flags] filename2.c 
# ...............
# gcc -c [flags] filenameN.c
# gcc -o executable [set of *.o files] [flags]
# ./executable
