/*
 * 
 * 	Escape Sequences in C
 * 
 */
 
#include <stdio.h>
 
int main()
{
	//printf("Hello world!\nHi There!\n");
	//printf("Hello world!\n");
	printf("Hello\vworld!\n");
	//printf("Hello\tworld!\n");
	//printf("Hello%cworld!\n", 0x09);
	printf("Hello world!\b\b\b\n");
	//printf("Are you Okay\?!\b\n");
	printf("Are you Okay\?!\a\n");
	printf("I said \"Wow! This is a great day!\" to my friend\n");
	//printf("I said, 'Wow! This is a great day!' to my friend\n");
	return 0;
}
/*
\'	single quote			byte 0x27 in ASCII encoding
\"	double quote			byte 0x22 in ASCII encoding
\?	question mark			byte 0x3f in ASCII encoding
\\	backslash				byte 0x5c in ASCII encoding
\a	audible bell			byte 0x07 in ASCII encoding
\b	backspace				byte 0x08 in ASCII encoding
\f	form feed - new page	byte 0x0c in ASCII encoding
\n	line feed - new line	byte 0x0a in ASCII encoding
\r	carriage return			byte 0x0d in ASCII encoding
\t	horizontal tab			byte 0x09 in ASCII encoding
\v	vertical tab			byte 0x0b in ASCII encoding
*/
