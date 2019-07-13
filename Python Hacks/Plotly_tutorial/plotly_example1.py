# Plotly example tutorial

import numpy as np
import plotly.graph_objs as go
import plotly.offline as ply

# Create sample data
n = 201
x = np.linspace(0, 2.0*np.pi, n)
y1 = np.sin(x)
y2 = np.cos(x)
y3 = y1 + y2

## Plotly steps begin

# Create traces - data collections
trace1 = go.Scatter(
    x = x,
    y = y1,
    name = "sine curve",
    line = dict(
        color = ("red"),
        width = 4,
        dash = 'dash'
    )
)

trace2 = go.Scatter(
    x = x,
    y = y2,
    name = "cosine curve",
    line = dict(
        color = ("green"),
        width = 4,
        dash = 'dot' # dot, dashdot
    )
)

trace3 = go.Scatter(
    x = x,
    y = y3,
    name = "sine + cosine curve",
    line = dict(
        color = ("blue"),
        width = 4,
        dash = "dashdot"
    )
)

# Create information / layout dictionary
layout = dict(
    title = "Some sample sinusoidal curves",
    xaxis = dict(title = "Angle in Radian"),
    yaxis = dict(title = "Magnitude")
)

# Pack the data
data = [trace1, trace2, trace3]

# Create a figure
fig = dict(data = data, layout = layout)

# Plot
ply.plot(fig, filename='simple_plot.html')

