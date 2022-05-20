%% POTER
clc
clear
close all

a = readmatrix('data/POTER.csv');

subplot(2,1,1);

x = a(:,1);
y = a(:,2);

h = plot(x, y);

xlim([1,1E9])
ylim([min(y)-15,max(y)+15])

ylabel('Magnitude [dB]')

set(gca,'XScale','log')
grid on

subplot(2,1,2);

x = a(:,3);
y = a(:,4);

h = plot(x, y);

xlim([1,1E9])
ylim([min(y)-15,max(y)+15])

ylabel('Phase [deg]')
xlabel('Frequence [Hz]')

set(gca,'XScale','log')
grid on

%%  NOISE
clc
clear
close all

a = readmatrix('data/NOISE.csv');

x = a(:,1);
y = a(:,2);
h = plot(x, y);

xlim([1,1E8])
ylim([-0.2E-5,3E-5])

xlabel('Frequence [Hz]')
ylabel('Noise [V/Hz^{1/2}]')

set(gca,'XScale','log')
set(gca,'YScale','linear')
grid on

%%  VOS
clc
clear
close all

a = readmatrix('data/VOS.csv');

h = plot(a(:,1),a(:,2)/10^(75/20));

ylim([0.8,0.9]*10^-3)

xlabel('time [s]')
ylabel('V_{OS} [V]')

set(gca,'XScale','linear')
set(gca,'YScale','linear')
grid on

%%  VOS
clc
clear
close all

a = readmatrix('data/SW.csv');

subplot(2,1,1);

h = plot(a(:,1),a(:,2));

xlim([1E-9,2E-8])
ylim([-0.2,1.2])

ylabel('Magnitude [dB]')

set(gca,'XScale','linear')
grid on

subplot(2,1,2);

h = plot(a(:,3),a(:,4));

xlim([1E-9,2E-8])
ylim([0.0,0.6])

ylabel('Phase [deg]')
xlabel('Frequence [Hz]')

set(gca,'XScale','linear')
grid on