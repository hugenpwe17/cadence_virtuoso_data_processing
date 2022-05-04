clc
clear
close all
%%%
mos = gmoverid('pmos');
mos.getData
mos.print(mos.gm_id, mos.fT_gm_id)
mos.grid
% mos.yscale
mos.legend('east')
%%%
disp('done!')