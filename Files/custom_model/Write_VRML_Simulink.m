global load chassis drawbar connection numofaxles a d str p numoftraileraxles t1 t2 Name num_of_nodes nodes_offset num_of_tyres

if isempty(chassis) == 1
    chassis = 0;
    load = 0;
end

if p == 2
    load = 1;
    chassis = 1;
end

if isempty(connection) == 1 && d >= 1
    connection = 0;
    drawbar = 0;
end

if p == 1
    tyre_offset = 0;
else
    tyre_offset = num_of_tyres+1;
end

temp1 = strread(num2str([]),'%s');
temp2 = strread(num2str([]),'%s');
temp3 = strread(num2str([]),'%s');
temp4 = strread(num2str([]),'%s');
temp5 = strread(num2str([]),'%s');
temp6 = strread(num2str([]),'%s');
temp7 = strread(num2str([]),'%s');
temp8 = strread(num2str([]),'%s');
temp9 = strread(num2str([]),'%s');
temp10 = strread(num2str([]),'%s');
temp11 = strread(num2str([]),'%s');
temp12 = strread(num2str([]),'%s');
temp13 = strread(num2str([]),'%s');
temp14 = strread(num2str([]),'%s');
temp15 = strread(num2str([]),'%s');
temp16 = strread(num2str([]),'%s');
temp17 = strread(num2str([]),'%s');
temp18 = strread(num2str([]),'%s');
temp19 = strread(num2str([]),'%s');
temp20 = strread(num2str([]),'%s');
temp21 = strread(num2str([]),'%s');
temp22 = strread(num2str([]),'%s');
temp23 = strread(num2str([]),'%s');
temp24 = strread(num2str([]),'%s');
temp25 = strread(num2str([]),'%s');
temp26 = strread(num2str([]),'%s');
temp27 = strread(num2str([]),'%s');
temp28 = strread(num2str([]),'%s');
temp29 = strread(num2str([]),'%s');
temp30 = strread(num2str([]),'%s');
temp31 = strread(num2str([]),'%s');

FieldsWritten = cellstr(repmat(strvcat('rotation','translation'),1,1))';

