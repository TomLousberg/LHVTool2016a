function turn90r8_postprocessing

global axle_tractor S turn90r8_results results Truckname
global  axle_trailer p tractor1 tractor viewpoint_turn90r8
global turn90r8_filename turn90r8_wrl
 
javaaddpath(which('MatlabGarbageCollector.jar'));
org.dt.matlab.utilities.JavaMemoryCleaner.clear(1);
clc;

%% Friction tab lay-out

set(S.tab15,'Parent', S.tgroup);

S.tgroup_turn90r8 = uitabgroup('Parent',S.tab15, 'tablocation', 'right');
S.PBs.tab = uitab('Parent', S.tgroup_turn90r8, 'backgroundcolor','w', 'Title','PBS Data');
S.turn90r8_visual_tab = uitab('Parent', S.tgroup_turn90r8, 'backgroundcolor','w', 'Title','Visulaization');

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
                      
S.Turn90R8_title = uicontrol('Parent', S.PBs.tab,...
                             'Style', 'text',...
                             'String', '90 Deg Turn R8',...
                             'Backgroundcolor', 'w',...
                             'FontSize',3.5,...
                             'FontUnits','Normalized',...
                             'FontWeight','bold',...
                             'Units','Normalized',...
                             'Position',[0.2 0.75 0.5 0.2]);

S.panel = uipanel('Parent',S.PBs.tab,...
                  'Units','Centimeters',...
                  'Position',[3.25 11 26 4],...    
                  'backgroundcolor','w',...
                  'Title','Performance Levels',...
                  'Units','Normalized',...
                  'FontWeight','bold',...
                  'FontSize',12,...
                  'FontUnits','Normalized',...
                  'BorderWidth',        2,...
                  'BorderType',         'Line',...
                  'highlightcolor',     'k');

S.panel_1 = uipanel('Parent',S.panel,...
                    'backgroundcolor','w',...
                    'Units','Normalized',...
                    'Position',[0.025 0.2 0.15 0.6],...
                    'FontWeight','bold',...
                    'FontSize',12,...
                    'FontUnits','Normalized',...
                  'BorderWidth',        2,...
                  'BorderType',         'Line',...
                  'highlightcolor',     'k');

S.width_edit = uicontrol('Parent', S.panel_1,...
                         'Style', 'edit', ...
                         'Backgroundcolor', 'w',...
                         'FontSize',12,...
                         'FontUnits','Normalized',...
                         'enable','off',...
                         'Units','Normalized',...
                         'Position',[0.3 0.3 0.4 0.2]);                           

S.width_text = uicontrol('Parent', S.panel_1,...
                         'Style', 'text',...
                         'String', 'Maximum Width of Swept Path (m)',...
                         'FontSize',6,...
                         'FontUnits','Normalized',...
                         'backgroundcolor','w',...
                         'Units','Normalized',...
                         'Position',[0.05 0.6 0.9 0.35]); 

S.truck_panel = uipanel('Parent',S.panel,...
                        'backgroundcolor','w',...
                        'Units','Normalized',...
                        'Position',[0.225 0.2 0.15 0.6],...
                        'FontWeight','bold','FontSize',12,...
                        'FontUnits','Normalized',...
                  'BorderWidth',        2,...
                  'BorderType',         'Line',...
                  'highlightcolor',     'k');

S.width2_edit = uicontrol('Parent', S.truck_panel,...
                         'Style', 'edit', ...
                         'Backgroundcolor', 'w',...
                         'FontSize',12,...
                         'FontUnits','Normalized',...
                         'enable','off',...
                         'Units','Normalized',...
                         'Position',[0.3 0.3 0.4 0.2]);                           

S.width2_text = uicontrol('Parent', S.truck_panel,...
                          'Style', 'text',...
                          'String', 'Frontal Swing Maximum (m)',...
                          'FontSize',6,...
                          'FontUnits','Normalized',...
                          'backgroundcolor','w',...
                          'Units','Normalized',...
                          'Position',[0.05 0.6 0.9 0.35]);

S.semitrailer_panel = uipanel('Parent',S.panel,...
                              'backgroundcolor','w',...
                              'Units','Normalized',...
                              'Position',[0.425 0.1 0.175 0.9],...
                              'FontWeight','bold',...
                              'FontSize',12,...
                              'FontUnits','Normalized',...
                              'BorderWidth',        2,...
                              'BorderType',         'Line',...
                              'highlightcolor',     'k');

S.MoD_edit = uicontrol('Parent', S.semitrailer_panel,...
                       'Style', 'edit',...
                       'Backgroundcolor', 'w',...
                       'FontSize',12,...
                       'FontUnits','Normalized',...
                       'enable','off',...
                       'Units','Normalized',...
                       'Position',[0.3 0.575 0.5 0.15]);                           

