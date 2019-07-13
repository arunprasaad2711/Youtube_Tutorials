# f90nml example tutorial

import f90nml

# create a namelist object - dictionary
nml = f90nml.read("parameters.nml")

# extract the data dictionary
params = nml['parameters_list']

# print the dictionary
print(params)

# print individual values
for key in params:
    print(key, params[key])