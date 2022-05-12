#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Apr 27 09:22:34 2022

@author: oyxl
"""

import numpy as np
import pandas as pd
# import scipy as sp
import matplotlib.pyplot as plt

# pre-define
plt.style.use('classic')

# import porter chart data
data = pd.read_csv('data/op_ln_ac.csv')
data = np.array(data)

# set figure handle
fig_handle = plt.figure()

# set axes handle
ax_handle = plt.axes(xscale='log', yscale='linear')
ax_handle.grid(which = 'major', axis = 'both', ls = 'solid')
ax_handle.grid(which = 'minor', axis = 'both', ls = 'dotted')

# set figure format
plt.title('Porter Chart')
plt.xlabel('Frequency [Hz]')
plt.ylabel('Gain [dB]')

# set xlimit, ylimit
plt.xlim([1E0, 1E9])
# plt.ylim([1E0, 1E9])

# print figure
fig = plt.plot(data[:,0], (data[:,1]), color = 'black', linestyle = 'solid')

# calculator f_-3dB
f_h = np.ones(data[:,0].shape) * np.sqrt(1/2) * (max(data[:,1]))

# print f_-3dB line
plt.plot(data[:,0], f_h, color = 'blue', linestyle = 'dashed')

# interp1
[data_y,idx] = np.unique(data[:,1],return_index=True)
data_x = data[:,0][idx]
bandwidth = np.interp(max(f_h), data_y, data_x)

# calculate bandwidth value
print('Gain = %.4E' %(max(data[:,1])))
print('Bandwidth = %.4E' %(bandwidth))

# # save figure
# plt.savefig(fname = 'op_ota_ac.svg', dpi = 600)
# plt.show()