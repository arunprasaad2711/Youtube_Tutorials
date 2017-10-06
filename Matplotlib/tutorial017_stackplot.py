# Plotting tutorials in Python
# Stack Plots
# Expenses in a fictitious city for 11 years

import numpy as np
import matplotlib.pyplot as plt
import matplotlib as mpl
mpl.style.use('default')

lim1 = 1
lim2 = 10
N = 11

# to reproduce the same random number data repeatedly
np.random.seed(1536252)

years = np.linspace(2000, 2010, N, dtype=np.int64)
expense1   = np.random.randint(lim1, lim2, N)
expense2   = np.random.randint(lim1, lim2, N)
expense3   = np.random.randint(lim1, lim2, N)
expense4   = np.random.randint(lim1, lim2, N)
expense5   = np.random.randint(lim1, lim2, N)
expenses = [expense1, expense2, expense3, expense4, expense5]

Labels = ['Education', 'Medication', 'Charity', 'Infrastructure', 'Defence']
Colours = ['blue', 'green', 'red', 'black', 'yellow']

# simple
# plt.stackplot(years, expense1, colors=['green'], labels=['Education'])

# Batch
# plt.stackplot(years, expense1, expense2, expense3, expense4, expense5,
#              colors=['blue', 'green', 'red', 'black', 'yellow'],
#              labels=['Education', 'Medication', 'Charity', 'Infrastructure', 'Defence'])

# Alternatively, this way is simpler and compact
plt.stackplot(years, expenses, colors=Colours, labels=Labels)

plt.xlabel('Years')
plt.ylabel('Accumulated Expenses')
plt.title('Stacked Plot: Expenses in {} city for 11 years in {} {}'.format('Coimbatore', 'Million', 'Rupees'))
plt.grid(True)
plt.legend()
plt.show()