S.MoD_text = uicontrol('Parent', S.semitrailer_panel,...
                       'Style', 'text',...
                       'String', 'Maximum of Difference (m)', ...
                       'FontSize',8,...
                       'FontUnits','Normalized',...
                       'backgroundcolor','w',...
                       'Units','Normalized',...
                       'Position',[0.05 0.75 0.9 0.15]);

 S.DoM_edit = uicontrol('Parent', S.semitrailer_panel,...
                        'Style', 'edit',...
                        'Backgroundcolor', 'w',...
                        'FontSize',12,...
                        'FontUnits','Normalized',...
                        'enable','off',...
                        'Units','Normalized',...
                        'Position',[0.3 0.1 0.5 0.15]);                           

S.DoM_text = uicontrol('Parent', S.semitrailer_panel,...
                       'Style', 'text',...
                       'String', 'Difference of Maxima (m)',...
                       'FontSize',8,...
                       'FontUnits','Normalized',...
                       'backgroundcolor','w',...
                       'Units','Normalized',...
                       'Position',[0.05 0.3 0.9 0.15]);


S.panel_4 = uipanel('Parent',S.panel,...
                    'backgroundcolor','w',...
                    'Units','Normalized',...
                    'Position',[0.625 0.2 0.15 0.6],...
                    'FontWeight','bold',...
                    'FontSize',12,...
                    'FontUnits','Normalized',...
                  'BorderWidth',        2,...
                  'BorderType',         'Line',...
                  'highlightcolor',     'k');

S.width3_edit = uicontrol('Parent', S.panel_4,...
                          'Style', 'edit', ...
                          'Backgroundcolor', 'w',...
                          'FontSize',12,...
                          'FontUnits','Normalized',...
                          'enable','off',...
                          'Units','Normalized',...
                          'Position',[0.3 0.3 0.4 0.2]);                           

S.width3_text = uicontrol('Parent', S.panel_4,...
                          'Style', 'text',...
                          'String', 'Tail Swing Maximum (m)',...
                          'FontSize',6,...
                          'FontUnits','Normalized',...
                          'backgroundcolor','w',...
                          'Units','Normalized',...
                          'Position',[0.05 0.6 0.9 0.35]);

S.panel_5 = uipanel('Parent',S.panel,...
                    'backgroundcolor','w',...
                    'Units','Normalized',...
                    'Position',[0.825 0.2 0.15 0.6],...
                    'FontWeight','bold',...
                    'FontSize',12,...
                    'FontUnits','Normalized',...
                  'BorderWidth',        2,...
                  'BorderType',         'Line',...
                  'highlightcolor',     'k');

S.friction_edit = uicontrol('Parent', S.panel_5,...
                            'Style', 'edit', ...
                            'Backgroundcolor', 'w',...
                            'FontSize',12,...
                            'FontUnits','Normalized',...
                            'enable','off',...
                            'Units','Normalized',...
                            'Position',[0.3 0.3 0.4 0.2]);                           

S.friction_text = uicontrol('Parent', S.panel_5,...
                            'Style', 'text',...
                            'String', 'Friction Demand (%)', ...
                            'FontSize',6,...
                            'FontUnits','Normalized',...
                            'backgroundcolor','w',...
                            'Units','Normalized',...
                            'Position',[0.05 0.6 0.9 0.35]);
                        
%% Visualization panel  
S.visual_turn90r8_panel = uipanel('Parent',             S.turn90r8_visual_tab,...
                         'Units',              'normalized',...
                         'Position',           [0 0 1 1],...
                         'BackgroundColor',    'w');                  

S.turn90r8_nav_text =      uicontrol('Parent',           S.visual_turn90r8_panel,...
                                      'Style',            'text',...
                                      'backgroundColor',  'w',...
                                      'Units',            'Normalized',...
                                      'FontWeight',       'bold',...
                                      'String',           'Navigation zones',...
                                      'FontSize',         10,...
                                      'FontUnits',        'Normalized',...
                                      'Position',         [0.55 0.95 0.1 0.05]);  
                                  
S.turn90r8_nav_popup =       uicontrol('Parent',           S.visual_turn90r8_panel,...
                                        'Style',            'popup',...
                                        'backgroundColor',  'w',...
                                        'Units',            'Normalized',...
                                        'FontWeight',       'bold',...
                                        'String',           {'On','Off'},...
                                        'FontSize',         10,...
                                        'FontUnits',        'Normalized',...
                                        'Position',         [0.55 0.9 0.1 0.05],...
                                        'Callback',         @turn90r8_nav_callback); 
                                    
