function C6_ridequality_postprocessing

global conf p axle_trailer axle_tractor axle_dolly S results  
global ridequality_results Truckname viewpoint_ridequality
global ridequality_filename ridequality_wrl

javaaddpath(which('MatlabGarbageCollector.jar'));
org.dt.matlab.utilities.JavaMemoryCleaner.clear(1);
clc;

%% Ride Quality tab lay-out

set(S.tab8,'Parent', S.tgroup);

S.tgroup_ridequality = uitabgroup('Parent',S.tab8, 'tablocation', 'right');
S.PBs.tab = uitab('Parent', S.tgroup_ridequality, 'backgroundcolor','w', 'Title','PBS Data');
S.ridequality_visual_tab = uitab('Parent', S.tgroup_ridequality, 'backgroundcolor','w', 'Title','Visulaization');

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
                      
S.Ridequality_title = uicontrol('Parent',               S.PBs.tab,...
                                'Style',                'text',...
                                'String',               'Ride quality (Drive Comfort)',...
                                'Backgroundcolor',      'w',...
                                'FontSize',             3.5,...
                                'FontUnits','Normalized',...
                                'FontWeight',           'bold',...
                                'Units',                'Normalized',...
                                'Position',             [.35 .75 .3 .15]);

S.h = uitable('Parent',             S.PBs.tab,...
              'Units',              'normalized',...
              'Position',           [.325 .2 .35 .5], ...
              'ColumnName',         [],...
              'RowName',            [],...
              'FontSize',           8,...
              'FontUnits','Normalized',...
              'BackgroundColor',    [1 1 1],...
              'ColumnWidth',        {440,52,83,83});

%% Visualization panel            
S.visual_ridequality_panel = uipanel('Parent',             S.ridequality_visual_tab,...
                                     'Units',              'normalized',...
                                     'Position',           [0 0 1 1],...
                                     'BackgroundColor',    'w');                  

S.ridequality_nav_text =      uicontrol('Parent',           S.visual_ridequality_panel,...
                                        'Style',            'text',...
                                        'backgroundColor',  'w',...
                                        'Units',            'Normalized',...
                                        'FontWeight',       'bold',...
                                        'String',           'Navigation zones',...
                                        'FontSize',         10,...
                                        'FontUnits',        'Normalized',...
                                        'Position',         [0.55 0.95 0.1 0.05]);  
                                  
S.ridequality_nav_popup =             uicontrol('Parent',           S.visual_ridequality_panel,...
                                        'Style',            'popup',...
                                        'backgroundColor',  'w',...
                                        'Units',            'Normalized',...
                                        'FontWeight',       'bold',...
                                        'String',           {'On','Off'},...
                                        'FontSize',         10,...
                                        'FontUnits',        'Normalized',...
                                        'Position',         [0.55 0.9 0.1 0.05],...
                                        'Callback',         @ridequality_nav_callback); 
                                    
S.ridequality_view_text =             uicontrol('Parent',           S.visual_ridequality_panel,...
                                        'Style',            'text',...
                                        'backgroundColor',  'w',...
                                        'Units',            'Normalized',...
                                        'FontWeight',       'bold',...
                                        'FontSize',         10,...
                                        'String',           'Viewpoint',...
                                        'FontUnits',        'Normalized',...
                                        'Position',         [0.24 0.95 0.1 0.05]);
                                    
S.ridequality_view_popup =            uicontrol('Parent',           S.visual_ridequality_panel,...
                                        'Style',            'popup',...
                                        'backgroundColor',  'w',...
                                        'Units',            'Normalized',...
                                        'FontWeight',       'bold',...
                                        'FontSize',         10,...
                                        'String',           {'Top view','Side view','Rear view','Front view','Top rotating view'},...
                                        'FontUnits',        'Normalized',...
                                        'Value',            2,...
                                        'Position',         [0.25 0.9 0.1 0.05],...
                                        'Callback',         @ridequality_view_callback); 


