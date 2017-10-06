/*
This is a multi-line comment.

Also, this program explains some simple data types in C
*/
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

int main()
{
    // this is a single line comment
    /* this is also a single line comment! */
    // integer - 4 bytes of memory
    // for storing numbers with no decimal part
    int i1, i2, i3; // variable declaration

    // float/real - 4 bytes of memory
    // for storing numbers with decimal part
    float f1, f2, f3; // 7-8 digits of precision

    // double - 8 bytes of memory
    // more storage and precision than float
    // but relatively slower than float
    double d1, d2, d3; // 14-16 digits of precision

    // character - 1 byte of memory
    // numbers -128 to 127 and/or a single character
    char c1, c2, c3, c4, c5;

    // boolean - true or false
    // need library stdbool.h
    bool b1, b2;

    i1 = 5;     // variable definitions
    i2 = 20;
    i3 = i1+i2; // mathematical expression

    // %i - place holder for integer values inside a string
    // also called as integer format specifier.
    // also applicable - %d
    printf("The sum of %i and %i is %i\n", i1, i2, i3);

    f1 = 5.0;     // variable definitions
    f2 = 20.46;
    f3 = f1*f2;

    // %f - place holder for float values inside a string
    // also called as float format specifier.
    // also applicable - %g or %e
    printf("The product of %f and %f is %f\n", f1, f2, f3);

    d1 = 5.0;     // variable definitions
    d2 = 20.46;
    d3 = d1/d2;

    // %g - place holder for float values inside a string
    // also called as float format specifier.
    printf("The division of %f by %f is %f\n", d1, d2, d3);

    c1 = 50;     // variable definitions
    c2 = 20;
    c3 = c1-c2;
    c4 = 'q';
    c5 = ')';

    // %d - place holder for integer values inside a string
    // also called as integer format specifier.
    // used for representing numbers in character values as well
    printf("The difference of %d and %d is %d\n", c1, c2, c3);

    // %c - place holder for character values inside a string
    // also called as character format specifier.
    printf("The characters 1 and 2 are %c and %c\n", c4, c5);

    b1 = true;  // or 1
    b2 = false; // or 0

    printf("The values of b1 and b2 are %d %d \n", b1, b2);
}
