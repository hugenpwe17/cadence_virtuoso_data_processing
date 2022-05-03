clc
clear
close all

% define data path
data_path = 'data/';

%% import data
[nmos, pmos] = csv2mat(data_path);

%% print
% V_gs, gm_id, gm_gds, fT, fT_gm_id, id_w
line = painter(nmos.gm_id, nmos.id_w, 'NMOS', 'gm_id', 'id_w');
set(gca,'YScale','log')

%% point's x coords you want to see its y value
point = gobjects(1,size(line,2));
for i = 1:size(line,2)
    P_x = 10;
    P_y = interp1(line(i).XData,line(i).YData,P_x, "spline");
    point(i) = scatter(P_x,P_y);
end