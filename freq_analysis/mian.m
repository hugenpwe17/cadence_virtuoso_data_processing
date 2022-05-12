clear
clc
close all

RC_1 = readmatrix('RC_LOW_1.csv');
RC_1_F = RC_1(:,[1,2]);
RC_1_A = RC_1(:,[3,4]);
RC_1_fig_handle = figure(1);


RC_1_ax_handle = axes(RC_1_fig_handle);

yyaxis left
RC_1_A_plot_handle = plot(RC_1_A(:,1),RC_1_A(:,2));
ylabel("20dB [Magnitude]")

hold on

yyaxis right
RC_1_F_plot_handle = plot(RC_1_F(:,1),RC_1_F(:,2));
ylabel("Phase [deg]")

xlabel('Freq [Hz]')

set(RC_1_ax_handle,'Xscale','log')
set(RC_1_ax_handle,'Yscale','linear')

axis padded
xlim([1,1E15])

set(RC_1_ax_handle,'XGrid','on')
set(RC_1_ax_handle,'YGrid','on')

% yyaxis right
% y1 = logspace(min(RC_1_F(:,2)),max(RC_1_F(:,2)));
% x1 = 159.2E6 * ones(size(y1));
% plot(x1,y1)
% legend('Magnitude','Phase','Location','southwest')