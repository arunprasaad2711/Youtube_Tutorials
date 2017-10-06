/*
 * Operator Precedence
 */
 
 #include <stdio.h>
 #include <stdlib.h>
 
 int main()
 {
	 int a = 5, b = 6, c = 7, d = 8;
	 int ans;
	  
	 ans = a * b - c + d;
	 
	 // ans = (a*b)-(c+d); // preferred way
	 // ans = 5 * 6 - 7 + 8
	 // Pref: Multiply
	 // ans = 30 - 7 + 8
	 // Pref: Add
	 // ans = 30 + 1
	 // ans = 31
	 
	 // Operator precedence: Which operation should happen first!
	 // PEMDAS : Parenthesis, Exponent, Multiplication, Division, Addition, and Subtraction.
	 // Please Excuse My Dear Aunt Sally
	 
	 printf("Answer = %i", ans);
	  
	 return 0;
 }
