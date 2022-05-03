function [label_name] = data2label(data_name)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

switch data_name
    case 'Vstar'
        label_name = 'Vstar [V]';
    case 'gm_id'
        label_name = 'gm/id [V^-1]';
    case 'fT'
        label_name = 'fT [Hz]';
    case 'gm_id_fT'
        label_name = 'gm/id*fT [Hz*V^-1]';
    case 'Istar'
        label_name = 'Istar [A/um]';
    case 'gm_gds'
        label_name = 'gm/gds [Magnitude]';
    case 'id_w'
        label_name = 'id/w [A/um]';
    otherwise
        label_name = data_name;
end

end