S.turn90r8_view_text =       uicontrol('Parent',           S.visual_turn90r8_panel,...
                                        'Style',            'text',...
                                        'backgroundColor',  'w',...
                                        'Units',            'Normalized',...
                                        'FontWeight',       'bold',...
                                        'FontSize',         10,...
                                        'String',           'Viewpoint',...
                                        'FontUnits',        'Normalized',...
                                        'Position',         [0.24 0.95 0.1 0.05]);
                                    
S.turn90r8_view_popup =       uicontrol('Parent',           S.visual_turn90r8_panel,...
                                         'Style',            'popup',...
                                         'backgroundColor',  'w',...
                                         'Units',            'Normalized',...
                                         'FontWeight',       'bold',...
                                         'FontSize',         10,...
                                         'String',           {'Top view','Side view','Rear view','Front view','Top rotating view'},...
                                         'FontUnits',        'Normalized',...
                                         'Value',            2,...
                                         'Position',         [0.25 0.9 0.1 0.05],...
                                         'Callback',         @turn90r8_view_callback); 


S.turn90r8_run_vis_push =    uicontrol('Parent',           S.visual_turn90r8_panel,...
                                        'Style',            'toggle',...
                                        'backgroundColor',  'w',...
                                        'ForegroundColor',  'b',...
                                        'Units',            'Normalized',...
                                        'FontWeight',       'bold',...
                                        'FontSize',         10,...
                                        'FontUnits',        'Normalized',...
                                        'Value',            0,...
                                        'Position',         [0.7 0.9 0.05 0.05],...
                                        'Callback',         @run_turn90r8_visualization_callback); 
                                    
S.turn90r8_stop_vis_push =   uicontrol('Parent',           S.visual_turn90r8_panel,...
                                        'Style',            'toggle',...
                                        'backgroundColor',  'w',...
                                        'ForegroundColor',  'b',...
                                        'Units',            'Normalized',...
                                        'FontWeight',       'bold',...
                                        'FontSize',         10,...
                                        'FontUnits',        'Normalized',...
                                        'Value',            1,...
                                        'Position',         [0.75 0.9 0.05 0.05],...
                                        'Callback',         @stop_turn90r8_visualization_callback); 

S.turn90r8_speed_string =    uicontrol('Parent',           S.visual_turn90r8_panel,...
                                        'Style',            'text',...
                                        'backgroundColor',  'w',...
                                        'Units',            'Normalized',...
                                        'FontWeight',       'bold',...
                                        'String',           'Simulation speed',...
                                        'FontSize',         10,...
                                        'FontUnits',        'Normalized',...
                                        'Value',            0,...
                                        'Position',         [0.35 0.95 0.2 0.05]);
                                    
S.turn90r8_speed_popup =     uicontrol('Parent',           S.visual_turn90r8_panel,...
                                        'Style',            'popup',...
                                        'backgroundColor',  'w',...
                                        'Units',            'Normalized',...
                                        'FontWeight',       'bold',...
                                        'String',           {'Low','Normal','High'},...
                                        'FontSize',         10,...
                                        'Value',            2,...
                                        'FontUnits',        'Normalized',...
                                        'Position',         [0.375 0.9 0.1 0.05],...
                                        'Callback',         @turn90r8_speed_callback); 
                                     
[a,~]=imread('play.jpg');
[r,e,~]=size(a); 
x=ceil(r/30); 
y=ceil(e/30); 
g=a(1:x:end,1:y:end,:);
g(g==255)=5.5*255;
set(S.turn90r8_run_vis_push,'CData',g);

[a,~]=imread('stop.jpg');
[r,e,~]=size(a); 
x=ceil(r/30); 
y=ceil(e/30); 
g=a(1:x:end,1:y:end,:);
g(g==255)=5.5*255;
set(S.turn90r8_stop_vis_push,'CData',g);

