clc
clear
close all

% define csv file's path
path_name = 'nmos_50_100n/';

% select x and y
% var:k
% Vstar, gm_id, fT, gm_id_fT, Istar
x_data_name = 'Vstar';
y_data_name = 'Vstar';

% import data
x_data_filename = [path_name, 'nmos_', x_data_name, '.csv'];
y_data_filename = [path_name, 'nmos_', y_data_name, '.csv'];
x_data = csvread(x_data_filename, 1);
y_data = csvread(y_data_filename, 1);

% set figure
figure(1)
hold on
grid on

% print data
legend_label_string = cell(1, size(x_data,2)/2);
factor = 1;
for i = 1:size(x_data,2)/2
    h(i) = plot(x_data(:,2*i - 1),y_data(:,2*i)/factor);
    legend_label_string{i} = ['T = ', num2str(350 + 100*(i-1)), 'n'];
end

% set legend
legend(h,legend_label_string);

% add x,y label and title
switch x_data_name
    case 'Vstar'
        x_label_name = 'Vstar [V]';
    case 'gm_id'
        x_label_name = 'gm/id [V^-1]';
    case 'fT'
        x_label_name = 'fT [Hz]';
    case 'gm_id_fT'
        x_label_name = 'gm/id*fT [Hz*V^-1]';
    case 'Istar'
        x_label_name = 'Istar [A/um]';
    otherwise
        x_label_name = x_data_name;
end

switch y_data_name
    case 'Vstar'
        y_label_name = 'Vstar [V]';
    case 'gm_id'
        y_label_name = 'gm/id [V^-1]';
    case 'fT'
        y_label_name = 'fT [Hz]';
    case 'gm_id_fT'
        y_label_name = 'gm/id*fT [Hz*V^-1]';
    case 'Istar'
        y_label_name = 'Istar [A/um]';
   otherwise
        y_label_name = y_data_name;
end

xlabel(x_label_name)
ylabel(y_label_name)
title([x_label_name, ' .vs ', y_label_name])