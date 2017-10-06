/*
 * 	Program to find the factorial of a number
 * 	Example for for loop
 */

#include <stdio.h>

int main()
{
	int num, i, fact = 1;
	
	// user input
	printf("Enter a number:");
	scanf("%i", &num);
	
	for(i = 1; i < num; i++)
		fact *= (i+1);
	
	printf("The value of %d! = %d\n", num, fact);
	
	return 0;
}
