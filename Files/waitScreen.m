function [ output_args ] = waintScreen(message)
global jObj S
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
javacomponent(jObj.getComponent, [screensize(3)/2-100,screensize(4)/2-50,200,100], S.hWait);jObj.start;     
jObj.start;     
pause(1)


end

