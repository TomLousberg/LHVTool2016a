function C5_tracking_postprocessing

global NumberOfRows S results Excelsave ExcelFileName axle_trailer p 
global tracking_results Truckname viewpoint_tracking   
global tracking_filename tracking_wrl 

javaaddpath(which('MatlabGarbageCollector.jar'));
org.dt.matlab.utilities.JavaMemoryCleaner.clear(1);
clc;

%% Tracking tab lay-out

set(S.tab6,'Parent', S.tgroup);
                      
S.tgroup_tracking = uitabgroup('Parent',S.tab6, 'tablocation', 'right');
S.PBS_tab = uitab('Parent', S.tgroup_tracking, 'backgroundcolor','w', 'Title','PBS Data');
S.tracking_visual_tab = uitab('Parent', S.tgroup_tracking, 'backgroundcolor','w', 'Title','Visulaization');

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
                      
S.Tracking_title = uicontrol('Parent',              S.PBS_tab,...
                             'Style',               'text',...
                             'String',              'Tracking', ...
                             'Backgroundcolor',     'w',...
                             'FontSize',            3.5,...
                             'FontUnits',           'Normalized',...
                             'FontWeight',          'bold',...
                             'Units',               'Normalized',...
                             'Position',            [0.4 0.8 0.15 0.2]);

S.Performance_panel = uipanel('Parent',          S.PBS_tab,...
                             'Units',           'Centimeters',...
                             'Position',        [3 12 8 3],...    
                             'backgroundcolor', 'w',...
                             'Title',           'Performance Levels',...
                             'Units',           'Normalized',...
                             'FontWeight',      'bold',...
                             'FontSize',        12,...   
                             'FontUnits',       'Normalized',...
                             'BorderWidth',     2,...
                             'BorderType',      'Line',...
                             'highlightcolor',  'k');

S.upgrade_text = uicontrol('Parent',            S.Performance_panel,...
                           'Style',             'text',...
                           'String',            'Total Swept Width (m)',...
                           'Backgroundcolor',   'w',...
                           'FontSize',          10,...
                           'FontUnits',         'Normalized',...
                           'Units',             'Normalized',...
                           'Position',          [.1 .6 .5 .2]);

S.Level_text = uicontrol('Parent',              S.Performance_panel,...
                         'Style',               'text',...
                         'String',              'Level',...
                         'Backgroundcolor',     'w',...
                         'FontSize',            10,...
                         'FontUnits',           'Normalized',...
                         'Units',               'Normalized',...
                         'Position',            [0.7 0.6 0.15 0.2]);                    

S.swept_edit = uicontrol('Parent',              S.Performance_panel,...
                         'Style',               'edit', ...
                         'Backgroundcolor',     'w',...
                         'FontSize',            12,...
                         'FontUnits',           'Normalized',...
                         'enable',              'off',...
                         'Units',               'Normalized',...
                         'Position',            [.25 .3 .15 .2]);

S.levelswept_edit = uicontrol('Parent',             S.Performance_panel,...
                             'Style',               'edit', ...
                             'Backgroundcolor',     'w',...
                             'FontSize',            12,...
                             'FontUnits',           'Normalized',...
                             'enable',              'off',...
                             'Units',               'Normalized',...
                             'Position',            [0.7 0.3 0.15 0.2]);                         

%% Visualization panel                            
S.visual_tracking_panel =     uipanel('Parent',             S.tracking_visual_tab,...
                                      'Units',              'normalized',...
                                      'Position',           [0 0 1 1],...
                                      'BackgroundColor',    'w');  
                                  
                        
S.tracking_nav_text =            uicontrol('Parent',           S.visual_tracking_panel,...
                                        'Style',            'text',...
                                        'backgroundColor',  'w',...
                                        'Units',            'Normalized',...
                                        'FontWeight',       'bold',...
                                        'String',           'Navigation zones',...
                                        'FontSize',         10,...
                                        'FontUnits',        'Normalized',...
                                        'Position',         [0.55 0.95 0.1 0.05]);  
                                  
