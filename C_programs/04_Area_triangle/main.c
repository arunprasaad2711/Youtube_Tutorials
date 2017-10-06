/*
    Program to calculate the area of a triangle using hero's formula.
*/
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int main()
{
    // sides
    float a, b, c;
    // perimeter, semi-perimeter, and area
    float peri, s, area;
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
    peri = a + b + c;
    // semi-perimeter
    s = peri/2.0; // 0.5*peri

    // Area - we need square root!
    // Available in math.c, so include math.h
    area = sqrt(s*(s-a)*(s-b)*(s-c));

    // print output
    printf("The sides of the triangle are:");
    printf("a = %f,\nb = %f,\n and\nc = %f\n",a,b,c);
    printf("The Perimeter and Semi-Perimeter are:\n");
    printf("perimeter = %f, \n semi-perimeter = %f\n",peri,s);
    printf("The area of the triangle is:\n Area = %f\n", area);
}