S.back_button = uicontrol('parent', S.visual_turn90r8_panel,...
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
    dirName = ['simresults\Turn90R8\LZV_custom\',turn90r8_results];
    files = dir( fullfile(dirName,'*.mat') );
    filename = files.name;
    load(filename)
else
    load(['simresults/Turn90R8/LZV_custom/',Truckname,'/',turn90r8_filename])
end

%Tyre Friction
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

    friction1=max(abs((A1+A2+A3+A4+A5+A6+A7+A8+A9+A10+A11+A12)./(B1+B2+B3+B4+B5+B6+B7+B8+B9+B10+B11+B12)));
    friction1=100*(friction1/mu_peak);

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

    friction1=max(abs((A1+A2+A3+A4+A5+A6+A7+A8+A9+A10)./(B1+B2+B3+B4+B5+B6+B7+B8+B9+B10)));
    friction1=100*(friction1/mu_peak);  

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

    friction1=max(abs((A1+A2+A3+A4+A5+A6)./(B1+B2+B3+B4+B5+B6)));
    friction1=100*(friction1/mu_peak);  
end

    %SweptPath
front_positionright_x=s.cabinfront.rightpos(:,1);
front_positionright_y=s.cabinfront.rightpos(:,2);
front_positionleft_x=s.cabinfront.leftpos(:,1);
front_positionleft_y=s.cabinfront.leftpos(:,2);

axle_positionright_x=eval(strcat('s.trailer',num2str(p-1),'axle',num2str(axle_trailer(p-1)),'.posright(:,1)'));
axle_positionright_y=eval(strcat('s.trailer',num2str(p-1),'axle',num2str(axle_trailer(p-1)),'.posright(:,2)'));
axle_positionleft_x=eval(strcat('s.trailer',num2str(p-1),'axle',num2str(axle_trailer(p-1)),'.posleft(:,1)'));
axle_positionleft_y=eval(strcat('s.trailer',num2str(p-1),'axle',num2str(axle_trailer(p-1)),'.posleft(:,2)'));

outermost_path_x1=front_positionright_x;
outermost_path_y1=front_positionright_y;
innermost_path_x1=axle_positionleft_x;
innermost_path_y1=axle_positionleft_y;

%Frontal Swing
axle1_positionright_x=s.steeraxle.posright(:,1);
axle1_positionright_y=s.steeraxle.posright(:,2);
axle1_positionleft_x=s.steeraxle.posleft(:,1);
axle1_positionleft_y=s.steeraxle.posleft(:,2);

tractor1=tractor;

if tractor1==1
    semitrailer_positionright_x=eval(strcat('s.trailer',num2str(1),'semi.posright(:,1)'));
    semitrailer_positionright_y=eval(strcat('s.trailer',num2str(1),'semi.posright(:,2)'));
    semitrailer_positionleft_x=eval(strcat('s.trailer',num2str(1),'semi.posleft(:,1)'));
    semitrailer_positionleft_y=eval(strcat('s.trailer',num2str(1),'semi.posleft(:,2)'));

    outsidewheel_x1=axle1_positionright_x;
    outsidewheel_y1=axle1_positionright_y;
    primemover_x1=front_positionright_x;
    primemover_y1=front_positionright_y;
    semitrailer_x1=semitrailer_positionright_x;
    semitrailer_y1=semitrailer_positionright_y;

    outermost_path_x2=front_positionright_x;
    outermost_path_y2=front_positionright_y;
    innermost_path_x2=axle1_positionright_x;
    innermost_path_y2=axle1_positionright_y;

elseif tractor1==0

    outermost_path_x2=front_positionright_x;
    outermost_path_y2=front_positionright_y;
    innermost_path_x2=axle1_positionright_x;
    innermost_path_y2=axle1_positionright_y;

end

%Tail Swing
tailright_x=eval(strcat('s.trailer',num2str(p-1),'.load.posright(:,1)'));
tailright_y=eval(strcat('s.trailer',num2str(p-1),'.load.posright(:,2)'));
tailleft_x=eval(strcat('s.trailer',num2str(p-1),'.load.posleft(:,1)'));
tailleft_y=eval(strcat('s.trailer',num2str(p-1),'.load.posleft(:,2)'));

tail_x1=tailright_x;
tail_y1=tailright_y;

f_coeff=friction_coeff;
temps1=s.time;
positionx1=s.steeraxle.pos(:,1);
positiony1=s.steeraxle.pos(:,2);
steer1=s.inputs.delta*180/pi;

set(S.semitrailer_panel,'Visible','Off');
set(S.truck_panel,'Visible','Off');

idx_outerstart=find(outermost_path_x1>32);
outerstart=idx_outerstart(1);
idx_outerstop=find(outermost_path_y1>8);
outerstop=idx_outerstop(1);
idx_outer=outerstart:outerstop;

idx_innerstart=find(innermost_path_x1>25.5);
innerstart=idx_innerstart(1);
idx_innerstop=find(innermost_path_y1>12.5);
innerstop=idx_innerstop(1);
idx_inner=innerstart:innerstop;

outermost_path_x3=outermost_path_x1(idx_outer);
outermost_path_y3=outermost_path_y1(idx_outer);
innermost_path_x3=innermost_path_x1(idx_inner);
innermost_path_y3=innermost_path_y1(idx_inner);

%Derivee outermost path
for i=21:(length(outermost_path_x3)-20)
    derivee_outer(i)=(outermost_path_y3(i+20)-outermost_path_y3(i-20))/(outermost_path_x3(i+20)-outermost_path_x3(i-20));
end
%Derivee innermost path
for i=21:(length(innermost_path_x3)-20)
    derivee_inner(i)=(innermost_path_y3(i+20)-innermost_path_y3(i-20))/(innermost_path_x3(i+20)-innermost_path_x3(i-20));
end

maxwidth=0;
for i=1:length(derivee_inner)
    for k=1:length(derivee_outer)
        if abs(derivee_outer(k)-derivee_inner(i))<0.1
            dist2paths=sqrt((innermost_path_y3(i)-outermost_path_y3(k))*(innermost_path_y3(i)-outermost_path_y3(k))+(innermost_path_x3(i)-outermost_path_x3(k))*(innermost_path_x3(i)-outermost_path_x3(k)));
            scal=((innermost_path_y3(i)-outermost_path_y3(k))*derivee_outer(k))+((innermost_path_x3(i)-outermost_path_x3(k))*1);
            if abs(scal)<0.1
                if dist2paths>maxwidth
                    maxwidth=dist2paths;
                    x_inner=innermost_path_x3(i);
                    y_inner=innermost_path_y3(i);
                    coeffdir_inner=derivee_inner(i);
                    x_outer=outermost_path_x3(k);
                    y_outer=outermost_path_y3(k);
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

maxwidth=(round(maxwidth*100))/100;
set(S.width_edit, 'string', num2str(maxwidth));

radius=8;
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
S.axes1 = axes('Parent',S.PBs.tab,'units','normalized','position',[.1 .5 .2 .1]);
plot(S.axes1, temps1,steer1,'LineWidth',1.5);
title('Steer angle');
xlabel('time [s]');
ylabel('angle [deg]');
grid on;

%Position of the LZV
S.axes2 = axes('Parent',S.PBs.tab,'units','normalized','position',[.6 .05 .3 .3]);
plot(S.axes2, outermost_path_x1,outermost_path_y1,'b',innermost_path_x1,innermost_path_y1,'b-.','LineWidth',1.5);
hold on 
plot(S.axes2,positionx1,positiony1,'g','LineWidth',1.5);
hold on
plot(S.axes2,outsidewheel_path_x,outsidewheel_path_y,'r--','LineWidth',1.5);
hold on
plot(S.axes2,x_inner,y_inner,'k+',x_outer,y_outer,'k+','LineWidth',1.5);
hold on
plot(S.axes2,xtang_inner,ytang_inner,'k--',xtang_outer,ytang_outer,'k--',maxwidth_dtex,maxwidth_dtey,'k','LineWidth',1.5);

legend('Outermost Path','Innermost Path','Center Position of firstaxle','Path followed by Center Position of firstaxle(Input)');
title('LZV Position - Swept Path');
axis([20 45 -5 20]);
xlabel('x [m]');
ylabel('y [m]');
grid on;

if tractor1==0
    set(S.truck_panel,'Visible','On');

    %maxwidth 
    maxwidth=abs(max(outermost_path_x2)-max(innermost_path_x2));
    maxwidth=(round(maxwidth*100))/100;
    set(S.width2_edit, 'string', num2str(maxwidth));

    %Position of the LZV
    S.axes3 = axes('Parent',S.PBs.tab,'units','normalized','position',[.1 .05 .2 .35]);
    plot(S.axes3, outermost_path_x2,outermost_path_y2,'b',innermost_path_x2,innermost_path_y2,'b--','LineWidth',1.5);
    legend('Outermost Path','Innermost Path');
    title('LZV Position - Frontal Swing (Truck)');
    axis([37.5 39 0 50]);
    xlabel('x [m]');
    ylabel('y [m]');
    grid on;

elseif tractor1==1
    set(S.semitrailer_panel,'Visible','On');
    set(S.truck_panel,'Visible','On');

    %Maximum of Difference 
    idx_primemover1=find(primemover_y1>=10);
    idx_semitrailer1=find(semitrailer_y1>=10);
    idx_primemover=idx_primemover1(1):length(primemover_y1)-1;
    idx_semitrailer=idx_semitrailer1(1):length(semitrailer_y1)-1;
    primemover_x=primemover_x1(idx_primemover);
    primemover_y=primemover_y1(idx_primemover);
    semitrailer_x=semitrailer_x1(idx_semitrailer);
    semitrailer_y=semitrailer_y1(idx_semitrailer);
    MoD=0;

    for i=1:length(primemover_x) 
       for k=1:length(semitrailer_x)
           if (abs(primemover_y(i)-semitrailer_y(k))<0.01) && (abs(primemover_x(i)-semitrailer_x(k))>MoD) && (primemover_x(i)<semitrailer_x(k)) 
               MoD=abs(primemover_x(i)-semitrailer_x(k)); 
           end
       end
    end

    %Difference of Maxima
    DoM=abs(max(primemover_x1)-max(semitrailer_x1));

    MoD=(round(MoD*100))/100;
    set(S.MoD_edit, 'string', num2str(MoD));
    DoM=(round(DoM*100))/100;
    set(S.DoM_edit, 'string', num2str(DoM));

    %Position of the LZV
    S.axes4 = axes('Parent',S.PBs.tab,'units','normalized','position',[.35 .05 .2 .35]);
    plot(S.axes4, outsidewheel_x1,outsidewheel_y1,'-.b',primemover_x1,primemover_y1,'--c',semitrailer_x1,semitrailer_y1,'-.m','LineWidth',1.5);
    legend('outsidewheel','primemover','semitrailer');
    title('LZV Position - Frontal Swing (Semitrailer)');
    axis([37.5 39 0 50]);
    xlabel('x [m]');
    ylabel('y [m]');
    grid on;

    %maxwidth 
    maxwidth=abs(max(outermost_path_x2)-max(innermost_path_x2));
    maxwidth=(round(maxwidth*100))/100;
    set(S.width2_edit, 'string', num2str(maxwidth));

    %Position of the LZV
    S.axes3 = axes('Parent',S.PBs.tab,'units','normalized','position',[.1 .05 .2 .35]);
    plot(S.axes3, outermost_path_x2,outermost_path_y2,'b',innermost_path_x2,innermost_path_y2,'b--','LineWidth',1.5);
    legend('Outermost Path','Innermost Path');
    title('LZV Position - Frontal Swing (Truck)');
    axis([37.5 39 0 50]);
    xlabel('x [m]');
    ylabel('y [m]');
    grid on;
end

%maxwidth 
%overshootdist
Q1=[tail_x1(1) ;tail_y1(1)];
Q2=[tail_x1(20) ;tail_y1(20)];
coeffdir=(Q2(2)-Q1(2))/(Q2(1)-Q1(1));
a=-100:0.01:100;
b=a.*coeffdir;
a=tail_x1(20)+a;
b=tail_y1(20)+b;

n=1;
maxwidth1=0;
for i=1:length(tail_x1)
    P=[tail_x1(n) ; tail_y1(n)];
    d= norm(abs(det([Q2-Q1,P-Q1]))/abs(Q2-Q1));
    n=n+1;
    d1= det([Q2-Q1,P-Q1])/(Q2-Q1);
    if d1(1)<=0
        if d>maxwidth1
            maxwidth1=d;
        end
    end
end

maxwidth1=(round(maxwidth1*100))/100;
set(S.width3_edit, 'string', num2str(maxwidth1));

%Position of the LZV
S.axes5 = axes('Parent',S.PBs.tab,'units','normalized','position',[.6 0.45 .3 .15]);
plot(S.axes5, tail_x1,tail_y1,'b','LineWidth',1.5);
hold on
plot(a,b,'k','LineWidth',1.5);
legend('Tail path','Tangent to entry path');
title('LZV Position - Tail Swing');
axis([0 30 -2.5 -0.5]);
xlabel('x [m]');
ylabel('y [m]');
grid on;
friction1=(round(friction1*10))/10;
set(S.friction_edit, 'string', num2str(friction1)); 

% Open the VRML visualization
if results == 1
    vr_world = vrworld(['simresults/Turn90R8/LZV_custom/',turn90r8_results,'/',turn90r8_wrl]);
else
    vr_world = vrworld(['simresults/Turn90R8/LZV_custom/',Truckname,'/',Truckname,'_turn90r8.wrl']);   
end

open(vr_world);
vr.canvas(vr_world,'Parent', S.visual_turn90r8_panel,'Units','Normalized',...
          'Position',[0 0 1 0.9],'Viewpoint','Side view','NavZones','On');  
      
viewpoint_turn90r8 = 2;  

function run_turn90r8_visualization_callback(source, eventdata)
global S turn90r8_results turn90r8_filename results
global turn90r8_sim turn90r8_wrl Truckname

% Press the toggle button
set(S.turn90r8_stop_vis_push, 'Value',0);

% Update the VR Sink block
if results == 1
    vrmodelname  = ['simresults/Turn90R8/LZV_custom/',turn90r8_results,'/',turn90r8_sim];
    load_system(vrmodelname)    
    [~,name,~] = fileparts(turn90r8_sim);
    h_vrsink = [name,'/VR sink'];
else
    vrmodelname = ['simresults/Turn90R8/LZV_custom/',Truckname,'/',Truckname,'_anim_turn90r8.slx'];  
    load_system(vrmodelname)
    h_vrsink=find_system('referenceblock','vrlib/VR Sink');
    h_vrsink=char(h_vrsink(1));
end
x = get_param(h_vrsink, 'FieldsWritten');
if results == 1
    set_param(h_vrsink, 'WorldFileName', turn90r8_wrl);
else
    set_param(h_vrsink, 'WorldFileName', [Truckname,'_turn90R8.wrl']);
end

set_param(h_vrsink, 'FieldsWritten', x);
save_system(vrmodelname)

if isempty(turn90r8_results) == 0
    dirName = ['simresults\Turn90R8\LZV_custom\',turn90r8_results];
    files = dir( fullfile(dirName,'*.mat') );
    filename = files.name;
    load(filename,'VR','s','dt');else
    load(['simresults/Turn90R8/LZV_custom/',Truckname,'/',turn90r8_filename])
end       
assignin('base','VR',VR);
assignin('base','s',s);
assignin('base','dt',dt);

% Start simulation
sim(vrmodelname)

% Set the toggle buttons to the right value when simulation is done
set(S.turn90r8_stop_vis_push, 'Value',1);
set(S.turn90r8_run_vis_push, 'Value',0);

function stop_turn90r8_visualization_callback(source,eventdata)
global S
set_param(bdroot, 'SimulationCommand', 'stop')
set(S.turn90r8_stop_vis_push, 'Value',1);
set(S.turn90r8_run_vis_push, 'Value',0);

function turn90r8_speed_callback(source,eventdata)
global S results turn90r8_results Truckname turn90r8_sim

if results == 1
    vrmodelname  = ['simresults/Turn90R8/LZV_custom/',turn90r8_results,'/',turn90r8_sim];
    load_system(vrmodelname)    
    [~,name,~] = fileparts(turn90r8_sim);
    h_vrsink = [name,'/VR sink'];
else
    vrmodelname = ['simresults/Turn90R8/LZV_custom/',Truckname,'/',Truckname,'_anim_turn90r8.slx'];  
    load_system(vrmodelname)
    h_vrsink=find_system('referenceblock','vrlib/VR Sink');
    h_vrsink=char(h_vrsink(1));
end

if get(S.turn90r8_speed_popup,'Value') == 1
    set_param(h_vrsink, 'SampleTime','0.05')
elseif get(S.turn90r8_speed_popup,'Value') == 2
    set_param(h_vrsink, 'SampleTime','0.1')
elseif get(S.turn90r8_speed_popup,'Value') == 3
    set_param(h_vrsink, 'SampleTime','0.5')
end

function turn90r8_view_callback(source,eventdata)
global S results turn90r8_results turn90r8_wrl Truckname viewpoint_turn90r8

if results == 1
    vr_world = vrworld(['simresults/Turn90R8/LZV_custom/',turn90r8_results,'/',turn90r8_wrl]);
else
    vr_world = vrworld(['simresults/Turn90R8/LZV_custom/',Truckname,'/',Truckname,'_turn90r8.wrl']);   
end
open(vr_world);
vr.canvas(vr_world,'Parent', S.visual_turn90r8_panel,'Units','Normalized',...
          'Position',[0 0 1 0.9],'Viewpoint','Side view','NavZones','On');  
      
if get(S.turn90r8_view_popup,'Value') == 1
    viewpoint_turn90r8 = 1;
    if get(S.turn90r8_nav_popup,'Value') == 1
        vr.canvas(vr_world,'Parent', S.visual_turn90r8_panel,'Units','Normalized',...
        'Position',[0 0 1 0.9],'Viewpoint','Top view (moving)','NavZones','On');
    else
        vr.canvas(vr_world,'Parent', S.visual_turn90r8_panel,'Units','Normalized',...
        'Position',[0 0 1 0.9],'Viewpoint','Top view (moving)','NavZones','Off');
    end
elseif get(S.turn90r8_view_popup,'Value') == 2
    viewpoint_turn90r8 = 2;
    if get(S.turn90r8_nav_popup,'Value') == 1    
        vr.canvas(vr_world,'Parent', S.visual_turn90r8_panel,'Units','Normalized',...
        'Position',[0 0 1 0.9],'Viewpoint','Side view','NavZones','On');
    else
        vr.canvas(vr_world,'Parent', S.visual_turn90r8_panel,'Units','Normalized',...
        'Position',[0 0 1 0.9],'Viewpoint','Side view','NavZones','Off');        
    end
elseif get(S.turn90r8_view_popup,'Value') == 3
    viewpoint_turn90r8 = 3;
    if get(S.turn90r8_nav_popup,'Value') == 1
        vr.canvas(vr_world,'Parent', S.visual_turn90r8_panel,'Units','Normalized',...
              'Position',[0 0 1 0.9],'Viewpoint','Rear view (moving)','NavZones','On');
    else
        vr.canvas(vr_world,'Parent', S.visual_turn90r8_panel,'Units','Normalized',...
        'Position',[0 0 1 0.9],'Viewpoint','Rear view (moving)','NavZones','Off');        
    end
elseif get(S.turn90r8_view_popup,'Value') == 4
    viewpoint_turn90r8 = 4;
    if get(S.turn90r8_nav_popup,'Value') == 1
        vr.canvas(vr_world,'Parent', S.visual_turn90r8_panel,'Units','Normalized',...
        'Position',[0 0 1 0.9],'Viewpoint','Front view (moving)','NavZones','On');
    else
        vr.canvas(vr_world,'Parent', S.visual_turn90r8_panel,'Units','Normalized',...
        'Position',[0 0 1 0.9],'Viewpoint','Front view (moving)','NavZones','Off');        
    end
elseif get(S.turn90r8_view_popup,'Value') == 5
    viewpoint_turn90r8 = 5;
    if get(S.turn90r8_nav_popup,'Value') == 1
        vr.canvas(vr_world,'Parent', S.visual_turn90r8_panel,'Units','Normalized',...
        'Position',[0 0 1 0.9],'Viewpoint','Top rotating view','NavZones','On');
    else
        vr.canvas(vr_world,'Parent', S.visual_turn90r8_panel,'Units','Normalized',...
        'Position',[0 0 1 0.9],'Viewpoint','Top rotating view','NavZones','Off');        
    end
end

function turn90r8_nav_callback(source,eventdata)
global S results turn90r8_wrl Truckname turn90r8_results viewpoint_turn90r8

% Open the VRML visualization
if results == 1
    vr_world = vrworld(['simresults/Turn90R8/LZV_custom/',turn90r8_results,'/',turn90r8_wrl]);
else
    vr_world = vrworld(['simresults/Turn90R8/LZV_custom/',Truckname,'/',Truckname,'_turn90r8.wrl']);   
end
open(vr_world);
vr.canvas(vr_world,'Parent', S.visual_turn90r8_panel,'Units','Normalized',...
          'Position',[0 0 1 0.9],'Viewpoint','Side view','NavZones','On'); 
      
if get(S.turn90r8_nav_popup,'Value') == 1
    if viewpoint_turn90r8 == 1
    vr.canvas(vr_world,'Parent', S.visual_turn90r8_panel,'Units','Normalized',...
              'Position',[0 0 1 0.9],'Viewpoint', 'Top view (moving)','NavZones','On');        
    elseif viewpoint_turn90r8 == 2
    vr.canvas(vr_world,'Parent', S.visual_turn90r8_panel,'Units','Normalized',...
              'Position',[0 0 1 0.9],'Viewpoint', 'Side view','NavZones','On');
    elseif viewpoint_turn90r8 == 3
    vr.canvas(vr_world,'Parent', S.visual_turn90r8_panel,'Units','Normalized',...
              'Position',[0 0 1 0.9],'Viewpoint', 'Rear view (moving)','NavZones','On');
    elseif viewpoint_turn90r8 == 4
    vr.canvas(vr_world,'Parent', S.visual_turn90r8_panel,'Units','Normalized',...
              'Position',[0 0 1 0.9],'Viewpoint', 'Front view (moving)','NavZones','On');
    elseif viewpoint_turn90r8 == 5
    vr.canvas(vr_world,'Parent', S.visual_turn90r8_panel,'Units','Normalized',...
              'Position',[0 0 1 0.9],'Viewpoint', 'Top rotating view','NavZones','On');
    end
    
elseif get(S.turn90r8_nav_popup,'Value') == 2
    if viewpoint_turn90r8 == 1
    vr.canvas(vr_world,'Parent', S.visual_turn90r8_panel,'Units','Normalized',...
              'Position',[0 0 1 0.9],'Viewpoint', 'Top view (moving)','NavZones','Off');        
    elseif viewpoint_turn90r8 == 2
    vr.canvas(vr_world,'Parent', S.visual_turn90r8_panel,'Units','Normalized',...
              'Position',[0 0 1 0.9],'Viewpoint', 'Side view','NavZones','Off');
    elseif viewpoint_turn90r8 == 3
    vr.canvas(vr_world,'Parent', S.visual_turn90r8_panel,'Units','Normalized',...
              'Position',[0 0 1 0.9],'Viewpoint', 'Rear view (moving)','NavZones','Off');
    elseif viewpoint_turn90r8 == 4
    vr.canvas(vr_world,'Parent', S.visual_turn90r8_panel,'Units','Normalized',...
              'Position',[0 0 1 0.9],'Viewpoint', 'Front view (moving)','NavZones','Off');
    elseif viewpoint_turn90r8 == 5
    vr.canvas(vr_world,'Parent', S.visual_turn90r8_panel,'Units','Normalized',...
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