S.tracking_nav_popup =           uicontrol('Parent',           S.visual_tracking_panel,...
                                        'Style',            'popup',...
                                        'backgroundColor',  'w',...
                                        'Units',            'Normalized',...
                                        'FontWeight',       'bold',...
                                        'String',           {'On','Off'},...
                                        'FontSize',         10,...
                                        'FontUnits',        'Normalized',...
                                        'Position',         [0.55 0.9 0.1 0.05],...
                                        'Callback',         @tracking_nav_callback); 
                                    
S.tracking_view_text =           uicontrol('Parent',           S.visual_tracking_panel,...
                                        'Style',            'text',...
                                        'backgroundColor',  'w',...
                                        'Units',            'Normalized',...
                                        'FontWeight',       'bold',...
                                        'FontSize',         10,...
                                        'String',           'Viewpoint',...
                                        'FontUnits',        'Normalized',...
                                        'Position',         [0.24 0.95 0.1 0.05]);
                                    
S.tracking_view_popup =          uicontrol('Parent',           S.visual_tracking_panel,...
                                        'Style',            'popup',...
                                        'backgroundColor',  'w',...
                                        'Units',            'Normalized',...
                                        'FontWeight',       'bold',...
                                        'FontSize',         10,...
                                        'String',           {'Top view','Side view','Rear view','Front view','Top rotating view'},...
                                        'FontUnits',        'Normalized',...
                                        'Value',            2,...
                                        'Position',         [0.25 0.9 0.1 0.05],...
                                        'Callback',         @tracking_view_callback); 

S.tracking_run_vis_push =        uicontrol('Parent',           S.visual_tracking_panel,...
                                        'Style',            'toggle',...
                                        'backgroundColor',  'w',...
                                        'ForegroundColor',  'b',...
                                        'Units',            'Normalized',...
                                        'FontWeight',       'bold',...
                                        'FontSize',         10,...
                                        'FontUnits',        'Normalized',...
                                        'Value',            0,...
                                        'Position',         [0.7 0.9 0.05 0.05],...
                                        'Callback',         @run_tracking_visualization_callback); 
                                    
S.tracking_stop_vis_push =       uicontrol('Parent',           S.visual_tracking_panel,...
                                        'Style',            'toggle',...
                                        'backgroundColor',  'w',...
                                        'ForegroundColor',  'b',...
                                        'Units',            'Normalized',...
                                        'FontWeight',       'bold',...
                                        'FontSize',         10,...
                                        'FontUnits',        'Normalized',...
                                        'Value',            1,...
                                        'Position',         [0.75 0.9 0.05 0.05],...
                                        'Callback',         @stop_tracking_visualization_callback); 

S.tracking_speed_string =        uicontrol('Parent',           S.visual_tracking_panel,...
                                        'Style',            'text',...
                                        'backgroundColor',  'w',...
                                        'Units',            'Normalized',...
                                        'FontWeight',       'bold',...
                                        'String',           'Simulation speed',...
                                        'FontSize',         10,...
                                        'FontUnits',        'Normalized',... 
                                        'Value',            0,...
                                        'Position',         [0.35 0.95 0.2 0.05]);
                                    
S.tracking_speed_popup =         uicontrol('Parent',           S.visual_tracking_panel,...
                                        'Style',            'popup',...
                                        'backgroundColor',  'w',...
                                        'Units',            'Normalized',...
                                        'FontWeight',       'bold',...
                                        'String',           {'Low','Normal','High'},...
                                        'FontSize',         10,...
                                        'Value',            2,...
                                        'FontUnits',        'Normalized',...
                                        'Position',         [0.375 0.9 0.1 0.05],...
                                        'Callback',         @tracking_speed_callback); 
                                     
[a,~]=imread('play.jpg');
[r,e,~]=size(a); 
x=ceil(r/30); 
y=ceil(e/30); 
g=a(1:x:end,1:y:end,:);
g(g==255)=5.5*255;
set(S.tracking_run_vis_push,'CData',g);

