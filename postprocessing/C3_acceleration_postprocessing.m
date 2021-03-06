function C3_acceleration_postprocessing

global NumberOfRows S results  Excelsave ExcelFileName
global acceleration_results Truckname viewpoint_acc
global acceleration_filename acc_wrl

javaaddpath(which('MatlabGarbageCollector.jar'));
org.dt.matlab.utilities.JavaMemoryCleaner.clear(1);
clc;
    
%% Acceleration Capability tab lay-out
set(S.tab4,'Parent', S.tgroup);

S.tgroup_acc = uitabgroup('Parent',S.tab4, 'tablocation', 'right');
S.PBS_tab = uitab('Parent', S.tgroup_acc,'backgroundcolor','w', 'Title','PBS Data');
S.acc_visual_tab = uitab('Parent', S.tgroup_acc, 'backgroundcolor','w', 'Title','Visualization');

S.back_button = uicontrol('parent', S.PBS_tab,...
                          'style','pushbutton',...
                          'BackgroundColor','w',...
                          'String','Back',...
                          'FontSize',10,...
                          'FontUnits','Normalized',...
                          'FontWeight','bold',...
                          'ForeGroundColor','r',...
                          'units','normalized',...
                          'position',[0.005 0.94 0.1 0.05],...
                          'Callback',@Back_callback);
                      
S.Acceleration_title = uicontrol('Parent',              S.PBS_tab,...
                                 'Style',               'text',...
                                 'String',              'Acceleration capability',...
                                 'Backgroundcolor',     'w',...
                                 'FontSize',            3.5,...
                                 'FontUnits','Normalized',...
                                 'FontWeight',          'bold',...
                                 'Units',               'Normalized',...
                                 'Position',            [0.35 0.85 0.3 0.15]);

S.Performace_panel = uipanel('Parent',              S.PBS_tab,...
                             'Units',               'Centimeters',...
                             'Position',            [3 11 8 3],...
                             'backgroundcolor',     'w',...
                             'Title',               'Maintain Speed Performance Levels',...
                             'Units',               'Normalized',...
                             'FontWeight',          'bold',...
                             'FontSize',            12,...
                             'FontUnits','Normalized',...
                             'BorderWidth',         2,...
                             'BorderType',          'Line',...
                             'highlightcolor',      'k');

S.upgrade_text = uicontrol('Parent',                S.Performace_panel,...
                           'Style',                 'text',...
                           'String',                'Time for 100m (s)',...
                           'Backgroundcolor',       'w',...
                           'FontSize',              10,...
                           'FontUnits','Normalized',...
                           'Units',                 'Normalized',...
                           'Position',              [0.1 .65 0.4 .2]);

S.Level_text = uicontrol('Parent',              S.Performace_panel,...
                         'Style',               'text',...
                         'String',              'Level',...
                         'Backgroundcolor',     'w',...
                         'FontSize',            10,...
                         'FontUnits','Normalized',...
                         'Units',               'Normalized',...
                         'Position',            [0.65 0.65 0.15 0.2]);                    

S.time_edit = uicontrol('Parent',               S.Performace_panel,...
                        'Style',                'edit', ...
                        'Backgroundcolor',      'w',...
                        'FontSize',             12,...
                        'FontUnits','Normalized',...
                        'enable',               'off',...
                        'Units',                'Normalized',...
                        'Position',             [0.675 0.3 0.15 0.2]);

S.level_edit = uicontrol('Parent',              S.Performace_panel,...
                         'Style',               'edit', ...
                         'Backgroundcolor',     'w',...
                         'FontSize',            12,...
                         'FontUnits','Normalized',...
                         'enable',              'off',...
                         'Units',               'Normalized',...
                         'Position',            [0.225 0.3 0.15 0.2]);    

%% Visualization panel                     
S.visual_acc_panel =          uipanel('Parent',             S.acc_visual_tab,...
                                      'Units',              'normalized',...
                                      'Position',           [0 0 1 1],...
                                      'BackgroundColor',    'w');                          

S.acc_nav_text =              uicontrol('Parent',           S.visual_acc_panel,...
                                        'Style',            'text',...
                                        'backgroundColor',  'w',...
                                        'Units',            'Normalized',...
                                        'FontWeight',       'bold',...
                                        'String',           'Navigation zones',...
                                        'FontSize',         10,...
                                        'FontUnits',        'Normalized',...
                                        'Position',         [0.55 0.95 0.1 0.05]);  
                                  
