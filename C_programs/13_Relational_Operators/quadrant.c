/*
 * 	Program to find the length of a point from origin, the angle with
 *  x axis and the quadrant/axis of location of the point.
 *  
 *  This serves as an exercise for if-else-if-else construct
 */
 
/* 
 * 	Also, we will look at the relational operators and logical operators
 */
 
#include <stdio.h>
#include <math.h>

int main()
{
	// coordinates, length, and angle
	double x, y, l, a;
	
	printf("Enter the x and y coordinates of the point:");
	scanf("%lf%lf", &x, &y);
	
	// length from origin
	// l = sqrt(x*x + y*y);
	l = sqrt(pow(x, 2) + pow(y, 2)); // pow = power function
	// pow(x, 2.5) = x^2.5
	
	// angle in degrees from X axis 
	// positive anti-clockwise
	// negative clockwise
	if (x == 0 && y != 0)
		a = 90.0;
	else if (x == 0 && y == 0)
		a = 0.0;
	else
		a = atan(y/x)*180.0/M_PI; // M_PI = pi in math.h
	
	printf("The length of the point (%g,%g) from the origin is %g\n", x, y, l);
	printf("The angle in degrees is %g\n", a);
	
	// if x+ and y+ the point is in q1
    // else if x- and y+ the point is in q2
    // else if x- and y- the point is in q3
    // else if x+ and y- the point is in q4
    // else if x==0 and y- the point is on neg_yaxis
    // else if x==0 and y+ the point is on pos_yaxis
    // else if y==0 and x- the point is on neg_xaxis
    // else if y==0 and x+ the point is on pos_xaxis
    // else x,y is the origin
    
    // == equal to
	// >  greater than
	// <  less than
	// >= greater than or equal to
	// <= less than or equal to
	// != not equal to
	
	// && logical and
	// || logical or
	
	if (x > 0 && y > 0) 
		printf("The point (%g,%g) is in Quadrant 1\n",x,y);
    else if (x < 0 && y > 0)
        printf("The point (%g,%g) is in Quadrant 2\n",x,y);
    else if (x < 0 && y < 0)
        printf("The point (%g,%g) is in Quadrant 3\n",x,y);
    else if (x > 0 && y < 0)
        printf("The point (%g,%g) is in Quadrant 4\n",x,y);
    else if (x == 0 && y > 0)
		printf("The point (%g,%g) is on Positive Y Axis\n",x,y);
	else if (x == 0 && y < 0)
		printf("The point (%g,%g) is on Negative Y Axis\n",x,y);
	else if (y == 0 && x > 0)
		printf("The point (%g,%g) is on Positive X Axis\n",x,y);
	else if (y == 0 && x < 0)
		printf("The point (%g,%g) is on Negative X Axis\n",x,y);
	else
		printf("The point (%g,%g) is the origin!\n",x,y);
	
	return 0;
}


