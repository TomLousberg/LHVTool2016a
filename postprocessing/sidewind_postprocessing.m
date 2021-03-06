function sidewind_postprocessing
global S results p axle_trailer
global sidewind_results Truckname viewpoint_sidewind
global sidewind_filename sidewind_wrl

javaaddpath(which('MatlabGarbageCollector.jar'));
org.dt.matlab.utilities.JavaMemoryCleaner.clear(1);
clc;

%% sidewind tab lay-out

set(S.tab14,'Parent', S.tgroup);

S.tgroup_sidewind = uitabgroup('Parent',S.tab14, 'tablocation', 'right');
S.PBS_tab = uitab('Parent', S.tgroup_sidewind, 'backgroundcolor','w', 'Title','PBS Data');
S.sidewind_visual_tab = uitab('Parent', S.tgroup_sidewind, 'backgroundcolor','w', 'Title','Visulaization');

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
                      
S.Sidewind_title = uicontrol('Parent',              S.PBS_tab,...
                             'Style',               'text',...
                             'String',              'Sidewind', ...
                             'Backgroundcolor',     'w',...
                             'FontSize',            8,...
                             'FontUnits','Normalized',...
                             'FontWeight',          'bold',...
                             'Units',               'Normalized',...
                             'Position',            [0.4 0.8 0.2 0.1]);

S.panel = uipanel('Parent',             S.PBS_tab,...
                  'Units',              'Centimeters',...
                  'Position',           [3 11 7 3],...    
                  'backgroundcolor',    'w',...
                  'Title',              'Performance Levels',...
                  'Units',              'Normalized',...
                  'FontWeight',         'bold',...
                  'FontSize',           12,...
                  'FontUnits','Normalized',...
                  'BorderWidth',        2,...
                  'BorderType',         'Line',...
                  'highlightcolor',     'k');

S.swept_edit = uicontrol('Parent',              S.panel,...
                         'Style',               'edit', ...
                         'Backgroundcolor',     'w',...
                         'FontSize',            12,...
                         'FontUnits','Normalized',...
                         'enable',              'off',...
                         'Units',               'Normalized',...
                         'Position',            [.15 .3 .2 .2]);                           

S.friction_text = uicontrol('Parent',           S.panel,...
                            'Style',            'text',...
                            'String',           'Total Swept Width (m)',...
                            'FontSize',         6,...
                            'FontUnits','Normalized',...
                            'backgroundcolor',  'w',...
                            'Units',            'Normalized',...
                            'Position',         [.05 .6 .4 .4]);  

S.levelswept_edit = uicontrol('Parent',             S.panel,...
                              'Style',              'edit',...
                              'Backgroundcolor',    'w',...
                              'FontSize',           12,...
                              'FontUnits','Normalized',...
                              'enable',             'off',...
                              'Units',              'Normalized',...
                              'Position',           [.6 .3 .2 .2]);                           

S.levelswept_text = uicontrol('Parent',             S.panel,...
                              'Style',              'text',...
                              'String',             'Level', ...
                              'FontSize',           6,...
                              'FontUnits','Normalized',...
                              'backgroundcolor',    'w',...
                              'Units',              'Normalized',...
                              'Position',           [.5 .6 .4 .4]);
                          
%% Visualization panel  
S.visual_sidewind_panel = uipanel('Parent',             S.sidewind_visual_tab,...
                         'Units',              'normalized',...
                         'Position',           [0 0 1 1],...
                         'BackgroundColor',    'w');                  

S.sidewind_nav_text =      uicontrol('Parent',           S.visual_sidewind_panel,...
                                      'Style',            'text',...
                                      'backgroundColor',  'w',...
                                      'Units',            'Normalized',...
                                      'FontWeight',       'bold',...
                                      'String',           'Navigation zones',...
                                      'FontSize',         10,...
                                      'FontUnits',        'Normalized',...
                                      'Position',         [0.55 0.95 0.1 0.05]);  
                                  
S.sidewind_nav_popup =       uicontrol('Parent',           S.visual_sidewind_panel,...
                                        'Style',            'popup',...
                                        'backgroundColor',  'w',...
                                        'Units',            'Normalized',...
                                        'FontWeight',       'bold',...
                                        'String',           {'On','Off'},...
                                        'FontSize',         10,...
                                        'FontUnits',        'Normalized',...
                                        'Position',         [0.55 0.9 0.1 0.05],...
                                        'Callback',         @sidewind_nav_callback); 
                                    
