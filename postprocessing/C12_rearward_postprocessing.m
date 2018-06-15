function C12_rearward_postprocessing

global Truckname p axle_tractor axle_trailer axle_dolly NumberOfRows S results rearward_results rearward_filename lateralacc Excelsave ExcelFileName
global line1 line2 line3 line4 line5 viewpoint_rearward rearward_wrl

javaaddpath(which('MatlabGarbageCollector.jar'));
org.dt.matlab.utilities.JavaMemoryCleaner.clear(1);
clc;

%% Rearward tab lay-out

set(S.tab17,'Parent', S.tgroup);

S.tgroup_rearwardampli = uitabgroup('Parent',S.tab17, 'tablocation', 'right');
S.PBS_tab = uitab('Parent', S.tgroup_rearwardampli, 'backgroundcolor','w', 'Title','PBS Data');
S.rearward_visual_tab = uitab('Parent', S.tgroup_rearwardampli, 'backgroundcolor','w', 'Title','Visulaization');

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
                      
S.Rearward_title = uicontrol('Parent',              S.PBS_tab,...
                             'Style',               'text',...
                             'String',              'Rearward amplification',...
                             'Backgroundcolor',     'w',...
                             'FontSize',            12,...
                             'FontUnits','Normalized',...
                             'FontWeight',          'bold',...
                             'Units',               'Normalized',...
                             'Position',            [0.3 0.9 0.4 0.05]);

S.panel = uipanel('Parent',             S.PBS_tab,...
                  'Units',              'Centimeters',...
                  'Position',           [2 10 9 5],...    
                  'backgroundcolor',    'w',...
                  'Title',              'Performance Levels',...
                  'Units',              'Normalized',...
                  'FontWeight',         'bold',...
                  'FontSize',           12,...
                  'FontUnits','Normalized',...
                  'BorderWidth',        2,...
                  'BorderType',         'Line',...
                  'highlightcolor',     'k');

S.latacc_edit = uicontrol('Parent',             S.panel,...
                          'Style',              'edit', ...
                          'Backgroundcolor',    'w',...
                          'FontSize',           8,...
                          'FontUnits','Normalized',...
                          'enable',             'off',...
                          'Units',              'Normalized',...
                          'Position',           [0.1 0.7 0.2 0.1]);                           

S.latacc_text = uicontrol('Parent',             S.panel,...
                          'Style',              'text',...
                          'String',             'Lateral Acceleration (m/s2)', ...
                          'FontSize',           6,...
                          'FontUnits','Normalized',...
                          'backgroundcolor',    'w',...
                          'Units',              'Normalized',...
                          'Position',           [0.05 0.825 0.35 0.15]);  

S.level_edit = uicontrol('Parent',              S.panel,...
                         'Style',               'edit', ...
                         'Backgroundcolor',     'w',...
                         'FontSize',            8,...
                         'FontUnits','Normalized',...
                         'enable',              'off',...
                         'Units',               'Normalized',...
                         'Position',            [0.1 0.1 0.2 0.1]);                           

S.level_text = uicontrol('Parent',          S.panel,...
                         'Style',           'text',...
                         'String',          'Level', ...
                         'FontSize',        12,...
                         'FontUnits','Normalized',...
                         'backgroundcolor', 'w',...
                         'Units',           'Normalized',...
                         'Position',        [.1 .225 .2 .075]);

S.lataccg_edit = uicontrol('Parent',            S.panel,...
                           'Style',             'edit', ...
                           'Backgroundcolor',   'w',...
                           'FontSize',          8,...
                           'FontUnits','Normalized',...
                           'enable',            'off',...
                           'Units',             'Normalized',...
                           'Position',          [0.1 0.4 0.2 0.1]);                           

S.lataccg_text = uicontrol('Parent',            S.panel,...
                           'Style',             'text',...
                           'String',            '/g', ...
                           'FontSize',          8,...
                           'FontUnits','Normalized',...
                           'backgroundcolor',   'w',...
                           'Units',             'Normalized',...
                           'Position',          [0.325 0.4 0.1 0.1]);

S.rearampli_edit = uicontrol('Parent',              S.panel,...
                             'Style',               'edit', ...
                             'Backgroundcolor',     'w',...
                             'FontSize',            8,...
                             'FontUnits','Normalized',...
                             'enable',              'off',...
                             'Units',               'Normalized',...
                             'Position',            [0.6 0.7 0.2 0.1]);                           

S.rearampli_text = uicontrol('Parent',          S.panel,...
                             'Style',           'text',...
                             'String',          'Reardward Amplification', ...
                             'FontSize',        6,...
                             'FontUnits','Normalized',...
                             'backgroundcolor', 'w',...
                             'Units',           'Normalized',...
                             'Position',        [.5 .825 .4 .15]);

