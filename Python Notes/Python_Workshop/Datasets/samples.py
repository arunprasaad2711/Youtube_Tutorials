# -*- coding: utf-8 -*-
"""
Created on Thu Aug  6 02:39:43 2015

@author: arun
"""

# This is a single line comment
"""
	Program to find the factorial of a number.
	This is also a docstring or a document string
"""
#n = input("Enter a positive integer")
n = int(raw_input("Enter a positive integer"))
f = 1
if n is 1 or 0:
	exit
else:
	for i in range(2, n+1):
		f = f*i
		# Also written as f *= i
print "The {}! is {}".format(n, f)

v = "I used slash \" to type a double quote symbol"
print v

# code
a = 1.5
print a, id(a), type(a)
a = "hello"
print a, id(a), type(a)
a = 5
print a, id(a), type(a)
a = True
print a, id(a), type(a)
a = [7, 8.9, 10] # List
print a, id(a), type(a)
a = (5.2, 4, 12) # Tuple
print a, id(a), type(a)
a = {'v1':6, 'v2':10} # Dictionary
print a, id(a), type(a)

x = [1, 3, 5, 7, 8]
y = [1.5, 5, 8.94, -5.78]
z = [1, 'f', True, [6.45, "six"], False ]
l = [ 1, 3.5, 'a', "hello", ['34', 3.14, ["three"], 4], 4.21 ]

print "x = ",x
print "y = ",y
print "z = ",z
print "l = ",l
print x[0]
print x[4]
print y[4]
print z[3][1]
print l[4][2][0]

x = (1, 3, 5, 7, 8)
y = (1.5, 5, 8.94, -5.78)
z = (1, 'f', True, (6.45, "six"), False )
l = ( 1, 3.5, 'a', "hello", ('34', 3.14, ("three", 4.5), 4), 4.21 )
l = (4.6)

print "x = ",x
print "y = ",y
print "z = ",z
print "l = ",l
print x[0]
print x[4]
print y[4]
print z[3][1]
print l[4][2][0]

x = [4.5, 6.7]
y = x
x.append(1)
print x, y
	
x = (4.5, 6.7)
y = x
x.append(1)
print x, y

x = [4.5, 6.7]
y = x
y = [7.8, 9.6]
print x, y
	
x = (4.5, 6.7)
y = x
y = (7.8, 9.6)
print x, y

a = {'v1':6, 'v2':10, 'lst': \
    [5.8, "hello"]}
print a
print a['v1']
print a['lst']
print a['lst'][1]

import numpy as np
a = 5
b = [5, 7.9, 3.4]
print int(a), type(int(a))           # Integer
print float(a), type(float(a))       # Float
print chr(a), type(chr(a))           # Character
print str(a), type(str(a))           # String
print bool(a), type(bool(a))         # Logical
print list(b), type(list(b))         # List
print tuple(b), type(tuple(b))       # Tuple
print np.array(b), type(np.array(b)) # Numpy Array

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

for i in range(0, 11, 2):
    print i

vp = np.array([[1, 2, 3], [4, 5, 6], [7, 8, 9]])
for val in vp:
    print "Val = ", val
    for num in val:
        print num

x = [6, 7, 8]
for x in [0, 1, 6, 7, 10]:
    print x
else:
    print "X in else"
i = 0
while i in range(0, 11):
    print i
    i += 1

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