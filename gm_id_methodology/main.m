clc
clear
close all
%%%
mos = gmoverid('nmos','data/');
mos.getData
mos.print(mos.gm_id, mos.gm_gds)
mos.grid
% mos.yscale
mos.legend('east')

mos.xfindy(10)
%%%
disp('done!')