if p == 1 % hauling units
    NodesWritten = cellstr(['tyre',num2str(tyre_offset+1)])'; 
    temp1 = strcat(NodesWritten',repmat('.',2,1),strcat(FieldsWritten',repmat('#',2,1)));
    NodesWritten = cellstr(['tyre',num2str(tyre_offset+2)])'; 
    temp2 = strcat(NodesWritten',repmat('.',2,1),strcat(FieldsWritten',repmat('#',2,1)));
    NodesWritten = cellstr('frontaxle')';
    temp3 = strcat(NodesWritten',repmat('.',2,1),strcat(FieldsWritten',repmat('#',2,1)));
    tyre_offset = tyre_offset + 2;
    num_of_nodes = 6;
    
    if a == 4
        NodesWritten = cellstr(['tyre',num2str(tyre_offset+1)])'; 
        temp4 = strcat(NodesWritten',repmat('.',2,1),strcat(FieldsWritten',repmat('#',2,1)));
        NodesWritten = cellstr(['tyre',num2str(tyre_offset+2)])'; 
        temp5 = strcat(NodesWritten',repmat('.',2,1),strcat(FieldsWritten',repmat('#',2,1)));
        NodesWritten = cellstr('frontaxle2')';
        temp6 = strcat(NodesWritten',repmat('.',2,1),strcat(FieldsWritten',repmat('#',2,1)));
        num_of_nodes = num_of_nodes + 6;
        tyre_offset = tyre_offset + 2;
    end
    
    NodesWritten = cellstr(['tyre',num2str(tyre_offset+1)])'; 
    temp7 = strcat(NodesWritten',repmat('.',2,1),strcat(FieldsWritten',repmat('#',2,1)));
    NodesWritten = cellstr(['tyre',num2str(tyre_offset+2)])'; 
    temp8 = strcat(NodesWritten',repmat('.',2,1),strcat(FieldsWritten',repmat('#',2,1)));
    NodesWritten = cellstr(['tyre',num2str(tyre_offset+3)])'; 
    temp9 = strcat(NodesWritten',repmat('.',2,1),strcat(FieldsWritten',repmat('#',2,1)));
    NodesWritten = cellstr(['tyre',num2str(tyre_offset+4)])'; 
    temp10 = strcat(NodesWritten',repmat('.',2,1),strcat(FieldsWritten',repmat('#',2,1)));
    NodesWritten = cellstr('rearaxle')';
    temp11 = strcat(NodesWritten',repmat('.',2,1),strcat(FieldsWritten',repmat('#',2,1)));
    num_of_nodes = num_of_nodes + 10;
    tyre_offset = tyre_offset + 4;
    
    if a == 3 || a == 4
        NodesWritten = cellstr(['tyre',num2str(tyre_offset+1)])';
        temp12 = strcat(NodesWritten',repmat('.',2,1),strcat(FieldsWritten',repmat('#',2,1)));
        NodesWritten = cellstr(['tyre',num2str(tyre_offset+2)])';
        temp13 = strcat(NodesWritten',repmat('.',2,1),strcat(FieldsWritten',repmat('#',2,1)));
        NodesWritten = cellstr(['tyre',num2str(tyre_offset+3)])'; 
        temp14 = strcat(NodesWritten',repmat('.',2,1),strcat(FieldsWritten',repmat('#',2,1)));
        NodesWritten = cellstr(['tyre',num2str(tyre_offset+4)])'; 
        temp15 = strcat(NodesWritten',repmat('.',2,1),strcat(FieldsWritten',repmat('#',2,1)));
        NodesWritten = cellstr('rearaxle2')'; 
        temp16 = strcat(NodesWritten',repmat('.',2,1),strcat(FieldsWritten',repmat('#',2,1)));
        num_of_nodes = num_of_nodes + 10;
    end

    if a == 2
        num_of_tyres = 6;
    elseif a == 3
        num_of_tyres = 10;
    elseif a == 4
        num_of_tyres = 12;
    end
    
    NodesWritten = cellstr('chassis_front')'; % chassis_front
    temp17 = strcat(NodesWritten',repmat('.',2,1),strcat(FieldsWritten',repmat('#',2,1)));
    NodesWritten = cellstr('chassis_rear')'; % chassis_rear
    temp18 = strcat(NodesWritten',repmat('.',2,1),strcat(FieldsWritten',repmat('#',2,1)));
    num_of_nodes = num_of_nodes + 4; 
    
    if t1 == 2 || t1 ==3 % truck
        NodesWritten = cellstr('truckload')'; % truckload
        temp19 = strcat(NodesWritten',repmat('.',2,1),strcat(FieldsWritten',repmat('#',2,1)));
        num_of_nodes = num_of_nodes + 2;
    end
    
    NodesWritten = cellstr('engine')'; % engine
    temp20 = strcat(NodesWritten',repmat('.',2,1),strcat(FieldsWritten',repmat('#',2,1)));
    NodesWritten = cellstr('cab')'; % cabine
    temp21 = strcat(NodesWritten',repmat('.',2,1),strcat(FieldsWritten',repmat('#',2,1)));
    num_of_nodes = num_of_nodes + 4;
    
