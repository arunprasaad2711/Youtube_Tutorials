/*
    Program to calculate the area of a triangle using hero's formula.
    * 
    * Example for code compilation
    * 
    * Three step procedure
    * 1. Code compilation
    * 	if code has errors -> stop and inform user to correct it
    * 	if no errors - proceed to compilation
    * 		Human readable code with no errors -----> assembly level -----> machine instructions
    * 		this leads to creation of object files. *.o, *.so, etc.,
    * 2. Build executable
    * 		Join *.o, *.so etc., files with library links to create an executable
    * 3. Run the executable
    * 		as the name mentioned
    * 
	# General Procedure
	* Compilation
	# gcc -c [flags] filename1.c 
	# gcc -c [flags] filename2.c 
	# ...............
	# gcc -c [flags] filenameN.c
	* Building
	# gcc -o executable [set of *.o files] [flags] [links]
	* Running Executable
	# ./executable
*/
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int main()
{
    // sides
    float a, b, c;
    // perimeter, semi-perimeter, and area
    float perimeter, s, area;
/*
    a = 4.0;
    b = 13.0;
    c = 15.0;
*/
    printf("Enter the side a:");
    // a = variable; &a = address of variable a;
    scanf("%f",&a);
    printf("Enter the side b:");
    scanf("%f",&b);
    printf("Enter the side c:");
    scanf("%f",&c);

    // perimeter
    perimeter = a + b + c;
    // semi-perimeter
    s = perimeter/2.0; // 0.5*peri

    // Area - we need square root!
    // Available in math.c, so include math.h
    area = sqrt(s*(s-a)*(s-b)*(s-c));

    // print output
    printf("The sides of the triangle are:\n");
    printf("a = %f\nb = %f,\tand\nc = %f\n",a,b,c);
    printf("The Perimeter and Semi-Perimeter are:\n");
    printf("perimeter = %f, \nsemi-perimeter = %f\n",perimeter,s);
    printf("The area of the triangle is:\nArea = %f\n", area);
}
