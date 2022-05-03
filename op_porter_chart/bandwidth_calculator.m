clc
clear
close all

% data input 
data = readmatrix('data/op_wb_ac.csv');

% calculate the f-3dB point
f_h = ones(size(data,1),1) * sqrt(1/2) * data(1,2);

% calculete the intersection
P_x = my_interx(data(:,1),data(:,2),f_h(1));

% [Y,idx] = unique(Y) ;
% X = X(idx) ;
% iwant = interp1(Y,X,sqrt(1/2) * data(1,2));

% set figure
hold on
grid on
xlim([1E0,1E9])
ylim([1E0,1E9])

% print image
plot(data(:,1),data(:,2))
plot(data(:,1),f_h)
scatter(P_x, f_h(1));

% set log scale
set(gca,'XScale','log','YScale','log')
