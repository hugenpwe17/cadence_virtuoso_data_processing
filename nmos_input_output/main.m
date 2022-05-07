clc
clear
close all

A = readmatrix("input.csv");
B = readmatrix("output.csv");

plot(A(:,1),A(:,2),'Marker','diamond');
hold on
plot(B(:,1),B(:,2),'Marker','.');

plot(B(:,3),B(:,4),'Marker','.');

plot(B(:,5),B(:,6),'Marker','.');

plot(B(:,7),B(:,8),'Marker','.');

plot(B(:,9),B(:,10),'Marker','.');

legend('input  V_{DS} = 5V','output V_{GS} = 0.5V','output V_{GS} = 1.5V',...
    'output V_{GS} = 2.5V','output V_{GS} = 3.5V','output V_{GS} = 4.5V','Location','best')

xlabel("V_{GS} [V]/ V_{DS} [V]")
ylabel("I_D [A]")