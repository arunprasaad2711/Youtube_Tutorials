/* 
 * Modular division demo.
 * Returns the remainder of a division.
 * Works with integers only!
 * */
 
 #include <stdio.h>
 
int main()
{
	int a = 16, b = 10;
	
	printf("quotient of %i divided by %i is : %i\n", a, b, a/b);
	printf("remainder of %i divided by %i is : %i\n", a, b, a%b);
	return 0;
}
