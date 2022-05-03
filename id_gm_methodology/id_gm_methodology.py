#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Apr 27 10:14:38 2022

@author: oyxl
"""

# import math
import numpy as np
from matplotlib import pyplot as plt

# define file path
filepath = './data/nmos_50_50n/'
# select x and y
# var(s):
#   V_GS, Vstar, gm_id, fT, gm_id_fT, Istar, gm_gds
xdata_filename = 'Vstar'
ydata_filename = 'fT'

# import data
with open(filepath + 'nmos_' + xdata_filename + '.csv') as f:
    lines = (line for line in f if not line.startswith('#'))
    x = np.loadtxt(lines, delimiter=',', unpack = True, skiprows=1)

# import data
with open(filepath + 'nmos_' + ydata_filename + '.csv') as f:
    lines = (line for line in f if not line.startswith('#'))
    y = np.loadtxt(lines, delimiter=',', unpack = True, skiprows=1)

# set axes format
ax = plt.axes(xscale = 'linear', yscale = 'linear', xlim = [0.19,0.21], ylim=[0,1E6])
ax.grid(visible = True, which = 'major', axis = 'both', ls = '-')
ax.grid(visible = True, which = 'minor', axis = 'both', ls = ':')

# print figure
for i in np.arange(1, int(x.shape[0]), 2):
    legend_label = 'T = ' + str(350 + 50*(i-1)/2) + 'n'
    plt.plot(x[i-1,:], y[i,:], label = legend_label)
    
# axis label convert
data2label = {'Vstar' : 'Vstar [V]','gm_id' : 'gm/id [1/V]','fT' : 'fT [GHz]','gm_id_fT' : 'gm/id * fT [GHz/V]','Istar' : 'Istar [A]','gm_gds' : 'gm/gds [Magnitude]'}
x_label = data2label[xdata_filename]
y_label = data2label[ydata_filename]
    
# set figure format
# plt.legend()
plt.title(xdata_filename + ' .vs ' + ydata_filename)
plt.xlabel(x_label)
plt.ylabel(y_label)

# save figure as format 'svg'
plt.savefig('figure/fT.svg', dpi =300)
