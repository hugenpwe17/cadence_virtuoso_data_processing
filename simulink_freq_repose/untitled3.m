% in = out.ScopeData.signals(1).values;
% out3 = out.ScopeData.signals(2).values;
% t = out.tout;
load('pm.mat')

figure(1)

hold on

plot(t,in);

plot(t,pm0);

plot(t,pm45);

plot(t,pm60);

plot(t,pm90);

xlabel('Time [s]')

ylabel('Signal [V]')

legend('input','PM = 0','PM = 45','PM = 60','PM = 90')