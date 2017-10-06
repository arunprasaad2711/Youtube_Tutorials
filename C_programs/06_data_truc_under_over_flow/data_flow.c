/* 
 * 	Data Truncation, Underflow, and Overflow.
 */ 

#include <stdio.h>

int main()
{
	//int i1 = 5, i2 = 6;
	//float a1 = 5.0, a2 = 20.46;
	//double a1 = 5.0, a2 = 20.46;
	int c1 = 2147483647, c2 = -2147483648;
	//printf("%i divided by %i = %i\n", i1, i2, i1/i2);
	//printf("%f divided by %f = %f\n", a1, a2, a1/a2);
	printf("%d plus 1 = %d\n", c1, c1+1);
	printf("%d minus 1 = %d\n", c2, c2-1);
	
	return 0;
}
