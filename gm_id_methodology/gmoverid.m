classdef gmoverid < handle
% gm/id methodology in analog circuits design

    % data info
    properties (SetAccess=private)
        path
        name
        mostype
        
    end

    % circuit variable
    properties (SetAccess=private)
        V_gs
        gm_id
        gm_gds
        id_w
        fT
        fT_gm_id
    end

    % image variable
    properties (SetAccess=public)
        figure_hand
        axes_hand
        line_hand
        point_hand
        title_bak
        legends
        leg_hand
        x_value
        y_value
    end

    % methods define
    methods
        
        function obj = gmoverid(mostype, path)
            % class initialization

            obj.path = path;
            obj.mostype = mostype;
            obj.name = upper(obj.mostype);
        end  
        
        function getData(obj)
        % data import

            % V_gs & gm/id
            Temp = readmatrix([obj.path, '/', obj.mostype, '_', 'gm_id.csv']);
            [obj.V_gs.data, obj.gm_id.data] = var_split(Temp);
            
            % gm/gds(ro)
            Temp = readmatrix([obj.path, '/', obj.mostype, '_', 'gm_gds.csv']);
            [~, obj.gm_gds.data] = var_split(Temp);
            
            % fT
            Temp = readmatrix([obj.path, '/', obj.mostype, '_', 'fT.csv']);
            [~, obj.fT.data] = var_split(Temp);

            % fT*gm/id
            Temp = readmatrix([obj.path, '/', obj.mostype, '_', 'fT_gm_id.csv']);
            [~, obj.fT_gm_id.data] = var_split(Temp);

            % id/w
            Temp = readmatrix([obj.path, '/', obj.mostype, '_', 'id_w.csv']);
            [~, obj.id_w.data] = var_split(Temp);
            
            % name inherit
            obj.V_gs.name   = 'V_gs';
            obj.gm_id.name  = 'gm_id';
            obj.gm_gds.name = 'gm_gds';
            obj.fT.name     = 'fT';
            obj.fT_gm_id.name = 'fT_gm_id';
            obj.id_w.name   = 'id_w';
           
            % type inherit
            obj.V_gs.type   = obj.mostype;
            obj.gm_id.type  = obj.mostype;
            obj.gm_gds.type = obj.mostype;
            obj.fT.type     = obj.mostype;
            obj.fT_gm_id.type = obj.mostype;
            obj.id_w.type   = obj.mostype;

        end

        function print(obj, x_var, y_var)

            if(~exist('x_var','var'))
                x_var = obj.V_gs;
            end

            if(~exist('y_var','var'))
                y_var = obj.gm_id;
            end

            obj.figure_hand = figure;

            obj.axes_hand = axes(obj.figure_hand);

            [obj.line_hand, obj.legends] = painter(x_var,y_var);

            x_label_name = data2label(x_var.name);
            y_label_name = data2label(y_var.name);

            xlabel(x_label_name, 'FontSize', 12, 'FontName', 'YaHei Consolas Hybrid')
            ylabel(y_label_name, 'FontSize', 12, 'FontName', 'YaHei Consolas Hybrid')
            title([x_label_name, ' .vs ',  y_label_name, ' (', obj.name, ')'],...
                    'FontSize', 10, 'FontName', 'YaHei Consolas Hybrid')
            % title backup
            obj.title_bak = obj.axes_hand.Title.String;

            hold(obj.axes_hand,'off');
%             axis(obj.axes_hand,'square');
            axis(obj.axes_hand,'padded');

        end

        function title(obj)
            
            if(strcmp(obj.axes_hand.Title.String,''))
                title(obj.title_bak,...
                    'FontSize', 10, 'FontName', 'YaHei Consolas Hybrid')
            else
                obj.axes_hand.Title.String = '';
            end
        end

        function legend(obj, location)
            if(~exist('location','var'))
                location = 'best';
            end
            obj.leg_hand = legend(obj.line_hand,obj.legends,'Location',location,...
                        'FontSize',10,'FontName','YaHei Consolas Hybrid');
            set(obj.leg_hand,'AutoUpdate','off')
            box(obj.leg_hand,'on')
        end

        function grid(obj)
            if(obj.axes_hand.XGrid || obj.axes_hand.YGrid || obj.axes_hand.ZGrid)
                grid(obj.axes_hand,'off');
            else 
                grid(obj.axes_hand,'on');
            end
        end

        function xscale(obj)
            if(strcmp(obj.axes_hand.XScale, 'linear'))
                set(obj.axes_hand,'XScale','log')
            else
                set(obj.axes_hand,'XScale','linear')
            end
        end

        function yscale(obj)
            if(strcmp(obj.axes_hand.YScale, 'linear'))
                set(obj.axes_hand,'YScale','log')
            else
                set(obj.axes_hand,'YScale','linear')
            end
        end

        function xfindy(obj, x_corrds)
            hold on
%             delete(obj.point_hand)
            % calculate y value in given x corrd by interp1
            obj.point_hand = gobjects(1,size(obj.line_hand,2));
            for i = 1:size(obj.line_hand,2)
                temp = interp1(obj.line_hand(i).XData, obj.line_hand(i).YData, x_corrds, "linear");
                obj.point_hand(i) = scatter(x_corrds, temp, 10);
            end
            % prnit y value table in each L 
            LDN = cell(size(obj.line_hand,2),1);
            PYD = zeros(size(obj.line_hand,2),1);
            for i = 1:size(obj.line_hand,2)
                LDN{i} = obj.line_hand(i).DisplayName;
                PYD(i,1) = obj.point_hand(i).YData;
            end
            T = table(LDN,PYD);
            disp(T);
        end

        function save(obj, name)

            exportgraphics(obj.figure_hand, ['figure/',name], 'Resolution', 300);

        end

    end

    methods (Static)

    end
    
end

function [h, legend_label_string]  = painter(x_var, y_var)
    % print data
%     c=colormap(hot(20));
    c=colormap(hsv(20));
    h = gobjects(1,14);
    legend_label_string = cell(1, size(x_var,2));
    for i = 1:size(x_var.data,2)
        h(i) = plot(x_var.data(:,i),y_var.data(:,i),'color',c(i,:),'LineWidth',1.5);
        hold on
        legend_label_string{i} = ['L = ', num2str(1.05 + 1*(i-1)), 'u'];
    end
        
end

function [x_data, y_data] = var_split(data)
    % var data split

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
        case 'fT_gm_id'
            label_name = 'fT*gm/id [Hz*V^{-1}]';
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