S.acc_nav_popup =             uicontrol('Parent',           S.visual_acc_panel,...
                                        'Style',            'popup',...
                                        'backgroundColor',  'w',...
                                        'Units',            'Normalized',...
                                        'FontWeight',       'bold',...
                                        'String',           {'On','Off'},...
                                        'FontSize',         10,...
                                        'FontUnits',        'Normalized',...
                                        'Position',         [0.55 0.9 0.1 0.05],...
                                        'Callback',         @acc_nav_callback); 
                                    
S.acc_view_text =             uicontrol('Parent',           S.visual_acc_panel,...
                                        'Style',            'text',...
                                        'backgroundColor',  'w',...
                                        'Units',            'Normalized',...
                                        'FontWeight',       'bold',...
                                        'FontSize',         10,...
                                        'String',           'Viewpoint',...
                                        'FontUnits',        'Normalized',...
                                        'Position',         [0.24 0.95 0.1 0.05]);
                                    
S.acc_view_popup =            uicontrol('Parent',           S.visual_acc_panel,...
                                        'Style',            'popup',...
                                        'backgroundColor',  'w',...
                                        'Units',            'Normalized',...
                                        'FontWeight',       'bold',...
                                        'FontSize',         10,...
                                        'String',           {'Top view','Side view','Rear view','Front view','Top rotating view'},...
                                        'FontUnits',        'Normalized',...
                                        'Value',            2,...
                                        'Position',         [0.25 0.9 0.1 0.05],...
                                        'Callback',         @acc_view_callback); 


S.acc_run_vis_push =          uicontrol('Parent',           S.visual_acc_panel,...
                                        'Style',            'toggle',...
                                        'backgroundColor',  'w',...
                                        'ForegroundColor',  'b',...
                                        'Units',            'Normalized',...
                                        'FontWeight',       'bold',...
                                        'FontSize',         10,...
                                        'FontUnits',        'Normalized',...
                                        'Value',            0,...
                                        'Position',         [0.7 0.9 0.05 0.05],...
                                        'Callback',         @run_acc_visualization_callback); 
                                    
S.acc_stop_vis_push =         uicontrol('Parent',           S.visual_acc_panel,...
                                        'Style',            'toggle',...
                                        'backgroundColor',  'w',...
                                        'ForegroundColor',  'b',...
                                        'Units',            'Normalized',...
                                        'FontWeight',       'bold',...
                                        'FontSize',         10,...
                                        'FontUnits',        'Normalized',...
                                        'Value',            1,...
                                        'Position',         [0.75 0.9 0.05 0.05],...
                                        'Callback',         @stop_acc_visualization_callback); 

S.acc_speed_string =         uicontrol('Parent',           S.visual_acc_panel,...
                                        'Style',            'text',...
                                        'backgroundColor',  'w',...
                                        'Units',            'Normalized',...
                                        'FontWeight',       'bold',...
                                        'String',           'Simulation speed',...
                                        'FontSize',         10,...
                                        'FontUnits',        'Normalized',...
                                        'Value',            0,...
                                        'Position',         [0.35 0.95 0.2 0.05]);
                                    
S.acc_speed_popup =           uicontrol('Parent',           S.visual_acc_panel,...
                                        'Style',            'popup',...
                                        'backgroundColor',  'w',...
                                        'Units',            'Normalized',...
                                        'FontWeight',       'bold',...
                                        'String',           {'Low','Normal','High'},...
                                        'FontSize',         10,...
                                        'Value',            2,...
                                        'FontUnits',        'Normalized',...
                                        'Position',         [0.375 0.9 0.1 0.05],...
                                        'Callback',         @acc_speed_callback); 
                                     
[a,~]=imread('play.jpg');
[r,e,~]=size(a); 
x=ceil(r/30); 
y=ceil(e/30); 
g=a(1:x:end,1:y:end,:);
g(g==255)=5.5*255;
set(S.acc_run_vis_push,'CData',g);

[a,~]=imread('stop.jpg');
[r,e,~]=size(a); 
x=ceil(r/30); 
y=ceil(e/30); 
g=a(1:x:end,1:y:end,:);
g(g==255)=5.5*255;
set(S.acc_stop_vis_push,'CData',g);