[a,~]=imread('stop.jpg');
[r,e,~]=size(a); 
x=ceil(r/30); 
y=ceil(e/30); 
g=a(1:x:end,1:y:end,:);
g(g==255)=5.5*255;
set(S.tracking_stop_vis_push,'CData',g);

S.back_button = uicontrol('parent', S.visual_tracking_panel,...
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
    dirName = ['simresults\C5_TrackingAbility\LZV_custom\',tracking_results];
    files = dir( fullfile(dirName,'*.mat') );
    filename = files.name;
    load(filename)    
else
    load(['simresults/C5_TrackingAbility/LZV_custom/',Truckname,'/',tracking_filename])
end

firstaxle_acc=s.steeraxle1.acc(:,1);
lastaxle_acc=eval(strcat('s.trailer',num2str(p-1),'axle',num2str(axle_trailer(p-1)),'.acc(:,1)'));
tailright_x=eval(strcat('s.trailer',num2str(p-1),'.load.posright(:,1)'));
tailright_y=eval(strcat('s.trailer',num2str(p-1),'.load.posright(:,2)'));
tailleft_x=eval(strcat('s.trailer',num2str(p-1),'.load.posleft(:,1)'));
tailleft_y=eval(strcat('s.trailer',num2str(p-1),'.load.posleft(:,2)'));

temps=s.time;
positionx=s.steeraxle.pos(:,1);
positiony=s.steeraxle.pos(:,2);
vitesse=s.Vx;
steer=s.inputs.delta*180/pi;

front_positionright_x=s.cabinfront.rightpos(:,1);
front_positionright_y=s.cabinfront.rightpos(:,2);
front_positionleft_x=s.cabinfront.leftpos(:,1);
front_positionleft_y=s.cabinfront.leftpos(:,2);

X=1:2:1000;
min_y=zeros(1,length(X));
max_y=zeros(1,length(X));

for k=1:length(X)
    for i=1:length(tailright_x)                     %tail
        if abs(tailright_x(i)-X(k))<2                %min - right
            if tailright_y(i)<min_y(k)
                min_y(k)=tailright_y(i);
            end
        end
        if abs(tailleft_x(i)-X(k))<2                 %max - left
            if tailleft_y(i)>max_y(k)
                max_y(k)=tailleft_y(i);
            end
        end
    end
    for i=1:length(front_positionright_x)           %front_position
        if abs(front_positionright_x(i)-X(k))<2      %min - right
            if front_positionright_y(i)<min_y(k)
                min_y(k)=front_positionright_y(i);
            end
        end
        if abs(front_positionleft_x(i)-X(k))<2      %max - left
            if front_positionleft_y(i)>max_y(k)
                max_y(k)=front_positionleft_y(i);
            end
        end
    end  
end

swept_min=abs(min(min_y));
swept_max=abs(max(max_y));
swept=(swept_max+swept_min);

%     set(S.frictioncoeff_edit, 'string', num2str(f_coeff));
if swept<=2.9
    levelswept=1;
elseif swept<=3.0
    levelswept=2;
elseif swept<=3.1
    levelswept=3;
elseif swept<=3.3
    levelswept=4;
else
    levelswept=5;
end

swept=(round(swept*100))/100;
set(S.swept_edit, 'string', num2str(swept));
set(S.levelswept_edit, 'string', num2str(levelswept));

%Steer angle
S.axes1 = axes('Parent',S.PBS_tab,'units','normalized','position',[.125 0.05 .35 .25]);
plot(S.axes1, temps,steer,'LineWidth',1.5);
title('Steer angle');
xlabel('t [s]');
ylabel('steer [deg]');
grid on;

%Position of the LZV
S.axes2 = axes('Parent',S.PBS_tab,'units','normalized','position',[.125 0.4 .35 .25]);
plot(S.axes2, positionx,positiony,'b','LineWidth',1.5);
title('Position of the LZV');
xlabel('x [m]');
ylabel('y [m]');
grid on;

% tracking of the first and last axle
S.axes3 = axes('Parent',S.PBS_tab,'units','normalized','position',[.525 0.05 .35 .25]);
if numel(lastaxle_acc)~=0
    plot(S.axes3, temps,firstaxle_acc,'b-',temps,lastaxle_acc,'r','LineWidth',1.5); %tracking selon x
    legend('First axle','Last axle');
    title('tracking of the first and last axle');
elseif numel(lastaxle_acc)==0
    plot(S.axes3, temps,firstaxle_acc,'b-','LineWidth',1.5); %tracking selon x
    legend('First axle');
    title('tracking of the first axle');
end
xlabel('t [s]');
ylabel('ax [m/s2]');
grid on;

%Swept width
S.axes4 = axes('Parent',S.PBS_tab,'units','normalized','position',[.525 0.4 .35 .25]);
X=1:2:1000;
plot(S.axes4, min_y,X,'-b',max_y,X,'-b','LineWidth',1.5);
title('Swept width');
xlabel('x [m]');
ylabel('y [m]');
grid on;
axis([-2.5 2.5 1 1000])
      
% Save the results to the Excel file
if Excelsave == 1
    A = {swept,levelswept};
    sheet = 1;
    x1Range = ['L', num2str(NumberOfRows)];
    xlswrite(ExcelFileName,A,sheet,x1Range)
end    

% Open the VRML visualization
if results == 1
    vr_world = vrworld(['simresults/C5_TrackingAbility/LZV_custom/',tracking_results,'/',tracking_wrl]);
else
    vr_world = vrworld(['simresults/C5_TrackingAbility/LZV_custom/',Truckname,'/',Truckname,'_tracking.wrl']);
end

open(vr_world);  

vr.canvas(vr_world,'Parent', S.visual_tracking_panel,'Units','Normalized',...
          'Position',[0 0 1 0.9],'Viewpoint','Side view','NavZones','On');  
      
viewpoint_tracking = 2;   

function run_tracking_visualization_callback(source,eventdata)
global results tracking_wrl  S tracking_results viewpoint_tracking
global tracking_filename Truckname tracking_sim

% Press the toggle button
set(S.tracking_stop_vis_push, 'Value',0);

% Update the VR Sink block
if results == 1
    vrmodelname  = ['simresults/C5_TrackingAbility/LZV_custom/',tracking_results,'/',tracking_sim];
    load_system(vrmodelname)    
    [~,name,~] = fileparts(tracking_sim);
    h_vrsink = [name,'/VR sink'];
else
    vrmodelname = ['simresults/C5_TrackingAbility/LZV_custom/',Truckname,'/',Truckname,'_tracking_anim.slx'];  
    load_system(vrmodelname)
    h_vrsink=find_system('referenceblock','vrlib/VR Sink');
    h_vrsink=char(h_vrsink(1));
end
x = get_param(h_vrsink, 'FieldsWritten');
if results == 1
    set_param(h_vrsink, 'WorldFileName', tracking_wrl);
else
    set_param(h_vrsink, 'WorldFileName', [Truckname,'_tracking.wrl']);
end
set_param(h_vrsink, 'FieldsWritten', x);
save_system(vrmodelname)

% Load the simulation results
if isempty(tracking_results) == 0
    dirName = ['simresults\C5_TrackingAbility\LZV_custom\',tracking_results];
    files = dir( fullfile(dirName,'*.mat') );
    filename = files.name;
    load(filename,'VR','s','dt');
else
    load(['simresults/C5_TrackingAbility/LZV_custom/',Truckname,'/',tracking_filename])
end 
assignin('base','VR',VR);
assignin('base','s',s);
assignin('base','dt',dt);

% Start simulation
sim(vrmodelname)

% Set the toggle buttons to the right value when simulation is done
set(S.tracking_stop_vis_push, 'Value',1);
set(S.tracking_run_vis_push, 'Value',0);

function stop_tracking_visualization_callback(source,eventdata)
global S 
set_param(bdroot, 'SimulationCommand', 'stop')
set(S.tracking_stop_vis_push, 'Value',1);
set(S.tracking_run_vis_push, 'Value',0);

function tracking_speed_callback(source,eventdata)
global S results Truckname tracking_sim tracking_results

if results == 1
    vrmodelname  = ['simresults/C5_TrackingAbility/LZV_custom/',tracking_results,'/',tracking_sim];
    load_system(vrmodelname)    
    [~,name,~] = fileparts(tracking_sim);
    h_vrsink = [name,'/VR sink'];
else
    vrmodelname = ['simresults/C5_TrackingAbility/LZV_custom/',Truckname,'/',Truckname,'_tracking_anim.slx'];  
    load_system(vrmodelname)
    h_vrsink=find_system('referenceblock','vrlib/VR Sink');
    h_vrsink=char(h_vrsink(1));
end

if get(S.tracking_speed_popup,'Value') == 1
    set_param(h_vrsink, 'SampleTime','0.05')
elseif get(S.tracking_speed_popup,'Value') == 2
    set_param(h_vrsink, 'SampleTime','0.1')
elseif get(S.tracking_speed_popup,'Value') == 3
    set_param(h_vrsink, 'SampleTime','0.5')
end

function tracking_view_callback(source,eventdata)
global S results tracking_results tracking_wrl Truckname viewpoint_tracking

if results == 1
    vr_world = vrworld(['simresults/C5_TrackingAbility/LZV_custom/',tracking_results,'/',tracking_wrl]);
else
    vr_world = vrworld(['simresults/C5_TrackingAbility/LZV_custom/',Truckname,'/',Truckname,'_tracking.wrl']);
end

open(vr_world);

if get(S.tracking_view_popup,'Value') == 1
    viewpoint_tracking = 1;
    if get(S.tracking_nav_popup,'Value') == 1
        vr.canvas(vr_world,'Parent', S.visual_tracking_panel,'Units','Normalized',...
        'Position',[0 0 1 0.9],'Viewpoint','Top view (moving)','NavZones','On');
    else
        vr.canvas(vr_world,'Parent', S.visual_tracking_panel,'Units','Normalized',...
        'Position',[0 0 1 0.9],'Viewpoint','Top view (moving)','NavZones','Off');
    end
elseif get(S.tracking_view_popup,'Value') == 2
    viewpoint_tracking = 2;
    if get(S.tracking_nav_popup,'Value') == 1    
        vr.canvas(vr_world,'Parent', S.visual_tracking_panel,'Units','Normalized',...
        'Position',[0 0 1 0.9],'Viewpoint','Side view','NavZones','On');
    else
        vr.canvas(vr_world,'Parent', S.visual_tracking_panel,'Units','Normalized',...
        'Position',[0 0 1 0.9],'Viewpoint','Side view','NavZones','Off');        
    end
elseif get(S.tracking_view_popup,'Value') == 3
    viewpoint_tracking = 3;
    if get(S.tracking_nav_popup,'Value') == 1
        vr.canvas(vr_world,'Parent', S.visual_tracking_panel,'Units','Normalized',...
              'Position',[0 0 1 0.9],'Viewpoint','Rear view (moving)','NavZones','On');
    else
        vr.canvas(vr_world,'Parent', S.visual_tracking_panel,'Units','Normalized',...
        'Position',[0 0 1 0.9],'Viewpoint','Rear view (moving)','NavZones','Off');        
    end
elseif get(S.tracking_view_popup,'Value') == 4
    viewpoint_tracking = 4;
    if get(S.tracking_nav_popup,'Value') == 1
        vr.canvas(vr_world,'Parent', S.visual_tracking_panel,'Units','Normalized',...
        'Position',[0 0 1 0.9],'Viewpoint','Front view (moving)','NavZones','On');
    else
        vr.canvas(vr_world,'Parent', S.visual_tracking_panel,'Units','Normalized',...
        'Position',[0 0 1 0.9],'Viewpoint','Front view (moving)','NavZones','Off');        
    end
elseif get(S.tracking_view_popup,'Value') == 5
    viewpoint_tracking = 5;
    if get(S.tracking_nav_popup,'Value') == 1
        vr.canvas(vr_world,'Parent', S.visual_tracking_panel,'Units','Normalized',...
        'Position',[0 0 1 0.9],'Viewpoint','Top rotating view','NavZones','On');
    else
        vr.canvas(vr_world,'Parent', S.visual_tracking_panel,'Units','Normalized',...
        'Position',[0 0 1 0.9],'Viewpoint','Top rotating view','NavZones','Off');        
    end
end

function tracking_nav_callback(source,eventdata)
global S results tracking_results Truckname tracking_wrl viewpoint_tracking

if results == 1
    vr_world = vrworld(['simresults/C5_trackingability/LZV_custom/',tracking_results,'/',tracking_wrl]);
else
    vr_world = vrworld(['simresults/C5_trackingability/LZV_custom/',Truckname,'/',Truckname,'_tracking.wrl']);
end  

open(vr_world);

if get(S.tracking_nav_popup,'Value') == 1
    if viewpoint_tracking == 1
        vr.canvas(vr_world,'Parent', S.visual_tracking_panel,'Units','Normalized',...
              'Position',[0 0 1 0.9],'Viewpoint', 'Top view (moving)','NavZones','On');
    elseif viewpoint_tracking == 2
        vr.canvas(vr_world,'Parent', S.visual_tracking_panel,'Units','Normalized',...
              'Position',[0 0 1 0.9],'Viewpoint', 'Side view','NavZones','On');
    elseif viewpoint_tracking == 3
        vr.canvas(vr_world,'Parent', S.visual_tracking_panel,'Units','Normalized',...
              'Position',[0 0 1 0.9],'Viewpoint', 'Rear view (moving)','NavZones','On');
    elseif viewpoint_tracking == 4
        vr.canvas(vr_world,'Parent', S.visual_tracking_panel,'Units','Normalized',...
              'Position',[0 0 1 0.9],'Viewpoint', 'Front view (moving)','NavZones','On');
    elseif viewpoint_tracking == 5
        vr.canvas(vr_world,'Parent', S.visual_tracking_panel,'Units','Normalized',...
              'Position',[0 0 1 0.9],'Viewpoint', 'Top rotating view','NavZones','On');
    end
    
elseif get(S.tracking_nav_popup,'Value') == 2
    if viewpoint_tracking == 1
        vr.canvas(vr_world,'Parent', S.visual_tracking_panel,'Units','Normalized',...
                  'Position',[0 0 1 0.9],'Viewpoint', 'Top view (moving)','NavZones','Off');
    elseif viewpoint_tracking == 2
        vr.canvas(vr_world,'Parent', S.visual_tracking_panel,'Units','Normalized',...
                  'Position',[0 0 1 0.9],'Viewpoint', 'Side view','NavZones','Off');    
    elseif viewpoint_tracking == 3
        vr.canvas(vr_world,'Parent', S.visual_tracking_panel,'Units','Normalized',...
                  'Position',[0 0 1 0.9],'Viewpoint', 'Rear view (moving)','NavZones','Off');    
    elseif viewpoint_tracking == 4
        vr.canvas(vr_world,'Parent', S.visual_tracking_panel,'Units','Normalized',...
                  'Position',[0 0 1 0.9],'Viewpoint', 'Front view (moving)','NavZones','Off');
    elseif viewpoint_tracking == 5
        vr.canvas(vr_world,'Parent', S.visual_tracking_panel,'Units','Normalized',...
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
    if custom == 1
        custom_core_simulation
    else
        core_simulation
    end
end