else % trailing units
    if t2 == 2 || t2 == 4
        if d == 1 
            nodes_offset = num_of_nodes;
            NodesWritten = cellstr(['tyre',num2str(tyre_offset)])';
            temp1 = strcat(NodesWritten',repmat('.',2,1),strcat(FieldsWritten',repmat('#',2,1)));
            NodesWritten = cellstr(['tyre',num2str(tyre_offset+1)])';
            temp2 = strcat(NodesWritten',repmat('.',2,1),strcat(FieldsWritten',repmat('#',2,1)));
            NodesWritten = cellstr(['traileraxle', num2str(numoftraileraxles + 1)])'; % dolly axle 1
            temp3 = strcat(NodesWritten',repmat('.',2,1),strcat(FieldsWritten',repmat('#',2,1)));
            NodesWritten = cellstr(['drawbar',num2str(drawbar)])';
            temp4 = strcat(NodesWritten',repmat('.',2,1),strcat(FieldsWritten',repmat('#',2,1)));
            NodesWritten = cellstr(['connection',num2str(connection)])';
            temp5 = strcat(NodesWritten',repmat('.',2,1),strcat(FieldsWritten',repmat('#',2,1)));
            num_of_nodes = num_of_nodes + 10;
            num_of_tyres = num_of_tyres + 2;
            
            NodesWritten = cellstr(['tyre',num2str(tyre_offset+2)])';
            temp6 = strcat(NodesWritten',repmat('.',2,1),strcat(FieldsWritten',repmat('#',2,1)));
            NodesWritten = cellstr(['tyre',num2str(tyre_offset+3)])';
            temp7 = strcat(NodesWritten',repmat('.',2,1),strcat(FieldsWritten',repmat('#',2,1)));
            NodesWritten = cellstr(['traileraxle', num2str(numoftraileraxles + 2)])'; % traileraxle
            temp8 = strcat(NodesWritten',repmat('.',2,1),strcat(FieldsWritten',repmat('#',2,1)));
            num_of_nodes = num_of_nodes + 6;
            num_of_tyres = num_of_tyres + 2;
            
            if a == 2 || a == 3 || a == 4 || a == 5
                NodesWritten = cellstr(['tyre',num2str(tyre_offset+4)])';
                temp9 = strcat(NodesWritten',repmat('.',2,1),strcat(FieldsWritten',repmat('#',2,1)));
                NodesWritten = cellstr(['tyre',num2str(tyre_offset+5)])';
                temp10 = strcat(NodesWritten',repmat('.',2,1),strcat(FieldsWritten',repmat('#',2,1)));
                NodesWritten = cellstr(['traileraxle', num2str(numoftraileraxles + 3)])'; % traileraxle
                temp11 = strcat(NodesWritten',repmat('.',2,1),strcat(FieldsWritten',repmat('#',2,1)));
                num_of_nodes = num_of_nodes + 6;
                num_of_tyres = num_of_tyres + 2;
            end

            if a == 3 || a == 4 || a == 5
                NodesWritten = cellstr(['tyre',num2str(tyre_offset+6)])';
                temp12 = strcat(NodesWritten',repmat('.',2,1),strcat(FieldsWritten',repmat('#',2,1)));
                NodesWritten = cellstr(['tyre',num2str(tyre_offset+7)])';
                temp13 = strcat(NodesWritten',repmat('.',2,1),strcat(FieldsWritten',repmat('#',2,1)));
                NodesWritten = cellstr(['traileraxle', num2str(numoftraileraxles + 4)])'; % traileraxle
                temp14 = strcat(NodesWritten',repmat('.',2,1),strcat(FieldsWritten',repmat('#',2,1)));
                num_of_nodes = num_of_nodes + 6;
                num_of_tyres = num_of_tyres + 2;
            end

            if a == 4 || a == 5
                NodesWritten = cellstr(['tyre',num2str(tyre_offset+8)])';
                temp15 = strcat(NodesWritten',repmat('.',2,1),strcat(FieldsWritten',repmat('#',2,1)));
                NodesWritten = cellstr(['tyre',num2str(tyre_offset+9)])';
                temp16 = strcat(NodesWritten',repmat('.',2,1),strcat(FieldsWritten',repmat('#',2,1)));
                NodesWritten = cellstr(['traileraxle', num2str(numoftraileraxles + 5)])'; % traileraxle
                temp17 = strcat(NodesWritten',repmat('.',2,1),strcat(FieldsWritten',repmat('#',2,1)));
                num_of_nodes = num_of_nodes + 6;
                num_of_tyres = num_of_tyres + 2;
            end

            if a == 5
                NodesWritten = cellstr(['tyre',num2str(tyre_offset+10)])';
                temp18 = strcat(NodesWritten',repmat('.',2,1),strcat(FieldsWritten',repmat('#',2,1)));
                NodesWritten = cellstr(['tyre',num2str(tyre_offset+11)])';
                temp19 = strcat(NodesWritten',repmat('.',2,1),strcat(FieldsWritten',repmat('#',2,1)));
                NodesWritten = cellstr(['traileraxle', num2str(numoftraileraxles + 6)])'; % traileraxle
                temp20 = strcat(NodesWritten',repmat('.',2,1),strcat(FieldsWritten',repmat('#',2,1)));
                num_of_nodes = num_of_nodes + 6;
                num_of_tyres = num_of_tyres + 2;
            end

        elseif d == 2
            nodes_offset = num_of_nodes;
            NodesWritten = cellstr(['tyre',num2str(tyre_offset)])';
            temp1 = strcat(NodesWritten',repmat('.',2,1),strcat(FieldsWritten',repmat('#',2,1)));
            NodesWritten = cellstr(['tyre',num2str(tyre_offset+1)])';
            temp2 = strcat(NodesWritten',repmat('.',2,1),strcat(FieldsWritten',repmat('#',2,1)));
            NodesWritten = cellstr(['traileraxle', num2str(numoftraileraxles + 1)])'; % dolly axle 1
            temp3 = strcat(NodesWritten',repmat('.',2,1),strcat(FieldsWritten',repmat('#',2,1)));
            num_of_nodes = num_of_nodes + 6;
            num_of_tyres = num_of_tyres + 2;

            NodesWritten = cellstr(['tyre',num2str(tyre_offset+2)])';
            temp4 = strcat(NodesWritten',repmat('.',2,1),strcat(FieldsWritten',repmat('#',2,1)));
            NodesWritten = cellstr(['tyre',num2str(tyre_offset+3)])';
            temp5 = strcat(NodesWritten',repmat('.',2,1),strcat(FieldsWritten',repmat('#',2,1)));
            NodesWritten = cellstr(['traileraxle', num2str(numoftraileraxles + 2)])'; % dolly axle 2
            temp6 = strcat(NodesWritten',repmat('.',2,1),strcat(FieldsWritten',repmat('#',2,1)));
            num_of_nodes = num_of_nodes + 6;
            num_of_tyres = num_of_tyres + 2;

            NodesWritten = cellstr(['drawbar',num2str(drawbar)])';
            temp7 = strcat(NodesWritten',repmat('.',2,1),strcat(FieldsWritten',repmat('#',2,1)));
            NodesWritten = cellstr(['connection',num2str(connection)])';
            temp8 = strcat(NodesWritten',repmat('.',2,1),strcat(FieldsWritten',repmat('#',2,1)));
            num_of_nodes = num_of_nodes + 4;
            
            NodesWritten = cellstr(['tyre',num2str(tyre_offset+4)])';
            temp9 = strcat(NodesWritten',repmat('.',2,1),strcat(FieldsWritten',repmat('#',2,1)));
            NodesWritten = cellstr(['tyre',num2str(tyre_offset+5)])';
            temp10 = strcat(NodesWritten',repmat('.',2,1),strcat(FieldsWritten',repmat('#',2,1)));
            NodesWritten = cellstr(['traileraxle', num2str(numoftraileraxles + 3)])'; % traileraxle
            temp11 = strcat(NodesWritten',repmat('.',2,1),strcat(FieldsWritten',repmat('#',2,1)));
            num_of_nodes = num_of_nodes + 6;
            num_of_tyres = num_of_tyres + 2;

            if a == 2 || a == 3 || a == 4 || a == 5
                NodesWritten = cellstr(['tyre',num2str(tyre_offset+6)])';
                temp12 = strcat(NodesWritten',repmat('.',2,1),strcat(FieldsWritten',repmat('#',2,1)));
                NodesWritten = cellstr(['tyre',num2str(tyre_offset+7)])';
                temp13 = strcat(NodesWritten',repmat('.',2,1),strcat(FieldsWritten',repmat('#',2,1)));
                NodesWritten = cellstr(['traileraxle', num2str(numoftraileraxles + 4)])'; % traileraxle
                temp14 = strcat(NodesWritten',repmat('.',2,1),strcat(FieldsWritten',repmat('#',2,1)));
                num_of_nodes = num_of_nodes + 6;
                num_of_tyres = num_of_tyres + 2;
            end

            if a == 3 || a == 4 || a == 5
                NodesWritten = cellstr(['tyre',num2str(tyre_offset+8)])';
                temp15 = strcat(NodesWritten',repmat('.',2,1),strcat(FieldsWritten',repmat('#',2,1)));
                NodesWritten = cellstr(['tyre',num2str(tyre_offset+9)])';
                temp16 = strcat(NodesWritten',repmat('.',2,1),strcat(FieldsWritten',repmat('#',2,1)));
                NodesWritten = cellstr(['traileraxle', num2str(numoftraileraxles + 5)])'; % traileraxle
                temp17 = strcat(NodesWritten',repmat('.',2,1),strcat(FieldsWritten',repmat('#',2,1)));
                num_of_nodes = num_of_nodes + 6;
                num_of_tyres = num_of_tyres + 2;
            end

            if a == 4 || a == 5
                NodesWritten = cellstr(['tyre',num2str(tyre_offset+10)])';
                temp18 = strcat(NodesWritten',repmat('.',2,1),strcat(FieldsWritten',repmat('#',2,1)));
                NodesWritten = cellstr(['tyre',num2str(tyre_offset+11)])';
                temp19 = strcat(NodesWritten',repmat('.',2,1),strcat(FieldsWritten',repmat('#',2,1)));
                NodesWritten = cellstr(['traileraxle', num2str(numoftraileraxles + 6)])'; % traileraxle
                temp20 = strcat(NodesWritten',repmat('.',2,1),strcat(FieldsWritten',repmat('#',2,1)));
                num_of_nodes = num_of_nodes + 6;
                num_of_tyres = num_of_tyres + 2;
            end

            if a == 5
                NodesWritten = cellstr(['tyre',num2str(tyre_offset+12)])';
                temp21 = strcat(NodesWritten',repmat('.',2,1),strcat(FieldsWritten',repmat('#',2,1)));
                NodesWritten = cellstr(['tyre',num2str(tyre_offset+13)])';
                temp22 = strcat(NodesWritten',repmat('.',2,1),strcat(FieldsWritten',repmat('#',2,1)));
                NodesWritten = cellstr(['traileraxle', num2str(numoftraileraxles + 7)])'; % traileraxle
                temp23 = strcat(NodesWritten',repmat('.',2,1),strcat(FieldsWritten',repmat('#',2,1)));
                num_of_nodes = num_of_nodes + 6;
                num_of_tyres = num_of_tyres + 2;
            end
        end
    end
