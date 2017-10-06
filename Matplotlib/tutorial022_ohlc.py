# Plotting tutorials in Python
# Candlestick Open High Low Close plots
# Applies in stock market data

import numpy as np

import csv

import matplotlib.pyplot as plt
from matplotlib import dates, ticker
import matplotlib as mpl
from matplotlib.finance import candlestick_ohlc

mpl.style.use('default')

fname = 'data.csv'

# Empty lists to extract the data from csv file
date_data = []
open_data = []
high_data = []
low_data = []
close_data = []
trade = []
turn = []

# Extracting data
with open(fname, 'r') as csvfile:
    data = csv.reader(csvfile, delimiter=',')
    for line in data:
        date_data.append(line[0])
        open_data.append(line[1])
        high_data.append(line[2])
        low_data.append(line[3])
        close_data.append(line[4])
        trade.append(line[5])
        turn.append(line[6])

# removing '-' in data
trade[18] = 0
turn[18] = 0

# Conversion to numpy arrays
open_val = np.array(open_data[1:], dtype=np.float64)
high_val = np.array(high_data[1:], dtype=np.float64)
low_val = np.array(low_data[1:], dtype=np.float64)
close_val = np.array(close_data[1:], dtype=np.float64)
trade_val = np.array(trade[1:], dtype=np.float64)
turn_val = np.array(turn[1:], dtype=np.float64)

# Matplotlib needs dates in floating numbers to plot them
# under the hood.
data_dates = []
for date in date_data[1:]:
    new_Date = dates.datestr2num(date)
    data_dates.append(new_Date)

# Creating a compacted bulk data for the ohlc plot
i = 0
ohlc_data = []
while i < len(data_dates):

    stats_1_day = data_dates[i], open_val[i], high_val[i], low_val[i], close_val[i]#, trade_val[i]
    ohlc_data.append(stats_1_day)
    i += 1

# Day format for x labels
dayFormatter = dates.DateFormatter('%d-%b-%Y')

fig, ax1 = plt.subplots()
candlestick_ohlc(ax1, ohlc_data, width=0.5, colorup='g', colordown='r', alpha=0.8)
# plt.plot(data_dates, open_val)
# plt.plot(data_dates, close_val)
# plt.plot(data_dates, high_val)
# plt.plot(data_dates, low_val)

ax1.xaxis.set_major_formatter(dayFormatter) # formats the dates
ax1.xaxis.set_major_locator(ticker.MaxNLocator(10)) # Specify the number of ticks in x axis
plt.xticks(rotation=30)
plt.grid()
plt.xlabel('Date')
plt.ylabel('NSE Index')
plt.title('Historical Data for NIFTY 50 \nFor the period 01-04-2017 to 15-05-2017')
plt.tight_layout()
plt.show()