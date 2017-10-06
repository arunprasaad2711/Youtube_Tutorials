/*
 *  Datatype prefixes
 * 
 * 	prefixes to primary data types
 * 
 *  long, signed, unsigned, short, long long
 * 
 * 	int : (signed/unsigned) short, short int, int, long, long int, long long, long long int
 * 
 * 	short <= short int <= int <= long <= long int <= long long <= long long int
 * 	
 * 	char : (signed/unsigned) char
 *  short char <= char <= long char
 * 
 * 	n - the number of bytes of int/char
 *  unsigned : 0 to 2^(8*n)-1
 * 	signed : -2^(8*(n-1)) to 2^(8*(n-1))-1
 * 
 * 	float
 * 	double
 *  long double
 */

#include <stdio.h>
#include <stdint.h>

int main()
{
	long double i1;
	
	printf(" Size of integer data is %ld,", sizeof(long double));
	
	
	return 0;
}
