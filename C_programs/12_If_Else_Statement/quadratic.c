/*
 * 
 *	Program to find the roots of a quadratic polynomial/equation
 * 
 */
/*
 * 
 * 	Plain IF Construct
 * if(condition 1)
 * {
 *		statements to execute if condition 1 is true;
 * }
 * 
 * 
 * 	IF - ELSE Construct 
 * if(condition 1)
 * {
 *		statements to execute if condition 1 is true;
 * }
 * else
 * {
 *		statements to execute if all condition(s) are false;
 * }
 * 
 *
 * 	IF - ELSE IF Construct
 * if(condition 1)
 * {
 *		statements to execute if condition 1 is true;
 * }
 * else if(condition 2)
 * {
 * 		statements to execute if condition 2 is true;
 * }
 * 
 * IF - ELSE IF - ELSE Construct
 * if(condition 1)
 * {
 *		statements to execute if condition 1 is true;
 * }
 * else if(condition 2)
 * {
 * 		statements to execute if condition 2 is true;
 * }
 * else if(condition 3)
 * {
 * 		statements to execute if condition 3 is true;
 * }
 * ............
 * else
 * {
 * 		statements to execute if all condition(s) are false;
 * }
 *
 * if statement can be independently present
 * else is optional
 * multiple else if is allowed
 * single line statements do not need {}
 * 
*/

#include <stdio.h>
#include <math.h>

int main()
{
	
	//coefficients
	double a, b, c;
	// discriminant
	double dis;
	// roots
	double r1, r2, img = 0;
	
	// input the coefficients
	printf("Enter the coefficients of the quadratic equation/polynomial:\n");
	printf("Enter the coefficient of x^2 term, a = ");
	scanf("%lf", &a);
	printf("Enter the coefficient of x^1 term, b = ");
	scanf("%lf", &b);
	printf("Enter the coefficient of x^0 term, c = ");
	scanf("%lf", &c);
	
	// discriminant calculation
	dis = b*b - 4.0*a*c;
	
/*
 * 	if dis is positive:
 * 		r1 = (-b + sqrt(dis))/(2a);	r2 = (-b - sqrt(dis))/(2a);
 *  else if dis is zero:
 * 		r1 = -b/(2a);	r2 = -b/(2a);
 *  else:
 * 		r1 = (-b + i*sqrt(-dis))/(2a);	r2 = (-b - i*sqrt(-dis))/(2a);
 */	
 
	if(dis > 0)
	{
		r1 = (-b + sqrt(dis))/(2.0*a);
		r2 = (-b - sqrt(dis))/(2.0*a);
	}
	else if(dis == 0)
	{
		r1 = (-b)/(2.0*a);
		r2 = (-b)/(2.0*a);
	}
	else
	{
		r1 = (-b)/(2.0*a);
		r2 = (-b)/(2.0*a);
		img = sqrt(-dis)/(2.0*a);
	}
	
	printf("The roots of the equation are:\n");
	printf("Root 1 = (%g + i%g)\n", r1, img);
	printf("Root 2 = (%g - i%g)\n", r2, img);
	
	return 0;
}
