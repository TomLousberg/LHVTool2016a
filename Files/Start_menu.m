function Start_menu

global S e p t1 t2 t1buffer t2buffer

warning('off','all');

addpath(genpath('Files'));
addpath custom_model
addpath default_model
addpath images
addpath(genpath('model'));
addpath(genpath('postprocessing'));
addpath(genpath('simresults'));
addpath(genpath('library'));

javaaddpath(which('MatlabGarbageCollector.jar'));
org.dt.matlab.utilities.JavaMemoryCleaner.clear(1);

e=0; p=0; t1=0; t2=0;
t1buffer=0; t2buffer=0;

S.f = figure('NumberTitle','off','Name','LHV Tool',...
             'color','w','toolbar','none','menubar','none','Units','Normalized',...
             'Position',[0.2 0.15 0.8 0.75],'Visible','off');
         
S.results_button = uicontrol('style','text',...
                             'Units','Centimeters',...
                             'position',[1 12 30 4],...
                             'BackgroundColor','w',...
                             'String','Do you want to create a new configuration or go directly to the results?',...
                             'FontUnits','Normalized',...
                             'FontSize',0.2,...
                             'FontWeight','bold',...
                             'units','normalized'); 
                         
S.results_button = uicontrol('style','pushbutton',...
                             'Units','Centimeters',...
                             'position',[11 4 10 4],...
                             'BackgroundColor','w',...
                             'String','Results',...
                             'FontUnits','Normalized',...
                             'FontSize',0.2,...
                             'FontWeight','bold',...
                             'units','normalized',...
                             'Callback',@results_callback); 
                
S.hcustom = uicontrol('Style','pushbutton',...
                      'Units','Centimeters',...
                      'position',[11 10 10 4],...    
                      'BackgroundColor','w',...
                      'String','New configuration',...
                      'FontUnits','Normalized',...
                      'FontSize',0.2,...
                      'FontWeight','bold',...
                      'Units','Normalized',...
                      'Callback',@custom_callback);

set(S.f,'visible','on');                
pause(0.5)
figure(S.f)
robot = java.awt.Robot; 
robot.keyPress(java.awt.event.KeyEvent.VK_ALT);      %// send ALT
robot.keyPress(java.awt.event.KeyEvent.VK_SPACE);    %// send SPACE
robot.keyRelease(java.awt.event.KeyEvent.VK_SPACE);  %// release SPACE
robot.keyRelease(java.awt.event.KeyEvent.VK_ALT);    %// release ALT
robot.keyPress(java.awt.event.KeyEvent.VK_X);        %// send X
robot.keyRelease(java.awt.event.KeyEvent.VK_X);      %// release X

function custom_callback(source,eventdata)
global S
S.hWait = figure('NumberTitle','off','Name','LHV Tool',...
             'color','w','toolbar','none','menubar','none','Units','Normalized',...
             'Position',[0.2 0.15 0.8 0.75]);  
pause(0.5)         
robot = java.awt.Robot; 
robot.keyPress(java.awt.event.KeyEvent.VK_ALT);      %// send ALT
robot.keyPress(java.awt.event.KeyEvent.VK_SPACE);    %// send SPACE
robot.keyRelease(java.awt.event.KeyEvent.VK_SPACE);  %// release SPACE
robot.keyRelease(java.awt.event.KeyEvent.VK_ALT);    %// release ALT
robot.keyPress(java.awt.event.KeyEvent.VK_X);        %// send X
robot.keyRelease(java.awt.event.KeyEvent.VK_X);      %// release X         
         
iconsClassName = 'com.mathworks.widgets.BusyAffordance$AffordanceSize';
iconsSizeEnums = javaMethod('values',iconsClassName);
SIZE_32x32 = iconsSizeEnums(2);  % (1) = 16x16,  (2) = 32x32
jObj = com.mathworks.widgets.BusyAffordance(SIZE_32x32, 'Please wait...');  % icon, label
jObj.setPaintsWhenStopped(true);  % default = false
jObj.useWhiteDots(false);         % default = false (true is good for dark backgrounds)
screensize = get( groot, 'Screensize' );
javacomponent(jObj.getComponent, [screensize(3)/2-100,screensize(4)/2-50,200,100], S.hWait);
jObj.start;     
pause(1)
configuration_selection
closereq
jObj.stop;

function results_callback(source, eventdata)
global S

S.hWait = figure('NumberTitle','off','Name','',...
             'color','w','toolbar','none','menubar','none','Units','Normalized',...
             'Position',[0.2 0.15 0.8 0.75]);  
pause(0.5)         
robot = java.awt.Robot; 
robot.keyPress(java.awt.event.KeyEvent.VK_ALT);      %// send ALT
robot.keyPress(java.awt.event.KeyEvent.VK_SPACE);    %// send SPACE
robot.keyRelease(java.awt.event.KeyEvent.VK_SPACE);  %// release SPACE
robot.keyRelease(java.awt.event.KeyEvent.VK_ALT);    %// release ALT
robot.keyPress(java.awt.event.KeyEvent.VK_X);        %// send X
robot.keyRelease(java.awt.event.KeyEvent.VK_X);      %// release X         
         
iconsClassName = 'com.mathworks.widgets.BusyAffordance$AffordanceSize';
iconsSizeEnums = javaMethod('values',iconsClassName);
SIZE_32x32 = iconsSizeEnums(2);  % (1) = 16x16,  (2) = 32x32
jObj = com.mathworks.widgets.BusyAffordance(SIZE_32x32, 'Please wait...');  % icon, label
jObj.setPaintsWhenStopped(true);  % default = false
jObj.useWhiteDots(false);         % default = false (true is good for dark backgrounds)
screensize = get( groot, 'Screensize' );
javacomponent(jObj.getComponent, [screensize(3)/2-100,screensize(4)/2-50,200,100], S.hWait);
jObj.start;     
pause(1)

core_simulation_results

closereq
jObj.stop;
close(S.hWait)