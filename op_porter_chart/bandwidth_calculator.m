clc
clear
close all

data = csvread('op_ln_ac.csv', 1);

loglog(data(:,1),data(:,2))

grid on

f_h = ones(size(data,1),1) * sqrt(1/2) * data(1,2);

hold on

loglog(data(:,1),f_h)

index = (abs(data(:,2)-f_h) == min(abs(data(:,2)-f_h)));

scatter(data(index,1),data(index,2));

disp (['Gain = ', num2str(data(1,2))]);
disp (['BandWidth = ',num2str(data(index,1)),' Hz']);