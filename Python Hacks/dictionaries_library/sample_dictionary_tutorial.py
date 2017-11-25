# A new implementation of dictionaries - tutorial

from dictionaries import Dict, FrozenDict, ReadonlyDictProxy

## Simple Dictionary
d = {'apple':5, 'orange':6}
# print(d, type(d))

## New Dictionary Class
d1 = Dict(apple = 5, orange = 6)
# print(d1, type(d1))

# Append
d1['kiwi'] = 4 # Standard notation
d1.strawberry = 10 # non-standard notation
# Edit
d1.apple = 4  # non-standard notation
d1['orange'] = 8 # standard notation
# print(d1, type(d1))

## Frozen Dictionary - Helpful for creating a bundle of constants

fd1 = FrozenDict(lily = 10, jasmine = 5)

# Append - not possible
# fd1['rose'] = 2 # Error
# fd1.rose = 2 # Error

# Edit - not possible
# fd1['lily'] = 8 # Error
# fd1.lily = 2 # Error
# print(fd1, type(fd1))

## Read only dictionary proxy
true_dictionary = Dict(monkey = 6, lion = 3)
proxy_dictionary = ReadonlyDictProxy(true_dictionary)

print(true_dictionary)
print(proxy_dictionary)

# Modify the original dictionary - changes are reflected into the proxy dictionary as well
true_dictionary.cheetah = 4

print(true_dictionary)
print(proxy_dictionary)

# Modify the proxy dictionary - not possible
# proxy_dictionary.monkey = 5 # won't work
# proxy_dictionary['monkey'] = 5 # Assignment won't work

proxy_dictionary1 = ReadonlyDictProxy(true_dictionary)
proxy_dictionary2 = ReadonlyDictProxy(true_dictionary)
proxy_dictionary3 = ReadonlyDictProxy(true_dictionary)

true_dictionary.elephant = 7

print(true_dictionary)
print(proxy_dictionary)
print(proxy_dictionary1)
print(proxy_dictionary2)
print(proxy_dictionary3)