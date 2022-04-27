#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sat Apr 23 02:35:10 2022


@author: oyxl
"""

# enable LaTex engine
# import matplotlib
# matplotlib.rcParams['text.usetex'] = True
 
import numpy as np
from matplotlib import pyplot as plt

# define W / L value
W = 10E-6
L = 1E-6

# import V_GS .vs I_D data (V_DS is const.)
filepath = 'mos_data_13.csv'
[x,y] = np.loadtxt(filepath, delimiter = ',', usecols = (0,1), unpack = True)

# fit 1 deg curve
fit_coeffs = np.polyfit(x, pow(y, 0.5), deg = 1)
y_fit = pow(fit_coeffs[0] * x + fit_coeffs[1], 2)

# print data
plt.scatter(x, y, c = 'c', label = 'data')
plt.plot(x, y_fit, c = 'r', label = 'fit')

# set figure title and label
plt.title('$V_{GS}$ vs. $I_D$')
plt.xlabel('$V_{GS}$ [V]')
plt.ylabel('$I_D$ [A')

# set figure format
plt.grid(visible = True, which = 'both', axis = 'both')
plt.legend()

# print result
print('V_th = %.4E' %(-fit_coeffs[1] / fit_coeffs[0]))
print('unCox = %.4E' %(2 * pow((fit_coeffs[0]), 2) / (W / L)))