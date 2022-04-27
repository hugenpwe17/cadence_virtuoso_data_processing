#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Apr 27 09:22:34 2022

@author: oyxl
"""

import math
import numpy as np
from matplotlib import pyplot as plt

plt.style.use('classic')

# import porter chart data
filepath = './'
filename = 'op_ota_ac.csv'
with open(filepath + filename) as f:
    lines = (line for line in f if not line.startswith('#'))
    [x,y] = np.loadtxt(lines, delimiter=',', usecols = (0,1), unpack = True, skiprows=1)
    
# set axes format
ax = plt.axes(xscale='log', yscale='linear')
ax.grid(visible = True, which = 'major', axis = 'both', ls = 'solid')
ax.grid(visible = True, which = 'minor', axis = 'both', ls = 'dotted')

# set figure format
plt.title('Porter Chart')
plt.xlabel('Frequency [Hz]')
plt.ylabel('Gain [dB]')

# set xlimit, ylimit
plt.xlim([1E0, 1E9])
# plt.ylim([1E0, 1E9])

# print figure
fig = plt.plot(x, 20 * np.log10(y), c = 'b', ls = 'solid')

# calculator f_-3dB
f_h = np.ones(x.shape) * math.sqrt(1/2) * max(y)

# print f_-3dB line
plt.plot(x, f_h, c = 'r', ls = 'dashed')

# print cross point (approximately)
index = abs(y - f_h) == min(abs(y - f_h))
plt.scatter(x[index], y[index], c ='r')

# calculate bandwidth value
print('Gain = %.4E' %(max(y)))
print('Bandwidth = %.4E' %(x[index]))

# save figure
plt.savefig(fname = 'op_ota_ac.svg', dpi = 600)
plt.show()