function C10_friction_postprocessing

global NumberOfRows axle_tractor S Excelsave  ExcelFileName results
global tyrefriction_results Truckname viewpoint_friction
global tyrefriction_filename tyrefriction_wrl

javaaddpath(which('MatlabGarbageCollector.jar'));
org.dt.matlab.utilities.JavaMemoryCleaner.clear(1);
clc;

%% Friction tab lay-out

set(S.tab13,'Parent', S.tgroup);

S.tgroup_friction = uitabgroup('Parent',S.tab13, 'tablocation', 'right');
S.PBS_tab = uitab('Parent', S.tgroup_friction, 'backgroundcolor','w', 'Title','PBS Data');
S.friction_visual_tab = uitab('Parent', S.tgroup_friction, 'backgroundcolor','w', 'Title','Visulaization');

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
                      
S.Friction_title = uicontrol('Parent',              S.PBS_tab,...
                             'Style',               'text',...
                             'String',              'Steer-tyre friction demand',...
                             'Backgroundcolor',     'w',...
                             'FontSize',            3.5,...
                             'FontUnits','Normalized',...
                             'FontWeight',          'bold',...
                             'Units',               'Normalized',...
                             'Position',            [0.25 0.75 0.4 0.2]);

S.panel = uipanel('Parent',             S.PBS_tab,...
                  'Units',              'Centimeters',...
                  'Position',           [10 11 10 3],...    
                  'backgroundcolor',    'w',...
                  'Title',              'Performance Levels',...
                  'Units',              'Normalized',...
                  'FontWeight',         'bold',...
                  'FontSize',           12,...
                  'FontUnits','Normalized',...
                  'BorderWidth',        2,...
                  'BorderType',         'Line',...
                  'highlightcolor',     'k');

S.friction_edit = uicontrol('Parent',           S.panel,...
                            'Style',            'edit', ...
                            'Backgroundcolor',  'w',...
                            'FontSize',         12,...
                            'FontUnits','Normalized',...
                            'enable',           'off',...
                            'Units',            'Normalized',...
                            'Position',         [0.2 0.3 0.2 0.25]);                           

S.friction_text = uicontrol('Parent',           S.panel,...
                            'Style',            'text',...
                            'String',           'Friction Demand (%)',...
                            'FontSize',         6,...
                            'FontUnits','Normalized',...
                            'backgroundcolor',  'w',...
                            'Units',            'Normalized',...
                            'Position',         [.05 .6 .5 .4]);  

S.level_edit = uicontrol('Parent',              S.panel,...
                         'Style',               'edit', ...
                         'Backgroundcolor',     'w',...
                         'FontSize',            12,...
                         'FontUnits','Normalized',...
                         'enable',              'off',...
                         'Units',               'Normalized',...
                         'Position',            [.6 .3 .2 .25]);                           

S.level_text = uicontrol('Parent',          S.panel,...
                         'Style',           'text',...
                         'String',          'Level', ...
                         'FontSize',        6,...
                         'FontUnits','Normalized',...
                         'backgroundcolor', 'w',...
                         'Units',           'Normalized',...
                         'Position',        [.5 .6 .4 .4]);

%% Visualization panel                       
S.visual_friction_panel = uipanel('Parent',             S.friction_visual_tab,...
                                  'Units',              'normalized',...
                                  'Position',           [0 0 1 1],...
                                  'BackgroundColor',    'w');                  

S.friction_nav_text =      uicontrol('Parent',           S.visual_friction_panel,...
                                     'Style',            'text',...
                                     'backgroundColor',  'w',...
                                     'Units',            'Normalized',...
                                     'FontWeight',       'bold',...
                                     'String',           'Navigation zones',...
                                     'FontSize',         10,...
                                     'FontUnits',        'Normalized',...
                                     'Position',         [0.55 0.95 0.1 0.05]);  
                                  
S.friction_nav_popup =       uicontrol('Parent',           S.visual_friction_panel,...
                                       'Style',            'popup',...
                                       'backgroundColor',  'w',...
                                       'Units',            'Normalized',...
                                       'FontWeight',       'bold',...
                                       'String',           {'On','Off'},...
                                       'FontSize',         10,...
                                       'FontUnits',        'Normalized',...
                                       'Position',         [0.55 0.9 0.1 0.05],...
                                       'Callback',         @friction_nav_callback); 
                                    
