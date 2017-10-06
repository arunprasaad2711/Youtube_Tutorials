/*
 * 
 * 	Format Specifiers in C
 * 
 */

#include <stdio.h>

int main()
{
	
	//int i1 = 125;
	//unsigned int i2 = 123;
	//long int i3 = 4563;
	//long unsigned int i4 =  78532;
	//short i5 = 78;
	float f1 = -95.56;
	
	// use %i or %d for unsigned/signed int. %u for unsigned int
	// %o for octal, %x, %X for hexadecimal
	// put l infront for long, h infront for short, and u infront of unsigned
	// %lu, %llu, %lld, %li, %lli, %hu, %hd, %hi
	//printf("%i\n",i1);     	// default/free specification
	//printf("%5i\n",i1);		// places the number in a character field of 5 units long including sign
	//printf("%05d\n", i1); 	// pads zeros at front
	//printf("%u\n",i2);     	// for positive or unsigned integers.
	//printf("%ld\n",i3);     // for long integers.
	//printf("%lu\n",i4);     // for long positive or unsigned integers.
	//printf("%hd\n",i5);     // for short integers.
	//printf("%o\n",i2);		// octal representation - for unsigned/positive
	//printf("%x\n",i2);		// hexa-decimal representation
	//printf("%X\n",i2);		// another hexa-decimal representation
	
	//printf("%f\n", f1);		// free format specification
	//printf("%4f\n", f1);	// digits before decimal point are placed in a character field of 4 units length including sign
	//printf("%.3f\n",f1);	// digits  after decimal point are placed in a character field of 3 units length
	//printf("%4.3f\n",f1);	// combo of both
	//printf("%04.3f\n",f1);	// padded zeros - won't work
	//printf("%4.3lf\n",f1);	// Long float full format specification
	//printf("%lf\n", f1);	// long float free format specification
	//printf("%g\n", f1);		// Alternate usage - mostly for double - better precision.
	//printf("%e\n", f1);		// free format Scientific Notation with lowercase e
	//printf("%E\n", f1);		// free format Scientific Notation with uppercase E
	printf("%.4e\n", f1);	// Scientific Notation with 4 decimal digits
	
	return 0;
}

/*
 
%c char single character

%d (%i) int signed integer

%e (%E) float or double exponential format

%f float or double signed decimal

%g (%G) float or double use %f or %e as required

%o int unsigned octal value

%p pointer address stored in pointer

%s array of char sequence of characters

%u int unsigned decimal

%x (%X) int unsigned hex value
 
 source: https://www.le.ac.uk/users/rjm1/cotter/page_30.htm
*/
