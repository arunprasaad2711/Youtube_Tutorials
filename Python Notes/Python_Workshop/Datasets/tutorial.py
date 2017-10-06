# -*- coding: utf-8 -*-
"""
Created on Thu Aug 13 14:43:27 2015

@author: arun
"""

# This line becomes a comment

'''
This is a doc string or document string!
1. A multi-line comment
2. Documentation help
'''

#n = input('Enter the value for n:') # Dynamic Input
#n = raw_input('Enter the value for n:') # String by Default
#n = float(raw_input('Enter the value for n:')) # Type cased input
n = float(input())
print n

a = 1.5     # Float/Real
print a, id(a), type(a)
a = "hello" # String/Character
print a, id(a), type(a)
a = 5       # Integer
print a, id(a), type(a)
a = True    # Logical
print a, id(a), type(a)
a = [7, 8.9, 10] # List
print a, id(a), type(a)
a = (5.2, 4, 12) # Tuple
print a, id(a), type(a)
a = {'v1': 6, 'v2' : 10} # Dictionary
print a, id(a), type(a)

a = 5
b = 6

a += b

print a

a = 5
a = a+b

print a

x = [1, 3, 5, 7, 8]
y = [1.5, 5, 8.94, -5.78]
z = [1, 'f', True, [6.45, "six"], False ]
l = [ 1, 3.5, 'a', "hello", ['34', 3.14, ["three"], 4], 4.21 ]


print "x = ",x
print "y = ",y
print "z = ",z
print "l = ",l

import numpy as np
l = [5, 7, 9]
t = (5, 7, 9.7)
a = np.array(l)
b = np.array(t)
print type(l)
print type(t)
print type(a)
print type(b)
print np.dtype(a[2])
print np.dtype(b[1])

import numpy as np

c = np.array(l, dtype=np.float32)

vp = np.array([[1, 2, 3], [4, 5, 6], [7, 8, 9]])

for val in vp:
    print "Val = ", val
    for num in val:
        print num
        # continue # to go to next iteration
        # break # to break the loop

i = 0 # Initialization has to be done for while loop
while i in range(0, 11):
    print i
    i += 1 # If not, then the loop will run infinitely



f = 1
n = input("Enter a value for n:")
if isinstance(n, int): # Checks whether the value is integer or not
    if n is 1 or 0:
        print "Execution at if"
        print "The value of {}! = {}".format(n, f)
        exit
    elif n<0:
        print "Execution at elif"
        print "n is negative!"
    else:
        print "Execution at else"
        for i in range(2, n+1):
            f *= i
        print "The value of {}! = {}".format(n, f)
else:
    print "Factorial does not exist"



def fact(n):
    f = 1 # This is a local variable. Accessible only inside the function
    if isinstance(n, int): # Checks whether the value is integer or not
        if n is 1 or 0:
            print "Execution at if"
            print "The value of {}! = {}".format(n, f)
            exit
        elif n<0:
            f = 0
            print "Execution at elif"
            print "n is negative!"
        else:
            print "Execution at else"
            for i in range(2, n+1):
                f *= i
            print "The value of {}! = {}".format(n, f)
    else:
        f = 0
        print "Factorial does not exist"
    return f
n = input("Enter a value for n:")
f = fact(n)
print f

def fact1(n):
    f = 1 # This is a local variable. Accessible only inside the function
    if isinstance(n, int): # Checks whether the value is integer or not
        if n is 1 or 0:
            print "Execution at if"
            print "The value of {}! = {}".format(n, f)
            exit
        elif n<0:
            f = 0
            print "Execution at elif"
            print "n is negative!"
        else:
            print "Execution at else"
            for i in range(2, n+1):
                f *= i
            print "The value of {}! = {}".format(n, f)
    else:
        f = 0
        print "Factorial does not exist"

a = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
print a           # Prints all entries
print a[7]        # Prints only the 7th entry
print a[:]        # Prints all entries
print a[6:10]     # Prints 6th to 9th entry
print a[0:4]      # Prints 0th to 3rd entry
print a[5:]       # Prints 5th entry till last
print a[:7]       # Prints all entries from start till 7th entry



