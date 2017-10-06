/*
 * 	Example of do while loop
 */
 
/*
 *  while (condition)
 * {
 * 		do something;
 * }
 * 
 * do
 * {
 * 		something
 * }
 * while(condition);
*/

#include <stdio.h>

int main()
{
	int num;
	
	// user input
	printf("Enter a number:");
	scanf("%i", &num);
	
	do
	//while(num > 0)
	{
		printf("%i\n", num);
		num -= 1; // num = num - 1
	}
	while(num > 0);
	
	return 0;
}