S.friction_view_text =       uicontrol('Parent',           S.visual_friction_panel,...
                                       'Style',            'text',...
                                       'backgroundColor',  'w',...
                                       'Units',            'Normalized',...
                                       'FontWeight',       'bold',...
                                       'FontSize',         10,...
                                       'String',           'Viewpoint',...
                                       'FontUnits',        'Normalized',...
                                       'Position',         [0.24 0.95 0.1 0.05]);
                                    
S.friction_view_popup =       uicontrol('Parent',           S.visual_friction_panel,...
                                        'Style',            'popup',...
                                        'backgroundColor',  'w',...
                                        'Units',            'Normalized',...
                                        'FontWeight',       'bold',...
                                        'FontSize',         10,...
                                        'String',           {'Top view','Side view','Rear view','Front view','Top rotating view'},...
                                        'FontUnits',        'Normalized',...
                                        'Value',            2,...
                                        'Position',         [0.25 0.9 0.1 0.05],...
                                        'Callback',         @friction_view_callback); 


S.friction_run_vis_push =    uicontrol('Parent',           S.visual_friction_panel,...
                                       'Style',            'toggle',...
                                       'backgroundColor',  'w',...
                                       'ForegroundColor',  'b',...
                                       'Units',            'Normalized',...
                                       'FontWeight',       'bold',...
                                       'FontSize',         10,...
                                       'FontUnits',        'Normalized',...
                                       'Value',            0,...
                                       'Position',         [0.7 0.9 0.05 0.05],...
                                       'Callback',         @run_friction_visualization_callback); 
                                    
S.friction_stop_vis_push =   uicontrol('Parent',           S.visual_friction_panel,...
                                       'Style',            'toggle',...
                                       'backgroundColor',  'w',...
                                       'ForegroundColor',  'b',...
                                       'Units',            'Normalized',...
                                       'FontWeight',       'bold',...
                                       'FontSize',         10,...
                                       'FontUnits',        'Normalized',...
                                       'Value',            1,...
                                       'Position',         [0.75 0.9 0.05 0.05],...
                                       'Callback',         @stop_friction_visualization_callback); 

S.friction_speed_string =    uicontrol('Parent',           S.visual_friction_panel,...
                                       'Style',            'text',...
                                       'backgroundColor',  'w',...
                                       'Units',            'Normalized',...
                                       'FontWeight',       'bold',...
                                       'String',           'Simulation speed',...
                                       'FontSize',         10,...
                                       'FontUnits',        'Normalized',...
                                       'Value',            0,...
                                       'Position',         [0.35 0.95 0.2 0.05]);
                                    
S.friction_speed_popup =     uicontrol('Parent',           S.visual_friction_panel,...
                                       'Style',            'popup',...
                                       'backgroundColor',  'w',...
                                       'Units',            'Normalized',...
                                       'FontWeight',       'bold',...
                                       'String',           {'Low','Normal','High'},...
                                       'FontSize',         10,...
                                       'Value',            2,...
                                       'FontUnits',        'Normalized',...
                                       'Position',         [0.375 0.9 0.1 0.05],...
                                       'Callback',         @friction_speed_callback); 
                                     
[a,~]=imread('play.jpg');
[r,e,~]=size(a); 
x=ceil(r/30); 
y=ceil(e/30); 
g=a(1:x:end,1:y:end,:);
g(g==255)=5.5*255;
set(S.friction_run_vis_push,'CData',g);

[a,~]=imread('stop.jpg');
[r,e,~]=size(a); 
x=ceil(r/30); 
y=ceil(e/30); 
g=a(1:x:end,1:y:end,:);
g(g==255)=5.5*255;
set(S.friction_stop_vis_push,'CData',g);

