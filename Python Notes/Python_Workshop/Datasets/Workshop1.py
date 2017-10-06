
# coding: utf-8

# In[1]:

from IPython.display import HTML
from IPython.display import Image


# # Python Workshop
# 
# Arun Prasaad Gunasekaran
# 
# Assistance from : ChetanKumar Jalihal, Aditya Nalam, Arijit Chanda
# 
# Centre for Atmospherice and Oceanic Sciences,
# 
# Indian Institute of Science
# 
# 11 August 2015 to 15 August 2015

# In[2]:

Image(filename='IISc_logo.jpg',width=200,height=200) 


# # Overview of Workshop
# ---
# 
# * 4 Sessions of Demo + Class + Hands-on
# * Practice sessions based on contents
# * Laptops Complusory!
# 
# On an interesting note, These sessions are video recorded!

# # Benefits of this Workshop
# ---
# 
# * **Short term benefits:**
#     * Useful for Assignments (First Years)
#     * Serves as an Icebreak to smoothen the class to research transition
#     * Gaining comfort and confidence
#     * Have a tool to solve simple problems
# * **Long term benefits:**
#     * Skills are directly applicable in research
#     * Helpful to cut-down pre-research timing (Finding fixes, looking for solutions etc.,)
#     * You have a solid foundation to proceed further

# # Why Python? - Funny Note

# In[3]:

Image(filename='python.png')


# Source: http://xkcd.com/353/

# # Why Python? - Serious note
# ---
# 
# * Free, open source, cross platform
# * __Object Oriented__, __modern__, **interpreted** Programming Language
# * Very flexible and has a wide variety of features
# * Little overhead and pre-requisite
# * Easy access to work with Unix/Linux Shells
# * One great choice to learn programming from scratch to advanced levels
# * Very friendly, **intuitive** and **humane**
# * Can combine this with other programming languages
# * Plotting and visualization tools (1D, 2D, 3D) are great
# * Can be used for making GUI apps, OS, web frame works etc.,
# * Most importantly, you get to avoid **Software Piracy Issues**
# 
# In Short, it can be called as a "Swiss Army Knife!"

# # Is Python absolutely advantageous?
# ---
# **No!**
# Beacuse no programming language is perfect.
# But,
# 
# * It has certain features that make certain operations better when compared to other programs.
# * Can behave optimally. (Moderately fast, less programming over head)
# * Less lead time!
# 
# Summary : Python is good, but not undisputed.
# 
# Other programming languages that are good (worth experimenting in Earth related Sciences) : R, Matlab, Fortran, C, C++, Grads, NCL, Ferret, CDAT (and Versions)

# # Python Versions
# ---
# 
# Python comes in two broad versions:
# 
# * Python 2
# * Python 3
# 
# Python 2 is the older version. Stable, tested and has a lot of libraries build based on it.
# Python 3 is the newer version. Developing, considerably tested and some libraries are yet to be built on it.
# 
# Which to choose? As of now, any version is fine. If a majority of your libraries are yet to be made in Python 3, then stick to Python 2.
# 
# ** Python 2 and Python 3 are not completely compatible!**. Some programs written in Python 2 will throw errors in Python 3 (and vice-versa) because of **Different internal architectures**. **So, do not mix and match syntax!**
# 
# In the distant future, Python 3 will be promoted. We are in a transition time. After few years, Python 2 will be dropped out from support.
# 
# We will use Python 2 version.
# 
# But, do not worry, the transition is not at all difficult!

# # Session 1

# # Preliminary Settings

# - Go to Spyder > Tools > Preferences > Ipython Console > Graphics
# - Select Activate support
# - Set backend to Qt or Tkinter (Qt)
# - Got to Advanced Settings
# - Select Greedy Completer
# - Press apply and ok.
# - Go to the ipython console and type \% matplotlib qt (This is for making plots come as a separate window)
# - Set the Working Directory in the File Explorer
# - Copy the path of the Working Directory
# - type cd (in the ipython console) and paste the path and enter
# - Keep cursor near any command and press Ctrl+I for documentation.