S.panel2 = uipanel('Parent',            S.panel,...
                   'Units',             'Centimeters',...
                   'Position',          [5 0.1 3 2.5],...    
                   'backgroundcolor',   'w',...
                   'Title',             'Procedure Validity',...
                   'Units',             'Normalized',...
                   'FontWeight',        'bold',...
                   'FontSize',          8,...
                   'FontUnits',         'Normalized',...
                   'BorderWidth',       2,...
                   'BorderType',        'Line',...
                   'highlightcolor',    'k');

 S.maxlatacc_edit = uicontrol('Parent',             S.panel2,...
                              'Style',              'edit', ...
                              'Backgroundcolor',    'w',...
                              'FontSize',           8,...
                              'FontUnits','Normalized',...
                              'enable',             'off',...
                              'Units',              'Normalized',...
                              'Position',           [0.3 0.35 0.3 0.2]);                           

S.maxlataccg_text = uicontrol('Parent',             S.panel2,...
                              'Style',              'text',...
                              'String',             'Maximum Lateral Acceleration (/g)', ...
                              'FontSize',           6,...
                              'FontUnits','Normalized',...
                              'backgroundcolor',    'w',...
                              'Units',              'Normalized',...
                              'Position',           [.1 .7 .8 .3]);

S.maxlatacc_checkbox = uicontrol('Parent',              S.panel2,...
                                 'Style',               'checkbox',...
                                 'backgroundcolor',     'w',...
                                 'Enable',              'off',...
                                 'Units',               'Normalized',...
                                 'Position',            [.7, .4 .1 .1]);                         

S.panel3 = uipanel('Parent',            S.PBS_tab,...
                   'Units',             'Centimeters',...
                   'Position',          [12 11 6 4],...    
                   'backgroundcolor',   'w',...
                   'Title',             'DLRT',...
                   'Units',             'Normalized',...
                   'FontWeight',        'bold',...
                   'FontSize',          12,...
                   'FontUnits','Normalized',...
                   'BorderWidth',       2,...
                   'BorderType',        'Line',...
                   'highlightcolor',    'k');

S.static_text1 = uicontrol('Parent',            S.panel3,...
                           'Style',             'Text',...
                           'backgroundcolor',   'w',...
                           'Units',             'Normalized',...
                           'Position',          [.25 .8 .5 .1],...
                           'String',            'Static text',...
                           'FontSize',          6.5,...
                       'FontUnits','Normalized');
                       
S.static_text2 = uicontrol('Parent',            S.panel3,...
                           'Style',             'Text',...
                           'backgroundcolor',   'w',...
                           'Units',             'Normalized',...
                           'Position',          [.25 .6 .5 .1],...
                           'String',            'Static text',...
                           'FontSize',          6.5,...
                           'FontUnits','Normalized');
                       
 S.static_text3 = uicontrol('Parent',           S.panel3,...
                            'Style',            'Text',...
                            'backgroundcolor',  'w',...
                            'Units',            'Normalized',...
                            'Position',         [.25 .4 .5 .1],...
                            'String',           'Static text',...
                            'FontSize',         6.5,...
                            'FontUnits','Normalized');
                        
 S.static_text4 = uicontrol('Parent',           S.panel3,...
                            'Style',            'Text',...
                            'backgroundcolor',  'w',...
                            'Units',            'Normalized',...
                            'Position',         [.25 .3 .5 .1],...
                            'String',           'Static text',...
                            'FontSize',         6.5,...
                            'FontUnits','Normalized');
                        
S.static_text5 = uicontrol('Parent',            S.panel3,...
                           'Style',             'Text',...
                           'backgroundcolor',   'w',...
                           'Units',             'Normalized',...
                           'Position',          [.25 .0 .5 .1],...
                           'String',            'Static text',...
                           'FontSize',          6.5,...
                           'FontUnits','Normalized');

%% Visualization panel                       
S.visual_rearward_panel = uipanel('Parent',             S.rearward_visual_tab,...
                         'Units',              'normalized',...
                         'Position',           [0 0 1 1],...
                         'BackgroundColor',    'w');                  

S.rearward_nav_text =      uicontrol('Parent',           S.visual_rearward_panel,...
                                      'Style',            'text',...
                                      'backgroundColor',  'w',...
                                      'Units',            'Normalized',...
                                      'FontWeight',       'bold',...
                                      'String',           'Navigation zones',...
                                      'FontSize',         10,...
                                      'FontUnits',        'Normalized',...
                                      'Position',         [0.55 0.95 0.1 0.05]);  
                                  
S.rearward_nav_popup =       uicontrol('Parent',           S.visual_rearward_panel,...
                                        'Style',            'popup',...
                                        'backgroundColor',  'w',...
                                        'Units',            'Normalized',...
                                        'FontWeight',       'bold',...
                                        'String',           {'On','Off'},...
                                        'FontSize',         10,...
                                        'FontUnits',        'Normalized',...
                                        'Position',         [0.55 0.9 0.1 0.05],...
                                        'Callback',         @rearward_nav_callback); 
                                    
S.rearward_view_text =       uicontrol('Parent',           S.visual_rearward_panel,...
                                        'Style',            'text',...
                                        'backgroundColor',  'w',...
                                        'Units',            'Normalized',...
                                        'FontWeight',       'bold',...
                                        'FontSize',         10,...
                                        'String',           'Viewpoint',...
                                        'FontUnits',        'Normalized',...
                                        'Position',         [0.24 0.95 0.1 0.05]);
                                    