S.sidewind_view_text =       uicontrol('Parent',           S.visual_sidewind_panel,...
                                        'Style',            'text',...
                                        'backgroundColor',  'w',...
                                        'Units',            'Normalized',...
                                        'FontWeight',       'bold',...
                                        'FontSize',         10,...
                                        'String',           'Viewpoint',...
                                        'FontUnits',        'Normalized',...
                                        'Position',         [0.24 0.95 0.1 0.05]);
                                    
S.sidewind_view_popup =       uicontrol('Parent',           S.visual_sidewind_panel,...
                                         'Style',            'popup',...
                                         'backgroundColor',  'w',...
                                         'Units',            'Normalized',...
                                         'FontWeight',       'bold',...
                                         'FontSize',         10,...
                                         'String',           {'Top view','Side view','Rear view','Front view','Top rotating view'},...
                                         'FontUnits',        'Normalized',...
                                         'Value',            2,...
                                         'Position',         [0.25 0.9 0.1 0.05],...
                                         'Callback',         @sidewind_view_callback); 


S.sidewind_run_vis_push =    uicontrol('Parent',           S.visual_sidewind_panel,...
                                        'Style',            'toggle',...
                                        'backgroundColor',  'w',...
                                        'ForegroundColor',  'b',...
                                        'Units',            'Normalized',...
                                        'FontWeight',       'bold',...
                                        'FontSize',         10,...
                                        'FontUnits',        'Normalized',...
                                        'Value',            0,...
                                        'Position',         [0.7 0.9 0.05 0.05],...
                                        'Callback',         @run_sidewind_visualization_callback); 
                                    
S.sidewind_stop_vis_push =   uicontrol('Parent',           S.visual_sidewind_panel,...
                                        'Style',            'toggle',...
                                        'backgroundColor',  'w',...
                                        'ForegroundColor',  'b',...
                                        'Units',            'Normalized',...
                                        'FontWeight',       'bold',...
                                        'FontSize',         10,...
                                        'FontUnits',        'Normalized',...
                                        'Value',            1,...
                                        'Position',         [0.75 0.9 0.05 0.05],...
                                        'Callback',         @stop_sidewind_visualization_callback); 

S.sidewind_speed_string =    uicontrol('Parent',           S.visual_sidewind_panel,...
                                        'Style',            'text',...
                                        'backgroundColor',  'w',...
                                        'Units',            'Normalized',...
                                        'FontWeight',       'bold',...
                                        'String',           'Simulation speed',...
                                        'FontSize',         10,...
                                        'FontUnits',        'Normalized',...
                                        'Value',            0,...
                                        'Position',         [0.35 0.95 0.2 0.05]);
                                    
S.sidewind_speed_popup =     uicontrol('Parent',           S.visual_sidewind_panel,...
                                        'Style',            'popup',...
                                        'backgroundColor',  'w',...
                                        'Units',            'Normalized',...
                                        'FontWeight',       'bold',...
                                        'String',           {'Low','Normal','High'},...
                                        'FontSize',         10,...
                                        'Value',            2,...
                                        'FontUnits',        'Normalized',...
                                        'Position',         [0.375 0.9 0.1 0.05],...
                                        'Callback',         @sidewind_speed_callback); 
                                     
[a,~]=imread('play.jpg');
[r,e,~]=size(a); 
x=ceil(r/30); 
y=ceil(e/30); 
g=a(1:x:end,1:y:end,:);
g(g==255)=5.5*255;
set(S.sidewind_run_vis_push,'CData',g);

[a,~]=imread('stop.jpg');
[r,e,~]=size(a); 
x=ceil(r/30); 
y=ceil(e/30); 
g=a(1:x:end,1:y:end,:);
g(g==255)=5.5*255;
set(S.sidewind_stop_vis_push,'CData',g);