# # A Sample Python Program
# ----
# 
# ```python
# # This is a single line comment
# """
#     Program to find the factorial of a number.
# 	This is also a docstring or a document string
# """
# n = input("Enter a positive integer") # To get user input data
# f = 1                                 # To initialize the fact value
# if n is 1 or 0:                       # To check if n is 0 or 1
#     exit                              # To exit the if statement
# else:                                 # To proceed further
#     for i in range(2, n+1):           # To start a loop from 2 to n.
#         f = f*i                       # Also written as f *= i
# print "The value of {}! is {}".format(n, f)
# ```

# # Comments
# ---
# 
# Comment - Lines that are ignored when the program is run. Used for excluding codes and for including messages.
# ```python
# 
# # This is a single line comment
# # Comment begins with a hash # symbol
# 
# ```
# Docstrings - Document strings. Multi-line comments. But more useful for including help/direction messages that appear when help utilities are called.
# ```python
# """
#     This is a Docstring. It starts and ends with 
#     triple " or triple ' quotes. Mix and match does not work!
# """
# ```

# # Input Command
# ---
# 
# Input command - Used for getting input from user to a variable.
# ```python
# n = input('Enter the value for n') # Dynamic input
# n = raw_input('Enter the value for n') # Raw input - string by default
# n = float(raw_input('Enter the value for n')) # Type casted input
# ```
# * Dynamic input analyses the data and assumes data type automatically.
# * Raw input takes the data as strings. Ignores assuming data type.
# * Type casting is used to control data types.

# # Primary Variable Types
# ---
# 
# These are the standard variables and primary data types.
# 
# ```python
# 
# i = 1 # Integer. Stores integers
# r = 5.78 # Floats. Stores numbers with decimal parts.
# c = 'h' # Characters. Stores single characters
# s = 'Strings' # Strings. Stores a series of characters
# l = True/False # Logical. Stores binary values
#     
# ```
# 
# Strings and characters use both single and double quotes, but must end accordingly. Use slash to place quotes if needed.
# 
# ```python
# 
# "Hello", 'Hello', 'My name is JD', "I asked, 'what is for lunch?'"
# 'I exclaimed, "This tree is big!"'
# "I used slash \" to type a double quote symbol"
# 
# ```

# # Primary Variable Types
# 
# A variable in python can have any data type. It can be modified at any level to have a new data type. This is because variables are actually "objects" in python.

# In[4]:

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


# # Operators
# ---
# 
# ```python
# a + b                  # Addition
# a - b                  # Subtraction
# a * b                  # Multiplication
# a / b                  # Division
# a += b # a = a+b       # Increment addition
# a *= b # -=, /= exists # Increment multiplication
# a ** b                 # Exponent
# ()                     # Parenthesis
# a % b                  # Modulo Operation
# or, and, not           # Logical Operators
# is, is not             # Identity Operators
# in, in, not in         # Membership Operators
# ```
# There are many more! Remember UPEMDAS REL LOG

# # Lists
# ---
# 
# __Mutable__, multi-datatype arrays. Can be single levelled or multi-levelled. Enclosed by [].
# 
# ```python
# x = [1, 3, 5, 7, 8]
# y = [1.5, 5, 8.94, -5.78]
# z = [1, 'f', True, [6.45, "six"], False ]
# l = [ 1, 3.5, 'a', "hello", ['34', 3.14, ["three"], 4], 4.21 ]
# ```
# 
# They allow lists within lists. Indexing goes from 0.

# In[5]:

x = [1, 3, 5, 7, 8]
y = [1.5, 5, 8.94, -5.78]
z = [1, 'f', True, [6.45, "six"], False ]
l = [ 1, 3.5, 'a', "hello", ['34', 3.14, ["three"], 4], 4.21 ]


# In[6]:

print "x = ",x
print "y = ",y
print "z = ",z
print "l = ",l
print x[0]
print x[4]
#print y[4] # This will throw an error: IndexError: list index out of range
print z[3][1]
print l[4][2][0]


# # Tuples
# ----
# 
# __Immutable__, multi-datatype arrays. Can be single levelled or multi-levelled. Enclosed by ().
# 
# ```python
# x = (1, 3, 5, 7, 8)
# y = (1.5, 5, 8.94, -5.78)
# z = (1, 'f', True, (6.45, "six"), False )
# l = ( 1, 3.5, 'a', "hello", ('34', 3.14, ("three"), 4), 4.21 )
# ```
# 
# They allow tuples within tuples. Indexing goes from 0.

