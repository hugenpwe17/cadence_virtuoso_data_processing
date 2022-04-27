clc
clear
close all
% define W/L value
W_L = 1;
% import V_gs vs. I_d data（V_ds = const.）
M = csvread('mos_data_13.csv');
x = M(:,1);
y = M(:,2);
% fit curve
po = polyfit(M(:,1), M(:,2).^0.5, 1);
y_fit = (po(1)*M(:,1) + po(2)).^2;
% get V_th value
V_th = - po(2) / po(1);
% get unCox value
unCox = 2 * po(1)^2 / W_L;

disp("V_th: ")
disp(V_th)

disp("unCox: ")
disp(unCox)

% display points and fit curve
figure(1)
hold on
scatter(M(:,1),M(:,2))
plot(M(:,1),y_fit)
title('V_{GS} vs. I_D')
xlabel('V_{GS} [V]')
ylabel('I_D [A]')