S.back_button = uicontrol('parent', S.visual_acc_panel,...
                          'style','pushbutton',...
                          'BackgroundColor','w',...
                          'String','Back',...
                          'FontSize',10,...
                          'FontUnits','Normalized',...
                          'FontWeight','bold',...
                          'ForeGroundColor','r',...
                          'units','normalized',...
                          'position',[0.005 0.9 0.1 0.05],...
                          'Callback',@Back_callback);                                        
%% PBS Data
if results == 1
    dirName = ['simresults\C3_Acceleration\LZV_custom\',acceleration_results];
    files = dir( fullfile(dirName,'*.mat') );
    filename = files.name;
    load(filename) 
else
    load(['simresults/C3_Acceleration/LZV_custom/',Truckname,'/',acceleration_filename])
end 
acc=s.steeraxle1.acc(:,1);

temps=s.time;
position=s.steeraxle.pos(:,1);
vitesse=s.Vx;

%%% Calculation of Acceleration Capability %%%
a=1;
while position(a)<100
    a=a+1;
end
t=temps(a);
t=round(t*10)/10;

if temps(a)<20
    %Performance Level 1
    level=1;
elseif temps(a)<23
    %Performance Level 2
    level=2;
elseif temps(a)<26
    %Performance Level 3
    level=3;
elseif temps(a)<29
    %Performance Level 4
    level=4;
else
    level=5;
end

f_coeff=friction_coeff;  
%     set(S.frictioncoeff_edit, 'string', num2str(f_coeff));
set(S.time_edit, 'string', num2str(t));
set(S.level_edit, 'string', num2str(level));

%Position of the first axle
S.axes1 = axes('Parent',S.PBS_tab,'units','normalized','position',[.6 0.4 .3 .2]);
plot(S.axes1, temps,position,'LineWidth',1.5);
title('Position of the first axle');
xlabel('t [s]');
ylabel('x [m]');
grid on;

% Velocity of the vehicle
S.axes2 = axes('Parent',S.PBS_tab,'units','normalized','position',[.1 0.4 .3 .2]);
plot(S.axes2, temps,(vitesse)*3.6,'LineWidth',1.5);
title('Forward velocity');
xlabel('t [s]');
ylabel('Vx [km/h]');
grid on;

% Acceleration of the firstaxle
S.axes3 = axes('Parent',S.PBS_tab,'units','normalized','position',[.1 0.1 .8 .2]);
plot(S.axes3, temps,acc,'b-','LineWidth',1.5); %Acceleration selon x
grid on;
title('Acceleration of the first axle');
xlabel('t [s]');ylabel('ax [m/s2]');
grid on;

% Save the results to the Excel file
if Excelsave == 1
    A = {t,level};
    sheet = 1;
    x1Range = ['H', num2str(NumberOfRows)];
    xlswrite(ExcelFileName,A,sheet,x1Range)
end 

% Open the VRML visualization
if results == 1
    vr_world = vrworld(['simresults/C3_Acceleration/LZV_custom/',acceleration_results,'/',acc_wrl]);
else
    vr_world = vrworld(['simresults/C3_Acceleration/LZV_custom/',Truckname,'/',Truckname,'_acceleration.wrl']);   
end

open(vr_world);

vr.canvas(vr_world,'Parent', S.visual_acc_panel,'Units','Normalized',...
          'Position',[0 0 1 0.9],'Viewpoint','Side view','NavZones','On');            
viewpoint_acc = 2;   

function run_acc_visualization_callback(source,eventdata)
global acc_wrl S Truckname viewpoint_acc
global acceleration_results acceleration_filename results acc_sim

% Press the toggle button
set(S.acc_stop_vis_push, 'Value',0);

% Update the VR Sink block
if results == 1
    vrmodelname  = ['simresults/C3_Acceleration/LZV_custom/',acceleration_results,'/',acc_sim];
    load_system(vrmodelname)    
    [~,name,~] = fileparts(acc_sim);
    h_vrsink = [name,'/VR sink'];
else
    vrmodelname = ['simresults/C3_Acceleration/LZV_custom/',Truckname,'/',Truckname,'_acceleration_anim.slx'];  
    load_system(vrmodelname)
    h_vrsink=find_system('referenceblock','vrlib/VR Sink');
    h_vrsink=char(h_vrsink(1));
end
x = get_param(h_vrsink, 'FieldsWritten');
if results == 1
    set_param(h_vrsink, 'WorldFileName', acc_wrl);
else
    set_param(h_vrsink, 'WorldFileName', [Truckname,'_acceleration.wrl']);
end
set_param(h_vrsink, 'FieldsWritten', x);
save_system(vrmodelname)
    
% Load the simulation results
if isempty(acceleration_results) == 0
    dirName = ['simresults\C3_Acceleration\LZV_custom\',acceleration_results];
    files = dir( fullfile(dirName,'*.mat') );
    filename = files.name;
    load(filename,'VR','s','dt');
else
    load(['simresults/C3_Acceleration/LZV_custom/',Truckname,'/',acceleration_filename])
end       
assignin('base','VR',VR);
assignin('base','s',s);
assignin('base','dt',dt);

% Start simulation
sim(vrmodelname)

% Set the toggle buttons to the right value when simulation is done
set(S.acc_stop_vis_push, 'Value',1);
set(S.acc_run_vis_push, 'Value',0);

function stop_acc_visualization_callback(source,eventdata)
global S
set_param(bdroot, 'SimulationCommand', 'stop')
set(S.acc_stop_vis_push, 'Value',1);
set(S.acc_run_vis_push, 'Value',0);

function acc_speed_callback(source,eventdata)
global S results acceleration_results Truckname acc_sim

if results == 1
    vrmodelname  = ['simresults/C3_Acceleration/LZV_custom/',acceleration_results,'/',acc_sim];
    load_system(vrmodelname)    
    [~,name,~] = fileparts(acc_sim);
    h_vrsink = [name,'/VR sink'];
else
    vrmodelname = ['simresults/C3_Acceleration/LZV_custom/',Truckname,'/',Truckname,'_acceleration_anim.slx'];  
    load_system(vrmodelname)
    h_vrsink=find_system('referenceblock','vrlib/VR Sink');
    h_vrsink=char(h_vrsink(1));
end

if get(S.acc_speed_popup,'Value') == 1
    set_param(h_vrsink, 'SampleTime','0.05')
elseif get(S.acc_speed_popup,'Value') == 2
    set_param(h_vrsink, 'SampleTime','0.1')
elseif get(S.acc_speed_popup,'Value') == 3
    set_param(h_vrsink, 'SampleTime','0.5')
end

function acc_view_callback(source,eventdata)
global S results acceleration_results acc_wrl Truckname viewpoint_acc

if results == 1
    vr_world = vrworld(['simresults/C3_Acceleration/LZV_custom/',acceleration_results,'/',acc_wrl]);
else
    vr_world = vrworld(['simresults/C3_Acceleration/LZV_custom/',Truckname,'/',Truckname,'_acceleration.wrl']);   
end

open(vr_world);

if get(S.acc_view_popup,'Value') == 1
    viewpoint_acc = 1;
    if get(S.acc_nav_popup,'Value') == 1
        vr.canvas(vr_world,'Parent', S.visual_acc_panel,'Units','Normalized',...
        'Position',[0 0 1 0.9],'Viewpoint','Top view (moving)','NavZones','On');
    else
        vr.canvas(vr_world,'Parent', S.visual_acc_panel,'Units','Normalized',...
        'Position',[0 0 1 0.9],'Viewpoint','Top view (moving)','NavZones','Off');
    end
elseif get(S.acc_view_popup,'Value') == 2
    viewpoint_acc = 2;
    if get(S.acc_nav_popup,'Value') == 1    
        vr.canvas(vr_world,'Parent', S.visual_acc_panel,'Units','Normalized',...
        'Position',[0 0 1 0.9],'Viewpoint','Side view','NavZones','On');
    else
        vr.canvas(vr_world,'Parent', S.visual_acc_panel,'Units','Normalized',...
        'Position',[0 0 1 0.9],'Viewpoint','Side view','NavZones','Off');        
    end
elseif get(S.acc_view_popup,'Value') == 3
    viewpoint_acc = 3;
    if get(S.acc_nav_popup,'Value') == 1
        vr.canvas(vr_world,'Parent', S.visual_acc_panel,'Units','Normalized',...
              'Position',[0 0 1 0.9],'Viewpoint','Rear view (moving)','NavZones','On');
    else
        vr.canvas(vr_world,'Parent', S.visual_acc_panel,'Units','Normalized',...
        'Position',[0 0 1 0.9],'Viewpoint','Rear view (moving)','NavZones','Off');        
    end
elseif get(S.acc_view_popup,'Value') == 4
    viewpoint_acc = 4;
    if get(S.acc_nav_popup,'Value') == 1
        vr.canvas(vr_world,'Parent', S.visual_acc_panel,'Units','Normalized',...
        'Position',[0 0 1 0.9],'Viewpoint','Front view (moving)','NavZones','On');
    else
        vr.canvas(vr_world,'Parent', S.visual_acc_panel,'Units','Normalized',...
        'Position',[0 0 1 0.9],'Viewpoint','Front view (moving)','NavZones','Off');        
    end
elseif get(S.acc_view_popup,'Value') == 5
    viewpoint_acc = 5;
    if get(S.acc_nav_popup,'Value') == 1
        vr.canvas(vr_world,'Parent', S.visual_acc_panel,'Units','Normalized',...
        'Position',[0 0 1 0.9],'Viewpoint','Top rotating view','NavZones','On');
    else
        vr.canvas(vr_world,'Parent', S.visual_acc_panel,'Units','Normalized',...
        'Position',[0 0 1 0.9],'Viewpoint','Top rotating view','NavZones','Off');        
    end
end

function acc_nav_callback(source,eventdata)
global S results acc_wrl Truckname acceleration_results viewpoint_acc

if results == 1
    vr_world = vrworld(['simresults/C3_Acceleration/LZV_custom/',acceleration_results,'/',acc_wrl]);
else
    vr_world = vrworld(['simresults/C3_Acceleration/LZV_custom/',Truckname,'/',Truckname,'_acceleration.wrl']);   
end

open(vr_world);

if get(S.acc_nav_popup,'Value') == 1
    if viewpoint_acc == 1
    vr.canvas(vr_world,'Parent', S.visual_acc_panel,'Units','Normalized',...
              'Position',[0 0 1 0.9],'Viewpoint', 'Top view (moving)','NavZones','On');        
    elseif viewpoint_acc == 2
    vr.canvas(vr_world,'Parent', S.visual_acc_panel,'Units','Normalized',...
              'Position',[0 0 1 0.9],'Viewpoint', 'Side view','NavZones','On');
    elseif viewpoint_acc == 3
    vr.canvas(vr_world,'Parent', S.visual_acc_panel,'Units','Normalized',...
              'Position',[0 0 1 0.9],'Viewpoint', 'Rear view (moving)','NavZones','On');
    elseif viewpoint_acc == 4
    vr.canvas(vr_world,'Parent', S.visual_acc_panel,'Units','Normalized',...
              'Position',[0 0 1 0.9],'Viewpoint', 'Front view (moving)','NavZones','On');
    elseif viewpoint_acc == 5
    vr.canvas(vr_world,'Parent', S.visual_acc_panel,'Units','Normalized',...
              'Position',[0 0 1 0.9],'Viewpoint', 'Top rotating view','NavZones','On');
    end
    
elseif get(S.acc_nav_popup,'Value') == 2
    if viewpoint_acc == 1
    vr.canvas(vr_world,'Parent', S.visual_acc_panel,'Units','Normalized',...
              'Position',[0 0 1 0.9],'Viewpoint', 'Top view (moving)','NavZones','Off');        
    elseif viewpoint_acc == 2
    vr.canvas(vr_world,'Parent', S.visual_acc_panel,'Units','Normalized',...
              'Position',[0 0 1 0.9],'Viewpoint', 'Side view','NavZones','Off');
    elseif viewpoint_acc == 3
    vr.canvas(vr_world,'Parent', S.visual_acc_panel,'Units','Normalized',...
              'Position',[0 0 1 0.9],'Viewpoint', 'Rear view (moving)','NavZones','Off');
    elseif viewpoint_acc == 4
    vr.canvas(vr_world,'Parent', S.visual_acc_panel,'Units','Normalized',...
              'Position',[0 0 1 0.9],'Viewpoint', 'Front view (moving)','NavZones','Off');
    elseif viewpoint_acc == 5
    vr.canvas(vr_world,'Parent', S.visual_acc_panel,'Units','Normalized',...
              'Position',[0 0 1 0.9],'Viewpoint', 'Top rotating view','NavZones','Off');
    end
end

function Back_callback(source, eventdata)
global results custom

if results == 1
    closereq;
    core_simulation_results
elseif results == 0
    closereq;
    custom_core_simulation
end