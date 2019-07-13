# A new implementation of dictionaries - tutorial

from dictionaries import Dict, FrozenDict, ReadonlyDictProxy

## Simple Dictionary
d = {'apple':5, 'orange':6}
print(d, type(d))

print("New Dictionary")
## New Dictionary Class
d1 = Dict(apple = 5, orange = 6)
print(d1, type(d1))

# Append
d1['kiwi'] = 4 # Standard notation
d1.strawberry = 10 # Non-Standard notation
print(d1, type(d1))

# Edit
d1.apple = 4 # Non-Standard Notation
d1['orange'] = 7 # Standard Notation
print(d1, type(d1))

print("Frozen Dictionary")
## Frozen Dictionaries - Used for creating constants or making dictionary contents constant while passing to functions

fd1 = FrozenDict(lily = 10, jasmine = 5)
print(fd1, type(fd1))

# Append - not possible
# fd1.rose = 2 # Not possible
# fd1['rose'] = 2 # Not possible

# Edit - not possible
# fd1.lily = 4 # Not possible
# fd1['lily'] = 4 # Not possible

print(fd1.lily, fd1['jasmine'])

print(" Read Only Dictionary Proxy")
## Read Only Dictionary Proxy

true_dictionary = Dict(monkey = 6, lion = 3)
proxy_dictionary = ReadonlyDictProxy(true_dictionary)

print(true_dictionary)
print(proxy_dictionary)

# Modify the original dictionary - changes are reflected in the proxy dictionaries
true_dictionary.cheetah = 4

print(true_dictionary)
print(proxy_dictionary)

# Modify the proxy dictionary - Cannot modify the proxy dictionary directly
# proxy_dictionary['monkey'] = 7 # won't work
# proxy_dictionary.monkey = 7 # won't work






