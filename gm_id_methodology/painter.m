function []  = painter(x_var, y_var)

% set figure
figure(1)
hold on
grid on

% print data
legend_label_string = cell(1, size(x_data,2)/2);
for i = 1:size(x_data,2)/2
    h(i) = plot(x_data(:,2*i),y_data(:,2*i));
    legend_label_string{i} = ['T = ', num2str(1.05 + 1*(i-1)), 'u'];
end

% set legend
legend(h,legend_label_string);

% add x,y label and title
x_label_name = data2label(x_data_name);
y_label_name = data2label(y_data_name);

xlabel(x_label_name)
ylabel(y_label_name)
title([mostype, ' ', x_label_name, ' .vs ', y_label_name])

end