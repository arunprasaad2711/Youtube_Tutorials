/*
 * 	Program to generate a Collatz Conjecture Sequence for a given number
 *	If odd, multiply by 3, then add 1 and divide by 2, if even,
 *  divide by 2 - repeat recursively till the number reaches 1.
 * 
 * 	25, 76, 38, 19, 58, 29, .... , 1
 * 
 * 	Usage of while loop
 * 
 */

#include <stdio.h>

int main()
{
	// positive integers
	unsigned int num, o_num, count = 0;
	
	// User input
	printf("Enter a positive integer:");
	scanf("%u", &o_num);
	
	// initialize sequence
	num = o_num;
	
	printf("Iteration %u \t Number = %u\n", count, num);
	
	// syntax for while loop
	//while(condition)
	//{
		//statements to execute if condition is true!
		//and one condition breaking statement set.
	//}
	
	while(num > 1)
	{
		if(num%2 > 0) // odd numbers
			num = 3*num + 1;
		else
			num /= 2; //num = num/2;
		count += 1;   //count = count + 1;
		printf("Iteration %u \t Number = %u\n", count, num);
	}
	
	printf("The number %u takes %u terms to converge to 1!\n", o_num, count);
	return 0;
}
