clc
clear
close all
%%%
mos = gmoverid('pmos','data/');
mos.getData
x = mos.V_gs;
y = mos.gm_gds;
mos.print(x, y)
mos.grid
mos.yscale
mos.legend('best')
mos.title()

x_find = 0.897;
% mos.xfindy(x_find)

left = min(x.data,[],'all');
right = max(x.data,[],'all');
top = max(y.data,[],'all');
bottom = min(y.data,[],'all');

xlim([left,right])
ylim([bottom/2,top*2])

hold on

% plot([x_find, x_find],[bottom/10,top*10],'linewidth',2)
%%%
disp('done!')

%%
figure(10)          % define figure
subplot(2,1,1);     % subplot(x,y,n)x表示显示的行数，y表示列数，n表示第几幅图片
plot(mos.V_gs, mos.gm_gds);
subplot(2,1,2);
plot(magic(2));

legend on