%     
    if t2 == 1 || t2 == 3 || t2 == 5 || t2 == 6
        nodes_offset = num_of_nodes;
%         if t2 == 5 || t2 == 6 % dollies and (db)trailers
%             NodesWritten = cellstr(['drawbar',num2str(drawbar)])';
%             temp7 = strcat(NodesWritten',repmat('.',2,1),strcat(FieldsWritten',repmat('#',2,1)));
%             num_of_nodes = num_of_nodes + 2;
%             if t2 == 2 || t2 == 4 || t2 == 5 % dollies and trailers
%                 NodesWritten = cellstr(['connection',num2str(connection)])';
%                 temp8 = strcat(NodesWritten',repmat('.',2,1),strcat(FieldsWritten',repmat('#',2,1)));
%                 num_of_nodes = num_of_nodes + 2;
%             end
%         end

        NodesWritten = cellstr(['tyre',num2str(tyre_offset)])';
        temp9 = strcat(NodesWritten',repmat('.',2,1),strcat(FieldsWritten',repmat('#',2,1)));
        NodesWritten = cellstr(['tyre',num2str(tyre_offset+1)])';
        temp10 = strcat(NodesWritten',repmat('.',2,1),strcat(FieldsWritten',repmat('#',2,1)));
        NodesWritten = cellstr(['traileraxle', num2str(numoftraileraxles + 1)])'; % traileraxle
        temp11 = strcat(NodesWritten',repmat('.',2,1),strcat(FieldsWritten',repmat('#',2,1)));
        num_of_nodes = num_of_nodes + 6;
        num_of_tyres = num_of_tyres + 2;

        if a == 2 || a == 3 || a == 4 || a == 5
            NodesWritten = cellstr(['tyre',num2str(tyre_offset+2)])';
            temp12 = strcat(NodesWritten',repmat('.',2,1),strcat(FieldsWritten',repmat('#',2,1)));
            NodesWritten = cellstr(['tyre',num2str(tyre_offset+3)])';
            temp13 = strcat(NodesWritten',repmat('.',2,1),strcat(FieldsWritten',repmat('#',2,1)));
            NodesWritten = cellstr(['traileraxle', num2str(numoftraileraxles + 2)])'; % traileraxle
            temp14 = strcat(NodesWritten',repmat('.',2,1),strcat(FieldsWritten',repmat('#',2,1)));
            num_of_nodes = num_of_nodes + 6;
            num_of_tyres = num_of_tyres + 2;
        end

        if a == 3 || a == 4 || a == 5
            NodesWritten = cellstr(['tyre',num2str(tyre_offset+4)])';
            temp15 = strcat(NodesWritten',repmat('.',2,1),strcat(FieldsWritten',repmat('#',2,1)));
            NodesWritten = cellstr(['tyre',num2str(tyre_offset+5)])';
            temp16 = strcat(NodesWritten',repmat('.',2,1),strcat(FieldsWritten',repmat('#',2,1)));
            NodesWritten = cellstr(['traileraxle', num2str(numoftraileraxles + 3)])'; % traileraxle
            temp17 = strcat(NodesWritten',repmat('.',2,1),strcat(FieldsWritten',repmat('#',2,1)));
            num_of_nodes = num_of_nodes + 6;
            num_of_tyres = num_of_tyres + 2;
        end

        if a == 4 || a == 5
            NodesWritten = cellstr(['tyre',num2str(tyre_offset+6)])';
            temp18 = strcat(NodesWritten',repmat('.',2,1),strcat(FieldsWritten',repmat('#',2,1)));
            NodesWritten = cellstr(['tyre',num2str(tyre_offset+7)])';
            temp19 = strcat(NodesWritten',repmat('.',2,1),strcat(FieldsWritten',repmat('#',2,1)));
            NodesWritten = cellstr(['traileraxle', num2str(numoftraileraxles + 4)])'; % traileraxle
            temp20 = strcat(NodesWritten',repmat('.',2,1),strcat(FieldsWritten',repmat('#',2,1)));
            num_of_nodes = num_of_nodes + 6;
            num_of_tyres = num_of_tyres + 2;
        end

        if a == 5
            NodesWritten = cellstr(['tyre',num2str(tyre_offset+8)])';
            temp21 = strcat(NodesWritten',repmat('.',2,1),strcat(FieldsWritten',repmat('#',2,1)));
            NodesWritten = cellstr(['tyre',num2str(tyre_offset+9)])';
            temp22 = strcat(NodesWritten',repmat('.',2,1),strcat(FieldsWritten',repmat('#',2,1)));
            NodesWritten = cellstr(['traileraxle', num2str(numoftraileraxles + 5)])'; % traileraxle
            temp23 = strcat(NodesWritten',repmat('.',2,1),strcat(FieldsWritten',repmat('#',2,1)));
            num_of_nodes = num_of_nodes + 6;
            num_of_tyres = num_of_tyres + 2;
        end
    end
    
    if t2 == 6 % dbtrailer
        NodesWritten = cellstr(['trailerchassis',num2str(chassis)])';
        temp24 = strcat(NodesWritten',repmat('.',2,1),strcat(FieldsWritten',repmat('#',2,1)));
        NodesWritten = cellstr(['drawbar',num2str(drawbar)])';
        temp25 = strcat(NodesWritten',repmat('.',2,1),strcat(FieldsWritten',repmat('#',2,1)));
        NodesWritten = cellstr(['trailerload',num2str(load)])';
        temp26 = strcat(NodesWritten',repmat('.',2,1),strcat(FieldsWritten',repmat('#',2,1)));
        num_of_nodes = num_of_nodes + 6;
        chassis = chassis + 1;
        load = load + 1;
    elseif t2 == 5 % trailer
        NodesWritten = cellstr(['trailerchassis',num2str(chassis)])';
        temp24 = strcat(NodesWritten',repmat('.',2,1),strcat(FieldsWritten',repmat('#',2,1)));
        NodesWritten = cellstr(['trailerchassis',num2str(chassis+1)])';
        temp25 = strcat(NodesWritten',repmat('.',2,1),strcat(FieldsWritten',repmat('#',2,1)));
        
        NodesWritten = cellstr(['drawbar',num2str(drawbar)])';
        temp26 = strcat(NodesWritten',repmat('.',2,1),strcat(FieldsWritten',repmat('#',2,1)));
        NodesWritten = cellstr(['connection',num2str(connection)])';
        temp27 = strcat(NodesWritten',repmat('.',2,1),strcat(FieldsWritten',repmat('#',2,1)));
                
        NodesWritten = cellstr(['trailerload',num2str(load)])';
        temp28 = strcat(NodesWritten',repmat('.',2,1),strcat(FieldsWritten',repmat('#',2,1)));
        NodesWritten = cellstr(['trailerload',num2str(load+1)])';
        temp29 = strcat(NodesWritten',repmat('.',2,1),strcat(FieldsWritten',repmat('#',2,1)));        
        num_of_nodes = num_of_nodes + 12;
        chassis = chassis + 2;
        load = load + 2;
    end
        
    if t2 == 1 || t2 == 2 || t2 == 3 || t2 == 4 % semitrailers
        NodesWritten = cellstr(['trailerchassis',num2str(chassis)])';
        temp24 = strcat(NodesWritten',repmat('.',2,1),strcat(FieldsWritten',repmat('#',2,1)));
        NodesWritten = cellstr(['trailerchassis',num2str(chassis+1)])';
        temp25 = strcat(NodesWritten',repmat('.',2,1),strcat(FieldsWritten',repmat('#',2,1)));
        NodesWritten = cellstr(['trailerload',num2str(load)])';
        temp26 = strcat(NodesWritten',repmat('.',2,1),strcat(FieldsWritten',repmat('#',2,1)));
        NodesWritten = cellstr(['trailerload',num2str(load+1)])';
        temp27 = strcat(NodesWritten',repmat('.',2,1),strcat(FieldsWritten',repmat('#',2,1)));
        num_of_nodes = num_of_nodes + 8;
        chassis = chassis + 2;
        load = load + 2;
    end
end
      
str = cat(2,[temp1{:} temp2{:} temp3{:} temp4{:} temp5{:} temp6{:} temp7{:} temp8{:} temp9{:} temp10{:} temp11{:} temp12{:} temp13{:} temp14{:} temp15{:} temp16{:} temp17{:} temp18{:} temp19{:} temp20{:} temp21{:} temp22{:} temp23{:} temp24{:} temp25{:} temp26{:} temp27{:} temp28{:} temp29{:} temp30{:} temp31{:}]); % deal out and concatenate