# In[7]:

x = (1, 3, 5, 7, 8)
y = (1.5, 5, 8.94, -5.78)
z = (1, 'f', True, (6.45, "six"), False )
l = ( 1, 3.5, 'a', "hello", ('34', 3.14, ("three"), 4), 4.21 )


# In[8]:

print "x = ",x
print "y = ",y
print "z = ",z
print "l = ",l
print x[0]
print x[4]
#print y[4] # This will throw an error: IndexError: tuple index out of range
print z[3][1]
print l[4][2]


# # Mutation

# Since variables are objects in python, sometimes, multiple variables point to the 
# same memory location. Sometimes, certain memory modifications done to one 
# variable replicates in others (Mutable). Sometimes they do not (Immutable).

# In[9]:

x = [4.5, 6.7]
y = x
x.append(1)
print x, y

x = (4.5, 6.7)
y = x
# x.append(1) # Produces an error: tuple' object has no attribute 'append'
print x, y


# ## Exception
# ---
# 
# However, switching data and mutation do not cause any issue.

# In[10]:

x = [4.5, 6.7]
y = x
y = [7.8, 9.6]
print x, y

x = (4.5, 6.7)
y = x
y = (7.8, 9.6)
print x, y


# Still, there is a problem with list and tuples. They are heterogeneous data arrays. We need homogeneous data arrays for scientific calculations. That is where __numpy arrays__ come in handy.

# # Dictionary
# ---
# 
# A composite collection of different primary and derived data types. __Imagine a wallet/bag having several items as an example__. Has __keys__ and corresponding __values__. Keys are the names/identifiers while values are the data. (Lists, tuples, arrays, integers, floats etc.,). Used for consolidating data into files.

# In[11]:

a = {'v1':6, 'v2':10, 'lst':     [5.8, "hello"]}
print a
print a['v1']
print a['lst']
print a['lst'][1]


# # Type Casting
# ---
# Used for data conversion. Also used to avoid mutation. Restriction of data entry is also possible.

# In[12]:

import numpy as np
a = 5
b = [5, 7.9, 3.4]
print int(a), type(int(a))           
print float(a), type(float(a))       
print chr(a), type(chr(a))          
print str(a), type(str(a))          
print bool(a), type(bool(a))        
print list(b), type(list(b))         
print tuple(b), type(tuple(b))       
print np.array(b), type(np.array(b))


# # Numpy Arrays
# ---
# 
# Comes from a module numpy. Homogeneous data type array. Automatically assumes data type. But can be manually set too. Needs numpy module. Inputs can be lists or tuples.

# In[13]:

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


# As you see, the data types are allocated automatically. Use __dtype__ inside __np.array__ to set the data type manually.
# ```python
# a = np.array(l, dtype=np.float32)
# ```

# # For and While loops
# ---

# In[14]:

for i in range(0, 11, 2):
	print i
# Note the indent! Break in indent means end out statements within loop.
# range function delivers values from 0 to 10 in steps of 2
# i takes one value in each iteration
# Nested loops (one within the other is possible) as shown below

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


# # If Clause
# ---

# In[15]:

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


# # Functions
# ---
# Functions are data type independent. The data type issues come only when the code has a mis-match.
# If you have a code that is data type independent, then functions can work very easily.

# In[16]:

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


# # Slicing
# ---
# 
# Convenient and Efficient way for handling arrays.

# In[17]:

a = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
print a           # Prints all entries
print a[7]        # Prints only the 7th entry
print a[:]        # Prints all entries
print a[6:10]     # Prints 6th to 9th entry
print a[0:4]      # Prints 0th to 3rd entry
print a[5:]       # Prints 5th entry till last
print a[:7]       # Prints all entries from start till 7th entry


# __Note__ : Negative Entries also exist! You can check it out!

# # Modules
# ---

# Collection of files having functions, objects and classes. Each Module has it's own set of functions.
# eg: Numpy, scipy, matplotlib, os, netcdf4 etc.,