S.ridequality_run_vis_push =          uicontrol('Parent',           S.visual_ridequality_panel,...
                                        'Style',            'toggle',...
                                        'backgroundColor',  'w',...
                                        'ForegroundColor',  'b',...
                                        'Units',            'Normalized',...
                                        'FontWeight',       'bold',...
                                        'FontSize',         10,...
                                        'FontUnits',        'Normalized',...
                                        'Value',            0,...
                                        'Position',         [0.7 0.9 0.05 0.05],...
                                        'Callback',         @run_ridequality_visualization_callback); 
                                    
S.ridequality_stop_vis_push =         uicontrol('Parent',           S.visual_ridequality_panel,...
                                        'Style',            'toggle',...
                                        'backgroundColor',  'w',...
                                        'ForegroundColor',  'b',...
                                        'Units',            'Normalized',...
                                        'FontWeight',       'bold',...
                                        'FontSize',         10,...
                                        'FontUnits',        'Normalized',...
                                        'Value',            1,...
                                        'Position',         [0.75 0.9 0.05 0.05],...
                                        'Callback',         @stop_ridequality_visualization_callback); 

S.ridequality_speed_string =         uicontrol('Parent',           S.visual_ridequality_panel,...
                                        'Style',            'text',...
                                        'backgroundColor',  'w',...
                                        'Units',            'Normalized',...
                                        'FontWeight',       'bold',...
                                        'String',           'Simulation speed',...
                                        'FontSize',         10,...
                                        'FontUnits',        'Normalized',...
                                        'Value',            0,...
                                        'Position',         [0.35 0.95 0.2 0.05]);
                                    
S.ridequality_speed_popup =           uicontrol('Parent',           S.visual_ridequality_panel,...
                                        'Style',            'popup',...
                                        'backgroundColor',  'w',...
                                        'Units',            'Normalized',...
                                        'FontWeight',       'bold',...
                                        'String',           {'Low','Normal','High'},...
                                        'FontSize',         10,...
                                        'Value',            2,...
                                        'FontUnits',        'Normalized',...
                                        'Position',         [0.375 0.9 0.1 0.05],...
                                        'Callback',         @ridequality_speed_callback); 
                                     
[a,~]=imread('play.jpg');
[r,e,~]=size(a); 
x=ceil(r/30); 
y=ceil(e/30); 
g=a(1:x:end,1:y:end,:);
g(g==255)=5.5*255;
set(S.ridequality_run_vis_push,'CData',g);

[a,~]=imread('stop.jpg');
[r,e,~]=size(a); 
x=ceil(r/30); 
y=ceil(e/30); 
g=a(1:x:end,1:y:end,:);
g(g==255)=5.5*255;
set(S.ridequality_stop_vis_push,'CData',g);

