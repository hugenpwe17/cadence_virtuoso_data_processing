function [nmos, pmos] = csv2mat(path)
%%%
% nmos, pmos frequency sweep data convert(csv -> mat)
%%%

nmos = data_read(path, 'nmos');
pmos = data_read(path, 'pmos');

end

function [data] = data_read(path, mos_type)
% initialization
data.V_gs.name = 'V_gs';
data.V_gs.type = mos_type;
data.gm_gds.name = 'gm_gds';
data.gm_gds.type = mos_type;
data.gm_id.name = 'gm_id';
data.gm_id.type = mos_type;
data.fT.name = 'fT';
data.fT.type = mos_type;
data.id_w.name = 'id_w';
data.id_w.type = mos_type;
data.fT_gm_id.name = 'fT_gm_id';
data.fT_gm_id.type = mos_type;

% V_gs & gm/id
Temp = readmatrix([path, mos_type, '_', 'gm_id.csv']);

[data.V_gs.data,data.gm_id.data] = var_split(Temp);

% gm/gds(ro)
Temp = readmatrix([path,  mos_type, '_', 'gm_gds.csv']);

[~,data.gm_gds.data] = var_split(Temp);

% fT
Temp = readmatrix([path,  mos_type, '_', 'fT.csv']);

[~,data.fT.data] = var_split(Temp);

% fT*gm/id
Temp = readmatrix([path,  mos_type, '_', 'fT_gm_id.csv']);

[~,data.fT_gm_id.data] = var_split(Temp);

% id/w
Temp = readmatrix([path,  mos_type, '_', 'id_w.csv']);

[~,data.id_w.data] = var_split(Temp);

end

function [x_data, y_data] = var_split(data)

x_data = zeros(size(data,1),size(data,2)/2);
y_data = x_data;

for i = 1:size(data,2)
    if(mod(i,2))
        x_data(:,(i+1)/2) = data(:,i);
    else
        y_data(:,i/2) = data(:,i);
    end
end

end