S.rearward_view_popup =       uicontrol('Parent',           S.visual_rearward_panel,...
                                         'Style',            'popup',...
                                         'backgroundColor',  'w',...
                                         'Units',            'Normalized',...
                                         'FontWeight',       'bold',...
                                         'FontSize',         10,...
                                         'String',           {'Top view','Side view','Rear view','Front view','Top rotating view'},...
                                         'FontUnits',        'Normalized',...
                                         'Value',            2,...
                                         'Position',         [0.25 0.9 0.1 0.05],...
                                         'Callback',         @rearward_view_callback); 


S.rearward_run_vis_push =    uicontrol('Parent',           S.visual_rearward_panel,...
                                        'Style',            'toggle',...
                                        'backgroundColor',  'w',...
                                        'ForegroundColor',  'b',...
                                        'Units',            'Normalized',...
                                        'FontWeight',       'bold',...
                                        'FontSize',         10,...
                                        'FontUnits',        'Normalized',...
                                        'Value',            0,...
                                        'Position',         [0.7 0.9 0.05 0.05],...
                                        'Callback',         @run_rearward_visualization_callback); 
                                    
S.rearward_stop_vis_push =   uicontrol('Parent',           S.visual_rearward_panel,...
                                        'Style',            'toggle',...
                                        'backgroundColor',  'w',...
                                        'ForegroundColor',  'b',...
                                        'Units',            'Normalized',...
                                        'FontWeight',       'bold',...
                                        'FontSize',         10,...
                                        'FontUnits',        'Normalized',...
                                        'Value',            1,...
                                        'Position',         [0.75 0.9 0.05 0.05],...
                                        'Callback',         @stop_rearward_visualization_callback); 

S.rearward_speed_string =    uicontrol('Parent',           S.visual_rearward_panel,...
                                        'Style',            'text',...
                                        'backgroundColor',  'w',...
                                        'Units',            'Normalized',...
                                        'FontWeight',       'bold',...
                                        'String',           'Simulation speed',...
                                        'FontSize',         10,...
                                        'FontUnits',        'Normalized',...
                                        'Value',            0,...
                                        'Position',         [0.35 0.95 0.2 0.05]);
                                    
S.rearward_speed_popup =     uicontrol('Parent',           S.visual_rearward_panel,...
                                        'Style',            'popup',...
                                        'backgroundColor',  'w',...
                                        'Units',            'Normalized',...
                                        'FontWeight',       'bold',...
                                        'String',           {'Low','Normal','High'},...
                                        'FontSize',         10,...
                                        'Value',            2,...
                                        'FontUnits',        'Normalized',...
                                        'Position',         [0.375 0.9 0.1 0.05],...
                                        'Callback',         @rearward_speed_callback); 
                                     
[a,~]=imread('play.jpg');
[r,e,~]=size(a); 
x=ceil(r/30); 
y=ceil(e/30); 
g=a(1:x:end,1:y:end,:);
g(g==255)=5.5*255;
set(S.rearward_run_vis_push,'CData',g);

[a,~]=imread('stop.jpg');
[r,e,~]=size(a); 
x=ceil(r/30); 
y=ceil(e/30); 
g=a(1:x:end,1:y:end,:);
g(g==255)=5.5*255;
set(S.rearward_stop_vis_push,'CData',g);

