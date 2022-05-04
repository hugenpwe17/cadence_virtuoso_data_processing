clc
clear
close all

% define data path
data_path = 'data/';

%% import data
[nmos, pmos] = csv2mat(data_path);

%% print
% V_gs, gm_id, gm_gds, fT, fT_gm_id, id_w
line = painter(nmos.gm_id, nmos.id_w);
set(gca,'YScale','log')

%% point's x coords you want to see its y value
point = gobjects(1,size(line,2));
for i = 1:size(line,2)
    P_x = 10;
    P_y = interp1(line(i).XData,line(i).YData,P_x, "spline");
    point(i) = scatter(P_x,P_y);
end

%% print table
LDN = cell(size(line,2),1);
PYD = zeros(size(line,2),1);
for i = 1:size(line,2)
    LDN{i} = line(i).DisplayName;
    PYD(i,1) = point(i).YData;
end
T = table(LDN,PYD);

disp(T)
disp('done')
