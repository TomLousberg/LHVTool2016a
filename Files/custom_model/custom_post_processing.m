function custom_post_processing
global Excelsave ExcelFileName Truckname NumberOfRows 
global handling_selected yawdamping_selected offtracking_selected rearward_selected 
global rollover_selected turn90R8_selected sidewind_selected friction_selected 
global tailswing_selected frontalswing_selected sweptpath360_selected sweptpath_selected 
global ridequality_selected directional_selected tracking_selected overtaking_selected 
global acceleration_selected gradeability_selected startability_selected statics_selected
global S results results_statics results_startability results_acceleration CRG_selected
global results_overtaking results_tracking results_directional results_ridequality results_CRG
global results_sweptpath results_sweptpath360 results_frontalswing results_tailswing
global results_tyrefriction results_sidewind results_turn90r8 results_rollover results_rearward
global results_offtracking results_yawdamping results_handling results_gradeability_speed results_gradeability_motion

warning('off', 'all');
javaaddpath(which('MatlabGarbageCollector.jar'));
org.dt.matlab.utilities.JavaMemoryCleaner.clear(1);
clc;

% Create main window
S.f = figure('NumberTitle','off','Name','LHV Tool - Post-processing',...
             'color','w','Units','Normalized',...
             'Position',[0.2 0.15 0.8 0.75],'visible','off'); 

% Create tabbed format for every simulated test         
S.tgroup = uitabgroup('Parent',S.f, 'tablocation', 'left');
S.tab1 = uitab('Parent', [],'backgroundcolor','w', 'Title','Statics');
S.tab2 = uitab('Parent', [],'backgroundcolor','w', 'Title','Start Ability');
S.tab3 = uitab('Parent', [],'backgroundcolor','w', 'Title','Grade Ability');
S.tab4 = uitab('Parent', [],'backgroundcolor','w', 'Title','Acceleration');
S.tab5 = uitab('Parent', [],'backgroundcolor','w', 'Title','Overtaking');
S.tab6 = uitab('Parent', [],'backgroundcolor','w', 'Title','Tracking');
S.tab7 = uitab('Parent', [],'backgroundcolor','w', 'Title','Directional Stability');
S.tab8 = uitab('Parent', [],'backgroundcolor','w', 'Title','Ride Quality');
S.tab9 = uitab('Parent', [],'backgroundcolor','w', 'Title','Swept Path');
S.tab10 = uitab('Parent', [],'backgroundcolor','w', 'Title','Swept Path 360');
S.tab11 = uitab('Parent', [],'backgroundcolor','w', 'Title','Frontal Swing');
S.tab12 = uitab('Parent', [],'backgroundcolor','w', 'Title','Tail Swing');
S.tab13 = uitab('Parent', [],'backgroundcolor','w', 'Title','Steer-Tyre Friction Demand');
S.tab14 = uitab('Parent', [],'backgroundcolor','w', 'Title','Sidewind');
S.tab15 = uitab('Parent', [],'backgroundcolor','w', 'Title','90 Deg Turn R8');
S.tab16 = uitab('Parent', [],'backgroundcolor','w', 'Title','Static Rollover');
S.tab17 = uitab('Parent', [],'backgroundcolor','w', 'Title','Rearward Amplification');
S.tab18 = uitab('Parent', [],'backgroundcolor','w', 'Title','Offtracking');
S.tab19 = uitab('Parent', [],'backgroundcolor','w', 'Title','Yaw Damping');
S.tab20 = uitab('Parent', [],'backgroundcolor','w', 'Title','Handling Quality');
S.tab21 = uitab('Parent', [],'backgroundcolor','w', 'Title','CRG');

% Fill in the excel sheet with data when requested
if Excelsave == 1
    Name = Truckname;
    [numbers strings] = xlsread(ExcelFileName);
    rows = size(strings);
    NumberOfRows = rows(1)+1;
    sheet = 1;
    x2Range = ['A', num2str(NumberOfRows)];
    xlswrite(ExcelFileName,{Name},sheet,x2Range);
    