S.back_button = uicontrol('parent', S.visual_rearward_panel,...
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
    dirName = ['simresults\C12_RearwardAmpli\LZV_custom\',rearward_results];
    files = dir( fullfile(dirName,'*.mat') );
    filename = files.name;
    load(filename)
else
    load(['simresults/C12_RearwardAmpli/LZV_custom/',Truckname,'/',rearward_filename])
end
DLTRvar=3;
idxDLTR=find(s.time>4);
steer=s.inputs.delta*180/pi;
steer=steer(idxDLTR);
positionamplix=s.steeraxle.pos(idxDLTR,1);
positionampliy=s.steeraxle.pos(idxDLTR,2);
tempsampli=s.time(idxDLTR);
vitesseampli=s.Vx(idxDLTR);

firstaxleampli_acc=s.steeraxle1.acc(idxDLTR,2);
lastaxleampli_acc=eval(strcat('s.trailer',num2str(p-1),'axle',num2str(axle_trailer(p-1)),'.acc(idxDLTR,2)'));

%%% Calculation of Lateral Acceleration %%%
idx=find(s.time<1);
rrcu=1;
for n=1:1:p-1
    if axle_dolly(n)~=0             %doll
        rrcu=n;          
    elseif trailer_code(n)==5       %Trailer
        rrcu=n;
    elseif trailer_code(n)==6       %Drawbar trailer
        rrcu=n;
    end
end

if tractor_code==1
    acc_haulingunit=s.chassis.acc(idxDLTR,2);
    cgz_haulingunit=zcg(1);
elseif tractor_code>=2
    acc_haulingunit=s.truckload.acc(idxDLTR,2);
    cgz_haulingunit=zcg(1);
end

A = 0;
B = acc_haulingunit-acc_haulingunit;


for n=rrcu:1:p-1
    if axle_dolly(n)~=0
        mass_dolly=sprung_mass_dolly(n)/9.807;
        cgz_dolly=0.9;
        acc_dolly=eval(strcat('s.dolly',num2str(n),'axle1.acc(idxDLTR,2)'));
        A3=mass_dolly*cgz_dolly;
        B3=A3*acc_dolly;
        A=A+A3;
        B=B+B3;
    end   
    mass_trailer=sprung_mass(n+1)/9.807;
    cgz_trailer=zcg(n+1);
    acc_trailer=eval(strcat('s.trailer',num2str(n),'load.acc(idxDLTR,2)'));
    A2=mass_trailer.*cgz_trailer;
    B2=A2*acc_trailer;
      A=A+A2;
      B=B+B2;
end

AY_rcu=max(B./A);
AY=max(abs(firstaxleampli_acc));
RearwardAmpli=AY_rcu/AY;

%%% Calculation of Dynamic Load Transfer Ratio (DLTR) %%%
if axle_tractor(1)==2
    DLTRrear(:,1)=(s.tyre.tractorFz(:,1)-s.tyre.tractorFz(:,2)+s.tyre.tractorFz(:,3)+s.tyre.tractorFz(:,4)-s.tyre.tractorFz(:,5)-s.tyre.tractorFz(:,6))...
           ./(s.tyre.tractorFz(:,1)+s.tyre.tractorFz(:,2)+s.tyre.tractorFz(:,3)+s.tyre.tractorFz(:,4)+s.tyre.tractorFz(:,5)+s.tyre.tractorFz(:,6));

elseif axle_tractor(1)==3
    DLTRrear(:,1)=(s.tyre.tractorFz(:,1)-s.tyre.tractorFz(:,2)+s.tyre.tractorFz(:,3)+s.tyre.tractorFz(:,4)-s.tyre.tractorFz(:,5)-s.tyre.tractorFz(:,6)+s.tyre.tractorFz(:,7)+s.tyre.tractorFz(:,8)-s.tyre.tractorFz(:,9)-s.tyre.tractorFz(:,10))...
        ./(s.tyre.tractorFz(:,1)+s.tyre.tractorFz(:,2)+s.tyre.tractorFz(:,3)+s.tyre.tractorFz(:,4)+s.tyre.tractorFz(:,5)+s.tyre.tractorFz(:,6)+s.tyre.tractorFz(:,7)+s.tyre.tractorFz(:,8)+s.tyre.tractorFz(:,9)+s.tyre.tractorFz(:,10));
elseif axle_tractor(1)==4
    DLTRrear(:,1)=(s.tyre.tractorFz(:,1)-s.tyre.tractorFz(:,2)+s.tyre.tractorFz(:,3)-s.tyre.tractorFz(:,4)+s.tyre.tractorFz(:,5)+s.tyre.tractorFz(:,6)-s.tyre.tractorFz(:,7)-s.tyre.tractorFz(:,8)+s.tyre.tractorFz(:,9)+s.tyre.tractorFz(:,10)-s.tyre.tractorFz(:,11)-s.tyre.tractorFz(:,12))...
           ./(s.tyre.tractorFz(:,1)+s.tyre.tractorFz(:,2)+s.tyre.tractorFz(:,3)+s.tyre.tractorFz(:,4)+s.tyre.tractorFz(:,5)+s.tyre.tractorFz(:,6)+s.tyre.tractorFz(:,7)+s.tyre.tractorFz(:,8)+s.tyre.tractorFz(:,9)+s.tyre.tractorFz(:,10)+s.tyre.tractorFz(:,11)+s.tyre.tractorFz(:,12));
end

for n=1:1:p-1
    if axle_trailer(n)==1
        DLTRrear(:,n+1)=(eval(['s.tyre.trailer',num2str(n),'Fz(:,1)'])-eval(['s.tyre.trailer',num2str(n),'Fz(:,2)']))...
            ./(eval(['s.tyre.trailer',num2str(n),'Fz(:,1)'])+eval(['s.tyre.trailer',num2str(n),'Fz(:,2)']));
    elseif axle_trailer(n)==2
        DLTRrear(:,n+1)=(eval(['s.tyre.trailer',num2str(n),'Fz(:,1)'])-eval(['s.tyre.trailer',num2str(n),'Fz(:,2)'])+eval(['s.tyre.trailer',num2str(n),'Fz(:,3)'])-eval(['s.tyre.trailer',num2str(n),'Fz(:,4)']))...
            ./(eval(['s.tyre.trailer',num2str(n),'Fz(:,1)'])+eval(['s.tyre.trailer',num2str(n),'Fz(:,2)'])+eval(['s.tyre.trailer',num2str(n),'Fz(:,3)'])+eval(['s.tyre.trailer',num2str(n),'Fz(:,4)']));
    elseif axle_trailer(n)==3
        DLTRrear(:,n+1)=(eval(['s.tyre.trailer',num2str(n),'Fz(:,1)'])-eval(['s.tyre.trailer',num2str(n),'Fz(:,2)'])+eval(['s.tyre.trailer',num2str(n),'Fz(:,3)'])-eval(['s.tyre.trailer',num2str(n),'Fz(:,4)'])+eval(['s.tyre.trailer',num2str(n),'Fz(:,5)'])-eval(['s.tyre.trailer',num2str(n),'Fz(:,6)']))...
            ./(eval(['s.tyre.trailer',num2str(n),'Fz(:,1)'])+eval(['s.tyre.trailer',num2str(n),'Fz(:,2)'])+eval(['s.tyre.trailer',num2str(n),'Fz(:,3)'])+eval(['s.tyre.trailer',num2str(n),'Fz(:,4)'])+eval(['s.tyre.trailer',num2str(n),'Fz(:,5)'])+eval(['s.tyre.trailer',num2str(n),'Fz(:,6)']));
    elseif axle_trailer(n)==4
        DLTRrear(:,n+1)=(eval(['s.tyre.trailer',num2str(n),'Fz(:,1)'])-eval(['s.tyre.trailer',num2str(n),'Fz(:,2)'])+eval(['s.tyre.trailer',num2str(n),'Fz(:,3)'])-eval(['s.tyre.trailer',num2str(n),'Fz(:,4)'])+eval(['s.tyre.trailer',num2str(n),'Fz(:,5)'])-eval(['s.tyre.trailer',num2str(n),'Fz(:,6)'])+eval(['s.tyre.trailer',num2str(n),'Fz(:,7)'])-eval(['s.tyre.trailer',num2str(n),'Fz(:,8)']))...
            ./(eval(['s.tyre.trailer',num2str(n),'Fz(:,1)'])+eval(['s.tyre.trailer',num2str(n),'Fz(:,2)'])+eval(['s.tyre.trailer',num2str(n),'Fz(:,3)'])+eval(['s.tyre.trailer',num2str(n),'Fz(:,4)'])+eval(['s.tyre.trailer',num2str(n),'Fz(:,5)'])+eval(['s.tyre.trailer',num2str(n),'Fz(:,6)'])+eval(['s.tyre.trailer',num2str(n),'Fz(:,7)'])+eval(['s.tyre.trailer',num2str(n),'Fz(:,8)']));
    elseif axle_trailer(n)==5
        DLTRrear(:,n+1)=(eval(['s.tyre.trailer',num2str(n),'Fz(:,1)'])-eval(['s.tyre.trailer',num2str(n),'Fz(:,2)'])+eval(['s.tyre.trailer',num2str(n),'Fz(:,3)'])-eval(['s.tyre.trailer',num2str(n),'Fz(:,4)'])+eval(['s.tyre.trailer',num2str(n),'Fz(:,5)'])-eval(['s.tyre.trailer',num2str(n),'Fz(:,6)'])+eval(['s.tyre.trailer',num2str(n),'Fz(:,7)'])-eval(['s.tyre.trailer',num2str(n),'Fz(:,8)'])+eval(['s.tyre.trailer',num2str(n),'Fz(:,9)'])-eval(['s.tyre.trailer',num2str(n),'Fz(:,10)']))...
            ./(eval(['s.tyre.trailer',num2str(n),'Fz(:,1)'])+eval(['s.tyre.trailer',num2str(n),'Fz(:,2)'])+eval(['s.tyre.trailer',num2str(n),'Fz(:,3)'])+eval(['s.tyre.trailer',num2str(n),'Fz(:,4)'])+eval(['s.tyre.trailer',num2str(n),'Fz(:,5)'])+eval(['s.tyre.trailer',num2str(n),'Fz(:,6)'])+eval(['s.tyre.trailer',num2str(n),'Fz(:,7)'])+eval(['s.tyre.trailer',num2str(n),'Fz(:,8)'])+eval(['s.tyre.trailer',num2str(n),'Fz(:,9)'])+eval(['s.tyre.trailer',num2str(n),'Fz(:,10)']));
    end
end

if p>=3
    DLTR1ampli=DLTRrear(:,1);
    DLTR2ampli=DLTRrear(:,p-1);
    DLTR3ampli=DLTRrear(:,p);
    DLTR1ampli=DLTR1ampli(idxDLTR);
    DLTR2ampli=DLTR2ampli(idxDLTR);
    DLTR3ampli=DLTR3ampli(idxDLTR);
    DLTRvar=3;
elseif p==2
    DLTR1ampli=DLTRrear(:,1);
    DLTR2ampli=DLTRrear(:,2);
    DLTR1ampli=DLTR1ampli(idxDLTR);
    DLTR2ampli=DLTR2ampli(idxDLTR);
    DLTRvar=2;
end

line1=['Dynamic Load Transfert Ratio : LZV_custom'];
line2=sprintf('-----------------------------------');

if p>=3
    DLTR1=max(abs(DLTR1ampli));
    DLTR2=max(abs(DLTR2ampli));
    DLTR3=max(abs(DLTR3ampli));
    line3=sprintf('Hauling Unit :  %6.3f ',DLTR1);
    line4=sprintf('Penultimate Trailing Unit :  %6.3f ',DLTR2);
    line5=sprintf('Last Trailing Unit :  %6.3f ',DLTR3);
elseif p==2
    DLTR1=max(abs(DLTR1ampli));
    DLTR2=max(abs(DLTR2ampli));
    line3=sprintf('Hauling Unit :  %6.3f ',DLTR1);
    line4=sprintf('Last Trailing Unit :  %6.3f ',DLTR2);
    line5=sprintf('');
end

set(S.static_text1,'String',line1)
set(S.static_text2,'String',line2)
set(S.static_text3,'String',line3)
set(S.static_text4,'String',line4)
set(S.static_text5,'String',line5)

f_coeff=friction_coeff;
%     set(S.frictioncoeff_edit, 'string', num2str(f_coeff));
%Level Performance
lateralacc=max(abs(B./A));
lateralacc=(round(lateralacc*1000))/1000;
set(S.latacc_edit, 'string', num2str(lateralacc));
lataccg=lateralacc/9.807;
lataccg=(round(lataccg*1000))/1000;
set(S.lataccg_edit, 'string', num2str(lataccg));

RearwardAmpli=(round(RearwardAmpli*1000))/1000;
set(S.rearampli_edit, 'string', num2str(RearwardAmpli));

if (RearwardAmpli/lataccg)<5.7
    set(S.level_edit, 'string', 'Yes');
    level = 'yes';
else
    set(S.level_edit, 'string', 'No');
    level = 'No';
end

%Procedure Validity 
maxlatacc=max(max(firstaxleampli_acc),max(lastaxleampli_acc));
maxlataccg=maxlatacc/9.807;
maxlataccg=(round(maxlataccg*1000))/1000;
set(S.maxlatacc_edit, 'string', num2str(maxlataccg));
if maxlataccg>0.15
    set(S.maxlatacc_checkbox, 'Value', 1);
else
    set(S.maxlatacc_checkbox, 'Value', 0);
end

%Position of the LZV
S.axes1 = axes('Parent',S.PBS_tab,'units','normalized','position',[.1 .05 .3 .15]);
plot(S.axes1, positionamplix,positionampliy,'b','LineWidth',1.5);
title('Position of the LZV');
xlabel('x [m]');
ylabel('y [m]');
grid on;

%Steer input
S.axes2 = axes('Parent',S.PBS_tab,'units','normalized','position',[.1 0.3 .3 .15]);
plot(S.axes2, tempsampli,steer,'LineWidth',1.5);
title('Steering wheel angle');
xlabel('t [s]');
ylabel('\delta [deg]');
grid on;

% Acceleration of the firstaxle
S.axes3 = axes('Parent',S.PBS_tab,'units','normalized','position',[.6 .5 .3 .3]);
plot(S.axes3, tempsampli,firstaxleampli_acc,'b-',tempsampli,lastaxleampli_acc,'k--','LineWidth',1.5);
title('Lateral accelerations of the first and last axle');
legend('first axle','last axle');
xlabel('t [s]');
ylabel('ay [m/s2]');
grid on;

% DLTR
S.axes4 = axes('Parent',S.PBS_tab,'units','normalized','position',[.6 .05 .3 .3]);
if DLTRvar==3
    plot(S.axes4, tempsampli,DLTR1ampli,tempsampli,DLTR2ampli,tempsampli,DLTR3ampli,'LineWidth',1.5);
    title('Dynamic load transfer ratio');
    xlabel('t [s]');
    ylabel('DLTR [-]')
    legend('hauling unit','penultimate trailing unit','last trailing unit');
    grid on;
elseif DLTRvar==2
    plot(S.axes4, tempsampli,DLTR1ampli,tempsampli,DLTR2ampli,'LineWidth',1.5);
    title('Dynamic load transfer ratio');
    xlabel('t [s]');
    ylabel('DLTR [-]')
    legend('hauling unit','trailing unit');
    grid on;
end  

% Safe data in Excel file
if Excelsave == 1
    A = exist('DLTR3');
    if A == 0
        DLTR3 = '';
    end
    A = {lateralacc,DLTR1,DLTR2,DLTR3,level};
    sheet = 1;
    x1Range = ['AD', num2str(NumberOfRows)];
    xlswrite(ExcelFileName,A,sheet,x1Range)
end 

% Open the VRML visualization
if results == 1
    vr_world = vrworld(['simresults/C12_RearwardAmpli/LZV_custom/',rearward_results,'/',rearward_wrl]);
else
    vr_world = vrworld(['simresults/C12_RearwardAmpli/LZV_custom/',Truckname,'/',Truckname,'_rearward.wrl']);   
end

open(vr_world);
vr.canvas(vr_world,'Parent', S.visual_rearward_panel,'Units','Normalized',...
          'Position',[0 0 1 0.9],'Viewpoint','Side view','NavZones','On');  
      
viewpoint_rearward = 2;  

function run_rearward_visualization_callback(source, eventdata)
global Truckname S rearward_results rearward_filename 
global rearward_sim rearward_wrl results

% Press the toggle button
set(S.rearward_stop_vis_push, 'Value',0);

% Update the VR Sink block
if results == 1
    vrmodelname  = ['simresults/C12_RearWardAmpli/LZV_custom/',rearward_results,'/',rearward_sim];
    load_system(vrmodelname)    
    [~,name,~] = fileparts(rearward_sim);
    h_vrsink = [name,'/VR sink'];
else
    vrmodelname = ['simresults/C12_RearWardAmpli/LZV_custom/',Truckname,'/',Truckname,'_anim_rearward.slx'];  
    load_system(vrmodelname)
    h_vrsink=find_system('referenceblock','vrlib/VR Sink');
    h_vrsink=char(h_vrsink(1));
end
x = get_param(h_vrsink, 'FieldsWritten');
if results == 1
    set_param(h_vrsink, 'WorldFileName', rearward_wrl);
else
    set_param(h_vrsink, 'WorldFileName', [Truckname,'_rearward.wrl']);
end
set_param(h_vrsink, 'FieldsWritten', x);
save_system(vrmodelname)

if isempty(rearward_results) == 0
    dirName = ['simresults\C12_RearWardAmpli\LZV_custom\',rearward_results];
    files = dir( fullfile(dirName,'*.mat') );
    filename = files.name;
    load(filename,'VR','s','dt');else
    load(['simresults/C12_RearWardAmpli/LZV_custom/',Truckname,'/',rearward_filename])
end       
assignin('base','VR',VR);
assignin('base','s',s);
assignin('base','dt',dt);

% Start simulation
sim(vrmodelname)

% Set the toggle buttons to the right value when simulation is done
set(S.rearward_stop_vis_push, 'Value',1);
set(S.rearward_run_vis_push, 'Value',0);

function stop_rearward_visualization_callback(source,eventdata)
global S
set_param(bdroot, 'SimulationCommand', 'stop')
set(S.rearward_stop_vis_push, 'Value',1);
set(S.rearward_run_vis_push, 'Value',0);

function rearward_speed_callback(source,eventdata)
global S results rearward_results Truckname rearward_sim

if results == 1
    vrmodelname  = ['simresults/C12_RearWardAmpli/LZV_custom/',rearward_results,'/',rearward_sim];
    load_system(vrmodelname)    
    [~,name,~] = fileparts(rearward_sim);
    h_vrsink = [name,'/VR sink'];
else
    vrmodelname = ['simresults/C12_RearWardAmpli/LZV_custom/',Truckname,'/',Truckname,'_anim_rearward.slx'];  
    load_system(vrmodelname)
    h_vrsink=find_system('referenceblock','vrlib/VR Sink');
    h_vrsink=char(h_vrsink(1));
end

if get(S.rearward_speed_popup,'Value') == 1
    set_param(h_vrsink, 'SampleTime','0.05')
elseif get(S.rearward_speed_popup,'Value') == 2
    set_param(h_vrsink, 'SampleTime','0.1')
elseif get(S.rearward_speed_popup,'Value') == 3
    set_param(h_vrsink, 'SampleTime','0.5')
end

function rearward_view_callback(source,eventdata)
global S results rearward_results rearward_wrl Truckname viewpoint_rearward

if results == 1
    vr_world = vrworld(['simresults/C12_RearWardAmpli/LZV_custom/',rearward_results,'/',rearward_wrl]);
else
    vr_world = vrworld(['simresults/C12_RearWardAmpli/LZV_custom/',Truckname,'/',Truckname,'_rearward.wrl']);   
end
open(vr_world);
vr.canvas(vr_world,'Parent', S.visual_rearward_panel,'Units','Normalized',...
          'Position',[0 0 1 0.9],'Viewpoint','Side view','NavZones','On');  
      
if get(S.rearward_view_popup,'Value') == 1
    viewpoint_rearward = 1;
    if get(S.rearward_nav_popup,'Value') == 1
        vr.canvas(vr_world,'Parent', S.visual_rearward_panel,'Units','Normalized',...
        'Position',[0 0 1 0.9],'Viewpoint','Top view (moving)','NavZones','On');
    else
        vr.canvas(vr_world,'Parent', S.visual_rearward_panel,'Units','Normalized',...
        'Position',[0 0 1 0.9],'Viewpoint','Top view (moving)','NavZones','Off');
    end
elseif get(S.rearward_view_popup,'Value') == 2
    viewpoint_rearward = 2;
    if get(S.rearward_nav_popup,'Value') == 1    
        vr.canvas(vr_world,'Parent', S.visual_rearward_panel,'Units','Normalized',...
        'Position',[0 0 1 0.9],'Viewpoint','Side view','NavZones','On');
    else
        vr.canvas(vr_world,'Parent', S.visual_rearward_panel,'Units','Normalized',...
        'Position',[0 0 1 0.9],'Viewpoint','Side view','NavZones','Off');        
    end
elseif get(S.rearward_view_popup,'Value') == 3
    viewpoint_rearward = 3;
    if get(S.rearward_nav_popup,'Value') == 1
        vr.canvas(vr_world,'Parent', S.visual_rearward_panel,'Units','Normalized',...
              'Position',[0 0 1 0.9],'Viewpoint','Rear view (moving)','NavZones','On');
    else
        vr.canvas(vr_world,'Parent', S.visual_rearward_panel,'Units','Normalized',...
        'Position',[0 0 1 0.9],'Viewpoint','Rear view (moving)','NavZones','Off');        
    end
elseif get(S.rearward_view_popup,'Value') == 4
    viewpoint_rearward = 4;
    if get(S.rearward_nav_popup,'Value') == 1
        vr.canvas(vr_world,'Parent', S.visual_rearward_panel,'Units','Normalized',...
        'Position',[0 0 1 0.9],'Viewpoint','Front view (moving)','NavZones','On');
    else
        vr.canvas(vr_world,'Parent', S.visual_rearward_panel,'Units','Normalized',...
        'Position',[0 0 1 0.9],'Viewpoint','Front view (moving)','NavZones','Off');        
    end
elseif get(S.rearward_view_popup,'Value') == 5
    viewpoint_rearward = 5;
    if get(S.rearward_nav_popup,'Value') == 1
        vr.canvas(vr_world,'Parent', S.visual_rearward_panel,'Units','Normalized',...
        'Position',[0 0 1 0.9],'Viewpoint','Top rotating view','NavZones','On');
    else
        vr.canvas(vr_world,'Parent', S.visual_rearward_panel,'Units','Normalized',...
        'Position',[0 0 1 0.9],'Viewpoint','Top rotating view','NavZones','Off');        
    end
end

function rearward_nav_callback(source,eventdata)
global S results rearward_wrl Truckname rearward_results viewpoint_rearward

% Open the VRML visualization
if results == 1
    vr_world = vrworld(['simresults/C12_RearWardAmpli/LZV_custom/',rearward_results,'/',rearward_wrl]);
else
    vr_world = vrworld(['simresults/C12_RearWardAmpli/LZV_custom/',Truckname,'/',Truckname,'_rearward.wrl']);   
end
open(vr_world);
vr.canvas(vr_world,'Parent', S.visual_rearward_panel,'Units','Normalized',...
          'Position',[0 0 1 0.9],'Viewpoint','Side view','NavZones','On'); 
      
if get(S.rearward_nav_popup,'Value') == 1
    if viewpoint_rearward == 1
    vr.canvas(vr_world,'Parent', S.visual_rearward_panel,'Units','Normalized',...
              'Position',[0 0 1 0.9],'Viewpoint', 'Top view (moving)','NavZones','On');        
    elseif viewpoint_rearward == 2
    vr.canvas(vr_world,'Parent', S.visual_rearward_panel,'Units','Normalized',...
              'Position',[0 0 1 0.9],'Viewpoint', 'Side view','NavZones','On');
    elseif viewpoint_rearward == 3
    vr.canvas(vr_world,'Parent', S.visual_rearward_panel,'Units','Normalized',...
              'Position',[0 0 1 0.9],'Viewpoint', 'Rear view (moving)','NavZones','On');
    elseif viewpoint_rearward == 4
    vr.canvas(vr_world,'Parent', S.visual_rearward_panel,'Units','Normalized',...
              'Position',[0 0 1 0.9],'Viewpoint', 'Front view (moving)','NavZones','On');
    elseif viewpoint_rearward == 5
    vr.canvas(vr_world,'Parent', S.visual_rearward_panel,'Units','Normalized',...
              'Position',[0 0 1 0.9],'Viewpoint', 'Top rotating view','NavZones','On');
    end
    
elseif get(S.rearward_nav_popup,'Value') == 2
    if viewpoint_rearward == 1
    vr.canvas(vr_world,'Parent', S.visual_rearward_panel,'Units','Normalized',...
              'Position',[0 0 1 0.9],'Viewpoint', 'Top view (moving)','NavZones','Off');        
    elseif viewpoint_rearward == 2
    vr.canvas(vr_world,'Parent', S.visual_rearward_panel,'Units','Normalized',...
              'Position',[0 0 1 0.9],'Viewpoint', 'Side view','NavZones','Off');
    elseif viewpoint_rearward == 3
    vr.canvas(vr_world,'Parent', S.visual_rearward_panel,'Units','Normalized',...
              'Position',[0 0 1 0.9],'Viewpoint', 'Rear view (moving)','NavZones','Off');
    elseif viewpoint_rearward == 4
    vr.canvas(vr_world,'Parent', S.visual_rearward_panel,'Units','Normalized',...
              'Position',[0 0 1 0.9],'Viewpoint', 'Front view (moving)','NavZones','Off');
    elseif viewpoint_rearward == 5
    vr.canvas(vr_world,'Parent', S.visual_rearward_panel,'Units','Normalized',...
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