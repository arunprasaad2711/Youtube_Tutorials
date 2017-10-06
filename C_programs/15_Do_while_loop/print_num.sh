rm *.o *.exe *~
gcc -c -Wall print_num.c
gcc -o print_num.exe print_num.o -Wall
./print_num.exe

# General Procedure
# gcc -c [flags] filename1.c 
# gcc -c [flags] filename2.c 
# ...............
# gcc -c [flags] filenameN.c
# gcc -o executable [set of *.o files] [flags]
# ./executable