% Run Postprocessing for the executed simulations
if results == 0 
    statics_postprocessing 
elseif statics_selected && results == 1 && iscell(results_statics)
    statics_postprocessing 
end

end

if (startability_selected && results == 0) || (startability_selected && results == 1 && iscell(results_startability))
    C1_startability_postprocessing 
end

if (gradeability_selected && results == 0) || (gradeability_selected && results == 1 && iscell(results_gradeability_speed) && iscell(results_gradeability_motion))
    C2_gradeability_postprocessing
end
    
if (acceleration_selected && results == 0) || (acceleration_selected && results == 1 && iscell(results_acceleration))
    C3_acceleration_postprocessing  
end
        
if (overtaking_selected && results == 0) || (overtaking_selected && results == 1 && iscell(results_overtaking))
    C4_overtaking_postprocessing 
end

if (tracking_selected && results == 0) || (tracking_selected && results == 1 && iscell(results_tracking))
    C5_tracking_postprocessing   
end
    
if (directional_selected && results == 0) || (directional_selected && results == 1 && iscell(results_directional))
    C16_directionalstability_postprocessing   
end
    
if (ridequality_selected && results == 0) || (ridequality_selected && results == 1 && iscell(results_ridequality))
    C6_ridequality_postprocessing    
end
    
if (sweptpath_selected && results == 0) || (sweptpath_selected && results == 1 && iscell(results_sweptpath))
    C7_sweptpath_postprocessing   
end
    
if (sweptpath360_selected && results == 0) || (sweptpath360_selected && results == 1 && iscell(results_sweptpath360))
    sweptpath360_postprocessing
end
    
if (frontalswing_selected && results == 0) || (frontalswing_selected && results == 1 && iscell(results_frontalswing))
    C8_frontalswing_postprocessing
end
    
if (tailswing_selected && results == 0) || (tailswing_selected && results == 1 && iscell(results_tailswing))
    C9_tailswing_postprocessing 
end
    
if (friction_selected && results == 0) || (friction_selected && results == 1 && iscell(results_tyrefriction))
    C10_friction_postprocessing
end
    
if (sidewind_selected && results == 0) || (sidewind_selected && results == 1 && iscell(results_sidewind))
    sidewind_postprocessing     
end
    
if (turn90R8_selected && results == 0) || (turn90R8_selected && results == 1 && iscell(results_turn90r8))
   turn90r8_postprocessing  
end
   
if (rollover_selected && results == 0) || (rollover_selected && results == 1 && iscell(results_rollover))
    C11_rollover_postprocessing  
end
    
if (rearward_selected && results == 0) || (rearward_selected && results == 1 && iscell(results_rearward))
    C12_rearward_postprocessing  
end
    
if (offtracking_selected && results == 0) || (offtracking_selected && results == 1 && iscell(results_offtracking))
    C13_offtracking_postprocessing 
end
    
if (yawdamping_selected && results == 0) || (yawdamping_selected && results == 1 && iscell(results_yawdamping))
   C14_yawdamping_postprocessing 
end
   
if (handling_selected && results == 0) || (handling_selected && results == 1 && iscell(results_handling))
   C15_handlingquality_postprocessing
end

if (CRG_selected && results == 0) || (CRG_selected && results == 1 && iscell(results_CRG))
   CRG_postprocessing
end

set(S.f,'visible','on');                
pause(2)
figure(S.f)
robot = java.awt.Robot; 
robot.keyPress(java.awt.event.KeyEvent.VK_ALT);      %// send ALT
robot.keyPress(java.awt.event.KeyEvent.VK_SPACE);    %// send SPACE
robot.keyRelease(java.awt.event.KeyEvent.VK_SPACE);  %// release SPACE
robot.keyRelease(java.awt.event.KeyEvent.VK_ALT);    %// release ALT
robot.keyPress(java.awt.event.KeyEvent.VK_X);        %// send X
robot.keyRelease(java.awt.event.KeyEvent.VK_X);      %// release X