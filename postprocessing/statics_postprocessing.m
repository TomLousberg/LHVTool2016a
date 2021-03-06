function statics_postprocessing

javaaddpath(which('MatlabGarbageCollector.jar'));
org.dt.matlab.utilities.JavaMemoryCleaner.clear(1);
clc;
global NumberOfRows Excelsave ExcelFileName
global S statics_results results statics_filename 
global mass_2axles Truckname mass mindist2axles
%% Statics tab lay-out
set(S.tab1,'Parent', S.tgroup);

S.back_button = uicontrol('parent', S.tab1,...
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
                      
S.Static_title = uicontrol('Parent', S.tab1, 'Style', 'text', 'String', 'Statics', ...
                         'Backgroundcolor', 'w','FontSize',3.5,'FontWeight','bold',...
                         'FontUnits','Normalized',...
                         'Units','Normalized','Position',[0.4 0.75 0.1 0.2]);

S.Loading_results = uipanel('Parent',S.tab1,'backgroundcolor','w','Title','Bridge Loading Results',...
                            'Units','Normalized','Position',[0.275 0.65 0.4 0.2],...
                            'FontWeight','bold','FontSize',12,'BorderWidth',2,...
                            'FontUnits','Normalized',...
                            'BorderType','Line','highlightcolor','k');

S.mindist2axles_text = uicontrol('Parent', S.Loading_results, 'Style', 'text', 'String', 'Minimum distance between 2 group axle (m)', ...
                         'Backgroundcolor', 'w','FontSize',6,...
                         'FontUnits','Normalized',...
                         'Units','Normalized','Position',[0.05 0.6 0.325 0.3]);                    
                     
S.mass_text = uicontrol('Parent', S.Loading_results, 'Style', 'text', 'String', 'Total gross mass on the axles (t)', ...
                         'Backgroundcolor', 'w','FontSize',6,...
                         'FontUnits','Normalized',...
                         'Units','Normalized','Position',[0.4 0.6 0.3 0.3]);                    
                     
S.level_text = uicontrol('Parent', S.Loading_results, 'Style', 'text', 'String', 'Level', ...
                         'Backgroundcolor', 'w','FontSize',6,...
                         'FontUnits','Normalized',...
                         'Units','Normalized','Position',[0.725 0.6 0.3 0.3]);                    

S.mindist2axles_edit = uicontrol('Parent', S.Loading_results, 'Style', 'edit', ...
                         'Backgroundcolor', 'w','FontSize',12,'enable','off',...
                         'FontUnits','Normalized',...
                         'Units','Normalized','Position',[0.125 0.2 0.15 0.2]);
                     
S.mass_edit = uicontrol('Parent', S.Loading_results, 'Style', 'edit', ...
                         'Backgroundcolor', 'w','FontSize',12,'enable','off',...
                         'FontUnits','Normalized',...
                         'Units','Normalized','Position',[0.475 0.2 0.15 0.2]);
                     
S.level_edit = uicontrol('Parent', S.Loading_results, 'Style', 'edit', ...
                         'Backgroundcolor', 'w','FontSize',12,'enable','off',...
                         'FontUnits','Normalized',...
                         'Units','Normalized','Position',[0.8 0.2 0.15 0.2]);
                
if results == 1
    dirName = ['simresults\Statics\LZV_custom\',statics_results];
    files = dir( fullfile(dirName,'*.mat') );
    filename = files.name;
    load(filename)
else
    load(['simresults/Statics/LZV_custom/',Truckname,'/',statics_filename])
end  

S.h = uitable('Parent',S.tab1,'Units','Centimeters', 'Position',[10 1 10 14], ...
              'Units','normalized','ColumnName',[],'RowName',[],'FontSize',12,'BackgroundColor',[1 1 1],...
              'FontUnits','Normalized','ColumnWidth', {300,200,150,100});                    


set(S.h,'Data',{line1; line2; line3; line4; line5;...
    line6; line7; line8; line9; line10; line11;...
    line12; line13; line14; line15; line16; line17;...
    line18; line19; line20; line21; line22; line23;...
    line24; line25; line26; line27; line28; line29;...
    line30; line31; line32; line33; line34});

mass_2axles=mass_2axles/1000;

%Level performance
level=5;
if mass_2axles<=(3*mindist2axles+12.5)
    level=3;
end
if mass_2axles<=46.5
   if mass_2axles<=(3*mindist2axles+12.5)
       level=2;
   end
elseif mass_2axles>46.5
   if mass_2axles<=(1.5*mindist2axles+29.5)
       level=2;
   end
end
if mass_2axles<=42.5
   if mass_2axles<=(3*mindist2axles+12.5)
       level=1;
   end
elseif mass_2axles>42.5
   if mass_2axles<=(mindist2axles+32.5)
       level=1;
   end
end

mindist2axles=(round(mindist2axles*100))/100;
mass_2axles=(round(mass_2axles*100))/100;
set(S.level_edit, 'string', num2str(level));
set(S.mindist2axles_edit, 'string', num2str(mindist2axles));
set(S.mass_edit, 'string', num2str(mass_2axles));

if Excelsave == 1
    A = {mass_2axles,mindist2axles,level,mass};
    sheet = 1;
    x1Range = ['AW', num2str(NumberOfRows)];
    xlswrite(ExcelFileName,A,sheet,x1Range)
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