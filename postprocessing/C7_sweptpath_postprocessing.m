function C7_sweptpath_postprocessing 

global p axle_trailer NumberOfRows ExcelFileName S results
global sweptpath_results Truckname Excelsave viewpoint_sweptpath
global sweptpath_filename sweptpath_wrl


javaaddpath(which('MatlabGarbageCollector.jar'));
org.dt.matlab.utilities.JavaMemoryCleaner.clear(1);
clc;     

%% Swept path tab lay-out

set(S.tab9,'Parent', S.tgroup);

S.tgroup_swept = uitabgroup('Parent',S.tab9, 'tablocation', 'right');
S.PBs.tab = uitab('Parent', S.tgroup_swept, 'backgroundcolor','w', 'Title','PBS Data');
S.sweptpath_visual_tab = uitab('Parent', S.tgroup_swept, 'backgroundcolor','w', 'Title','Visulaization');

S.back_button = uicontrol('parent', S.PBs.tab,...
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
                      
S.Sweptpath_title = uicontrol('Parent',             S.PBs.tab,...
                              'Style',              'text',...
                              'String',             'Swept path',...
                              'Backgroundcolor',    'w',...
                              'FontSize',           12,...
                              'FontUnits','Normalized',...
                              'FontWeight',         'bold',...
                              'Units',              'Normalized',...
                              'Position',           [.325 .9 .3 .05]);
                    

S.Performace_panel = uipanel('Parent',              S.PBs.tab,...
                             'Units',               'Centimeters',...
                             'Position',            [3 11 10 2.5],...    
                             'backgroundcolor',     'w',...
                             'Title',               'Performance Levels',...
                             'Units',               'Normalized',...
                             'FontWeight',          'bold',...
                             'FontSize',            12,...
                             'FontUnits','Normalized',...
                             'BorderWidth',         2,...
                             'BorderType',          'Line',...
                             'highlightcolor',      'k');

S.width_edit = uicontrol('Parent',              S.Performace_panel,...
                         'Style',               'edit',...
                         'Backgroundcolor',     'w',...
                         'FontSize',            12,...
                         'FontUnits','Normalized',...
                         'enable',              'off',...
                         'Units',               'Normalized',...
                         'Position',            [.15 .25 .2 .25]);   

S.levelswept_edit = uicontrol('Parent',             S.Performace_panel,...
                              'Style',              'edit', ...
                              'Backgroundcolor',    'w',...
                              'FontSize',           12,...
                              'FontUnits','Normalized',...
                              'enable',             'off',...
                              'Units',              'Normalized',...
                              'Position',           [.6 .25 .2 .25]);                           

S.swept_text = uicontrol('Parent',              S.Performace_panel,...
                         'Style',               'text',...
                         'String',              'Minimum Width of Swept Path (m)',...
                         'Backgroundcolor',     'w',...
                         'FontSize',            7,...
                         'FontUnits','Normalized',...
                         'Units',               'Normalized',...
                         'Position',            [.05 .6 .4 .4]);                    

S.Level_text = uicontrol('Parent',              S.Performace_panel,...
                         'Style',               'text',...
                         'String',              'Level', ...
                         'Backgroundcolor',     'w',...
                         'FontSize',            7,...
                         'FontUnits','Normalized',...
                         'Units',               'Normalized',...
                         'Position',            [.5 .65 .4 .35]); 

%% Visualization panel                        
S.visual_sweptpath_panel = uipanel('Parent',             S.sweptpath_visual_tab,...
                                   'Units',              'normalized',...
                                   'Position',           [0 0 1 1],...
                                   'BackgroundColor',    'w');                  

S.sweptpath_nav_text =        uicontrol('Parent',           S.visual_sweptpath_panel,...
                                        'Style',            'text',...
                                        'backgroundColor',  'w',...
                                        'Units',            'Normalized',...
                                        'FontWeight',       'bold',...
                                        'String',           'Navigation zones',...
                                        'FontSize',         10,...
                                        'FontUnits',        'Normalized',...
                                        'Position',         [0.55 0.95 0.1 0.05]);  
                                  
S.sweptpath_nav_popup =       uicontrol('Parent',           S.visual_sweptpath_panel,...
                                        'Style',            'popup',...
                                        'backgroundColor',  'w',...
                                        'Units',            'Normalized',...
                                        'FontWeight',       'bold',...
                                        'String',           {'On','Off'},...
                                        'FontSize',         10,...
                                        'FontUnits',        'Normalized',...
                                        'Position',         [0.55 0.9 0.1 0.05],...
                                        'Callback',         @sweptpath_nav_callback); 
                                    
S.sweptpath_view_text =       uicontrol('Parent',           S.visual_sweptpath_panel,...
                                        'Style',            'text',...
                                        'backgroundColor',  'w',...
                                        'Units',            'Normalized',...
                                        'FontWeight',       'bold',...
                                        'FontSize',         10,...
                                        'String',           'Viewpoint',...
                                        'FontUnits',        'Normalized',...
                                        'Position',         [0.24 0.95 0.1 0.05]);
                                    
S.sweptpath_view_popup =      uicontrol('Parent',           S.visual_sweptpath_panel,...
                                        'Style',            'popup',...
                                        'backgroundColor',  'w',...
                                        'Units',            'Normalized',...
                                        'FontWeight',       'bold',...
                                        'FontSize',         10,...
                                        'String',           {'Top view','Side view','Rear view','Front view','Top rotating view'},...
                                        'FontUnits',        'Normalized',...
                                        'Value',            2,...
                                        'Position',         [0.25 0.9 0.1 0.05],...
                                        'Callback',         @sweptpath_view_callback); 


S.sweptpath_run_vis_push =    uicontrol('Parent',           S.visual_sweptpath_panel,...
                                        'Style',            'toggle',...
                                        'backgroundColor',  'w',...
                                        'ForegroundColor',  'b',...
                                        'Units',            'Normalized',...
                                        'FontWeight',       'bold',...
                                        'FontSize',         10,...
                                        'FontUnits',        'Normalized',...
                                        'Value',            0,...
                                        'Position',         [0.7 0.9 0.05 0.05],...
                                        'Callback',         @run_sweptpath_visualization_callback); 
                                    
S.sweptpath_stop_vis_push =   uicontrol('Parent',           S.visual_sweptpath_panel,...
                                        'Style',            'toggle',...
                                        'backgroundColor',  'w',...
                                        'ForegroundColor',  'b',...
                                        'Units',            'Normalized',...
                                        'FontWeight',       'bold',...
                                        'FontSize',         10,...
                                        'FontUnits',        'Normalized',...
                                        'Value',            1,...
                                        'Position',         [0.75 0.9 0.05 0.05],...
                                        'Callback',         @stop_sweptpath_visualization_callback); 

S.sweptpath_speed_string =     uicontrol('Parent',           S.visual_sweptpath_panel,...
                                        'Style',            'text',...
                                        'backgroundColor',  'w',...
                                        'Units',            'Normalized',...
                                        'FontWeight',       'bold',...
                                        'String',           'Simulation speed',...
                                        'FontSize',         10,...
                                        'FontUnits',        'Normalized',...
                                        'Value',            0,...
                                        'Position',         [0.35 0.95 0.2 0.05]);
                                    
S.sweptpath_speed_popup =     uicontrol('Parent',           S.visual_sweptpath_panel,...
                                        'Style',            'popup',...
                                        'backgroundColor',  'w',...
                                        'Units',            'Normalized',...
                                        'FontWeight',       'bold',...
                                        'String',           {'Low','Normal','High'},...
                                        'FontSize',         10,...
                                        'Value',            2,...
                                        'FontUnits',        'Normalized',...
                                        'Position',         [0.375 0.9 0.1 0.05],...
                                        'Callback',         @sweptpath_speed_callback); 
                                     
[a,~]=imread('play.jpg');
[r,e,~]=size(a); 
x=ceil(r/30); 
y=ceil(e/30); 
g=a(1:x:end,1:y:end,:);
g(g==255)=5.5*255;
set(S.sweptpath_run_vis_push,'CData',g);

[a,~]=imread('stop.jpg');
[r,e,~]=size(a); 
x=ceil(r/30); 
y=ceil(e/30); 
g=a(1:x:end,1:y:end,:);
g(g==255)=5.5*255;
set(S.sweptpath_stop_vis_push,'CData',g);

S.back_button = uicontrol('parent', S.visual_sweptpath_panel,...
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
    dirName = ['simresults\C7_SweptPath\LZV_custom\',sweptpath_results];
    files = dir( fullfile(dirName,'*.mat') );
    filename = files.name;
    load(filename)
else
    load(['simresults/C7_SweptPath/LZV_custom/',Truckname,'/',sweptpath_filename])
end
axle_positionright_x=eval(strcat('s.trailer',num2str(p-1),'axle',num2str(axle_trailer(p-1)),'.posright(:,1)'));
axle_positionright_y=eval(strcat('s.trailer',num2str(p-1),'axle',num2str(axle_trailer(p-1)),'.posright(:,2)'));
axle_positionleft_x=eval(strcat('s.trailer',num2str(p-1),'axle',num2str(axle_trailer(p-1)),'.posleft(:,1)'));
axle_positionleft_y=eval(strcat('s.trailer',num2str(p-1),'axle',num2str(axle_trailer(p-1)),'.posleft(:,2)'));

f_coeff=friction_coeff;
temps=s.time;
positionx=s.steeraxle.pos(:,1);
positiony=s.steeraxle.pos(:,2);
steer=s.inputs.delta*180/pi;
front_positionright_x=s.cabinfront.rightpos(:,1);
front_positionright_y=s.cabinfront.rightpos(:,2);
front_positionleft_x=s.cabinfront.leftpos(:,1);
front_positionleft_y=s.cabinfront.leftpos(:,2);
outermost_path_x=front_positionright_x;
outermost_path_y=front_positionright_y;
innermost_path_x=axle_positionleft_x;
innermost_path_y=axle_positionleft_y;

idx_outerstart=find(outermost_path_x>30);
outerstart=idx_outerstart(1);
idx_outerstop=find(outermost_path_y>20);
outerstop=idx_outerstop(1);
idx_outer=outerstart:outerstop;

idx_innerstart=find(innermost_path_x>30);
innerstart=idx_innerstart(1);
idx_innerstop=find(innermost_path_y>20);
innerstop=idx_innerstop(1);
idx_inner=innerstart:innerstop;

outermost_path_x1=outermost_path_x(idx_outer);
outermost_path_y1=outermost_path_y(idx_outer);
innermost_path_x1=innermost_path_x(idx_inner);
innermost_path_y1=innermost_path_y(idx_inner);

%Derivee outermost path
for i=21:(length(outermost_path_x1)-20)
    derivee_outer(i)=(outermost_path_y1(i+20)-outermost_path_y1(i-20))/(outermost_path_x1(i+20)-outermost_path_x1(i-20));
end
%Derivee innermost path
for i=21:(length(innermost_path_x1)-20)
    derivee_inner(i)=(innermost_path_y1(i+20)-innermost_path_y1(i-20))/(innermost_path_x1(i+20)-innermost_path_x1(i-20));
end

%maxwidth?
maxwidth=0;
for i=1:length(derivee_inner)
    for k=1:length(derivee_outer)
        if abs(derivee_outer(k)-derivee_inner(i))<0.1
            dist2paths=sqrt((innermost_path_y1(i)-outermost_path_y1(k))*(innermost_path_y1(i)-outermost_path_y1(k))+(innermost_path_x1(i)-outermost_path_x1(k))*(innermost_path_x1(i)-outermost_path_x1(k)));
            scal=((innermost_path_y1(i)-outermost_path_y1(k))*derivee_outer(k))+((innermost_path_x1(i)-outermost_path_x1(k))*1);
            if abs(scal)<0.1
                if dist2paths>maxwidth
                    maxwidth=dist2paths;
                    x_inner=innermost_path_x1(i);
                    y_inner=innermost_path_y1(i);
                    coeffdir_inner=derivee_inner(i);
                    x_outer=outermost_path_x1(k);
                    y_outer=outermost_path_y1(k);
                    coeffdir_outer=derivee_outer(k);
                end
            end
        end
    end
end

%Tangentes
x_tang=-2.5:0.5:2.5;
xtang_inner=x_tang+x_inner;
ytang_inner=x_tang*coeffdir_inner+y_inner;
x_tang1=-2.5:0.5:2.5;
xtang_outer=x_tang1+x_outer;
ytang_outer=x_tang1*coeffdir_outer+y_outer;

maxwidth_dtex=[x_inner x_outer];
maxwidth_dtey=[y_inner y_outer];

if maxwidth<=7.4
    levelswept=1;
elseif maxwidth<=8.7
    levelswept=2;
elseif maxwidth<=10.6
    levelswept=3;
elseif maxwidth<=13.7
    levelswept=4;
else
    levelswept=5;
end

maxwidth=(round(maxwidth*100))/100;
set(S.width_edit, 'string', num2str(maxwidth));
set(S.levelswept_edit, 'string', num2str(levelswept));

radius=12.5;
Xin2=0:1:30;
Yin2=zeros(1,length(Xin2));

VThetaDeg2 = 90:-1:0;
VThetaDeg2=-VThetaDeg2;
VTheta2 = VThetaDeg2 *pi / 180;
xm2=(2*radius)-(width_firstaxle);
ym2=(2*radius)-(width_firstaxle);
a2=xm2/2;
b2=ym2/2;
R2=xm2/2;
XCercle2 = a2 + R2 * cos(VTheta2);
YCercle2 = b2 + R2 * sin(VTheta2);
XCercle2=XCercle2-(radius-(width_firstaxle/2))+30;

Yout2=(radius-(width_firstaxle/2)):1:200;
Xout2=ones(1,length(Yout2))*((radius+30)-(width_firstaxle/2));
X=[Xin2 XCercle2 Xout2];
Y=[Yin2 YCercle2 Yout2];   
rotAngle = 0;
xRot     = X*cosd(rotAngle) - Y*sind(rotAngle);
yRot     = X*sind(rotAngle) + Y*cosd(rotAngle);

outsidewheel_path_x=xRot;            %X
outsidewheel_path_y=yRot;            %Y

%Steer angle
S.axes1 = axes('Parent',S.PBs.tab,'units','normalized','position',[.1 0.1 .3 .4]);
plot(S.axes1,temps,steer,'LineWidth',1.5);
title('Steer angle');
xlabel('time [s]');
ylabel('angle [deg]');
grid on;

%Position of the LZV
S.axes2 = axes('Parent',S.PBs.tab,'units','normalized','position',[.45 0.1 .5 .7]);
plot(S.axes2,outermost_path_x,outermost_path_y,'b',innermost_path_x,innermost_path_y,'b-.','LineWidth',1.5);
hold on 
plot(S.axes2,positionx,positiony,'g','LineWidth',1.5);
hold on
plot(S.axes2,outsidewheel_path_x,outsidewheel_path_y,'r--','LineWidth',1.5);
hold on
plot(S.axes2,x_inner,y_inner,'k+',x_outer,y_outer,'k+','LineWidth',1.5);
hold on
plot(S.axes2,xtang_inner,ytang_inner,'k--',xtang_outer,ytang_outer,'k--',maxwidth_dtex,maxwidth_dtey,'k','LineWidth',1.5);
legend('Outermost Path (Front of Cabin)','Innermost Path (Medium Axle of Last Trailing Unit)','Center Position of firstaxle','Path followed by Center Position of firstaxle(Input)');
title('Position of the LZV');
axis([20 50 -5 25]);
xlabel('x [m]');
ylabel('y [m]');
grid on;
   
% Safe data in Excel file
if Excelsave == 1
    A = {maxwidth,levelswept};
    sheet = 1;
    x1Range = ['P', num2str(NumberOfRows)];
    xlswrite(ExcelFileName,A,sheet,x1Range)
end 

% Open the VRML visualization
if results == 1
    vr_world = vrworld(['simresults/C7_SweptPath/LZV_custom/',sweptpath_results,'/',sweptpath_wrl]);
else
    vr_world = vrworld(['simresults/C7_SweptPath/LZV_custom/',Truckname,'/',Truckname,'_sweptpath.wrl']);   
end

open(vr_world);
vr.canvas(vr_world,'Parent', S.visual_sweptpath_panel,'Units','Normalized',...
          'Position',[0 0 1 0.9],'Viewpoint','Side view','NavZones','On');            

viewpoint_sweptpath = 2;  

function run_sweptpath_visualization_callback(source,eventdata)
global Truckname S sweptpath_results sweptpath_filename
global sweptpath_wrl sweptpath_sim results

% Press the toggle button
set(S.sweptpath_stop_vis_push, 'Value',0);

% Update the VR Sink block
if results == 1
    vrmodelname  = ['simresults/C7_SweptPath/LZV_custom/',sweptpath_results,'/',sweptpath_sim];
    load_system(vrmodelname)    
    [~,name,~] = fileparts(sweptpath_sim);
    h_vrsink = [name,'/VR sink'];
else
    vrmodelname = ['simresults/C7_SweptPath/LZV_custom/',Truckname,'/',Truckname,'_anim_sweptpath.slx'];  
    load_system(vrmodelname)
    h_vrsink=find_system('referenceblock','vrlib/VR Sink');
    h_vrsink=char(h_vrsink(1));
end
x = get_param(h_vrsink, 'FieldsWritten');
if results == 1
    set_param(h_vrsink, 'WorldFileName', sweptpath_wrl);
else
    set_param(h_vrsink, 'WorldFileName', [Truckname,'_sweptpath.wrl']);
end
set_param(h_vrsink, 'FieldsWritten', x);
save_system(vrmodelname)

% Load the simulation results
if isempty(sweptpath_results) == 0
    dirName = ['simresults\C7_Sweptpath\LZV_custom\',sweptpath_results];
    files = dir( fullfile(dirName,'*.mat') );
    filename = files.name;
    load(filename,'VR','s','dt');
else
    load(['simresults/C7_Sweptpath/LZV_custom/',Truckname,'/',sweptpath_filename])
end       
assignin('base','VR',VR);
assignin('base','s',s);
assignin('base','dt',dt);

% Start simulation
sim(vrmodelname)

% Set the toggle buttons to the right value when simulation is done
set(S.sweptpath_stop_vis_push, 'Value',1);
set(S.sweptpath_run_vis_push, 'Value',0);

function stop_sweptpath_visualization_callback(source,eventdata)
global S
set_param(bdroot, 'SimulationCommand', 'stop')
set(S.sweptpath_stop_vis_push, 'Value',1);
set(S.sweptpath_run_vis_push, 'Value',0);

function sweptpath_speed_callback(source,eventdata)
global S results sweptpath_results Truckname sweptpath_sim

if results == 1
    vrmodelname  = ['simresults/C7_Sweptpath/LZV_custom/',sweptpath_results,'/',sweptpath_sim];
    load_system(vrmodelname)    
    [~,name,~] = fileparts(sweptpath_sim);
    h_vrsink = [name,'/VR sink'];
else
    vrmodelname = ['simresults/C7_Sweptpath/LZV_custom/',Truckname,'/',Truckname,'_anim_sweptpath.slx'];  
    load_system(vrmodelname)
    h_vrsink=find_system('referenceblock','vrlib/VR Sink');
    h_vrsink=char(h_vrsink(1));
end

if get(S.sweptpath_speed_popup,'Value') == 1
    set_param(h_vrsink, 'SampleTime','0.05')
elseif get(S.sweptpath_speed_popup,'Value') == 2
    set_param(h_vrsink, 'SampleTime','0.1')
elseif get(S.sweptpath_speed_popup,'Value') == 3
    set_param(h_vrsink, 'SampleTime','0.5')
end

function sweptpath_view_callback(source,eventdata)
global S results sweptpath_results sweptpath_wrl Truckname viewpoint_sweptpath

if results == 1
    vr_world = vrworld(['simresults/C7_Sweptpath/LZV_custom/',sweptpath_results,'/',sweptpath_wrl]);
else
    vr_world = vrworld(['simresults/C7_Sweptpath/LZV_custom/',Truckname,'/',Truckname,'_sweptpath.wrl']);   
end
open(vr_world);
vr.canvas(vr_world,'Parent', S.visual_sweptpath_panel,'Units','Normalized',...
          'Position',[0 0 1 0.9],'Viewpoint','Side view','NavZones','On');  
      
if get(S.sweptpath_view_popup,'Value') == 1
    viewpoint_sweptpath = 1;
    if get(S.sweptpath_nav_popup,'Value') == 1
        vr.canvas(vr_world,'Parent', S.visual_sweptpath_panel,'Units','Normalized',...
        'Position',[0 0 1 0.9],'Viewpoint','Top view (moving)','NavZones','On');
    else
        vr.canvas(vr_world,'Parent', S.visual_sweptpath_panel,'Units','Normalized',...
        'Position',[0 0 1 0.9],'Viewpoint','Top view (moving)','NavZones','Off');
    end
elseif get(S.sweptpath_view_popup,'Value') == 2
    viewpoint_sweptpath = 2;
    if get(S.sweptpath_nav_popup,'Value') == 1    
        vr.canvas(vr_world,'Parent', S.visual_sweptpath_panel,'Units','Normalized',...
        'Position',[0 0 1 0.9],'Viewpoint','Side view','NavZones','On');
    else
        vr.canvas(vr_world,'Parent', S.visual_sweptpath_panel,'Units','Normalized',...
        'Position',[0 0 1 0.9],'Viewpoint','Side view','NavZones','Off');        
    end
elseif get(S.sweptpath_view_popup,'Value') == 3
    viewpoint_sweptpath = 3;
    if get(S.sweptpath_nav_popup,'Value') == 1
        vr.canvas(vr_world,'Parent', S.visual_sweptpath_panel,'Units','Normalized',...
              'Position',[0 0 1 0.9],'Viewpoint','Rear view (moving)','NavZones','On');
    else
        vr.canvas(vr_world,'Parent', S.visual_sweptpath_panel,'Units','Normalized',...
        'Position',[0 0 1 0.9],'Viewpoint','Rear view (moving)','NavZones','Off');        
    end
elseif get(S.sweptpath_view_popup,'Value') == 4
    viewpoint_sweptpath = 4;
    if get(S.sweptpath_nav_popup,'Value') == 1
        vr.canvas(vr_world,'Parent', S.visual_sweptpath_panel,'Units','Normalized',...
        'Position',[0 0 1 0.9],'Viewpoint','Front view (moving)','NavZones','On');
    else
        vr.canvas(vr_world,'Parent', S.visual_sweptpath_panel,'Units','Normalized',...
        'Position',[0 0 1 0.9],'Viewpoint','Front view (moving)','NavZones','Off');        
    end
elseif get(S.sweptpath_view_popup,'Value') == 5
    viewpoint_sweptpath = 5;
    if get(S.sweptpath_nav_popup,'Value') == 1
        vr.canvas(vr_world,'Parent', S.visual_sweptpath_panel,'Units','Normalized',...
        'Position',[0 0 1 0.9],'Viewpoint','Top rotating view','NavZones','On');
    else
        vr.canvas(vr_world,'Parent', S.visual_sweptpath_panel,'Units','Normalized',...
        'Position',[0 0 1 0.9],'Viewpoint','Top rotating view','NavZones','Off');        
    end
end

function sweptpath_nav_callback(source,eventdata)
global S results sweptpath_wrl Truckname sweptpath_results viewpoint_sweptpath

% Open the VRML visualization
if results == 1
    vr_world = vrworld(['simresults/C7_SweptPath/LZV_custom/',sweptpath_results,'/',sweptpath_wrl]);
else
    vr_world = vrworld(['simresults/C7_SweptPath/LZV_custom/',Truckname,'/',Truckname,'_sweptpath.wrl']);   
end
open(vr_world);
vr.canvas(vr_world,'Parent', S.visual_sweptpath_panel,'Units','Normalized',...
          'Position',[0 0 1 0.9],'Viewpoint','Side view','NavZones','On'); 
      
if get(S.sweptpath_nav_popup,'Value') == 1
    if viewpoint_sweptpath == 1
    vr.canvas(vr_world,'Parent', S.visual_sweptpath_panel,'Units','Normalized',...
              'Position',[0 0 1 0.9],'Viewpoint', 'Top view (moving)','NavZones','On');        
    elseif viewpoint_sweptpath == 2
    vr.canvas(vr_world,'Parent', S.visual_sweptpath_panel,'Units','Normalized',...
              'Position',[0 0 1 0.9],'Viewpoint', 'Side view','NavZones','On');
    elseif viewpoint_sweptpath == 3
    vr.canvas(vr_world,'Parent', S.visual_sweptpath_panel,'Units','Normalized',...
              'Position',[0 0 1 0.9],'Viewpoint', 'Rear view (moving)','NavZones','On');
    elseif viewpoint_sweptpath == 4
    vr.canvas(vr_world,'Parent', S.visual_sweptpath_panel,'Units','Normalized',...
              'Position',[0 0 1 0.9],'Viewpoint', 'Front view (moving)','NavZones','On');
    elseif viewpoint_sweptpath == 5
    vr.canvas(vr_world,'Parent', S.visual_sweptpath_panel,'Units','Normalized',...
              'Position',[0 0 1 0.9],'Viewpoint', 'Top rotating view','NavZones','On');
    end
    
elseif get(S.sweptpath_nav_popup,'Value') == 2
    if viewpoint_sweptpath == 1
    vr.canvas(vr_world,'Parent', S.visual_sweptpath_panel,'Units','Normalized',...
              'Position',[0 0 1 0.9],'Viewpoint', 'Top view (moving)','NavZones','Off');        
    elseif viewpoint_sweptpath == 2
    vr.canvas(vr_world,'Parent', S.visual_sweptpath_panel,'Units','Normalized',...
              'Position',[0 0 1 0.9],'Viewpoint', 'Side view','NavZones','Off');
    elseif viewpoint_sweptpath == 3
    vr.canvas(vr_world,'Parent', S.visual_sweptpath_panel,'Units','Normalized',...
              'Position',[0 0 1 0.9],'Viewpoint', 'Rear view (moving)','NavZones','Off');
    elseif viewpoint_sweptpath == 4
    vr.canvas(vr_world,'Parent', S.visual_sweptpath_panel,'Units','Normalized',...
              'Position',[0 0 1 0.9],'Viewpoint', 'Front view (moving)','NavZones','Off');
    elseif viewpoint_sweptpath == 5
    vr.canvas(vr_world,'Parent', S.visual_sweptpath_panel,'Units','Normalized',...
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