# ## Including them in the files/functions
# ---
# ```python
# import numpy
# # This imports the entire module
# from numpy import *
# # Same as above
# from matplotlib import pyplot
# # Used for including specific functions/objects/classes
# import numpy as np
# # This imports the module with alternate name for convenience
# import matplotlib.pyplot as plt
# # This imports specific function with an alternate name
# from matplotlib import pyplot as plt
# # Same as above
# ```

# # Exercises

# ## Problem 1 - Easy
# ---
# 
# Find the first 12 Fibonacci numbers.In a Fibonacci series/sequence, if $F_n$ is the $n^{th}$ term of the series, (provided $n \ge 2$) then it can be given in terms of the previous 2 terms, $F_{n-1}$ and $F_{n-2}$ by the recurrence relation,
# $$ F_n = F_{n-1} + F_{n-2}$$
# Find all the values till 12th term ($F_{12}$), save them and print them using loops. Take $F_0$ = 0 and $F_1$ = 1. __Use numpy arrays. Set the data type to be int8. Do you notice anything strange? Set the data type to be int16 and repeat. Do you notice anything strange?__ If yes/no, can you guess what could be the reason?

# ## Problem 2 - Hard
# ---
# 
# The table shows the plot of relative humidity and altitude. Assume surface temperature $T_S = 30^\circ\ C$ and $P_S = 10^5\ Pa$. Use SI units in calculation.
# 
# Altitude Vs RH Measurement
# 
# 
# 

# In[18]:

Z = [0.00, 0.10, 0.30, 0.50, 1.00, 2.00, 3.00, 4.00, 5.00, 6.00, 7.00, 8.00, 9.00, 10.0 ]
RH = [60., 70., 80.0, 75.0, 60.0, 50.0, 80.0, 90.0, 60.0, 40.0, 20.0, 5.00, 2.00, 1.00]


# In[19]:

print "Altitude in km :         ", Z
print "Relative Humidity in % : ", RH


# * Calculate $e_s(Z)$ which is given by $e_s = A\exp{\left[-\frac{B}{T}\right]}$. Where, $A = 2.53\times10^{11}\ Pa$ and $B = 5420\ K$
# * Calculate e(z) which is given by $e = \frac{RH\times\ e_s}{100}$ . (Use % values of RH directly)
# * Calculate T(z) which is given by $T = T_S - \frac{gZ}{C_p}$, where $g = 9.806\ m/s^2$ and $C_p = 1005\ J/kgK$
# * Calculate P(z) which is given by $P = P_s\exp{\frac{-gZ}{RT}}$, where $R = 287\ J/kgK$
# * Calculate $\rho$(z) which is given by $\rho = \frac{P}{RT}$
# * Calculate q(z) which is given by $q = 0.622\left[\ \frac{e}{P} \right]$
# * Calculate W(z), given by $W = q\times\ \rho$
# * Calculate h(z), given by $h = Lq + C_pT$. Where $L = 2.5006\times\ 10^6\ J/kg$. (Use T in K here)
# * Calculate MSE(z), given by $MSE = h + gZ$
# * Calculate Velocity v(z), which is given by the relation, $v = v_0\left(\exp\left[\frac{Z}{Z_s}\right] - 1\right)$, where, $Z_s = \frac{RT_s}{g}$ (Where $T_s$ is in Kelvin) and $v_0 = 100\ m/s$
# * Calculate the total energy, $E = MSE + 0.5v^2$

# # Next Session
# ---
# 

# * Extracting Data from text files
# * Saving Data in text files
# * Extracting Data from netcdf files
# * Reading and Saving in matrix files (.mat)
# * 1-D Plotting
# * 2-D Plotting
# * Plot Enhancements for 1-D and 2-D plots

# # Important for Tomorrow
# ---
# 
# Please do this and come!
# 
# * Connect to a proper internet connection,
# * Open command prompt/shell
# * Type the following
# ```
# conda install netcdf4
# ```
# You will get a message stating that certain libraries have to be installed.
# 
# * Select yes
# 
# Let the download happen. Once downloaded, the shell will link/unlink libraries.
# 
# If you get a message indicating a positive reply or no message and get the prompt back, then your netcdf library is installed! (For accessing netcdf files). Else, there is some problem in the installation and retry. (Mostly, it will work fine!)
# 
# * Similarly, try the following
# ```
# conda install h5py
# ```
# 
# Proceed as mentioned above. This should install hdf library for accessing hdf files.
# 
# * To update your python libraries, type these one after the other
# 
# ```
# conda update conda
# conda update anaconda
# ```
# 
# __Caution!__: This will update **all** the libraries and programs in python! You may need to download 200-300 MB of data. So, do this when your internet data and speed are good.