S.back_button = uicontrol('parent', S.visual_ridequality_panel,...
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
    dirName = ['simresults\C6_RideQuality\LZV_custom\',ridequality_results];
    files = dir( fullfile(dirName,'*.mat') );
    filename = files.name;
    load(filename)  
else
    load(['simresults/C6_RideQuality/LZV_custom/',Truckname,'/',ridequality_filename])
end 
    
idx=find(s.time>4);

for i=1:34
    eval(['line' num2str(i) '=[];'])
end

line1=['Static axle loads LZV custom'];
line2=sprintf('--------------------------------------');
line3=sprintf('Hauling Unit');

if axle_tractor(1)==2
    Fz_truck_1L    = max(s.tyre.tractorFz(idx,1));
    Fz_truck_1R    = max(s.tyre.tractorFz(idx,2));
    Fz_truck_2L1     = max(s.tyre.tractorFz(idx,3));
    Fz_truck_2L2     = max(s.tyre.tractorFz(idx,4));
    Fz_truck_2R1     = max(s.tyre.tractorFz(idx,5));
    Fz_truck_2R2     = max(s.tyre.tractorFz(idx,6));
    line4=sprintf('Front axle  Left - %6.0f N  Right - %6.0f N',Fz_truck_1L,Fz_truck_1R);
    line5=sprintf('Rear axle   Left - %6.0f N / %6.0f N  Right - %6.0f N / %6.0f N',Fz_truck_2L1,Fz_truck_2L2,Fz_truck_2R1,Fz_truck_2R2);
    line6=sprintf('--------------------------------------');
    line_num=7;
elseif axle_tractor(1)==3
    Fz_truck_1L    = max(s.tyre.tractorFz(idx,1));
    Fz_truck_1R    = max(s.tyre.tractorFz(idx,2));
    Fz_truck_2L1     = max(s.tyre.tractorFz(idx,3));
    Fz_truck_2L2     = max(s.tyre.tractorFz(idx,4));
    Fz_truck_2R1     = max(s.tyre.tractorFz(idx,5));
    Fz_truck_2R2     = max(s.tyre.tractorFz(idx,6));
    Fz_truck_3L1     = max(s.tyre.tractorFz(idx,7));
    Fz_truck_3L2     = max(s.tyre.tractorFz(idx,8));
    Fz_truck_3R1     = max(s.tyre.tractorFz(idx,9));
    Fz_truck_3R2     = max(s.tyre.tractorFz(idx,10));
    line4=sprintf('Front axle1  Left - %6.0f N  Right - %6.0f N',Fz_truck_1L,Fz_truck_1R);
    line5=sprintf('Rear axle1   Left - %6.0f N / %6.0f N  Right - %6.0f N / %6.0f N',Fz_truck_2L1,Fz_truck_2L2,Fz_truck_2R1,Fz_truck_2R2);
    line6=sprintf('Rear axle2   Left - %6.0f N / %6.0f N  Right - %6.0f N / %6.0f N',Fz_truck_3L1,Fz_truck_3L2,Fz_truck_3R1,Fz_truck_3R2);
    line7=sprintf('--------------------------------------');
    line_num=8;
elseif axle_tractor(1)==4
    Fz_truck_1L    = max(s.tyre.tractorFz(idx,1));
    Fz_truck_1R    = max(s.tyre.tractorFz(idx,2));
    Fz_truck_2L    = max(s.tyre.tractorFz(idx,3));
    Fz_truck_2R    = max(s.tyre.tractorFz(idx,4));
    Fz_truck_3L1     = max(s.tyre.tractorFz(idx,5));
    Fz_truck_3L2     = max(s.tyre.tractorFz(idx,6));
    Fz_truck_3R1     = max(s.tyre.tractorFz(idx,7));
    Fz_truck_3R2     = max(s.tyre.tractorFz(idx,8));
    Fz_truck_4L1     = max(s.tyre.tractorFz(idx,9));
    Fz_truck_4L2     = max(s.tyre.tractorFz(idx,10));
    Fz_truck_4R1     = max(s.tyre.tractorFz(idx,11));
    Fz_truck_4R2     = max(s.tyre.tractorFz(idx,12));
    if conf==1
        line4=sprintf('Front axle1  Left - %6.0f N  Right - %6.0f N',Fz_truck_1L,Fz_truck_1R);
        line5=sprintf('Front axle2  Left - %6.0f N  Right - %6.0f N',Fz_truck_2L,Fz_truck_2R);
        line6=sprintf('Rear axle1   Left - %6.0f N / %6.0f N  Right - %6.0f N / %6.0f N',Fz_truck_3L1,Fz_truck_3L2,Fz_truck_3R1,Fz_truck_3R2);
        line7=sprintf('Rear axle2   Left - %6.0f N / %6.0f N  Right - %6.0f N / %6.0f N',Fz_truck_4L1,Fz_truck_4L2,Fz_truck_4R1,Fz_truck_4R2);
    elseif conf==2
        line4=sprintf('Front axle1  Left - %6.0f N  Right - %6.0f N',Fz_truck_1L,Fz_truck_1R);
        line5=sprintf('Front axle2   Left - %6.0f N / %6.0f N  Right - %6.0f N / %6.0f N',Fz_truck_4L1,Fz_truck_4L2,Fz_truck_4R1,Fz_truck_4R2);
        line6=sprintf('Rear axle1   Left - %6.0f N / %6.0f N  Right - %6.0f N / %6.0f N',Fz_truck_3L1,Fz_truck_3L2,Fz_truck_3R1,Fz_truck_3R2);
        line7=sprintf('Rear axle2  Left - %6.0f N  Right - %6.0f N',Fz_truck_2L,Fz_truck_2R);
    end
    
    line8=sprintf('--------------------------------------');
    line_num=9;
end


for n=1:1:p-1
    tampon=sprintf('Trailing Unit %d', n);
  	eval(['line' num2str(line_num) '=tampon;'])    
    line_num=line_num+1;
    
    if axle_dolly(n)~=0
        Fz_dolly_1L = max(eval(['s.tyre.dolly',num2str(n),'Fz(idx,1)']));
        Fz_dolly_1R = max(eval(['s.tyre.dolly',num2str(n),'Fz(idx,2)']));
        tampon=sprintf('Dolly%g axle 1  Left - %6.0f N  Right - %6.0f N', n ,Fz_dolly_1L,Fz_dolly_1R);
        eval(['line' num2str(line_num) '=tampon;'])
        line_num=line_num+1;
        if axle_dolly(n)==2
            Fz_dolly_2L = max(eval(['s.tyre.dolly',num2str(n),'Fz(idx,3)']));
            Fz_dolly_2R = max(eval(['s.tyre.dolly',num2str(n),'Fz(idx,4)']));
            tampon=sprintf('Dolly%g axle 2  Left - %6.0f N  Right - %6.0f N', n ,Fz_dolly_2L,Fz_dolly_2R);
            eval(['line' num2str(line_num) '=tampon;'])
            line_num=line_num+1;
        end
    end 
    
    Fz_trailer_1L = max(eval(['s.tyre.trailer',num2str(n),'Fz(idx,1)']));
    Fz_trailer_1R = max(eval(['s.tyre.trailer',num2str(n),'Fz(idx,2)']));
    tampon=sprintf('Trailer%g axle 1  Left - %6.0f N  Right - %6.0f N', n , Fz_trailer_1L,Fz_trailer_1R);
 	eval(['line' num2str(line_num) '=tampon;'])
   	line_num=line_num+1;
    if axle_trailer(n)>=2
        Fz_trailer_2L = max(eval(['s.tyre.trailer',num2str(n),'Fz(idx,3)']));
        Fz_trailer_2R = max(eval(['s.tyre.trailer',num2str(n),'Fz(idx,4)']));
        tampon=sprintf('Trailer%g axle 2  Left - %6.0f N  Right - %6.0f N', n , Fz_trailer_2L,Fz_trailer_2R);
        eval(['line' num2str(line_num) '=tampon;'])
        line_num=line_num+1;
    end
    if axle_trailer(n)>=3
        Fz_trailer_3L = max(eval(['s.tyre.trailer',num2str(n),'Fz(idx,5)']));
        Fz_trailer_3R = max(eval(['s.tyre.trailer',num2str(n),'Fz(idx,6)']));
        tampon=sprintf('Trailer%g axle 3  Left - %6.0f N  Right - %6.0f N', n , Fz_trailer_3L,Fz_trailer_3R);
        eval(['line' num2str(line_num) '=tampon;'])
        line_num=line_num+1;
    end
    if axle_trailer(n)>=4
        Fz_trailer_4L = max(eval(['s.tyre.trailer',num2str(n),'Fz(idx,7)']));
        Fz_trailer_4R = max(eval(['s.tyre.trailer',num2str(n),'Fz(idx,8)']));
        tampon=sprintf('Trailer%g axle 4  Left - %6.0f N  Right - %6.0f N', n , Fz_trailer_4L,Fz_trailer_4R);
        eval(['line' num2str(line_num) '=tampon;'])
        line_num=line_num+1;
    end
    if axle_trailer(n)==5
        Fz_trailer_5L = max(eval(['s.tyre.trailer',num2str(n),'Fz(idx,9)']));
        Fz_trailer_5R = max(eval(['s.tyre.trailer',num2str(n),'Fz(idx,10)']));
        tampon=sprintf('Trailer%g axle 5  Left - %6.0f N  Right - %6.0f N', n , Fz_trailer_5L,Fz_trailer_5R);
        eval(['line' num2str(line_num) '=tampon;'])
        line_num=line_num+1;
    end
    
    tampon=sprintf('--------------------------------------');
    eval(['line' num2str(line_num) '=tampon;'])
    line_num=line_num+1;
end

set(S.h,'Data',{line1; line2; line3; line4; line5; line6; line7; line8; line9; line10; line11; line12; line13; line14; line15; line16; line17; line18; line19; line20; line21; line22; line23; line24; line25; line26; line27; line28; line29; line30; line31; line32; line33; line34});

% Open the VRML visualization
if results == 1
    vr_world = vrworld(['simresults/C6_RideQuality/LZV_custom/',ridequality_results,'/',ridequality_wrl]);
else
    vr_world = vrworld(['simresults/C6_RideQuality/LZV_custom/',Truckname,'/',Truckname,'_rideability.wrl']);   
end

open(vr_world);
vr.canvas(vr_world,'Parent', S.visual_ridequality_panel,'Units','Normalized',...
          'Position',[0 0 1 0.9],'Viewpoint','Side view','NavZones','On');     
      
viewpoint_ridequality = 2;   

function run_ridequality_visualization_callback(source,eventdata)
global ridequality_wrl Truckname S viewpoint_ridequality
global ridequality_results ridequality_filename  results  ridequality_sim

% Press the toggle button
set(S.ridequality_stop_vis_push, 'Value',0);

% Update the VR Sink block
if results == 1
    vrmodelname  = ['simresults/C6_RideQuality/LZV_custom/',ridequality_results,'/',ridequality_sim];
    load_system(vrmodelname)    
    [~,name,~] = fileparts(ridequality_sim);
    h_vrsink = [name,'/VR sink'];
else
    vrmodelname = ['simresults/C6_RideQuality/LZV_custom/',Truckname,'/',Truckname,'_rideability_anim.slx'];  
    load_system(vrmodelname)
    h_vrsink=find_system('referenceblock','vrlib/VR Sink');
    h_vrsink=char(h_vrsink(1));
end
x = get_param(h_vrsink, 'FieldsWritten');
if results == 1
    set_param(h_vrsink, 'WorldFileName', ridequality_wrl);
else
    set_param(h_vrsink, 'WorldFileName', [Truckname,'_rideability.wrl']);
end
set_param(h_vrsink, 'FieldsWritten', x);
save_system(vrmodelname)

% Load the simulation results
if isempty(ridequality_results) == 0
    dirName = ['simresults\C6_RideQuality\LZV_custom\',ridequality_results];
    files = dir( fullfile(dirName,'*.mat') );
    filename = files.name;
    load(filename,'VR','s','dt');
else
    load(['simresults/C6_RideQuality/LZV_custom/',Truckname,'/',ridequality_filename])
end       
assignin('base','VR',VR);
assignin('base','s',s);
assignin('base','dt',dt);

% Start simulation
sim(vrmodelname)

% Set the toggle buttons to the right value when simulation is done
set(S.ridequality_stop_vis_push, 'Value',1);
set(S.ridequality_run_vis_push, 'Value',0);

function stop_ridequality_visualization_callback(source,eventdata)
global S
set_param(bdroot, 'SimulationCommand', 'stop')
set(S.ridequality_stop_vis_push, 'Value',1);
set(S.ridequality_run_vis_push, 'Value',0);

function ridequality_speed_callback(source,eventdata)
global S results ridequality_results Truckname ridecualtiy_sim

if results == 1
    vrmodelname  = ['simresults/C6_RideQuality/LZV_custom/',ridequality_results,'/',ridecualtiy_sim];
    load_system(vrmodelname)    
    [~,name,~] = fileparts(ridequality_sim);
    h_vrsink = [name,'/VR sink'];
else
    vrmodelname = ['simresults/C6_RideQuality/LZV_custom/',Truckname,'/',Truckname,'_rideability_anim.slx'];  
    load_system(vrmodelname)
    h_vrsink=find_system('referenceblock','vrlib/VR Sink');
    h_vrsink=char(h_vrsink(1));
end

if get(S.ridequality_speed_popup,'Value') == 1
    set_param(h_vrsink, 'SampleTime','0.05')
elseif get(S.ridequality_speed_popup,'Value') == 2
    set_param(h_vrsink, 'SampleTime','0.1')
elseif get(S.ridequality_speed_popup,'Value') == 3
    set_param(h_vrsink, 'SampleTime','0.5')
end

function ridequality_view_callback(source,eventdata)
global S results ridequality_results ridequality_wrl Truckname viewpoint_ridequality

if results == 1
    vr_world = vrworld(['simresults/C6_RideQuality/LZV_custom/',ridequality_results,'/',ridequality_wrl]);
else
    vr_world = vrworld(['simresults/C6_RideQuality/LZV_custom/',Truckname,'/',Truckname,'_rideability.wrl']);   
end

open(vr_world);

if get(S.ridequality_view_popup,'Value') == 1
    viewpoint_ridequality = 1;
    if get(S.ridequality_nav_popup,'Value') == 1
        vr.canvas(vr_world,'Parent', S.visual_ridequality_panel,'Units','Normalized',...
        'Position',[0 0 1 0.9],'Viewpoint','Top view (moving)','NavZones','On');
    else
        vr.canvas(vr_world,'Parent', S.visual_ridequality_panel,'Units','Normalized',...
        'Position',[0 0 1 0.9],'Viewpoint','Top view (moving)','NavZones','Off');
    end
elseif get(S.ridequality_view_popup,'Value') == 2
    viewpoint_ridequality = 2;
    if get(S.ridequality_nav_popup,'Value') == 1    
        vr.canvas(vr_world,'Parent', S.visual_ridequality_panel,'Units','Normalized',...
        'Position',[0 0 1 0.9],'Viewpoint','Side view','NavZones','On');
    else
        vr.canvas(vr_world,'Parent', S.visual_ridequality_panel,'Units','Normalized',...
        'Position',[0 0 1 0.9],'Viewpoint','Side view','NavZones','Off');        
    end
elseif get(S.ridequality_view_popup,'Value') == 3
    viewpoint_ridequality = 3;
    if get(S.ridequality_nav_popup,'Value') == 1
        vr.canvas(vr_world,'Parent', S.visual_ridequality_panel,'Units','Normalized',...
              'Position',[0 0 1 0.9],'Viewpoint','Rear view (moving)','NavZones','On');
    else
        vr.canvas(vr_world,'Parent', S.visual_ridequality_panel,'Units','Normalized',...
        'Position',[0 0 1 0.9],'Viewpoint','Rear view (moving)','NavZones','Off');        
    end
elseif get(S.ridequality_view_popup,'Value') == 4
    viewpoint_ridequality = 4;
    if get(S.ridequality_nav_popup,'Value') == 1
        vr.canvas(vr_world,'Parent', S.visual_ridequality_panel,'Units','Normalized',...
        'Position',[0 0 1 0.9],'Viewpoint','Front view (moving)','NavZones','On');
    else
        vr.canvas(vr_world,'Parent', S.visual_ridequality_panel,'Units','Normalized',...
        'Position',[0 0 1 0.9],'Viewpoint','Front view (moving)','NavZones','Off');        
    end
elseif get(S.ridequality_view_popup,'Value') == 5
    viewpoint_ridequality = 5;
    if get(S.ridequality_nav_popup,'Value') == 1
        vr.canvas(vr_world,'Parent', S.visual_ridequality_panel,'Units','Normalized',...
        'Position',[0 0 1 0.9],'Viewpoint','Top rotating view','NavZones','On');
    else
        vr.canvas(vr_world,'Parent', S.visual_ridequality_panel,'Units','Normalized',...
        'Position',[0 0 1 0.9],'Viewpoint','Top rotating view','NavZones','Off');        
    end
end

function ridequality_nav_callback(source,eventdata)
global S results ridequality_wrl Truckname ridequality_results viewpoint_ridequality

if results == 1
    vr_world = vrworld(['simresults/C6_RideQuality/LZV_custom/',ridequality_results,'/',ridequality_wrl]);
else
    vr_world = vrworld(['simresults/C6_RideQuality/LZV_custom/',Truckname,'/',Truckname,'_rideability.wrl']);   
end

open(vr_world);

if get(S.ridequality_nav_popup,'Value') == 1
    if viewpoint_ridequality == 1
    vr.canvas(vr_world,'Parent', S.visual_ridequality_panel,'Units','Normalized',...
              'Position',[0 0 1 0.9],'Viewpoint', 'Top view (moving)','NavZones','On');        
    elseif viewpoint_ridequality == 2
    vr.canvas(vr_world,'Parent', S.visual_ridequality_panel,'Units','Normalized',...
              'Position',[0 0 1 0.9],'Viewpoint', 'Side view','NavZones','On');
    elseif viewpoint_ridequality == 3
    vr.canvas(vr_world,'Parent', S.visual_ridequality_panel,'Units','Normalized',...
              'Position',[0 0 1 0.9],'Viewpoint', 'Rear view (moving)','NavZones','On');
    elseif viewpoint_ridequality == 4
    vr.canvas(vr_world,'Parent', S.visual_ridequality_panel,'Units','Normalized',...
              'Position',[0 0 1 0.9],'Viewpoint', 'Front view (moving)','NavZones','On');
    elseif viewpoint_ridequality == 5
    vr.canvas(vr_world,'Parent', S.visual_ridequality_panel,'Units','Normalized',...
              'Position',[0 0 1 0.9],'Viewpoint', 'Top rotating view','NavZones','On');
    end
    
elseif get(S.ridequality_nav_popup,'Value') == 2
    if viewpoint_ridequality == 1
    vr.canvas(vr_world,'Parent', S.visual_ridequality_panel,'Units','Normalized',...
              'Position',[0 0 1 0.9],'Viewpoint', 'Top view (moving)','NavZones','Off');        
    elseif viewpoint_ridequality == 2
    vr.canvas(vr_world,'Parent', S.visual_ridequality_panel,'Units','Normalized',...
              'Position',[0 0 1 0.9],'Viewpoint', 'Side view','NavZones','Off');
    elseif viewpoint_ridequality == 3
    vr.canvas(vr_world,'Parent', S.visual_ridequality_panel,'Units','Normalized',...
              'Position',[0 0 1 0.9],'Viewpoint', 'Rear view (moving)','NavZones','Off');
    elseif viewpoint_ridequality == 4
    vr.canvas(vr_world,'Parent', S.visual_ridequality_panel,'Units','Normalized',...
              'Position',[0 0 1 0.9],'Viewpoint', 'Front view (moving)','NavZones','Off');
    elseif viewpoint_ridequality == 5
    vr.canvas(vr_world,'Parent', S.visual_ridequality_panel,'Units','Normalized',...
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