S.back_button = uicontrol('parent', S.visual_sidewind_panel,...
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
    dirName = ['simresults\Sidewind\LZV_custom\',sidewind_results];
    files = dir( fullfile(dirName,'*.mat') );
    filename = files.name;
    load(filename)
else
    load(['simresults/Sidewind/LZV_custom/',Truckname,'/',sidewind_filename])
end 
lastaxle_acc=eval(strcat('s.trailer',num2str(p-1),'axle',num2str(axle_trailer(p-1)),'.acc(:,1)'));
tailright_x=eval(strcat('s.trailer',num2str(p-1),'.load.posright(:,1)'));
tailright_y=eval(strcat('s.trailer',num2str(p-1),'.load.posright(:,2)'));
tailleft_x=eval(strcat('s.trailer',num2str(p-1),'.load.posleft(:,1)'));
tailleft_y=eval(strcat('s.trailer',num2str(p-1),'.load.posleft(:,2)'));

f_coeff=friction_coeff;
temps=s.time;
positionx=s.steeraxle.pos(:,1);
positiony=s.steeraxle.pos(:,2);
vitesse=s.Vx;
steer=s.inputs.delta*180/pi;
front_positionright_x=s.cabinfront.rightpos(:,1);
front_positionright_y=s.cabinfront.rightpos(:,2);
front_positionleft_x=s.cabinfront.leftpos(:,1);
front_positionleft_y=s.cabinfront.leftpos(:,2);

X=1:2:250;
min_y=zeros(1,length(X));
max_y=zeros(1,length(X));

firstaxle_acc=s.steeraxle1.acc(:,1);
    
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
S.axes1 = axes('Parent',S.PBS_tab,'units','normalized','position',[.1 .1 .3 .2]);
plot(S.axes1, temps,steer,'LineWidth',1.5);
title('Steer angle');
xlabel('t [s]');
ylabel('steer [deg]');
grid on;

%Position of the LZV
S.axes2 = axes('Parent',S.PBS_tab,'units','normalized','position',[.1 0.4 .3 .2]);
plot(S.axes2, positionx,positiony,'b','LineWidth',1.5);
title('Position of the LZV');
xlabel('x [m]');
ylabel('y [m]');
grid on;

% Acceleration of the first and last axle
S.axes3 = axes('Parent',S.PBS_tab,'units','normalized','position',[.6 .1 .3 .3]);
if numel(lastaxle_acc)~=0
    plot(S.axes3, temps,firstaxle_acc,'b-',temps,lastaxle_acc,'r','LineWidth',1.5); %Acceleration selon x
    legend('First axle','Last axle');
    title('Acceleration of the first and last axle');
elseif numel(lastaxle_acc)==0
    plot(S.axes3, temps,firstaxle_acc,'b-','LineWidth',1.5); %Acceleration selon x
    legend('First axle');
    title('Acceleration of the first axle');
end
xlabel('t [s]');
ylabel('ax [m/s^2]');
grid on;

%Swept width
S.axes4 = axes('Parent',S.PBS_tab,'units','normalized','position',[.6 .5 .3 .3]);
X=1:2:250;
plot(S.axes4, min_y,X,'-b',max_y,X,'-b','LineWidth',1.5);
title('Swept width');
xlabel('x [m]');
ylabel('y [m]');
grid on;
axis([-2.5 2.5 75 200])


% Open the VRML visualization
if results == 1
    vr_world = vrworld(['simresults/Sidewind/LZV_custom/',sidewind_results,'/',sidewind_wrl]);
else
    vr_world = vrworld(['simresults/Sidewind/LZV_custom/',Truckname,'/',Truckname,'_sidewind.wrl']);   
end

open(vr_world);
vr.canvas(vr_world,'Parent', S.visual_sidewind_panel,'Units','Normalized',...
          'Position',[0 0 1 0.9],'Viewpoint','Side view','NavZones','On');  
      
viewpoint_sidewind = 2;  

function run_sidewind_visualization_callback(eventdata, source)
global Truckname S sidewind_results sidewind_filename 
global results sidewind_sim sidewind_wrl
 
% Press the toggle button
set(S.sidewind_stop_vis_push, 'Value',0);

% Update the VR Sink block
if results == 1
    vrmodelname  = ['simresults/Sidewind/LZV_custom/',sidewind_results,'/',sidewind_sim];
    load_system(vrmodelname)    
    [~,name,~] = fileparts(sidewind_sim);
    h_vrsink = [name,'/VR sink'];
else
    vrmodelname = ['simresults/Sidewind/LZV_custom/',Truckname,'/',Truckname,'_anim_sidewind.slx'];  
    load_system(vrmodelname)
    h_vrsink=find_system('referenceblock','vrlib/VR Sink');
    h_vrsink=char(h_vrsink(1));
end
x = get_param(h_vrsink, 'FieldsWritten');
if results == 1
    set_param(h_vrsink, 'WorldFileName', sidewind_wrl);
else
    set_param(h_vrsink, 'WorldFileName', [Truckname,'_sidewind.wrl']);
end
set_param(h_vrsink, 'FieldsWritten', x);
save_system(vrmodelname)

if isempty(sidewind_results) == 0
    dirName = ['simresults\Sidewind\LZV_custom\',sidewind_results];
    files = dir( fullfile(dirName,'*.mat') );
    filename = files.name;
    load(filename,'VR','s','dt');else
    load(['simresults/Sidewind/LZV_custom/',Truckname,'/',sidewind_filename])
end       
assignin('base','VR',VR);
assignin('base','s',s);
assignin('base','dt',dt);

% Start simulation
sim(vrmodelname)

% Set the toggle buttons to the right value when simulation is done
set(S.sidewind_stop_vis_push, 'Value',1);
set(S.sidewind_run_vis_push, 'Value',0);

function stop_sidewind_visualization_callback(source,eventdata)
global S
set_param(bdroot, 'SimulationCommand', 'stop')
set(S.sidewind_stop_vis_push, 'Value',1);
set(S.sidewind_run_vis_push, 'Value',0);

function sidewind_speed_callback(source,eventdata)
global S results sidewind_results Truckname sidewind_sim

if results == 1
    vrmodelname  = ['simresults/Sidewind/LZV_custom/',sidewind_results,'/',sidewind_sim];
    load_system(vrmodelname)    
    [~,name,~] = fileparts(sidewind_sim);
    h_vrsink = [name,'/VR sink'];
else
    vrmodelname = ['simresults/Sidewind/LZV_custom/',Truckname,'/',Truckname,'_anim_sidewind.slx'];  
    load_system(vrmodelname)
    h_vrsink=find_system('referenceblock','vrlib/VR Sink');
    h_vrsink=char(h_vrsink(1));
end

if get(S.sidewind_speed_popup,'Value') == 1
    set_param(h_vrsink, 'SampleTime','0.05')
elseif get(S.sidewind_speed_popup,'Value') == 2
    set_param(h_vrsink, 'SampleTime','0.1')
elseif get(S.sidewind_speed_popup,'Value') == 3
    set_param(h_vrsink, 'SampleTime','0.5')
end

function sidewind_view_callback(source,eventdata)
global S results sidewind_results sidewind_wrl Truckname viewpoint_sidewind

if results == 1
    vr_world = vrworld(['simresults/Sidewind/LZV_custom/',sidewind_results,'/',sidewind_wrl]);
else
    vr_world = vrworld(['simresults/Sidewind/LZV_custom/',Truckname,'/',Truckname,'_sidewind.wrl']);   
end
open(vr_world);
vr.canvas(vr_world,'Parent', S.visual_sidewind_panel,'Units','Normalized',...
          'Position',[0 0 1 0.9],'Viewpoint','Side view','NavZones','On');  
      
if get(S.sidewind_view_popup,'Value') == 1
    viewpoint_sidewind = 1;
    if get(S.sidewind_nav_popup,'Value') == 1
        vr.canvas(vr_world,'Parent', S.visual_sidewind_panel,'Units','Normalized',...
        'Position',[0 0 1 0.9],'Viewpoint','Top view (moving)','NavZones','On');
    else
        vr.canvas(vr_world,'Parent', S.visual_sidewind_panel,'Units','Normalized',...
        'Position',[0 0 1 0.9],'Viewpoint','Top view (moving)','NavZones','Off');
    end
elseif get(S.sidewind_view_popup,'Value') == 2
    viewpoint_sidewind = 2;
    if get(S.sidewind_nav_popup,'Value') == 1    
        vr.canvas(vr_world,'Parent', S.visual_sidewind_panel,'Units','Normalized',...
        'Position',[0 0 1 0.9],'Viewpoint','Side view','NavZones','On');
    else
        vr.canvas(vr_world,'Parent', S.visual_sidewind_panel,'Units','Normalized',...
        'Position',[0 0 1 0.9],'Viewpoint','Side view','NavZones','Off');        
    end
elseif get(S.sidewind_view_popup,'Value') == 3
    viewpoint_sidewind = 3;
    if get(S.sidewind_nav_popup,'Value') == 1
        vr.canvas(vr_world,'Parent', S.visual_sidewind_panel,'Units','Normalized',...
              'Position',[0 0 1 0.9],'Viewpoint','Rear view (moving)','NavZones','On');
    else
        vr.canvas(vr_world,'Parent', S.visual_sidewind_panel,'Units','Normalized',...
        'Position',[0 0 1 0.9],'Viewpoint','Rear view (moving)','NavZones','Off');        
    end
elseif get(S.sidewind_view_popup,'Value') == 4
    viewpoint_sidewind = 4;
    if get(S.sidewind_nav_popup,'Value') == 1
        vr.canvas(vr_world,'Parent', S.visual_sidewind_panel,'Units','Normalized',...
        'Position',[0 0 1 0.9],'Viewpoint','Front view (moving)','NavZones','On');
    else
        vr.canvas(vr_world,'Parent', S.visual_sidewind_panel,'Units','Normalized',...
        'Position',[0 0 1 0.9],'Viewpoint','Front view (moving)','NavZones','Off');        
    end
elseif get(S.sidewind_view_popup,'Value') == 5
    viewpoint_sidewind = 5;
    if get(S.sidewind_nav_popup,'Value') == 1
        vr.canvas(vr_world,'Parent', S.visual_sidewind_panel,'Units','Normalized',...
        'Position',[0 0 1 0.9],'Viewpoint','Top rotating view','NavZones','On');
    else
        vr.canvas(vr_world,'Parent', S.visual_sidewind_panel,'Units','Normalized',...
        'Position',[0 0 1 0.9],'Viewpoint','Top rotating view','NavZones','Off');        
    end
end

function sidewind_nav_callback(source,eventdata)
global S results sidewind_wrl Truckname sidewind_results viewpoint_sidewind

% Open the VRML visualization
if results == 1
    vr_world = vrworld(['simresults/Sidewind/LZV_custom/',sidewind_results,'/',sidewind_wrl]);
else
    vr_world = vrworld(['simresults/Sidewind/LZV_custom/',Truckname,'/',Truckname,'_sidewind.wrl']);   
end
open(vr_world);
vr.canvas(vr_world,'Parent', S.visual_sidewind_panel,'Units','Normalized',...
          'Position',[0 0 1 0.9],'Viewpoint','Side view','NavZones','On'); 
      
if get(S.sidewind_nav_popup,'Value') == 1
    if viewpoint_sidewind == 1
    vr.canvas(vr_world,'Parent', S.visual_sidewind_panel,'Units','Normalized',...
              'Position',[0 0 1 0.9],'Viewpoint', 'Top view (moving)','NavZones','On');        
    elseif viewpoint_sidewind == 2
    vr.canvas(vr_world,'Parent', S.visual_sidewind_panel,'Units','Normalized',...
              'Position',[0 0 1 0.9],'Viewpoint', 'Side view','NavZones','On');
    elseif viewpoint_sidewind == 3
    vr.canvas(vr_world,'Parent', S.visual_sidewind_panel,'Units','Normalized',...
              'Position',[0 0 1 0.9],'Viewpoint', 'Rear view (moving)','NavZones','On');
    elseif viewpoint_sidewind == 4
    vr.canvas(vr_world,'Parent', S.visual_sidewind_panel,'Units','Normalized',...
              'Position',[0 0 1 0.9],'Viewpoint', 'Front view (moving)','NavZones','On');
    elseif viewpoint_sidewind == 5
    vr.canvas(vr_world,'Parent', S.visual_sidewind_panel,'Units','Normalized',...
              'Position',[0 0 1 0.9],'Viewpoint', 'Top rotating view','NavZones','On');
    end
    
elseif get(S.sidewind_nav_popup,'Value') == 2
    if viewpoint_sidewind == 1
    vr.canvas(vr_world,'Parent', S.visual_sidewind_panel,'Units','Normalized',...
              'Position',[0 0 1 0.9],'Viewpoint', 'Top view (moving)','NavZones','Off');        
    elseif viewpoint_sidewind == 2
    vr.canvas(vr_world,'Parent', S.visual_sidewind_panel,'Units','Normalized',...
              'Position',[0 0 1 0.9],'Viewpoint', 'Side view','NavZones','Off');
    elseif viewpoint_sidewind == 3
    vr.canvas(vr_world,'Parent', S.visual_sidewind_panel,'Units','Normalized',...
              'Position',[0 0 1 0.9],'Viewpoint', 'Rear view (moving)','NavZones','Off');
    elseif viewpoint_sidewind == 4
    vr.canvas(vr_world,'Parent', S.visual_sidewind_panel,'Units','Normalized',...
              'Position',[0 0 1 0.9],'Viewpoint', 'Front view (moving)','NavZones','Off');
    elseif viewpoint_sidewind == 5
    vr.canvas(vr_world,'Parent', S.visual_sidewind_panel,'Units','Normalized',...
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