# For instance, It should be something similar as this:
# ```
# arun@hpdv6:~$ conda install netcdf4
# Fetching package metadata: ....
# Solving package specifications: .
# Package plan for installation in environment /home/arun/anaconda3:
# 
# The following packages will be downloaded:
# 
#     package                    |            build
#     ---------------------------|-----------------
#     yaml-0.1.6                 |                0         246 KB
#     conda-env-2.3.0            |           py34_0          24 KB
#     netcdf4-1.1.8              |       np19py34_0         1.5 MB
#     pyyaml-3.11                |           py34_1         330 KB
#     setuptools-18.0.1          |           py34_0         345 KB
#     conda-3.16.0               |           py34_0         176 KB
#     pip-7.1.0                  |           py34_0         1.4 MB
#     ------------------------------------------------------------
#                                            Total:         4.1 MB
# 
# The following NEW packages will be INSTALLED:
# 
#     libnetcdf:  4.3.2-1         
#     netcdf4:    1.1.8-np19py34_0
# 
# The following packages will be UPDATED:
# 
#     conda:      3.13.0-py34_0 --> 3.16.0-py34_0   
#     conda-env:  2.2.0-py34_0  --> 2.3.0-py34_0    
#     pip:        7.0.3-py34_0  --> 7.1.0-py34_0    
#     pyyaml:     3.11-py34_0   --> 3.11-py34_1     
#     setuptools: 17.0-py34_0   --> 18.0.1-py34_0   
#     yaml:       0.1.4-0       --> 0.1.6-0         
# 
# Proceed ([y]/n)? y
# 
# Fetching packages ...
# yaml-0.1.6-0.t 100% |################################| Time: 0:00:03  63.87 kB/s
# conda-env-2.3. 100% |################################| Time: 0:00:00  26.22 kB/s
# netcdf4-1.1.8- 100% |################################| Time: 0:00:14 113.74 kB/s
# pyyaml-3.11-py 100% |################################| Time: 0:00:03  95.35 kB/s
# setuptools-18. 100% |################################| Time: 0:00:03  92.54 kB/s
# conda-3.16.0-p 100% |################################| Time: 0:00:02  74.77 kB/s
# pip-7.1.0-py34 100% |################################| Time: 0:00:13 110.97 kB/s
# Extracting packages ...
# [      COMPLETE      ]|###################################################| 100%
# Unlinking packages ...
# [      COMPLETE      ]|###################################################| 100%
# Linking packages ...
# [      COMPLETE      ]|###################################################| 100%
# arun@hpdv6:~$ conda install h5py
# Fetching package metadata: ....
# Solving package specifications: .
# Package plan for installation in environment /home/arun/anaconda3:
# 
# The following packages will be downloaded:
# 
#     package                    |            build
#     ---------------------------|-----------------
#     hdf5-1.8.15.1              |                1         1.8 MB
#     h5py-2.5.0                 |       np19py34_3         2.6 MB
#     ------------------------------------------------------------
#                                            Total:         4.4 MB
# 
# The following packages will be UPDATED:
# 
#     h5py: 2.4.0-np19py34_0 --> 2.5.0-np19py34_3
#     hdf5: 1.8.14-0         --> 1.8.15.1-1      
# 
# Proceed ([y]/n)? y
# 
# Fetching packages ...
# hdf5-1.8.15.1- 100% |################################| Time: 0:00:18 103.68 kB/s
# h5py-2.5.0-np1 100% |################################| Time: 0:00:27 101.49 kB/s
# Extracting packages ...
# [      COMPLETE      ]|###################################################| 100%
# Unlinking packages ...
# [      COMPLETE      ]|###################################################| 100%
# Linking packages ...
# [      COMPLETE      ]|###################################################| 100%
# arun@hpdv6:~$ 
# ```

