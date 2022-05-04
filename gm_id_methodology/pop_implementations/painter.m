function [h]  = painter(x_var, y_var)

% print data
h = gobjects(1,14);
legend_label_string = cell(1, size(x_var,2));
for i = 1:size(x_var.data,2)
    h(i) = plot(x_var.data(:,i),y_var.data(:,i));
    hold on
    legend_label_string{i} = ['L = ', num2str(1.05 + 1*(i-1)), 'u'];
end

% set legend
leg = legend(h,legend_label_string,'Location','best');
set(leg,'AutoUpdate','off')
box(leg,'on')
grid on

% add x,y label and title
x_label_name = data2label(x_var.name);
y_label_name = data2label(y_var.name);

xlabel(x_label_name)
ylabel(y_label_name)
title([upper(x_var.type), '''s ', x_label_name, ' .vs ', upper(y_var.type), '''s ',  y_label_name])

end

function [label_name] = data2label(data_name)
% data name convert to label

switch data_name
    case 'V_gs'
        label_name = 'V_{gs} [V]';
    case 'Vstar'
        label_name = 'Vstar [V]';
    case 'gm_id'
        label_name = 'gm/id [V^{-1}]';
    case 'fT'
        label_name = 'fT [Hz]';
    case 'gm_id_fT'
        label_name = 'gm/id*fT [Hz*V^{-1}]';
    case 'Istar'
        label_name = 'Istar [A/m]';
    case 'gm_gds'
        label_name = 'gm/gds [Magnitude]';
    case 'id_w'
        label_name = 'id/w [A/m]';
    otherwise
        label_name = data_name;
end

end