S.back_button = uicontrol('parent', S.visual_friction_panel,...
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

if results == 1
    dirName = ['simresults\C10_TyreFriction\LZV_custom\',tyrefriction_results];
    files = dir( fullfile(dirName,'*.mat') );
    filename = files.name;
    load(filename)
else
    load(['simresults/C10_TyreFriction/LZV_custom/',Truckname,'/',tyrefriction_filename])
end
    %friction    
mu_peak=0.8;
if axle_tractor==4
    %steer axle 1
    %wheel 1
    Fx1=s.tyre.tractorFx(:,1);
    Fy1=s.tyre.tractorFy(:,1);
    Fz1=s.tyre.tractorFz(:,1);
    A1=sqrt(Fx1.*Fx1+Fy1.*Fy1);
    B1=abs(Fz1);
    %wheel 2
    Fx2=s.tyre.tractorFx(:,2);
    Fy2=s.tyre.tractorFy(:,2);
    Fz2=s.tyre.tractorFz(:,2);
    A2=sqrt(Fx2.*Fx2+Fy2.*Fy2);
    B2=abs(Fz2);
        %steer axle 2
    %wheel 1
    Fx3=s.tyre.tractorFx(:,3);
    Fy3=s.tyre.tractorFy(:,3);
    Fz3=s.tyre.tractorFz(:,3);
    A3=sqrt(Fx3.*Fx3+Fy3.*Fy3);
    B3=abs(Fz3);
    %wheel 2
    Fx4=s.tyre.tractorFx(:,4);
    Fy4=s.tyre.tractorFy(:,4);
    Fz4=s.tyre.tractorFz(:,4);
    A4=sqrt(Fx4.*Fx4+Fy4.*Fy4);
    B4=abs(Fz4);

        %drive axle 1
    %tyre 1
    Fx5=s.tyre.tractorFx(:,5);
    Fy5=s.tyre.tractorFy(:,5);
    Fz5=s.tyre.tractorFz(:,5);
    A5=sqrt(Fx5.*Fx5+Fy5.*Fy5);
    B5=abs(Fz5);
    %tyre 2
    Fx6=s.tyre.tractorFx(:,6);
    Fy6=s.tyre.tractorFy(:,6);
    Fz6=s.tyre.tractorFz(:,6);
    A6=sqrt(Fx6.*Fx6+Fy6.*Fy6);
    B6=abs(Fz6);
    %tyre 3
    Fx7=s.tyre.tractorFx(:,7);
    Fy7=s.tyre.tractorFy(:,7);
    Fz7=s.tyre.tractorFz(:,7);
    A7=sqrt(Fx7.*Fx7+Fy7.*Fy7);
    B7=abs(Fz7);
    %tyre 4
    Fx8=s.tyre.tractorFx(:,8);
    Fy8=s.tyre.tractorFy(:,8);
    Fz8=s.tyre.tractorFz(:,8);
    A8=sqrt(Fx8.*Fx8+Fy8.*Fy8);
    B8=abs(Fz8);
        %drive axle 2
    %tyre 1
    Fx9=s.tyre.tractorFx(:,9);
    Fy9=s.tyre.tractorFy(:,9);
    Fz9=s.tyre.tractorFz(:,9);
    A9=sqrt(Fx9.*Fx9+Fy9.*Fy9);
    B9=abs(Fz9);
    %tyre 2
    Fx10=s.tyre.tractorFx(:,10);
    Fy10=s.tyre.tractorFy(:,10);
    Fz10=s.tyre.tractorFz(:,10);
    A10=sqrt(Fx10.*Fx10+Fy10.*Fy10);
    B10=abs(Fz10);
    %tyre 3
    Fx11=s.tyre.tractorFx(:,11);
    Fy11=s.tyre.tractorFy(:,11);
    Fz11=s.tyre.tractorFz(:,11);
    A11=sqrt(Fx11.*Fx11+Fy11.*Fy11);
    B11=abs(Fz11);
    %tyre 4
    Fx12=s.tyre.tractorFx(:,12);
    Fy12=s.tyre.tractorFy(:,12);
    Fz12=s.tyre.tractorFz(:,12);
    A12=sqrt(Fx12.*Fx12+Fy12.*Fy12);
    B12=abs(Fz12);

    friction=max(abs((A1+A2+A3+A4+A5+A6+A7+A8+A9+A10+A11+A12)./(B1+B2+B3+B4+B5+B6+B7+B8+B9+B10+B11+B12)));
    friction=100*(friction/mu_peak);

elseif axle_tractor==3
        %steer axle
    %wheel 1
    Fx1=s.tyre.tractorFx(:,1);
    Fy1=s.tyre.tractorFy(:,1);
    Fz1=s.tyre.tractorFz(:,1);
    A1=sqrt(Fx1.*Fx1+Fy1.*Fy1);
    B1=Fz1;
    %wheel 2
    Fx2=s.tyre.tractorFx(:,2);
    Fy2=s.tyre.tractorFy(:,2);
    Fz2=s.tyre.tractorFz(:,2);
    A2=sqrt(Fx2.*Fx2+Fy2.*Fy2);
    B2=Fz2;

        %drive axle 1
    %wheel 1
    Fx3=s.tyre.tractorFx(:,3);
    Fy3=s.tyre.tractorFy(:,3);
    Fz3=s.tyre.tractorFz(:,3);
    A3=sqrt(Fx3.*Fx3+Fy3.*Fy3);
    B3=abs(Fz3);
    %wheel 2
    Fx4=s.tyre.tractorFx(:,4);
    Fy4=s.tyre.tractorFy(:,4);
    Fz4=s.tyre.tractorFz(:,4);
    A4=sqrt(Fx4.*Fx4+Fy4.*Fy4);
    B4=abs(Fz4);
    %wheel 3
    Fx5=s.tyre.tractorFx(:,5);
    Fy5=s.tyre.tractorFy(:,5);
    Fz5=s.tyre.tractorFz(:,5);
    A5=sqrt(Fx5.*Fx5+Fy5.*Fy5);
    B5=abs(Fz5);
    %wheel 4
    Fx6=s.tyre.tractorFx(:,6);
    Fy6=s.tyre.tractorFy(:,6);
    Fz6=s.tyre.tractorFz(:,6);
    A6=sqrt(Fx6.*Fx6+Fy6.*Fy6);
    B6=abs(Fz6);
        %drive axle 2
    %tyre 1
    Fx7=s.tyre.tractorFx(:,7);
    Fy7=s.tyre.tractorFy(:,7);
    Fz7=s.tyre.tractorFz(:,7);
    A7=sqrt(Fx7.*Fx7+Fy7.*Fy7);
    B7=abs(Fz7);
    %tyre 2
    Fx8=s.tyre.tractorFx(:,8);
    Fy8=s.tyre.tractorFy(:,8);
    Fz8=s.tyre.tractorFz(:,8);
    A8=sqrt(Fx8.*Fx8+Fy8.*Fy8);
    B8=abs(Fz8);
    %tyre 3
    Fx9=s.tyre.tractorFx(:,9);
    Fy9=s.tyre.tractorFy(:,9);
    Fz9=s.tyre.tractorFz(:,9);
    A9=sqrt(Fx9.*Fx9+Fy9.*Fy9);
    B9=abs(Fz9);
    %tyre 4
    Fx10=s.tyre.tractorFx(:,10);
    Fy10=s.tyre.tractorFy(:,10);
    Fz10=s.tyre.tractorFz(:,10);
    A10=sqrt(Fx10.*Fx10+Fy10.*Fy10);
    B10=abs(Fz10);

    friction=max(abs((A1+A2+A3+A4+A5+A6+A7+A8+A9+A10)./(B1+B2+B3+B4+B5+B6+B7+B8+B9+B10)));
    friction=100*(friction/mu_peak);  

elseif axle_tractor==2
        %steer axle
    %wheel 1
    Fx1=s.tyre.tractorFx(:,1);
    Fy1=s.tyre.tractorFy(:,1);
    Fz1=s.tyre.tractorFz(:,1);
    A1=sqrt(Fx1.*Fx1+Fy1.*Fy1);
    B1=Fz1;
    %wheel 2
    Fx2=s.tyre.tractorFx(:,2);
    Fy2=s.tyre.tractorFy(:,2);
    Fz2=s.tyre.tractorFz(:,2);
    A2=sqrt(Fx2.*Fx2+Fy2.*Fy2);
    B2=Fz2;

        %drive axle
    %wheel 1
    Fx3=s.tyre.tractorFx(:,3);
    Fy3=s.tyre.tractorFy(:,3);
    Fz3=s.tyre.tractorFz(:,3);
    A3=sqrt(Fx3.*Fx3+Fy3.*Fy3);
    B3=abs(Fz3);
    %wheel 2
    Fx4=s.tyre.tractorFx(:,4);
    Fy4=s.tyre.tractorFy(:,4);
    Fz4=s.tyre.tractorFz(:,4);
    A4=sqrt(Fx4.*Fx4+Fy4.*Fy4);
    B4=abs(Fz4);
    %wheel 3
    Fx5=s.tyre.tractorFx(:,5);
    Fy5=s.tyre.tractorFy(:,5);
    Fz5=s.tyre.tractorFz(:,5);
    A5=sqrt(Fx5.*Fx5+Fy5.*Fy5);
    B5=abs(Fz5);
    %wheel 4
    Fx6=s.tyre.tractorFx(:,6);
    Fy6=s.tyre.tractorFy(:,6);
    Fz6=s.tyre.tractorFz(:,6);
    A6=sqrt(Fx6.*Fx6+Fy6.*Fy6);
    B6=abs(Fz6);

    friction=max(abs((A1+A2+A3+A4+A5+A6)./(B1+B2+B3+B4+B5+B6)));
    friction=100*(friction/mu_peak);  
end

f_coeff=friction_coeff;
temps=s.time;
positionx=s.steeraxle.pos(:,1);
positiony=s.steeraxle.pos(:,2);
steer=s.inputs.delta*180/pi;    

if friction<=(80) 
    set(S.level_edit, 'string', 'Yes');
    level = 'Yes';
else
    set(S.level_edit, 'string', 'No');
    level = 'No';
end

friction=(round(friction*10))/10;
set(S.friction_edit, 'string', num2str(friction));

%Steer angle
S.axes1 = axes('Parent',S.PBS_tab,'units','normalized','position',[.325 .2 .3 .3]);
plot(S.axes1, temps,steer,'LineWidth',1.5);
title('Steer angle');
xlabel('time [s]');
ylabel('angle [deg]');
grid on;

% Safe data in Excel file
if Excelsave == 1
    A = {friction,level};
    sheet = 1;
    x1Range = ['Z', num2str(NumberOfRows)];
    xlswrite(ExcelFileName,A,sheet,x1Range)
end 

% Open the VRML visualization
if results == 1
    vr_world = vrworld(['simresults/C10_TyreFriction/LZV_custom/',tyrefriction_results,'/',tyrefriction_wrl]);
else
    vr_world = vrworld(['simresults/C10_TyreFriction/LZV_custom/',Truckname,'/',Truckname,'_friction.wrl']);   
end

open(vr_world);
vr.canvas(vr_world,'Parent', S.visual_friction_panel,'Units','Normalized',...
          'Position',[0 0 1 0.9],'Viewpoint','Side view','NavZones','On');  
      
viewpoint_friction = 2; 

function run_friction_visualization_callback(source,eventdata)
global Truckname S tyrefriction_results tyrefriction_filename 
global tyrefriction_wrl tyrefriction_sim results

% Press the toggle button
set(S.friction_stop_vis_push, 'Value',0);

% Update the VR Sink block
if results == 1
    vrmodelname  = ['simresults/C10_TyreFriction/LZV_custom/',tyrefriction_results,'/',tyrefriction_sim];
    load_system(vrmodelname)    
    [~,name,~] = fileparts(tyrefriction_sim);
    h_vrsink = [name,'/VR sink'];
else
    vrmodelname = ['simresults/C10_TyreFriction/LZV_custom/',Truckname,'/',Truckname,'_anim_friction.slx'];  
    load_system(vrmodelname)
    h_vrsink=find_system('referenceblock','vrlib/VR Sink');
    h_vrsink=char(h_vrsink(1));
end
x = get_param(h_vrsink, 'FieldsWritten');
if results == 1
    set_param(h_vrsink, 'WorldFileName', tyrefriction_wrl);
else
    set_param(h_vrsink, 'WorldFileName', [Truckname,'_friction.wrl']);
end
set_param(h_vrsink, 'FieldsWritten', x);
save_system(vrmodelname)

% Load the simulation results
if isempty(tyrefriction_results) == 0
    dirName = ['simresults\C10_TyreFriction\LZV_custom\',tyrefriction_results];
    files = dir( fullfile(dirName,'*.mat') );
    filename = files.name;
    load(filename,'VR','s','dt');
else
    load(['simresults/C10_TyreFriction/LZV_custom/',Truckname,'/',tyrefriction_filename])
end 
assignin('base','VR',VR);
assignin('base','s',s);
assignin('base','dt',dt);

% Start simulation
sim(vrmodelname)

% Set the toggle buttons to the right value when simulation is done
set(S.friction_stop_vis_push, 'Value',1);
set(S.friction_run_vis_push, 'Value',0);

function stop_friction_visualization_callback(source,eventdata)
global S
set_param(bdroot, 'SimulationCommand', 'stop')
set(S.friction_stop_vis_push, 'Value',1);
set(S.friction_run_vis_push, 'Value',0);

function friction_speed_callback(source,eventdata)
global S results tyrefriction_results Truckname tyrefriction_sim

if results == 1
    vrmodelname  = ['simresults/C10_TyreFriction/LZV_custom/',tyrefriction_results,'/',tyrefriction_sim];
    load_system(vrmodelname)    
    [~,name,~] = fileparts(tyrefriction_sim);
    h_vrsink = [name,'/VR sink'];
else
    vrmodelname = ['simresults/C10_TyreFriction/LZV_custom/',Truckname,'/',Truckname,'_anim_friction.slx'];  
    load_system(vrmodelname)
    h_vrsink=find_system('referenceblock','vrlib/VR Sink');
    h_vrsink=char(h_vrsink(1));
end

if get(S.friction_speed_popup,'Value') == 1
    set_param(h_vrsink, 'SampleTime','0.05')
elseif get(S.friction_speed_popup,'Value') == 2
    set_param(h_vrsink, 'SampleTime','0.1')
elseif get(S.friction_speed_popup,'Value') == 3
    set_param(h_vrsink, 'SampleTime','0.5')
end

function friction_view_callback(source,eventdata)
global S results tyrefriction_results tyrefriction_wrl Truckname viewpoint_friction

if results == 1
    vr_world = vrworld(['simresults/C10_TyreFriction/LZV_custom/',tyrefriction_results,'/',tyrefriction_wrl]);
else
    vr_world = vrworld(['simresults/C10_TyreFriction/LZV_custom/',Truckname,'/',Truckname,'_friction.wrl']);   
end
open(vr_world);
vr.canvas(vr_world,'Parent', S.visual_friction_panel,'Units','Normalized',...
          'Position',[0 0 1 0.9],'Viewpoint','Side view','NavZones','On');  
      
if get(S.friction_view_popup,'Value') == 1
    viewpoint_friction = 1;
    if get(S.friction_nav_popup,'Value') == 1
        vr.canvas(vr_world,'Parent', S.visual_friction_panel,'Units','Normalized',...
        'Position',[0 0 1 0.9],'Viewpoint','Top view (moving)','NavZones','On');
    else
        vr.canvas(vr_world,'Parent', S.visual_friction_panel,'Units','Normalized',...
        'Position',[0 0 1 0.9],'Viewpoint','Top view (moving)','NavZones','Off');
    end
elseif get(S.friction_view_popup,'Value') == 2
    viewpoint_friction = 2;
    if get(S.friction_nav_popup,'Value') == 1    
        vr.canvas(vr_world,'Parent', S.visual_friction_panel,'Units','Normalized',...
        'Position',[0 0 1 0.9],'Viewpoint','Side view','NavZones','On');
    else
        vr.canvas(vr_world,'Parent', S.visual_friction_panel,'Units','Normalized',...
        'Position',[0 0 1 0.9],'Viewpoint','Side view','NavZones','Off');        
    end
elseif get(S.friction_view_popup,'Value') == 3
    viewpoint_friction = 3;
    if get(S.friction_nav_popup,'Value') == 1
        vr.canvas(vr_world,'Parent', S.visual_friction_panel,'Units','Normalized',...
              'Position',[0 0 1 0.9],'Viewpoint','Rear view (moving)','NavZones','On');
    else
        vr.canvas(vr_world,'Parent', S.visual_friction_panel,'Units','Normalized',...
        'Position',[0 0 1 0.9],'Viewpoint','Rear view (moving)','NavZones','Off');        
    end
elseif get(S.friction_view_popup,'Value') == 4
    viewpoint_friction = 4;
    if get(S.friction_nav_popup,'Value') == 1
        vr.canvas(vr_world,'Parent', S.visual_friction_panel,'Units','Normalized',...
        'Position',[0 0 1 0.9],'Viewpoint','Front view (moving)','NavZones','On');
    else
        vr.canvas(vr_world,'Parent', S.visual_friction_panel,'Units','Normalized',...
        'Position',[0 0 1 0.9],'Viewpoint','Front view (moving)','NavZones','Off');        
    end
elseif get(S.friction_view_popup,'Value') == 5
    viewpoint_friction = 5;
    if get(S.friction_nav_popup,'Value') == 1
        vr.canvas(vr_world,'Parent', S.visual_friction_panel,'Units','Normalized',...
        'Position',[0 0 1 0.9],'Viewpoint','Top rotating view','NavZones','On');
    else
        vr.canvas(vr_world,'Parent', S.visual_friction_panel,'Units','Normalized',...
        'Position',[0 0 1 0.9],'Viewpoint','Top rotating view','NavZones','Off');        
    end
end

function friction_nav_callback(source,eventdata)
global S results tyrefriction_wrl Truckname tyrefriction_results viewpoint_friction

% Open the VRML visualization
if results == 1
    vr_world = vrworld(['simresults/C10_TyreFriction/LZV_custom/',tyrefriction_results,'/',tyrefriction_wrl]);
else
    vr_world = vrworld(['simresults/C10_TyreFriction/LZV_custom/',Truckname,'/',Truckname,'_friction.wrl']);   
end
open(vr_world);
vr.canvas(vr_world,'Parent', S.visual_friction_panel,'Units','Normalized',...
          'Position',[0 0 1 0.9],'Viewpoint','Side view','NavZones','On'); 
      
if get(S.friction_nav_popup,'Value') == 1
    if viewpoint_friction == 1
    vr.canvas(vr_world,'Parent', S.visual_friction_panel,'Units','Normalized',...
              'Position',[0 0 1 0.9],'Viewpoint', 'Top view (moving)','NavZones','On');        
    elseif viewpoint_friction == 2
    vr.canvas(vr_world,'Parent', S.visual_friction_panel,'Units','Normalized',...
              'Position',[0 0 1 0.9],'Viewpoint', 'Side view','NavZones','On');
    elseif viewpoint_friction == 3
    vr.canvas(vr_world,'Parent', S.visual_friction_panel,'Units','Normalized',...
              'Position',[0 0 1 0.9],'Viewpoint', 'Rear view (moving)','NavZones','On');
    elseif viewpoint_friction == 4
    vr.canvas(vr_world,'Parent', S.visual_friction_panel,'Units','Normalized',...
              'Position',[0 0 1 0.9],'Viewpoint', 'Front view (moving)','NavZones','On');
    elseif viewpoint_friction == 5
    vr.canvas(vr_world,'Parent', S.visual_friction_panel,'Units','Normalized',...
              'Position',[0 0 1 0.9],'Viewpoint', 'Top rotating view','NavZones','On');
    end
    
elseif get(S.friction_nav_popup,'Value') == 2
    if viewpoint_friction == 1
    vr.canvas(vr_world,'Parent', S.visual_friction_panel,'Units','Normalized',...
              'Position',[0 0 1 0.9],'Viewpoint', 'Top view (moving)','NavZones','Off');        
    elseif viewpoint_friction == 2
    vr.canvas(vr_world,'Parent', S.visual_friction_panel,'Units','Normalized',...
              'Position',[0 0 1 0.9],'Viewpoint', 'Side view','NavZones','Off');
    elseif viewpoint_friction == 3
    vr.canvas(vr_world,'Parent', S.visual_friction_panel,'Units','Normalized',...
              'Position',[0 0 1 0.9],'Viewpoint', 'Rear view (moving)','NavZones','Off');
    elseif viewpoint_friction == 4
    vr.canvas(vr_world,'Parent', S.visual_friction_panel,'Units','Normalized',...
              'Position',[0 0 1 0.9],'Viewpoint', 'Front view (moving)','NavZones','Off');
    elseif viewpoint_friction == 5
    vr.canvas(vr_world,'Parent', S.visual_friction_panel,'Units','Normalized',...
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