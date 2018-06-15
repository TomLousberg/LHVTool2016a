function configuration_selection

global p a c t1 t2 nodes_offset num_of_nodes d S bg1 bg2 bg3 
global bg4 bg5 Name str numoftraileraxles numofaxles p1name p2name truckname

S.f = figure('NumberTitle','off','Name','LHV Tool',...
             'color','w','toolbar','none','menubar','none','Units','Normalized',...
             'Position',[0.2 0.15 0.8 0.75],'Visible','off');  

S.back_button = uiControlfunction(S.f,'pushbutton','w','Back',10,'bold','r',[0.1 16 3 1],@Back_callback);    
                         
if p>=2            
    S.next_button = uiControlfunction(S.f,'pushbutton','w','Next',10,'bold','b',[29.5 16 3 1],@Next_callback);                
    S.saveModel_button = uiControlfunction(S.f,'pushbutton','w','Save model',10,'bold','k',[14 16 5 1],@saveModel_callback);                
end  

S.Hauling_panel = uiPanelfunction(S.f,'w','1 - Tractor & Truck',11,'bold','k',[1 4 8.5 10]);    
S.Trailing_panel = uiPanelfunction(S.f,'w','2 - Trailers',11,'bold','k',[10.5 4 21 10]);    
S.Tractor_panel = uiPanelfunction(S.Hauling_panel,'w','Tractor',11,'bold','k',[0.1 5.5 8 4]);    
S.Trucks_panel = uiPanelfunction(S.Hauling_panel,'w','Tucks',11,'bold','k',[0.1 0.1 8 5]);    
S.Semitrailers_panel = uiPanelfunction(S.Trailing_panel,'w','Semi trailers',11,'bold','k',[0.5 4.5 20 5]);    
S.trailer_panel = uiPanelfunction(S.Trailing_panel,'w','Trailer',11,'bold','k',[0.5 0.1 9.5 4]);    
S.dbtrailer_panel = uiPanelfunction(S.Trailing_panel,'w','Drawbar trailer',11,'bold','k',[11 0.1 9.5 4]);    
                                      
axes('Parent',S.Tractor_panel,...
     'units','normalized',...
     'position',[-0.05 0.25 .5 .5],...
     'xtick',[],'ytick',[]);
imshow('tractor_2a.bmp') 

axes('Parent',S.Trucks_panel,...
     'units','normalized',...
     'position',[0 0.5 .3 .3],...
     'xtick',[],'ytick',[]);
imshow('truck_a_3a.bmp') 

axes('Parent',S.Trucks_panel,...
     'units','normalized',...
     'position',[0 0.1 .3 .3],...
     'xtick',[],'ytick',[]);
imshow('truck_b_3a.bmp') 

S.Tractor_button = uiControlfunction(S.Tractor_panel,'pushbutton','w','Tractor',6,'bold','k',[3.2 1.4 4 1],@tractor_callback);    
S.Truck_button = uiControlfunction(S.Trucks_panel,'pushbutton','w','Truck',6,'bold','k',[3.2 2.5 4 1],@truck_callback);    
S.Truck_king_button = uiControlfunction(S.Trucks_panel,'pushbutton','w','Truck + kingpin',6,'bold','k',[3.2 .7 4 1],@truck_king_callback);    
S.Semitrailer_button = uiControlfunction(S.Semitrailers_panel,'pushbutton','w','Semi trailer',6,'bold','k',[6 3 4 1],@Semitrailer_callback);    
S.Semitrailer_doll_button = uiControlfunction(S.Semitrailers_panel,'pushbutton','w','Semi trailer + dolly',6,'bold','k',[6 0.5 4 1],@Semitrailer_doll_callback);    
S.Semitrailer_king_button = uiControlfunction(S.Semitrailers_panel,'pushbutton','w','Semi trailer + kingpin',5,'bold','k',[15 3 4 1],@Semitrailer_king_callback);    
S.Semitrailer_king_doll_button = uiControlfunction(S.Semitrailers_panel,'pushbutton','w','Semitrailer + kingpin + dolly',4,'bold','k',[15 0.5 4 1],@semitrailerkingpindoll_button_Callback);    
S.trailer_button = uiControlfunction(S.trailer_panel,'pushbutton','w','Trailer',7,'bold','k',[5 1.5 4 1],@trailer_callback);    
S.dbtrailer_button = uiControlfunction(S.dbtrailer_panel,'pushbutton','w','Drawbar trailer',7,'bold','k',[5 1.5 4 1],@dbtrailer_callback);    

axes('Parent',S.Semitrailers_panel,...
     'units','normalized',...
     'position',[0. 0.6 .3 .3],...
     'xtick',[],'ytick',[]);
imshow('Semitrailer_3a.bmp')           

axes('Parent',S.Semitrailers_panel,...
     'units','normalized',...
     'position',[0. 0.06 .3 .3],...
     'xtick',[],'ytick',[]);
imshow('semitrailer_3a+doll_2a.bmp') 

axes('Parent',S.Semitrailers_panel,...
     'units','normalized',...
     'position',[0.49 0.6 .3 .3],...
     'xtick',[],'ytick',[]);
imshow('semitrailer+kingpin_3a.bmp') 

axes('Parent',S.Semitrailers_panel,...
     'units','normalized',...
     'position',[0.49 0.05 .3 .3],...
     'xtick',[],'ytick',[]);
imshow('semitrailer_3a+doll_2a+kingpin.bmp')

axes('Parent',S.trailer_panel,...
     'units','normalized',...
     'position',[0.1 0.3 .4 .4],...
     'xtick',[],'ytick',[]);
imshow('Trailer_2a.bmp') 

axes('Parent',S.dbtrailer_panel,...
     'units','normalized',...
     'position',[0.05 0.3 .4 .4],...
     'xtick',[],'ytick',[]);
imshow('Dbtrailer_2a.bmp')                             

if p == 0
    set(S.Semitrailer_button,'Enable','off');
    set(S.Semitrailer_doll_button,'Enable','off');
    set(S.Semitrailer_king_button,'Enable','off');
    set(S.Semitrailer_king_doll_button,'Enable','off');
    set(S.trailer_button,'Enable','off');
    set(S.dbtrailer_button,'Enable','off');
else
    set(S.Tractor_button,'Enable','off');
    set(S.Truck_button,'Enable','off');
    set(S.Truck_king_button,'Enable','off');
end

if p == 1 && t1 == 1
    set(S.Semitrailer_doll_button,'Enable','off');
    set(S.Semitrailer_king_doll_button,'Enable','off');
    set(S.trailer_button,'Enable','off');
    set(S.dbtrailer_button,'Enable','off');
elseif p == 1 && t1 == 2
    set(S.Semitrailer_button,'Enable','off');
    set(S.Semitrailer_king_button,'Enable','off');
elseif p == 1 && t1 == 3       
    set(S.Semitrailer_doll_button,'Enable','off');
    set(S.Semitrailer_king_doll_button,'Enable','off');
    set(S.trailer_button,'Enable','off');
    set(S.dbtrailer_button,'Enable','off');
end

if t2 == 1
    set(S.Semitrailer_button,'Enable','off');
    set(S.Semitrailer_king_button,'Enable','off');
elseif t2 == 2
    set(S.Semitrailer_button,'Enable','off');
    set(S.Semitrailer_king_button,'Enable','off');
elseif t2 == 3
    set(S.Semitrailer_doll_button,'Enable','off');
    set(S.Semitrailer_king_doll_button,'Enable','off');
    set(S.trailer_button,'Enable','off');
    set(S.dbtrailer_button,'Enable','off');
elseif t2 == 4
    set(S.Semitrailer_doll_button,'Enable','off');
    set(S.Semitrailer_king_doll_button,'Enable','off');
%     set(S.Semitrailer_king_button,'Enable','off');
    set(S.trailer_button,'Enable','off');
    set(S.dbtrailer_button,'Enable','off');
elseif t2 == 5
    set(S.Semitrailer_button,'Enable','off');
    set(S.Semitrailer_king_button,'Enable','off');
elseif t2 == 6
    set(S.Semitrailer_button,'Enable','off');
    set(S.Semitrailer_king_button,'Enable','off');
end

if p == 5
    set(S.Semitrailer_doll_button,'Enable','off');
    set(S.Semitrailer_king_doll_button,'Enable','off');
    set(S.trailer_button,'Enable','off');
    set(S.dbtrailer_button,'Enable','off');
    set(S.Semitrailer_button,'Enable','off');
    set(S.Semitrailer_king_button,'Enable','off');
end

if p==1
    truckname = p1name;

    [MonthNum, MonthString] = month(date);
    Second = second(datetime);
    x = sprintf('%0.0f\n', Second);
    secs = str2num(x);
    Minute = minute(datetime);
    Hour = hour(datetime);
    Day = day(date);
    Month = MonthString;
    Year = year(date);
    Name = [Month '_' num2str(Day) '_' num2str(Year) '_' num2str(Hour) '_' num2str(Minute) '_' num2str(secs)];

    numofaxles = 0;
    new_system(Name);
    set_param(Name,'StopTime','max(VR.tractor.time)')
    add_block('vrlib/VR Sink',[Name, '/VR sink']);
    h_vrsink=find_system('referenceblock','vrlib/VR Sink');
    h_vrsink=char(h_vrsink);

    if t1==1 && a==2 && c==1
        bg1 = imread('tractor_2a.bmp');
        writetractor(Name,2);
        Write_VRML_Simulink
        numofaxles = 2;
    elseif t1==1 && a==3 && c==1
        bg1 = imread('tractor_3a.bmp');
        writetractor(Name,3);
        Write_VRML_Simulink
        numofaxles = 3;
    elseif t1==1 && a==4 && c==1
        bg1 = imread('tractor_4a.bmp');
        writetractor(Name,4);
        Write_VRML_Simulink
        numofaxles = 4;
    elseif t1==2 && a==2 && c==1
        bg1 = imread('truck_a_2a.bmp');
        writetruck(Name,2);
        Write_VRML_Simulink
        numofaxles = 2;
    elseif t1==2 && a==3 && c==1
        bg1 = imread('truck_a_3a.bmp');
        writetruck(Name,3);
        Write_VRML_Simulink
        numofaxles = 3;
    elseif t1==2 && a==4 && c==1
        bg1 = imread('truck_a_4a.bmp');
        writetruck(Name,4);
        Write_VRML_Simulink
        numofaxles = 4;
    elseif t1==3 && a==2 && c==1
        bg1 = imread('truck_b_2a.bmp');
        writetruckking(Name,2);
        Write_VRML_Simulink
        numofaxles = 2;
    elseif t1==3 && a==3 && c==1
        bg1 = imread('truck_b_3a.bmp');
        writetruckking(Name,3);
        Write_VRML_Simulink 
        numofaxles = 3;
    elseif t1==3 && a==4 && c==1
        bg1 = imread('truck_b_4a.bmp');
        writetruckking(Name,4);
        Write_VRML_Simulink
        numofaxles = 4;
    end

    worldfilename = [Name, '.wrl'];
    myworld = vrworld(worldfilename);
    open(myworld);

    set_param(h_vrsink, 'WorldFileName', worldfilename);
    set_param(h_vrsink, 'FieldsWritten', str,'Position',[400 10 500 10+num_of_nodes*10]);

elseif p==2
    truckname = [truckname,'_',p2name];

    numoftraileraxles = 0;
    if t2==1 && a==1 && c==1
        bg2 = imread('semitrailer_1a.bmp');
        writesemi(1)
        Write_VRML_Simulink
        numofaxles = numofaxles + 1;
        numoftraileraxles = numoftraileraxles + 1;
    elseif t2==1 && a==2 && c==1
        bg2 = imread('semitrailer_2a.bmp');
        writesemi(2)
        Write_VRML_Simulink
        numofaxles = numofaxles + 2;
        numoftraileraxles = numoftraileraxles + 2;
    elseif t2==1 && a==3 && c==1
        bg2 = imread('semitrailer_3a.bmp');
        writesemi(3)
        Write_VRML_Simulink
        numofaxles = numofaxles + 3;
        numoftraileraxles = numoftraileraxles + 3;
    elseif t2==1 && a==4 && c==1
        bg2 = imread('semitrailer_4a.bmp');
        writesemi(4)
        Write_VRML_Simulink
        numofaxles = numofaxles + 4;
        numoftraileraxles = numoftraileraxles + 4;
    elseif t2==1 && a==5 && c==1
        bg2 = imread('semitrailer_5a.bmp');
        writesemi(5)
        Write_VRML_Simulink
        numofaxles = numofaxles + 5;
        numoftraileraxles = numoftraileraxles + 5;
    elseif t2==2 && a==1 && d==1 && c==1
        bg2 = imread('semitrailer_1a+doll_1a.bmp');
        writesemidolly(1,1)
        Write_VRML_Simulink
        numofaxles = numofaxles + 2;
        numoftraileraxles = numoftraileraxles + 2;
    elseif t2==2 && a==2 && d==1 && c==1
        bg2 = imread('semitrailer_2a+doll_1a.bmp');
        writesemidolly(1,2)
        Write_VRML_Simulink
        numofaxles = numofaxles + 3;
        numoftraileraxles = numoftraileraxles + 3;
    elseif t2==2 && a==3 && d==1 && c==1
        bg2 = imread('semitrailer_3a+doll_1a.bmp');
        writesemidolly(1,3)
        Write_VRML_Simulink
        numofaxles = numofaxles + 4;
        numoftraileraxles = numoftraileraxles + 4;
    elseif t2==2 && a==4 && d==1 && c==1
        bg2 = imread('semitrailer_4a+doll_1a.bmp');
        writesemidolly(1,4)
        Write_VRML_Simulink
        numofaxles = numofaxles + 5;
        numoftraileraxles = numoftraileraxles + 5;
    elseif t2==2 && a==5 && d==1 && c==1
        bg2 = imread('semitrailer_5a+doll_1a.bmp');
        writesemidolly(1,5)
        Write_VRML_Simulink
        numofaxles = numofaxles + 6;
        numoftraileraxles = numoftraileraxles + 6;
    elseif t2==2 && a==1 && d==2 && c==1
        bg2 = imread('semitrailer_1a+doll_2a.bmp');
        writesemidolly(2,1)
        Write_VRML_Simulink
        numofaxles = numofaxles + 3;
        numoftraileraxles = numoftraileraxles + 3;
    elseif t2==2 && a==2 && d==2 && c==1
        bg2 = imread('semitrailer_2a+doll_2a.bmp');
        writesemidolly(2,2)
        Write_VRML_Simulink
        numofaxles = numofaxles + 4;
        numoftraileraxles = numoftraileraxles + 4;
    elseif t2==2 && a==3 && d==2 && c==1
        bg2 = imread('semitrailer_3a+doll_2a.bmp');
        writesemidolly(2,3)
        Write_VRML_Simulink
        numofaxles = numofaxles + 5;
        numoftraileraxles = numoftraileraxles + 5;
    elseif t2==2 && a==4 && d==2 && c==1
        bg2 = imread('semitrailer_4a+doll_2a.bmp');
        writesemidolly(2,4)
        Write_VRML_Simulink
        numofaxles = numofaxles + 6;
        numoftraileraxles = numoftraileraxles + 6;
    elseif t2==2 && a==5 && d==2 && c==1
        bg2 = imread('semitrailer_5a+doll_2a.bmp');
        writesemidolly(2,5)
        Write_VRML_Simulink
        numofaxles = numofaxles + 7;
        numoftraileraxles = numoftraileraxles + 7;
    elseif t2==3 && a==1 && c==1
        bg2 = imread('semitrailer+kingpin_1a.bmp');
        writesemiking(1)
        Write_VRML_Simulink
        numofaxles = numofaxles + 1;
        numoftraileraxles = numoftraileraxles + 1;
    elseif t2==3 && a==2 && c==1
        bg2 = imread('semitrailer+kingpin_2a.bmp');
        writesemiking(2)
        Write_VRML_Simulink
        numofaxles = numofaxles + 2;
        numoftraileraxles = numoftraileraxles + 2;
    elseif t2==3 && a==3 && c==1
        bg2 = imread('semitrailer+kingpin_3a.bmp');
        writesemiking(3)
        Write_VRML_Simulink
        numofaxles = numofaxles + 3;
        numoftraileraxles = numoftraileraxles + 3;
    elseif t2==3 && a==4 && c==1
        bg2 = imread('semitrailer+kingpin_4a.bmp');
        writesemiking(4)
        Write_VRML_Simulink
        numofaxles = numofaxles + 4;
        numoftraileraxles = numoftraileraxles + 4;
    elseif t2==3 && a==5 && c==1
        bg2 = imread('semitrailer+kingpin_5a.bmp');
        writesemiking(5)
        Write_VRML_Simulink
        numofaxles = numofaxles + 5;
        numoftraileraxles = numoftraileraxles + 5;
    elseif t2==4 && a==1 && d==1 && c==1
        bg2 = imread('semitrailer_1a+doll_1a+kingpin.bmp');
        writesemidollyking(1,1)
        Write_VRML_Simulink
        numofaxles = numofaxles + 2;
        numoftraileraxles = numoftraileraxles + 2;
    elseif t2==4 && a==2 && d==1 && c==1
        bg2 = imread('semitrailer_2a+doll_1a+kingpin.bmp');
        writesemidollyking(1,2)
        Write_VRML_Simulink
        numofaxles = numofaxles + 3;
        numoftraileraxles = numoftraileraxles + 3;
    elseif t2==4 && a==3 && d==1 && c==1
        bg2 = imread('semitrailer_3a+doll_1a+kingpin.bmp');
        writesemidollyking(1,3)
        Write_VRML_Simulink
        numofaxles = numofaxles + 4;
        numoftraileraxles = numoftraileraxles + 4;
    elseif t2==4 && a==4 && d==1 && c==1
        bg2 = imread('semitrailer_4a+doll_1a+kingpin.bmp');
        writesemidollyking(1,4)
        Write_VRML_Simulink
        numofaxles = numofaxles + 5;
        numoftraileraxles = numoftraileraxles + 5;
    elseif t2==4 && a==5 && d==1 && c==1
        bg2 = imread('semitrailer_5a+doll_1a+kingpin.bmp');
        writesemidollyking(1,5)
        Write_VRML_Simulink
        numofaxles = numofaxles + 6;
        numoftraileraxles = numoftraileraxles + 6;
    elseif t2==4 && a==1 && d==2 && c==1
        bg2 = imread('semitrailer_1a+doll_2a+kingpin.bmp');
        writesemidollyking(2,1)
        Write_VRML_Simulink
        numofaxles = numofaxles + 3;
        numoftraileraxles = numoftraileraxles + 3;
    elseif t2==4 && a==2 && d==2 && c==1
        bg2 = imread('semitrailer_2a+doll_2a+kingpin.bmp');
        writesemidollyking(2,2)
        Write_VRML_Simulink
        numofaxles = numofaxles + 4;
        numoftraileraxles = numoftraileraxles + 4;
    elseif t2==4 && a==3 && d==2 && c==1
        bg2 = imread('semitrailer_3a+doll_2a+kingpin.bmp');
        writesemidollyking(2,3)
        Write_VRML_Simulink
        numofaxles = numofaxles + 5;
        numoftraileraxles = numoftraileraxles + 5;
    elseif t2==4 && a==4 && d==2 && c==1
        bg2 = imread('semitrailer_4a+doll_2a+kingpin.bmp');
        writesemidollyking(2,4)
        Write_VRML_Simulink
        numofaxles = numofaxles + 6;
        numoftraileraxles = numoftraileraxles + 6;
    elseif t2==4 && a==5 && d==2 && c==1
        bg2 = imread('semitrailer_5a+doll_2a+kingpin.bmp');
        writesemidollyking(2,5)
        Write_VRML_Simulink
        numofaxles = numofaxles + 7;
        numoftraileraxles = numoftraileraxles + 7;
    elseif t2==5 && a==1 && c==1
        bg2 = imread('trailer_1a.bmp');
        writetrailer(1)
        Write_VRML_Simulink
        numofaxles = numofaxles + 1;
        numoftraileraxles = numoftraileraxles + 1;
    elseif t2==5 && a==2 && c==1
        bg2 = imread('trailer_2a.bmp');
        writetrailer(2)
        Write_VRML_Simulink
        numofaxles = numofaxles + 2;
        numoftraileraxles = numoftraileraxles + 2;
    elseif t2==5 && a==3 && c==1
        bg2 = imread('trailer_3a.bmp');
        writetrailer(3)
        Write_VRML_Simulink
        numofaxles = numofaxles + 3;
        numoftraileraxles = numoftraileraxles + 3;
    elseif t2==5 && a==4 && c==1
        bg2 = imread('trailer_4a.bmp');
        writetrailer(4)
        Write_VRML_Simulink
        numofaxles = numofaxles + 4;
        numoftraileraxles = numoftraileraxles + 4;
    elseif t2==6 && a==1 && c==1
        bg2 = imread('dbtrailer_1a.bmp');
        writedbtrailer(1)
        numofaxles = numofaxles + 1;
        numoftraileraxles = numoftraileraxles + 1;
    elseif t2==6 && a==2 && c==1
        bg2 = imread('dbtrailer_2a.bmp');
        writedbtrailer(2)
        Write_VRML_Simulink
        numofaxles = numofaxles + 2;
        numoftraileraxles = numoftraileraxles + 2;
    elseif t2==6 && a==3 && c==1
        bg2 = imread('dbtrailer_3a.bmp');
        writedbtrailer(3)
        Write_VRML_Simulink
        numofaxles = numofaxles + 3;
        numoftraileraxles = numoftraileraxles + 3;
    elseif t2==6 && a==4 && c==1
        bg2 = imread('dbtrailer_4a.bmp');
        writedbtrailer(4)
        Write_VRML_Simulink
        numofaxles = numofaxles + 4;
        numoftraileraxles = numoftraileraxles + 4;
    end

    h_vrsink=find_system('referenceblock','vrlib/VR Sink');
    h_vrsink=char(h_vrsink);
    x = get_param(h_vrsink, 'FieldsWritten');
    set_param(h_vrsink, 'FieldsWritten', [x,str],'Position',[400 10 500 10+num_of_nodes*10]);

elseif p==3
    truckname = [truckname,'_',p2name];
    if t2==1 && a==1 && c==1
        bg3 = imread('semitrailer_1a.bmp');
        writesemi(1)
        Write_VRML_Simulink
        numofaxles = numofaxles + 1;
        numoftraileraxles = numoftraileraxles + 1;
    elseif t2==1 && a==2 && c==1
        bg3 = imread('semitrailer_2a.bmp');
        writesemi(2)
        Write_VRML_Simulink
        numofaxles = numofaxles + 2;
        numoftraileraxles = numoftraileraxles + 2;
    elseif t2==1 && a==3 && c==1
        bg3 = imread('semitrailer_3a.bmp');
        writesemi(3)
        Write_VRML_Simulink
        numofaxles = numofaxles + 3;
        numoftraileraxles = numoftraileraxles + 3;
    elseif t2==1 && a==4 && c==1
        bg3 = imread('semitrailer_4a.bmp');
        writesemi(4)
        Write_VRML_Simulink
        numofaxles = numofaxles + 4;
        numoftraileraxles = numoftraileraxles + 4;
    elseif t2==1 && a==5 && c==1
        bg3 = imread('semitrailer_5a.bmp');
        writesemi(5)
        Write_VRML_Simulink
        numofaxles = numofaxles + 5;
        numoftraileraxles = numoftraileraxles + 5;
    elseif t2==2 && a==1 && d==1 && c==1
        bg3 = imread('semitrailer_1a+doll_1a.bmp');
        writesemidolly(1,1)
        Write_VRML_Simulink
        numofaxles = numofaxles + 2;
        numoftraileraxles = numoftraileraxles + 2;
    elseif t2==2 && a==2 && d==1 && c==1
        bg3 = imread('semitrailer_2a+doll_1a.bmp');
        writesemidolly(1,2)
        Write_VRML_Simulink
        numofaxles = numofaxles + 3;
        numoftraileraxles = numoftraileraxles + 3;
    elseif t2==2 && a==3 && d==1 && c==1
        bg3 = imread('semitrailer_3a+doll_1a.bmp');
        writesemidolly(1,3)
        Write_VRML_Simulink
        numofaxles = numofaxles + 4;
        numoftraileraxles = numoftraileraxles + 4;
    elseif t2==2 && a==4 && d==1 && c==1
        bg3 = imread('semitrailer_4a+doll_1a.bmp');
        writesemidolly(1,4)
        Write_VRML_Simulink
        numofaxles = numofaxles + 5;
        numoftraileraxles = numoftraileraxles + 5;
    elseif t2==2 && a==5 && d==1 && c==1
        bg3 = imread('semitrailer_5a+doll_1a.bmp');
        writesemidolly(1,5)
        Write_VRML_Simulink
        numofaxles = numofaxles + 6;
        numoftraileraxles = numoftraileraxles + 6;
    elseif t2==2 && a==1 && d==2 && c==1
        bg3 = imread('semitrailer_1a+doll_2a.bmp');
        writesemidolly(2,1)
        Write_VRML_Simulink
        numofaxles = numofaxles + 3;
        numoftraileraxles = numoftraileraxles + 3;
    elseif t2==2 && a==2 && d==2 && c==1
        bg3 = imread('semitrailer_2a+doll_2a.bmp');
        writesemidolly(2,2)
        Write_VRML_Simulink
        numofaxles = numofaxles + 4;
        numoftraileraxles = numoftraileraxles + 4;
    elseif t2==2 && a==3 && d==2 && c==1
        bg3 = imread('semitrailer_3a+doll_2a.bmp');
        writesemidolly(2,3)
        Write_VRML_Simulink
        numofaxles = numofaxles + 5;
        numoftraileraxles = numoftraileraxles + 5;
    elseif t2==2 && a==4 && d==2 && c==1
        bg3 = imread('semitrailer_4a+doll_2a.bmp');
        writesemidolly(2,4)
        Write_VRML_Simulink
        numofaxles = numofaxles + 6;
        numoftraileraxles = numoftraileraxles + 6;
    elseif t2==2 && a==5 && d==2 && c==1
        bg3 = imread('semitrailer_5a+doll_2a.bmp');
        writesemidolly(2,5)
        Write_VRML_Simulink
        numofaxles = numofaxles + 7;
        numoftraileraxles = numoftraileraxles + 7;
    elseif t2==3 && a==1 && c==1
        bg3 = imread('semitrailer+kingpin_1a.bmp');
        writesemiking(1)
        Write_VRML_Simulink
        numofaxles = numofaxles + 1;
        numoftraileraxles = numoftraileraxles + 1;
    elseif t2==3 && a==2 && c==1
        bg3 = imread('semitrailer+kingpin_2a.bmp');
        writesemiking(2)
        Write_VRML_Simulink
        numofaxles = numofaxles + 2;
        numoftraileraxles = numoftraileraxles + 2;
    elseif t2==3 && a==3 && c==1
        bg3 = imread('semitrailer+kingpin_3a.bmp');
        writesemiking(3)
        Write_VRML_Simulink
        numofaxles = numofaxles + 3;
        numoftraileraxles = numoftraileraxles + 3;
    elseif t2==3 && a==4 && c==1
        bg3 = imread('semitrailer+kingpin_4a.bmp');
        writesemiking(4)
        Write_VRML_Simulink
        numofaxles = numofaxles + 4;
       numoftraileraxles = numoftraileraxles + 4; 
    elseif t2==3 && a==5 && c==1
        bg3 = imread('semitrailer+kingpin_5a.bmp');
        writesemiking(5)
        Write_VRML_Simulink
        numofaxles = numofaxles + 5;
        numoftraileraxles = numoftraileraxles + 5;
    elseif t2==4 && a==1 && d==1 && c==1
        bg3 = imread('semitrailer_1a+doll_1a+kingpin.bmp');
        writesemidollyking(1,1)
        Write_VRML_Simulink
        numofaxles = numofaxles + 2;
        numoftraileraxles = numoftraileraxles + 2;
    elseif t2==4 && a==2 && d==1 && c==1
        bg3 = imread('semitrailer_2a+doll_1a+kingpin.bmp');
        writesemidollyking(1,2)
        Write_VRML_Simulink
        numofaxles = numofaxles + 3;
        numoftraileraxles = numoftraileraxles + 3;
    elseif t2==4 && a==3 && d==1 && c==1
        bg3 = imread('semitrailer_3a+doll_1a+kingpin.bmp');
        writesemidollyking(1,3)
        Write_VRML_Simulink
        numofaxles = numofaxles + 4;
        numoftraileraxles = numoftraileraxles + 4;
    elseif t2==4 && a==4 && d==1 && c==1
        bg3 = imread('semitrailer_4a+doll_1a+kingpin.bmp');
        writesemidollyking(1,4)
        Write_VRML_Simulink
        numofaxles = numofaxles + 5;
        numoftraileraxles = numoftraileraxles + 5;
    elseif t2==4 && a==5 && d==1 && c==1
        bg3 = imread('semitrailer_5a+doll_1a+kingpin.bmp');
        writesemidollyking(1,5)
        Write_VRML_Simulink
        numofaxles = numofaxles + 6;
        numoftraileraxles = numoftraileraxles + 6;
    elseif t2==4 && a==1 && d==2 && c==1
        bg3 = imread('semitrailer_1a+doll_2a+kingpin.bmp');
        writesemidollyking(2,1)
        Write_VRML_Simulink
        numofaxles = numofaxles + 3;
        numoftraileraxles = numoftraileraxles + 3;
    elseif t2==4 && a==2 && d==2 && c==1
        bg3 = imread('semitrailer_2a+doll_2a+kingpin.bmp');
        writesemidollyking(2,2)
        Write_VRML_Simulink
        numofaxles = numofaxles + 4;
        numoftraileraxles = numoftraileraxles + 4;
    elseif t2==4 && a==3 && d==2 && c==1
        bg3 = imread('semitrailer_3a+doll_2a+kingpin.bmp');
        writesemidollyking(2,3)
        Write_VRML_Simulink
        numofaxles = numofaxles + 5;
        numoftraileraxles = numoftraileraxles + 5;
    elseif t2==4 && a==4 && d==2 && c==1
        bg3 = imread('semitrailer_4a+doll_2a+kingpin.bmp');
        writesemidollyking(2,4)
        Write_VRML_Simulink
        numofaxles = numofaxles + 6;
        numoftraileraxles = numoftraileraxles + 6; 
    elseif t2==4 && a==5 && d==2 && c==1
        bg3 = imread('semitrailer_5a+doll_2a+kingpin.bmp');
        writesemidollyking(2,5)
        Write_VRML_Simulink
        numofaxles = numofaxles + 7;
        numoftraileraxles = numoftraileraxles + 7;
    elseif t2==5 && a==1 && c==1
        bg3 = imread('trailer_1a.bmp');
        writetrailer(1)
        Write_VRML_Simulink
        numofaxles = numofaxles + 1;
        numoftraileraxles = numoftraileraxles + 1;
    elseif t2==5 && a==2 && c==1
        bg3 = imread('trailer_2a.bmp');
        writetrailer(2)
        Write_VRML_Simulink
        numofaxles = numofaxles + 2;
        numoftraileraxles = numoftraileraxles + 2;
    elseif t2==5 && a==3 && c==1
        bg3 = imread('trailer_3a.bmp');
        writetrailer(3)
        Write_VRML_Simulink
        numofaxles = numofaxles + 3;
        numoftraileraxles = numoftraileraxles + 3;
    elseif t2==5 && a==4 && c==1
        bg3 = imread('trailer_4a.bmp');
        writetrailer(4)
        Write_VRML_Simulink
        numofaxles = numofaxles + 4;
        numoftraileraxles = numoftraileraxles + 4;
    elseif t2==6 && a==1 && c==1
        bg3 = imread('dbtrailer_1a.bmp');
        writedbtrailer(1)
        Write_VRML_Simulink
        numofaxles = numofaxles + 1;
        numoftraileraxles = numoftraileraxles + 1;
    elseif t2==6 && a==2 && c==1
        bg3 = imread('dbtrailer_2a.bmp');
        writedbtrailer(2)
        Write_VRML_Simulink
        numofaxles = numofaxles + 2;
        numoftraileraxles = numoftraileraxles + 2;
    elseif t2==6 && a==3 && c==1
        bg3 = imread('dbtrailer_3a.bmp');
        writedbtrailer(3)
        Write_VRML_Simulink
        numofaxles = numofaxles + 3;
        numoftraileraxles = numoftraileraxles + 3;
    elseif t2==6 && a==4 && c==1
        bg3 = imread('dbtrailer_4a.bmp');
        writedbtrailer(4)
        Write_VRML_Simulink
        numofaxles = numofaxles + 4;
        numoftraileraxles = numoftraileraxles + 4;
    end

    h_vrsink=find_system('referenceblock','vrlib/VR Sink');
    h_vrsink=char(h_vrsink);
    x = get_param(h_vrsink, 'FieldsWritten');
    set_param(h_vrsink, 'FieldsWritten', [x,str],'Position',[400 10 500 10+num_of_nodes*10]);

elseif p==4
    truckname = [truckname,'_',p2name];
    if t2==1 && a==1 && c==1
        bg4 = imread('semitrailer_1a.bmp');
        writesemi(1)
        Write_VRML_Simulink
        numofaxles = numofaxles + 1;
        numoftraileraxles = numoftraileraxles + 1;
    elseif t2==1 && a==2 && c==1
        bg4 = imread('semitrailer_2a.bmp');
        writesemi(2)
        Write_VRML_Simulink
        numofaxles = numofaxles + 2;
        numoftraileraxles = numoftraileraxles + 2;
    elseif t2==1 && a==3 && c==1
        bg4 = imread('semitrailer_3a.bmp');
        writesemi(3)
        Write_VRML_Simulink
        numofaxles = numofaxles + 3;
        numoftraileraxles = numoftraileraxles + 3;
    elseif t2==1 && a==4 && c==1
        bg4 = imread('semitrailer_4a.bmp');
        writesemi(4)
        Write_VRML_Simulink
        numofaxles = numofaxles + 4;
        numoftraileraxles = numoftraileraxles + 4;
    elseif t2==1 && a==5 && c==1
        bg4 = imread('semitrailer_5a.bmp');
        writesemi(5)
        Write_VRML_Simulink
        numofaxles = numofaxles + 5;
        numoftraileraxles = numoftraileraxles + 5;
    elseif t2==2 && a==1 && d==1 && c==1
        bg4 = imread('semitrailer_1a+doll_1a.bmp');
        writesemidolly(1,1)
        Write_VRML_Simulink
        numofaxles = numofaxles + 2;
        numoftraileraxles = numoftraileraxles + 2;
    elseif t2==2 && a==2 && d==1 && c==1
        bg4 = imread('semitrailer_2a+doll_1a.bmp');
        writesemidolly(1,2)
        Write_VRML_Simulink
        numofaxles = numofaxles + 3;
        numoftraileraxles = numoftraileraxles + 3;
    elseif t2==2 && a==3 && d==1 && c==1
        bg4 = imread('semitrailer_3a+doll_1a.bmp');
        writesemidolly(1,3)
        Write_VRML_Simulink
        numofaxles = numofaxles + 4;
        numoftraileraxles = numoftraileraxles + 4;
    elseif t2==2 && a==4 && d==1 && c==1
        bg4 = imread('semitrailer_4a+doll_1a.bmp');
        writesemidolly(1,4)
        Write_VRML_Simulink
        numofaxles = numofaxles + 5;
        numoftraileraxles = numoftraileraxles + 5;
    elseif t2==2 && a==5 && d==1 && c==1
        bg4 = imread('semitrailer_5a+doll_1a.bmp');
        writesemidolly(1,5)
        Write_VRML_Simulink
        numofaxles = numofaxles + 6;
        numoftraileraxles = numoftraileraxles + 6;
    elseif t2==2 && a==1 && d==2 && c==1
        bg4 = imread('semitrailer_1a+doll_2a.bmp');
        writesemidolly(2,1)
        Write_VRML_Simulink
        numofaxles = numofaxles + 3;
        numoftraileraxles = numoftraileraxles + 3;
    elseif t2==2 && a==2 && d==2 && c==1
        bg4 = imread('semitrailer_2a+doll_2a.bmp');
        writesemidolly(2,2)
        Write_VRML_Simulink
        numofaxles = numofaxles + 4;
        numoftraileraxles = numoftraileraxles + 4;
    elseif t2==2 && a==3 && d==2 && c==1
        bg4 = imread('semitrailer_3a+doll_2a.bmp');
        writesemidolly(2,3)
        Write_VRML_Simulink
        numofaxles = numofaxles + 5;
        numoftraileraxles = numoftraileraxles + 5;
    elseif t2==2 && a==4 && d==2 && c==1
        bg4 = imread('semitrailer_4a+doll_2a.bmp');
        writesemidolly(2,4)
        Write_VRML_Simulink
        numofaxles = numofaxles + 6;
        numoftraileraxles = numoftraileraxles + 6;
    elseif t2==2 && a==5 && d==2 && c==1
        bg4 = imread('semitrailer_5a+doll_2a.bmp');
        writesemidolly(2,5)
        Write_VRML_Simulink
        numofaxles = numofaxles + 7;
        numoftraileraxles = numoftraileraxles + 7;
    elseif t2==3 && a==1 && c==1
        bg4 = imread('semitrailer+kingpin_1a.bmp');
        writesemiking(1)
        Write_VRML_Simulink
        numofaxles = numofaxles + 1;
        numoftraileraxles = numoftraileraxles + 1;
    elseif t2==3 && a==2 && c==1
        bg4 = imread('semitrailer+kingpin_2a.bmp');
        writesemiking(2)
        Write_VRML_Simulink
        numofaxles = numofaxles + 2;
        numoftraileraxles = numoftraileraxles + 2;
    elseif t2==3 && a==3 && c==1
        bg4 = imread('semitrailer+kingpin_3a.bmp');
        writesemiking(3)
        Write_VRML_Simulink
        numofaxles = numofaxles + 3;
        numoftraileraxles = numoftraileraxles + 3;
    elseif t2==3 && a==4 && c==1
        bg4 = imread('semitrailer+kingpin_4a.bmp');
        writesemiking(4)
        Write_VRML_Simulink
        numofaxles = numofaxles + 4;
        numoftraileraxles = numoftraileraxles + 4;
    elseif t2==3 && a==5 && c==1
        bg4 = imread('semitrailer+kingpin_5a.bmp');
        writesemiking(5)
        Write_VRML_Simulink
        numofaxles = numofaxles + 5;
        numoftraileraxles = numoftraileraxles + 5;
    elseif t2==4 && a==1 && d==1 && c==1
        bg4 = imread('semitrailer_1a+doll_1a+kingpin.bmp');
        writesemidollyking(1,1)
        Write_VRML_Simulink
        numofaxles = numofaxles + 2;
        numoftraileraxles = numoftraileraxles + 2;
    elseif t2==4 && a==2 && d==1 && c==1
        bg4 = imread('semitrailer_2a+doll_1a+kingpin.bmp');
        writesemidollyking(1,2)
        Write_VRML_Simulink
        numofaxles = numofaxles + 3;
        numoftraileraxles = numoftraileraxles + 3;
    elseif t2==4 && a==3 && d==1 && c==1
        bg4 = imread('semitrailer_3a+doll_1a+kingpin.bmp');
        writesemidollyking(1,3)
        Write_VRML_Simulink
        numofaxles = numofaxles + 4;
        numoftraileraxles = numoftraileraxles + 4;
    elseif t2==4 && a==4 && d==1 && c==1
        bg4 = imread('semitrailer_4a+doll_1a+kingpin.bmp');
        writesemidollyking(1,4)
        Write_VRML_Simulink
        numofaxles = numofaxles + 5;
        numoftraileraxles = numoftraileraxles + 5;
    elseif t2==4 && a==5 && d==1 && c==1
        bg4 = imread('semitrailer_5a+doll_1a+kingpin.bmp');
        writesemidollyking(1,5)
        Write_VRML_Simulink
        numofaxles = numofaxles + 6;
        numoftraileraxles = numoftraileraxles + 6;
    elseif t2==4 && a==1 && d==2 && c==1
        bg4 = imread('semitrailer_1a+doll_2a+kingpin.bmp');
        writesemidollyking(2,1)
        Write_VRML_Simulink
        numofaxles = numofaxles + 3;
        numoftraileraxles = numoftraileraxles + 3;
    elseif t2==4 && a==2 && d==2 && c==1
        bg4 = imread('semitrailer_2a+doll_2a+kingpin.bmp');
        writesemidollyking(2,2)
        Write_VRML_Simulink
        numofaxles = numofaxles + 4;
        numoftraileraxles = numoftraileraxles + 4;
    elseif t2==4 && a==3 && d==2 && c==1
        bg4 = imread('semitrailer_3a+doll_2a+kingpin.bmp');
        writesemidollyking(2,3)
        Write_VRML_Simulink
        numofaxles = numofaxles + 5;
        numoftraileraxles = numoftraileraxles + 5;
    elseif t2==4 && a==4 && d==2 && c==1
        bg4 = imread('semitrailer_4a+doll_2a+kingpin.bmp');
        writesemidollyking(2,4)
        Write_VRML_Simulink
        numofaxles = numofaxles + 6;
        numoftraileraxles = numoftraileraxles + 6;
    elseif t2==4 && a==5 && d==2 && c==1
        bg4 = imread('semitrailer_5a+doll_2a+kingpin.bmp');
        writesemidollyking(2,5)
        Write_VRML_Simulink
        numofaxles = numofaxles + 7;
        numoftraileraxles = numoftraileraxles + 7;
    elseif t2==5 && a==1 && c==1
        bg4 = imread('trailer_1a.bmp');
        writetrailer(1)
        Write_VRML_Simulink
        numofaxles = numofaxles + 1;
        numoftraileraxles = numoftraileraxles + 1;
    elseif t2==5 && a==2 && c==1
        bg4 = imread('trailer_2a.bmp');
        writetrailer(2)
        Write_VRML_Simulink
        numofaxles = numofaxles + 2;
        numoftraileraxles = numoftraileraxles + 2;
    elseif t2==5 && a==3 && c==1
        bg4 = imread('trailer_3a.bmp');
        writetrailer(3)
        Write_VRML_Simulink
        numofaxles = numofaxles + 3;
        numoftraileraxles = numoftraileraxles + 3;
    elseif t2==5 && a==4 && c==1
        bg4 = imread('trailer_4a.bmp');
        writetrailer(4)
        Write_VRML_Simulink
       numofaxles = numofaxles + 4; 
       numoftraileraxles = numoftraileraxles + 4;
    elseif t2==6 && a==1 && c==1
        bg4 = imread('dbtrailer_1a.bmp');
        writedbtrailer(1)
        Write_VRML_Simulink
        numofaxles = numofaxles + 1;
        numoftraileraxles = numoftraileraxles + 1;
    elseif t2==6 && a==2 && c==1
        bg4 = imread('dbtrailer_2a.bmp');
        writedbtrailer(2)
        Write_VRML_Simulink
        numofaxles = numofaxles + 2;
        numoftraileraxles = numoftraileraxles + 2;
    elseif t2==6 && a==3 && c==1
        bg4 = imread('dbtrailer_3a.bmp');
        writedbtrailer(3)
        Write_VRML_Simulink
        numofaxles = numofaxles + 3;
        numoftraileraxles = numoftraileraxles + 3;
    elseif t2==6 && a==4 && c==1
        bg4 = imread('dbtrailer_4a.bmp');
        writedbtrailer(4)
        Write_VRML_Simulink
        numofaxles = numofaxles + 4;
        numoftraileraxles = numoftraileraxles + 4;
    end

    h_vrsink=find_system('referenceblock','vrlib/VR Sink');
    h_vrsink=char(h_vrsink);
    x = get_param(h_vrsink, 'FieldsWritten');
    set_param(h_vrsink, 'FieldsWritten', [x,str],'Position',[400 10 500 10+num_of_nodes*10]);

elseif p==5
    truckname = [truckname,'_',p2name];
    if t2==1 && a==1 && c==1
        bg5 = imread('semitrailer_1a.bmp');
        writesemi(1)
        Write_VRML_Simulink
        numofaxles = numofaxles + 1;
        numoftraileraxles = numoftraileraxles + 1;
    elseif t2==1 && a==2 && c==1
        bg5 = imread('semitrailer_2a.bmp');
        writesemi(2)
        Write_VRML_Simulink
        numofaxles = numofaxles + 2;
        numoftraileraxles = numoftraileraxles + 2;
    elseif t2==1 && a==3 && c==1
        bg5 = imread('semitrailer_3a.bmp');
        writesemi(3)
        Write_VRML_Simulink
        numofaxles = numofaxles + 3;
        numoftraileraxles = numoftraileraxles + 3;
    elseif t2==1 && a==4 && c==1
        bg5 = imread('semitrailer_4a.bmp');
        writesemi(4)
        Write_VRML_Simulink
        numofaxles = numofaxles + 4;
        numoftraileraxles = numoftraileraxles + 4;
    elseif t2==1 && a==5 && c==1
        bg5 = imread('semitrailer_5a.bmp');
        writesemi(5)
        Write_VRML_Simulink
        numofaxles = numofaxles + 5;
        numoftraileraxles = numoftraileraxles + 5;
    elseif t2==2 && a==1 && d==1 && c==1
        bg5 = imread('semitrailer_1a+doll_1a.bmp');
        writesemidolly(1,1)
        Write_VRML_Simulink
        numofaxles = numofaxles + 2;
        numoftraileraxles = numoftraileraxles + 2;
    elseif t2==2 && a==2 && d==1 && c==1
        bg5 = imread('semitrailer_2a+doll_1a.bmp');
        writesemidolly(1,2)
        Write_VRML_Simulink
        numofaxles = numofaxles + 3;
        numoftraileraxles = numoftraileraxles + 3;
    elseif t2==2 && a==3 && d==1 && c==1
        bg5 = imread('semitrailer_3a+doll_1a.bmp');
        writesemidolly(1,3)
        Write_VRML_Simulink
        numofaxles = numofaxles + 4;
        numoftraileraxles = numoftraileraxles + 4;
    elseif t2==2 && a==4 && d==1 && c==1
        bg5 = imread('semitrailer_4a+doll_1a.bmp');
        writesemidolly(1,4)
        Write_VRML_Simulink
        numofaxles = numofaxles + 5;
        numoftraileraxles = numoftraileraxles + 5;
    elseif t2==2 && a==5 && d==1 && c==1
        bg5 = imread('semitrailer_5a+doll_1a.bmp');
        writesemidolly(1,5)
        Write_VRML_Simulink
        numofaxles = numofaxles + 6;
        numoftraileraxles = numoftraileraxles + 6;
    elseif t2==2 && a==1 && d==2 && c==1
        bg5 = imread('semitrailer_1a+doll_2a.bmp');
        writesemidolly(2,1)
        Write_VRML_Simulink
        numofaxles = numofaxles + 3;
        numoftraileraxles = numoftraileraxles + 3;
    elseif t2==2 && a==2 && d==2 && c==1
        bg5 = imread('semitrailer_2a+doll_2a.bmp');
        writesemidolly(2,2)
        Write_VRML_Simulink
        numofaxles = numofaxles + 4;
        numoftraileraxles = numoftraileraxles + 4;
    elseif t2==2 && a==3 && d==2 && c==1
        bg5 = imread('semitrailer_3a+doll_2a.bmp');
        writesemidolly(2,3)
        Write_VRML_Simulink
        numofaxles = numofaxles + 5;
        numoftraileraxles = numoftraileraxles + 5;
    elseif t2==2 && a==4 && d==2 && c==1
        bg5 = imread('semitrailer_4a+doll_2a.bmp');
        writesemidolly(2,4)
        Write_VRML_Simulink
        numofaxles = numofaxles + 6;
        numoftraileraxles = numoftraileraxles + 6;
    elseif t2==2 && a==5 && d==2 && c==1
        bg5 = imread('semitrailer_5a+doll_2a.bmp');
        writesemidolly(2,5)
        Write_VRML_Simulink
        numofaxles = numofaxles + 7;
        numoftraileraxles = numoftraileraxles + 7;
    elseif t2==3 && a==1 && c==1
        bg5 = imread('semitrailer+kingpin_1a.bmp');
        writesemiking(1)
        Write_VRML_Simulink
        numofaxles = numofaxles + 1;
        numoftraileraxles = numoftraileraxles + 1;
    elseif t2==3 && a==2 && c==1
        bg5 = imread('semitrailer+kingpin_2a.bmp');
        writesemiking(2)
        Write_VRML_Simulink
        numofaxles = numofaxles + 2;
        numoftraileraxles = numoftraileraxles + 2;
    elseif t2==3 && a==3 && c==1
        bg5 = imread('semitrailer+kingpin_3a.bmp');
        writesemiking(3)
        Write_VRML_Simulink
        numofaxles = numofaxles + 3;
        numoftraileraxles = numoftraileraxles + 3;
    elseif t2==3 && a==4 && c==1
        bg5 = imread('semitrailer+kingpin_4a.bmp');
        writesemiking(4)
        Write_VRML_Simulink
        numofaxles = numofaxles + 4;
        numoftraileraxles = numoftraileraxles + 4;
    elseif t2==3 && a==5 && c==1
        bg5 = imread('semitrailer+kingpin_5a.bmp');
        writesemiking(5)
        Write_VRML_Simulink
        numofaxles = numofaxles + 5;
        numoftraileraxles = numoftraileraxles + 5;
    elseif t2==4 && a==1 && d==1 && c==1
        bg5 = imread('semitrailer_1a+doll_1a+kingpin.bmp');
        writesemidollyking(1,1)
        Write_VRML_Simulink
        numofaxles = numofaxles + 2;
       numoftraileraxles = numoftraileraxles + 2; 
    elseif t2==4 && a==2 && d==1 && c==1
        bg5 = imread('semitrailer_2a+doll_1a+kingpin.bmp');
        writesemidollyking(1,2)
        Write_VRML_Simulink
        numofaxles = numofaxles + 3;
        numoftraileraxles = numoftraileraxles + 3;
    elseif t2==4 && a==3 && d==1 && c==1
        bg5 = imread('semitrailer_3a+doll_1a+kingpin.bmp');
        writesemidollyking(1,3)
        Write_VRML_Simulink
        numofaxles = numofaxles + 4;
        numoftraileraxles = numoftraileraxles + 4;
    elseif t2==4 && a==4 && d==1 && c==1
        bg5 = imread('semitrailer_4a+doll_1a+kingpin.bmp');
        writesemidollyking(1,4)
        Write_VRML_Simulink
        numofaxles = numofaxles + 5;
        numoftraileraxles = numoftraileraxles + 5;
    elseif t2==4 && a==5 && d==1 && c==1
        bg5 = imread('semitrailer_5a+doll_1a+kingpin.bmp');
       writesemidollyking(1,5) 
       Write_VRML_Simulink
       numofaxles = numofaxles + 6;
       numoftraileraxles = numoftraileraxles + 6;
    elseif t2==4 && a==1 && d==2 && c==1
        bg5 = imread('semitrailer_1a+doll_2a+kingpin.bmp');
        writesemidollyking(2,1)
        Write_VRML_Simulink
        numofaxles = numofaxles + 3;
        numoftraileraxles = numoftraileraxles + 3;
    elseif t2==4 && a==2 && d==2 && c==1
        bg5 = imread('semitrailer_2a+doll_2a+kingpin.bmp');
        writesemidollyking(2,2)
        Write_VRML_Simulink
        numofaxles = numofaxles + 4;
        numoftraileraxles = numoftraileraxles + 4;
    elseif t2==4 && a==3 && d==2 && c==1
        bg5 = imread('semitrailer_3a+doll_2a+kingpin.bmp');
        writesemidollyking(2,3)
        Write_VRML_Simulink
        numofaxles = numofaxles + 5;
        numoftraileraxles = numoftraileraxles + 5;
    elseif t2==4 && a==4 && d==2 && c==1
        bg5 = imread('semitrailer_4a+doll_2a+kingpin.bmp');
        writesemidollyking(2,4)
        Write_VRML_Simulink
        numofaxles = numofaxles + 6;
        numoftraileraxles = numoftraileraxles + 6;
    elseif t2==4 && a==5 && d==2 && c==1
        bg5 = imread('semitrailer_5a+doll_2a+kingpin.bmp');
        writesemidollyking(2,5)
        Write_VRML_Simulink
       numofaxles = numofaxles + 7; 
       numoftraileraxles = numoftraileraxles + 7;
    elseif t2==5 && a==1 && c==1
        bg5 = imread('trailer_1a.bmp');
        writetrailer(1)
        Write_VRML_Simulink
        numofaxles = numofaxles + 1;
        numoftraileraxles = numoftraileraxles + 1;
    elseif t2==5 && a==2 && c==1
        bg5 = imread('trailer_2a.bmp');
        writetrailer(2)
        Write_VRML_Simulink
        numofaxles = numofaxles + 2;
        numoftraileraxles = numoftraileraxles + 2;
    elseif t2==5 && a==3 && c==1
        bg5 = imread('trailer_3a.bmp');
        writetrailer(3)
        Write_VRML_Simulink
        numofaxles = numofaxles + 3;
        numoftraileraxles = numoftraileraxles + 3;
    elseif t2==5 && a==4 && c==1
        bg5 = imread('trailer_4a.bmp');
        writetrailer(4)
        Write_VRML_Simulink
        numofaxles = numofaxles + 4;
        numoftraileraxles = numoftraileraxles + 4;
    elseif t2==6 && a==1 && c==1
        bg5 = imread('dbtrailer_1a.bmp');
        writedbtrailer(1)
        Write_VRML_Simulink
        numofaxles = numofaxles + 1;
        numoftraileraxles = numoftraileraxles + 1;
    elseif t2==6 && a==2 && c==1
        bg5 = imread('dbtrailer_2a.bmp');
        writedbtrailer(2)
        Write_VRML_Simulink
        numofaxles = numofaxles + 2;
        numoftraileraxles = numoftraileraxles + 2;
    elseif t2==6 && a==3 && c==1
        bg5 = imread('dbtrailer_3a.bmp');
        writedbtrailer(3)
        Write_VRML_Simulink
        numofaxles = numofaxles + 3;
        numoftraileraxles = numoftraileraxles + 3;
    elseif t2==6 && a==4 && c==1
        bg5 = imread('dbtrailer_4a.bmp');
       writedbtrailer(4) 
       Write_VRML_Simulink
       numofaxles = numofaxles + 4;
       numoftraileraxles = numoftraileraxles + 4;
    end

    h_vrsink=find_system('referenceblock','vrlib/VR Sink');
    h_vrsink=char(h_vrsink);
    x = get_param(h_vrsink, 'FieldsWritten');
    set_param(h_vrsink, 'FieldsWritten', [x,str],'Position',[400 10 500 10+num_of_nodes*10]);
end

if p==2
    t1=0;
end

if t1 == 1
    num_of_outputs = 24;
    left_offset = 235;
    height_offset = 10;
elseif t1 == 2 || t1 == 3
    num_of_outputs = 26;
    left_offset = 235;
    height_offset = 10;
end

if t1 == 1 && a == 2 % tractor 2 axles
    add_block('simulink/Signal Routing/Demux',[Name,'/Demux',num2str(p)],'outputs','24','Position',[left_offset height_offset left_offset+5 num_of_outputs*10]);
    A = get_param([Name, '/Demux',num2str(p)],'Position');
    add_block('simulink/Sources/From Workspace',[Name,'/From Workspace',num2str(p)],'Position',[150 height_offset+((A(4)-A(2))/2-10) 200 height_offset+((A(4)-A(2))/2+10)]);
    set_param([Name,'/From Workspace',num2str(p)],'VariableName','VR.tractor')
    FromWorkspaceHandles = get_param([Name,'/From Workspace',num2str(p)],'PortHandles');
    SubsysPortHandles = get_param([Name,'/VR sink'],'PortHandles');
    ScopePortHandles = get_param([Name,'/Demux',num2str(p)],'PortHandles');
    add_line(Name,FromWorkspaceHandles.Outport(1),ScopePortHandles.Inport(1),'autorouting','on');
    for u = 1:24
        add_line(Name,ScopePortHandles.Outport(u),SubsysPortHandles.Inport(u),'autorouting','on');
    end
elseif t1 == 1 && a == 3 % tractor 3 axles
    add_block('simulink/Signal Routing/Demux',[Name,'/Demux',num2str(p)],'outputs','34','Position',[left_offset height_offset left_offset+5 num_of_outputs*10+10*10]);
    A = get_param([Name, '/Demux',num2str(p)],'Position');
    add_block('simulink/Sources/From Workspace',[Name,'/From Workspace',num2str(p)],'Position',[150 height_offset+((A(4)-A(2))/2-10) 200 height_offset+((A(4)-A(2))/2+10)]);
    set_param([Name,'/From Workspace',num2str(p)],'VariableName','VR.tractor')
    FromWorkspaceHandles = get_param([Name,'/From Workspace',num2str(p)],'PortHandles');
    SubsysPortHandles = get_param([Name,'/VR sink'],'PortHandles');
    ScopePortHandles = get_param([Name,'/Demux',num2str(p)],'PortHandles');
    add_line(Name,FromWorkspaceHandles.Outport(1),ScopePortHandles.Inport(1),'autorouting','on');
    for u = 1:34
        add_line(Name,ScopePortHandles.Outport(u),SubsysPortHandles.Inport(u),'autorouting','on');
    end
elseif t1 == 1 && a == 4 % tractor 4 axles
    add_block('simulink/Signal Routing/Demux',[Name,'/Demux',num2str(p)],'outputs','40','Position',[left_offset height_offset left_offset+5 num_of_outputs*10+20*10]);
    A = get_param([Name, '/Demux',num2str(p)],'Position');
    add_block('simulink/Sources/From Workspace',[Name,'/From Workspace',num2str(p)],'Position',[150 height_offset+((A(4)-A(2))/2-10) 200 height_offset+((A(4)-A(2))/2+10)]);
    set_param([Name,'/From Workspace',num2str(p)],'VariableName','VR.tractor')
    FromWorkspaceHandles = get_param([Name,'/From Workspace',num2str(p)],'PortHandles');
    SubsysPortHandles = get_param([Name,'/VR sink'],'PortHandles');
    ScopePortHandles = get_param([Name,'/Demux',num2str(p)],'PortHandles');
    add_line(Name,FromWorkspaceHandles.Outport(1),ScopePortHandles.Inport(1),'autorouting','on');
    for u = 1:40
        add_line(Name,ScopePortHandles.Outport(u),SubsysPortHandles.Inport(u),'autorouting','on');
    end
elseif (t1 == 2 || t1 == 3) && a == 2  % truck 2 axles
    add_block('simulink/Signal Routing/Demux',[Name,'/Demux',num2str(p)],'outputs','26','Position',[left_offset height_offset left_offset+5 num_of_outputs*10]);
    A = get_param([Name, '/Demux',num2str(p)],'Position');
    add_block('simulink/Sources/From Workspace',[Name,'/From Workspace',num2str(p)],'Position',[150 height_offset+((A(4)-A(2))/2-10) 200 height_offset+((A(4)-A(2))/2+10)]);
    set_param([Name,'/From Workspace',num2str(p)],'VariableName','VR.tractor')
    FromWorkspaceHandles = get_param([Name,'/From Workspace',num2str(p)],'PortHandles');
    SubsysPortHandles = get_param([Name,'/VR sink'],'PortHandles');
    ScopePortHandles = get_param([Name,'/Demux',num2str(p)],'PortHandles');
    add_line(Name,FromWorkspaceHandles.Outport(1),ScopePortHandles.Inport(1),'autorouting','on');
    for u = 1:26
        add_line(Name,ScopePortHandles.Outport(u),SubsysPortHandles.Inport(u),'autorouting','on');
    end
elseif (t1 == 2 || t1 == 3) && a == 3  % truck 3 axles
    add_block('simulink/Signal Routing/Demux',[Name,'/Demux',num2str(p)],'outputs','36','Position',[left_offset height_offset left_offset+5 num_of_outputs*10+10*10]);
    A = get_param([Name, '/Demux',num2str(p)],'Position');
    add_block('simulink/Sources/From Workspace',[Name,'/From Workspace',num2str(p)],'Position',[150 height_offset+((A(4)-A(2))/2-10) 200 height_offset+((A(4)-A(2))/2+10)]);
    set_param([Name,'/From Workspace',num2str(p)],'VariableName','VR.tractor')
    FromWorkspaceHandles = get_param([Name,'/From Workspace',num2str(p)],'PortHandles');
    SubsysPortHandles = get_param([Name,'/VR sink'],'PortHandles');
    ScopePortHandles = get_param([Name,'/Demux',num2str(p)],'PortHandles');
    add_line(Name,FromWorkspaceHandles.Outport(1),ScopePortHandles.Inport(1),'autorouting','on');
    for u = 1:36
        add_line(Name,ScopePortHandles.Outport(u),SubsysPortHandles.Inport(u),'autorouting','on');
    end
elseif (t1 == 2 || t1 == 3) && a == 4  % truck 4 axles
    add_block('simulink/Signal Routing/Demux',[Name,'/Demux',num2str(p)],'outputs','42','Position',[left_offset height_offset left_offset+5 num_of_outputs*10+20*10]);
    A = get_param([Name, '/Demux',num2str(p)],'Position');
    add_block('simulink/Sources/From Workspace',[Name,'/From Workspace',num2str(p)],'Position',[150 height_offset+((A(4)-A(2))/2-10) 200 height_offset+((A(4)-A(2))/2+10)]);
    set_param([Name,'/From Workspace',num2str(p)],'VariableName','VR.tractor')
    FromWorkspaceHandles = get_param([Name,'/From Workspace',num2str(p)],'PortHandles');
    SubsysPortHandles = get_param([Name,'/VR sink'],'PortHandles');
    ScopePortHandles = get_param([Name,'/Demux',num2str(p)],'PortHandles');
    add_line(Name,FromWorkspaceHandles.Outport(1),ScopePortHandles.Inport(1),'autorouting','on');
    for u = 1:42
        add_line(Name,ScopePortHandles.Outport(u),SubsysPortHandles.Inport(u),'autorouting','on');
    end
end

if t2 ~= 0
    A = get_param([Name, '/Demux',num2str(p-1)],'Position');

    if t2 == 1
        num_of_outputs = 14;
        left_offset = 235;
        height_offset = 5+A(4);
    elseif t2 == 2
        num_of_outputs = 24;
        left_offset = 235;
        height_offset = 5+A(4);     
    elseif t2 == 3
        num_of_outputs = 14;
        left_offset = 235;
        height_offset = 5+A(4);     
    elseif t2 == 4
        num_of_outputs = 24;
        left_offset = 235;
        height_offset = 5+A(4);     
    elseif t2 == 5
        num_of_outputs = 18;
        left_offset = 235;
        height_offset = 5+A(4);     
    elseif t2 == 6
        num_of_outputs = 14;
        left_offset = 235;
        height_offset = 5+A(4);     
    end    

    if t2 == 1 && a == 1
        add_block('simulink/Signal Routing/Demux',[Name, '/Demux',num2str(p)],'outputs','14','Position',[left_offset height_offset left_offset+5 height_offset+num_of_outputs*10]);
        A = get_param([Name, '/Demux',num2str(p)],'Position');
        add_block('simulink/Sources/From Workspace',[Name,'/From Workspace',num2str(p)],'Position',[150 height_offset+((A(4)-A(2))/2-10) 200 height_offset+((A(4)-A(2))/2+10)]);
        set_param([Name,'/From Workspace',num2str(p)],'VariableName',['VR.trailer' num2str(p-1)])
        FromWorkspaceHandles = get_param([Name,'/From Workspace',num2str(p)],'PortHandles');
        SubsysPortHandles = get_param([Name,'/VR sink'],'PortHandles');
        ScopePortHandles = get_param([Name,'/Demux',num2str(p)],'PortHandles');
        add_line(Name,FromWorkspaceHandles.Outport(1),ScopePortHandles.Inport(1),'autorouting','on');
        for u = 1:14
            add_line(Name,ScopePortHandles.Outport(u),SubsysPortHandles.Inport(nodes_offset+u),'autorouting','on');
        end
    elseif t2 == 1 && a == 2 
        add_block('simulink/Signal Routing/Demux',[Name, '/Demux',num2str(p)],'outputs','20','Position',[left_offset height_offset left_offset+5 height_offset+num_of_outputs*10+6*10]);
        A = get_param([Name, '/Demux',num2str(p)],'Position');
        add_block('simulink/Sources/From Workspace',[Name,'/From Workspace',num2str(p)],'Position',[150 height_offset+((A(4)-A(2))/2-10) 200 height_offset+((A(4)-A(2))/2+10)]);
        set_param([Name,'/From Workspace',num2str(p)],'VariableName',['VR.trailer' num2str(p-1)])
        FromWorkspaceHandles = get_param([Name,'/From Workspace',num2str(p)],'PortHandles');
        SubsysPortHandles = get_param([Name,'/VR sink'],'PortHandles');
        ScopePortHandles = get_param([Name,'/Demux',num2str(p)],'PortHandles');
        add_line(Name,FromWorkspaceHandles.Outport(1),ScopePortHandles.Inport(1),'autorouting','on');
        for u = 1:20
            add_line(Name,ScopePortHandles.Outport(u),SubsysPortHandles.Inport(nodes_offset+u),'autorouting','on');
        end
    elseif t2 == 1 && a == 3 
        add_block('simulink/Signal Routing/Demux',[Name, '/Demux',num2str(p)],'outputs','26','Position',[left_offset height_offset left_offset+5 height_offset+num_of_outputs*10+12*10]);
        A = get_param([Name, '/Demux',num2str(p)],'Position');
        add_block('simulink/Sources/From Workspace',[Name,'/From Workspace',num2str(p)],'Position',[150 height_offset+((A(4)-A(2))/2-10) 200 height_offset+((A(4)-A(2))/2+10)]);
        set_param([Name,'/From Workspace',num2str(p)],'VariableName',['VR.trailer' num2str(p-1)])
        FromWorkspaceHandles = get_param([Name,'/From Workspace',num2str(p)],'PortHandles');
        SubsysPortHandles = get_param([Name,'/VR sink'],'PortHandles');
        ScopePortHandles = get_param([Name,'/Demux',num2str(p)],'PortHandles');
        add_line(Name,FromWorkspaceHandles.Outport(1),ScopePortHandles.Inport(1),'autorouting','on');
        for u = 1:26
            add_line(Name,ScopePortHandles.Outport(u),SubsysPortHandles.Inport(nodes_offset+u),'autorouting','on');
        end
    elseif t2 == 1 && a == 4 
        add_block('simulink/Signal Routing/Demux',[Name, '/Demux',num2str(p)],'outputs','32','Position',[left_offset height_offset left_offset+5 height_offset+num_of_outputs*10+18*10]);
        A = get_param([Name, '/Demux',num2str(p)],'Position');
        add_block('simulink/Sources/From Workspace',[Name,'/From Workspace',num2str(p)],'Position',[150 height_offset+((A(4)-A(2))/2-10) 200 height_offset+((A(4)-A(2))/2+10)]);
        set_param([Name,'/From Workspace',num2str(p)],'VariableName',['VR.trailer' num2str(p-1)])
        FromWorkspaceHandles = get_param([Name,'/From Workspace',num2str(p)],'PortHandles');
        SubsysPortHandles = get_param([Name,'/VR sink'],'PortHandles');
        ScopePortHandles = get_param([Name,'/Demux',num2str(p)],'PortHandles');
        add_line(Name,FromWorkspaceHandles.Outport(1),ScopePortHandles.Inport(1),'autorouting','on');
        for u = 1:32
            add_line(Name,ScopePortHandles.Outport(u),SubsysPortHandles.Inport(nodes_offset+u),'autorouting','on');
        end
    elseif t2 == 1 && a == 5 
        add_block('simulink/Signal Routing/Demux',[Name, '/Demux',num2str(p)],'outputs','38','Position',[left_offset height_offset left_offset+5 height_offset+num_of_outputs*10+24*10]);    
        A = get_param([Name, '/Demux',num2str(p)],'Position');
        add_block('simulink/Sources/From Workspace',[Name,'/From Workspace',num2str(p)],'Position',[150 height_offset+((A(4)-A(2))/2-10) 200 height_offset+((A(4)-A(2))/2+10)]);
        set_param([Name,'/From Workspace',num2str(p)],'VariableName',['VR.trailer' num2str(p-1)])
        FromWorkspaceHandles = get_param([Name,'/From Workspace',num2str(p)],'PortHandles');
        SubsysPortHandles = get_param([Name,'/VR sink'],'PortHandles');
        ScopePortHandles = get_param([Name,'/Demux',num2str(p)],'PortHandles');
        add_line(Name,FromWorkspaceHandles.Outport(1),ScopePortHandles.Inport(1),'autorouting','on');
        for u = 1:38
            add_line(Name,ScopePortHandles.Outport(u),SubsysPortHandles.Inport(nodes_offset+u),'autorouting','on');
        end

    elseif t2 == 2 && a == 1 && d == 1
        add_block('simulink/Signal Routing/Demux',[Name, '/Demux_dolly',num2str(p)],'outputs','10','Position',[left_offset height_offset left_offset+5 height_offset+num_of_outputs*10]);
        A = get_param([Name, '/Demux_dolly',num2str(p)],'Position');
        add_block('simulink/Sources/From Workspace',[Name,'/From Workspace dolly',num2str(p)],'Position',[150 height_offset+((A(4)-A(2))/2-10) 200 height_offset+((A(4)-A(2))/2+10)]);
        set_param([Name,'/From Workspace dolly',num2str(p)],'VariableName',['VR.dolly' num2str(p-1)])
        FromWorkspaceHandles = get_param([Name,'/From Workspace dolly',num2str(p)],'PortHandles');
        SubsysPortHandles = get_param([Name,'/VR sink'],'PortHandles');
        ScopePortHandles = get_param([Name,'/Demux_dolly',num2str(p)],'PortHandles');
        add_line(Name,FromWorkspaceHandles.Outport(1),ScopePortHandles.Inport(1),'autorouting','on');
        for u = 1:10
            add_line(Name,ScopePortHandles.Outport(u),SubsysPortHandles.Inport(nodes_offset+u),'autorouting','on');
        end

        add_block('simulink/Signal Routing/Demux',[Name, '/Demux',num2str(p)],'outputs','14','Position',[left_offset height_offset left_offset+5 height_offset+num_of_outputs*10]);
        A = get_param([Name, '/Demux',num2str(p)],'Position');
        add_block('simulink/Sources/From Workspace',[Name,'/From Workspace',num2str(p)],'Position',[150 height_offset+((A(4)-A(2))/2-10) 200 height_offset+((A(4)-A(2))/2+10)]);
        set_param([Name,'/From Workspace',num2str(p)],'VariableName',['VR.trailer' num2str(p-1)])
        FromWorkspaceHandles = get_param([Name,'/From Workspace',num2str(p)],'PortHandles');
        SubsysPortHandles = get_param([Name,'/VR sink'],'PortHandles');
        ScopePortHandles = get_param([Name,'/Demux',num2str(p)],'PortHandles');
        add_line(Name,FromWorkspaceHandles.Outport(1),ScopePortHandles.Inport(1),'autorouting','on');
        for u = 1:14
            add_line(Name,ScopePortHandles.Outport(u),SubsysPortHandles.Inport(nodes_offset+10+u),'autorouting','on');
        end
    elseif t2 == 2 && a == 1 && d == 2

        add_block('simulink/Signal Routing/Demux',[Name, '/Demux_dolly',num2str(p)],'outputs','16','Position',[left_offset height_offset left_offset+5 height_offset+num_of_outputs*10]);
        A = get_param([Name, '/Demux_dolly',num2str(p)],'Position');
        add_block('simulink/Sources/From Workspace',[Name,'/From Workspace dolly',num2str(p)],'Position',[150 height_offset+((A(4)-A(2))/2-10) 200 height_offset+((A(4)-A(2))/2+10)]);
        set_param([Name,'/From Workspace dolly',num2str(p)],'VariableName',['VR.dolly' num2str(p-1)])
        FromWorkspaceHandles = get_param([Name,'/From Workspace dolly',num2str(p)],'PortHandles');
        SubsysPortHandles = get_param([Name,'/VR sink'],'PortHandles');
        ScopePortHandles = get_param([Name,'/Demux_dolly',num2str(p)],'PortHandles');
        add_line(Name,FromWorkspaceHandles.Outport(1),ScopePortHandles.Inport(1),'autorouting','on');
        for u = 1:16
            add_line(Name,ScopePortHandles.Outport(u),SubsysPortHandles.Inport(nodes_offset+u),'autorouting','on');
        end

        add_block('simulink/Signal Routing/Demux',[Name, '/Demux',num2str(p)],'outputs','14','Position',[left_offset height_offset left_offset+5 height_offset+num_of_outputs*10]);
        A = get_param([Name, '/Demux',num2str(p)],'Position');
        add_block('simulink/Sources/From Workspace',[Name,'/From Workspace',num2str(p)],'Position',[150 height_offset+((A(4)-A(2))/2-10) 200 height_offset+((A(4)-A(2))/2+10)]);
        set_param([Name,'/From Workspace',num2str(p)],'VariableName',['VR.trailer' num2str(p-1)])
        FromWorkspaceHandles = get_param([Name,'/From Workspace',num2str(p)],'PortHandles');
        SubsysPortHandles = get_param([Name,'/VR sink'],'PortHandles');
        ScopePortHandles = get_param([Name,'/Demux',num2str(p)],'PortHandles');
        add_line(Name,FromWorkspaceHandles.Outport(1),ScopePortHandles.Inport(1),'autorouting','on');
        for u = 1:14
            add_line(Name,ScopePortHandles.Outport(u),SubsysPortHandles.Inport(nodes_offset+16+u),'autorouting','on');
        end        

    elseif t2 == 2 && a == 2 && d == 1
        add_block('simulink/Signal Routing/Demux',[Name, '/Demux_dolly',num2str(p)],'outputs','10','Position',[left_offset height_offset left_offset+5 height_offset+num_of_outputs*10]);
        A = get_param([Name, '/Demux_dolly',num2str(p)],'Position');
        add_block('simulink/Sources/From Workspace',[Name,'/From Workspace dolly',num2str(p)],'Position',[150 height_offset+((A(4)-A(2))/2-10) 200 height_offset+((A(4)-A(2))/2+10)]);
        set_param([Name,'/From Workspace dolly',num2str(p)],'VariableName',['VR.dolly' num2str(p-1)])
        FromWorkspaceHandles = get_param([Name,'/From Workspace dolly',num2str(p)],'PortHandles');
        SubsysPortHandles = get_param([Name,'/VR sink'],'PortHandles');
        ScopePortHandles = get_param([Name,'/Demux_dolly',num2str(p)],'PortHandles');
        add_line(Name,FromWorkspaceHandles.Outport(1),ScopePortHandles.Inport(1),'autorouting','on');
        for u = 1:10
            add_line(Name,ScopePortHandles.Outport(u),SubsysPortHandles.Inport(nodes_offset+u),'autorouting','on');
        end

        add_block('simulink/Signal Routing/Demux',[Name, '/Demux',num2str(p)],'outputs','20','Position',[left_offset height_offset left_offset+5 height_offset+num_of_outputs*10]);
        A = get_param([Name, '/Demux',num2str(p)],'Position');
        add_block('simulink/Sources/From Workspace',[Name,'/From Workspace',num2str(p)],'Position',[150 height_offset+((A(4)-A(2))/2-10) 200 height_offset+((A(4)-A(2))/2+10)]);
        set_param([Name,'/From Workspace',num2str(p)],'VariableName',['VR.trailer' num2str(p-1)])
        FromWorkspaceHandles = get_param([Name,'/From Workspace',num2str(p)],'PortHandles');
        SubsysPortHandles = get_param([Name,'/VR sink'],'PortHandles');
        ScopePortHandles = get_param([Name,'/Demux',num2str(p)],'PortHandles');
        add_line(Name,FromWorkspaceHandles.Outport(1),ScopePortHandles.Inport(1),'autorouting','on');
        for u = 1:20
            add_line(Name,ScopePortHandles.Outport(u),SubsysPortHandles.Inport(nodes_offset+10+u),'autorouting','on');
        end
    elseif t2 == 2 && a == 2 && d == 2

        add_block('simulink/Signal Routing/Demux',[Name, '/Demux_dolly',num2str(p)],'outputs','16','Position',[left_offset height_offset left_offset+5 height_offset+num_of_outputs*10]);
        A = get_param([Name, '/Demux_dolly',num2str(p)],'Position');
        add_block('simulink/Sources/From Workspace',[Name,'/From Workspace dolly',num2str(p)],'Position',[150 height_offset+((A(4)-A(2))/2-10) 200 height_offset+((A(4)-A(2))/2+10)]);
        set_param([Name,'/From Workspace dolly',num2str(p)],'VariableName',['VR.dolly' num2str(p-1)])
        FromWorkspaceHandles = get_param([Name,'/From Workspace dolly',num2str(p)],'PortHandles');
        SubsysPortHandles = get_param([Name,'/VR sink'],'PortHandles');
        ScopePortHandles = get_param([Name,'/Demux_dolly',num2str(p)],'PortHandles');
        add_line(Name,FromWorkspaceHandles.Outport(1),ScopePortHandles.Inport(1),'autorouting','on');
        for u = 1:16
            add_line(Name,ScopePortHandles.Outport(u),SubsysPortHandles.Inport(nodes_offset+u),'autorouting','on');
        end

        add_block('simulink/Signal Routing/Demux',[Name, '/Demux',num2str(p)],'outputs','20','Position',[left_offset height_offset left_offset+5 height_offset+num_of_outputs*10+12*10]);
        A = get_param([Name, '/Demux',num2str(p)],'Position');
        add_block('simulink/Sources/From Workspace',[Name,'/From Workspace',num2str(p)],'Position',[150 height_offset+((A(4)-A(2))/2-10) 200 height_offset+((A(4)-A(2))/2+10)]);
        set_param([Name,'/From Workspace',num2str(p)],'VariableName',['VR.trailer' num2str(p-1)])
        FromWorkspaceHandles = get_param([Name,'/From Workspace',num2str(p)],'PortHandles');
        SubsysPortHandles = get_param([Name,'/VR sink'],'PortHandles');
        ScopePortHandles = get_param([Name,'/Demux',num2str(p)],'PortHandles');
        add_line(Name,FromWorkspaceHandles.Outport(1),ScopePortHandles.Inport(1),'autorouting','on');
        for u = 1:20
            add_line(Name,ScopePortHandles.Outport(u),SubsysPortHandles.Inport(nodes_offset+16+u),'autorouting','on');
        end
    elseif t2 == 2 && a == 3 && d == 1

        add_block('simulink/Signal Routing/Demux',[Name, '/Demux_dolly',num2str(p)],'outputs','10','Position',[left_offset height_offset left_offset+5 height_offset+num_of_outputs*10]);
        A = get_param([Name, '/Demux_dolly',num2str(p)],'Position');
        add_block('simulink/Sources/From Workspace',[Name,'/From Workspace dolly',num2str(p)],'Position',[150 height_offset+((A(4)-A(2))/2-10) 200 height_offset+((A(4)-A(2))/2+10)]);
        set_param([Name,'/From Workspace dolly',num2str(p)],'VariableName',['VR.dolly' num2str(p-1)])
        FromWorkspaceHandles = get_param([Name,'/From Workspace dolly',num2str(p)],'PortHandles');
        SubsysPortHandles = get_param([Name,'/VR sink'],'PortHandles');
        ScopePortHandles = get_param([Name,'/Demux_dolly',num2str(p)],'PortHandles');
        add_line(Name,FromWorkspaceHandles.Outport(1),ScopePortHandles.Inport(1),'autorouting','on');
        for u = 1:10
            add_line(Name,ScopePortHandles.Outport(u),SubsysPortHandles.Inport(nodes_offset+u),'autorouting','on');
        end

        add_block('simulink/Signal Routing/Demux',[Name, '/Demux',num2str(p)],'outputs','26','Position',[left_offset height_offset left_offset+5 height_offset+num_of_outputs*10+12*10]);
        A = get_param([Name, '/Demux',num2str(p)],'Position');
        add_block('simulink/Sources/From Workspace',[Name,'/From Workspace',num2str(p)],'Position',[150 height_offset+((A(4)-A(2))/2-10) 200 height_offset+((A(4)-A(2))/2+10)]);
        set_param([Name,'/From Workspace',num2str(p)],'VariableName',['VR.trailer' num2str(p-1)])
        FromWorkspaceHandles = get_param([Name,'/From Workspace',num2str(p)],'PortHandles');
        SubsysPortHandles = get_param([Name,'/VR sink'],'PortHandles');
        ScopePortHandles = get_param([Name,'/Demux',num2str(p)],'PortHandles');
        add_line(Name,FromWorkspaceHandles.Outport(1),ScopePortHandles.Inport(1),'autorouting','on');
        for u = 1:26
            add_line(Name,ScopePortHandles.Outport(u),SubsysPortHandles.Inport(nodes_offset+10+u),'autorouting','on');
        end
    elseif t2 == 2 && a == 3 && d == 2
        add_block('simulink/Signal Routing/Demux',[Name, '/Demux_dolly',num2str(p)],'outputs','16','Position',[left_offset height_offset left_offset+5 height_offset+num_of_outputs*10]);
        A = get_param([Name, '/Demux_dolly',num2str(p)],'Position');
        add_block('simulink/Sources/From Workspace',[Name,'/From Workspace dolly',num2str(p)],'Position',[150 height_offset+((A(4)-A(2))/2-10) 200 height_offset+((A(4)-A(2))/2+10)]);
        set_param([Name,'/From Workspace dolly',num2str(p)],'VariableName',['VR.dolly' num2str(p-1)])
        FromWorkspaceHandles = get_param([Name,'/From Workspace dolly',num2str(p)],'PortHandles');
        SubsysPortHandles = get_param([Name,'/VR sink'],'PortHandles');
        ScopePortHandles = get_param([Name,'/Demux_dolly',num2str(p)],'PortHandles');
        add_line(Name,FromWorkspaceHandles.Outport(1),ScopePortHandles.Inport(1),'autorouting','on');
        for u = 1:16
            add_line(Name,ScopePortHandles.Outport(u),SubsysPortHandles.Inport(nodes_offset+u),'autorouting','on');
        end

        add_block('simulink/Signal Routing/Demux',[Name, '/Demux',num2str(p)],'outputs','26','Position',[left_offset height_offset left_offset+5 height_offset+num_of_outputs*10+18*10]);
        A = get_param([Name, '/Demux',num2str(p)],'Position');
        add_block('simulink/Sources/From Workspace',[Name,'/From Workspace',num2str(p)],'Position',[150 height_offset+((A(4)-A(2))/2-10) 200 height_offset+((A(4)-A(2))/2+10)]);
        set_param([Name,'/From Workspace',num2str(p)],'VariableName',['VR.trailer' num2str(p-1)])
        FromWorkspaceHandles = get_param([Name,'/From Workspace',num2str(p)],'PortHandles');
        SubsysPortHandles = get_param([Name,'/VR sink'],'PortHandles');
        ScopePortHandles = get_param([Name,'/Demux',num2str(p)],'PortHandles');
        add_line(Name,FromWorkspaceHandles.Outport(1),ScopePortHandles.Inport(1),'autorouting','on');
        for u = 1:26
            add_line(Name,ScopePortHandles.Outport(u),SubsysPortHandles.Inport(nodes_offset+16+u),'autorouting','on');
        end
    elseif t2 == 2 && a == 4 && d == 1

        add_block('simulink/Signal Routing/Demux',[Name, '/Demux_dolly',num2str(p)],'outputs','10','Position',[left_offset height_offset left_offset+5 height_offset+num_of_outputs*10]);
        A = get_param([Name, '/Demux_dolly',num2str(p)],'Position');
        add_block('simulink/Sources/From Workspace',[Name,'/From Workspace dolly',num2str(p)],'Position',[150 height_offset+((A(4)-A(2))/2-10) 200 height_offset+((A(4)-A(2))/2+10)]);
        set_param([Name,'/From Workspace dolly',num2str(p)],'VariableName',['VR.dolly' num2str(p-1)])
        FromWorkspaceHandles = get_param([Name,'/From Workspace dolly',num2str(p)],'PortHandles');
        SubsysPortHandles = get_param([Name,'/VR sink'],'PortHandles');
        ScopePortHandles = get_param([Name,'/Demux_dolly',num2str(p)],'PortHandles');
        add_line(Name,FromWorkspaceHandles.Outport(1),ScopePortHandles.Inport(1),'autorouting','on');
        for u = 1:10
            add_line(Name,ScopePortHandles.Outport(u),SubsysPortHandles.Inport(nodes_offset+u),'autorouting','on');
        end

        add_block('simulink/Signal Routing/Demux',[Name, '/Demux',num2str(p)],'outputs','32','Position',[left_offset height_offset left_offset+5 height_offset+num_of_outputs*10+18*10]);
        A = get_param([Name, '/Demux',num2str(p)],'Position');
        add_block('simulink/Sources/From Workspace',[Name,'/From Workspace',num2str(p)],'Position',[150 height_offset+((A(4)-A(2))/2-10) 200 height_offset+((A(4)-A(2))/2+10)]);
        set_param([Name,'/From Workspace',num2str(p)],'VariableName',['VR.trailer' num2str(p-1)])
        FromWorkspaceHandles = get_param([Name,'/From Workspace',num2str(p)],'PortHandles');
        SubsysPortHandles = get_param([Name,'/VR sink'],'PortHandles');
        ScopePortHandles = get_param([Name,'/Demux',num2str(p)],'PortHandles');
        add_line(Name,FromWorkspaceHandles.Outport(1),ScopePortHandles.Inport(1),'autorouting','on');
        for u = 1:32
            add_line(Name,ScopePortHandles.Outport(u),SubsysPortHandles.Inport(nodes_offset+10+u),'autorouting','on');
        end
    elseif t2 == 2 && a == 4 && d == 2

        add_block('simulink/Signal Routing/Demux',[Name, '/Demux_dolly',num2str(p)],'outputs','16','Position',[left_offset height_offset left_offset+5 height_offset+num_of_outputs*10]);
        A = get_param([Name, '/Demux_dolly',num2str(p)],'Position');
        add_block('simulink/Sources/From Workspace',[Name,'/From Workspace dolly',num2str(p)],'Position',[150 height_offset+((A(4)-A(2))/2-10) 200 height_offset+((A(4)-A(2))/2+10)]);
        set_param([Name,'/From Workspace dolly',num2str(p)],'VariableName',['VR.dolly' num2str(p-1)])
        FromWorkspaceHandles = get_param([Name,'/From Workspace dolly',num2str(p)],'PortHandles');
        SubsysPortHandles = get_param([Name,'/VR sink'],'PortHandles');
        ScopePortHandles = get_param([Name,'/Demux_dolly',num2str(p)],'PortHandles');
        add_line(Name,FromWorkspaceHandles.Outport(1),ScopePortHandles.Inport(1),'autorouting','on');
        for u = 1:16
            add_line(Name,ScopePortHandles.Outport(u),SubsysPortHandles.Inport(nodes_offset+u),'autorouting','on');
        end

        add_block('simulink/Signal Routing/Demux',[Name, '/Demux',num2str(p)],'outputs','32','Position',[left_offset height_offset left_offset+5 height_offset+num_of_outputs*10+24*10]);
        A = get_param([Name, '/Demux',num2str(p)],'Position');
        add_block('simulink/Sources/From Workspace',[Name,'/From Workspace',num2str(p)],'Position',[150 height_offset+((A(4)-A(2))/2-10) 200 height_offset+((A(4)-A(2))/2+10)]);
        set_param([Name,'/From Workspace',num2str(p)],'VariableName',['VR.trailer' num2str(p-1)])
        FromWorkspaceHandles = get_param([Name,'/From Workspace',num2str(p)],'PortHandles');
        SubsysPortHandles = get_param([Name,'/VR sink'],'PortHandles');
        ScopePortHandles = get_param([Name,'/Demux',num2str(p)],'PortHandles');
        add_line(Name,FromWorkspaceHandles.Outport(1),ScopePortHandles.Inport(1),'autorouting','on');
        for u = 1:32
            add_line(Name,ScopePortHandles.Outport(u),SubsysPortHandles.Inport(nodes_offset+16+u),'autorouting','on');
        end
    elseif t2 == 2 && a == 5 && d == 1

        add_block('simulink/Signal Routing/Demux',[Name, '/Demux_dolly',num2str(p)],'outputs','10','Position',[left_offset height_offset left_offset+5 height_offset+num_of_outputs*10]);
        A = get_param([Name, '/Demux_dolly',num2str(p)],'Position');
        add_block('simulink/Sources/From Workspace',[Name,'/From Workspace dolly',num2str(p)],'Position',[150 height_offset+((A(4)-A(2))/2-10) 200 height_offset+((A(4)-A(2))/2+10)]);
        set_param([Name,'/From Workspace dolly',num2str(p)],'VariableName',['VR.dolly' num2str(p-1)])
        FromWorkspaceHandles = get_param([Name,'/From Workspace dolly',num2str(p)],'PortHandles');
        SubsysPortHandles = get_param([Name,'/VR sink'],'PortHandles');
        ScopePortHandles = get_param([Name,'/Demux_dolly',num2str(p)],'PortHandles');
        add_line(Name,FromWorkspaceHandles.Outport(1),ScopePortHandles.Inport(1),'autorouting','on');
        for u = 1:10
            add_line(Name,ScopePortHandles.Outport(u),SubsysPortHandles.Inport(nodes_offset+u),'autorouting','on');
        end

        add_block('simulink/Signal Routing/Demux',[Name, '/Demux',num2str(p)],'outputs','38','Position',[left_offset height_offset left_offset+5 height_offset+num_of_outputs*10+24*10]);
        A = get_param([Name, '/Demux',num2str(p)],'Position');
        add_block('simulink/Sources/From Workspace',[Name,'/From Workspace',num2str(p)],'Position',[150 height_offset+((A(4)-A(2))/2-10) 200 height_offset+((A(4)-A(2))/2+10)]);
        set_param([Name,'/From Workspace',num2str(p)],'VariableName',['VR.trailer' num2str(p-1)])
        FromWorkspaceHandles = get_param([Name,'/From Workspace',num2str(p)],'PortHandles');
        SubsysPortHandles = get_param([Name,'/VR sink'],'PortHandles');
        ScopePortHandles = get_param([Name,'/Demux',num2str(p)],'PortHandles');
        add_line(Name,FromWorkspaceHandles.Outport(1),ScopePortHandles.Inport(1),'autorouting','on');
        for u = 1:38
            add_line(Name,ScopePortHandles.Outport(u),SubsysPortHandles.Inport(nodes_offset+10+u),'autorouting','on');
        end
    elseif t2 == 2 && a == 5 && d == 2

        add_block('simulink/Signal Routing/Demux',[Name, '/Demux_dolly',num2str(p)],'outputs','16','Position',[left_offset height_offset left_offset+5 height_offset+num_of_outputs*10]);
        A = get_param([Name, '/Demux_dolly',num2str(p)],'Position');
        add_block('simulink/Sources/From Workspace',[Name,'/From Workspace dolly',num2str(p)],'Position',[150 height_offset+((A(4)-A(2))/2-10) 200 height_offset+((A(4)-A(2))/2+10)]);
        set_param([Name,'/From Workspace dolly',num2str(p)],'VariableName',['VR.dolly' num2str(p-1)])
        FromWorkspaceHandles = get_param([Name,'/From Workspace dolly',num2str(p)],'PortHandles');
        SubsysPortHandles = get_param([Name,'/VR sink'],'PortHandles');
        ScopePortHandles = get_param([Name,'/Demux_dolly',num2str(p)],'PortHandles');
        add_line(Name,FromWorkspaceHandles.Outport(1),ScopePortHandles.Inport(1),'autorouting','on');
        for u = 1:16
            add_line(Name,ScopePortHandles.Outport(u),SubsysPortHandles.Inport(nodes_offset+u),'autorouting','on');
        end

        add_block('simulink/Signal Routing/Demux',[Name, '/Demux',num2str(p)],'outputs','38','Position',[left_offset height_offset left_offset+5 height_offset+num_of_outputs*10+30*10]);
        A = get_param([Name, '/Demux',num2str(p)],'Position');
        add_block('simulink/Sources/From Workspace',[Name,'/From Workspace',num2str(p)],'Position',[150 height_offset+((A(4)-A(2))/2-10) 200 height_offset+((A(4)-A(2))/2+10)]);
        set_param([Name,'/From Workspace',num2str(p)],'VariableName',['VR.trailer' num2str(p-1)])
        FromWorkspaceHandles = get_param([Name,'/From Workspace',num2str(p)],'PortHandles');
        SubsysPortHandles = get_param([Name,'/VR sink'],'PortHandles');
        ScopePortHandles = get_param([Name,'/Demux',num2str(p)],'PortHandles');
        add_line(Name,FromWorkspaceHandles.Outport(1),ScopePortHandles.Inport(1),'autorouting','on');
        for u = 1:38
            add_line(Name,ScopePortHandles.Outport(u),SubsysPortHandles.Inport(nodes_offset+16+u),'autorouting','on');
        end

    elseif t2 == 3 && a == 1
        add_block('simulink/Signal Routing/Demux',[Name, '/Demux',num2str(p)],'outputs','14','Position',[left_offset height_offset left_offset+5 height_offset+num_of_outputs*10]);
        A = get_param([Name, '/Demux',num2str(p)],'Position');
        add_block('simulink/Sources/From Workspace',[Name,'/From Workspace',num2str(p)],'Position',[150 height_offset+((A(4)-A(2))/2-10) 200 height_offset+((A(4)-A(2))/2+10)]);
        set_param([Name,'/From Workspace',num2str(p)],'VariableName',['VR.trailer' num2str(p-1)])
        FromWorkspaceHandles = get_param([Name,'/From Workspace',num2str(p)],'PortHandles');
        SubsysPortHandles = get_param([Name,'/VR sink'],'PortHandles');
        ScopePortHandles = get_param([Name,'/Demux',num2str(p)],'PortHandles');
        add_line(Name,FromWorkspaceHandles.Outport(1),ScopePortHandles.Inport(1),'autorouting','on');
        for u = 1:14
            add_line(Name,ScopePortHandles.Outport(u),SubsysPortHandles.Inport(nodes_offset+u),'autorouting','on');
        end
    elseif t2 == 3 && a == 2
        add_block('simulink/Signal Routing/Demux',[Name, '/Demux',num2str(p)],'outputs','20','Position',[left_offset height_offset left_offset+5 height_offset+num_of_outputs*10+6*10]);
        A = get_param([Name, '/Demux',num2str(p)],'Position');
        add_block('simulink/Sources/From Workspace',[Name,'/From Workspace',num2str(p)],'Position',[150 height_offset+((A(4)-A(2))/2-10) 200 height_offset+((A(4)-A(2))/2+10)]);
        set_param([Name,'/From Workspace',num2str(p)],'VariableName',['VR.trailer' num2str(p-1)])
        FromWorkspaceHandles = get_param([Name,'/From Workspace',num2str(p)],'PortHandles');
        SubsysPortHandles = get_param([Name,'/VR sink'],'PortHandles');
        ScopePortHandles = get_param([Name,'/Demux',num2str(p)],'PortHandles');
        add_line(Name,FromWorkspaceHandles.Outport(1),ScopePortHandles.Inport(1),'autorouting','on');
        for u = 1:20
            add_line(Name,ScopePortHandles.Outport(u),SubsysPortHandles.Inport(nodes_offset+u),'autorouting','on');
        end
    elseif t2 == 3 && a == 3
        add_block('simulink/Signal Routing/Demux',[Name, '/Demux',num2str(p)],'outputs','26','Position',[left_offset height_offset left_offset+5 height_offset+num_of_outputs*10+12*10]);
        A = get_param([Name, '/Demux',num2str(p)],'Position');
        add_block('simulink/Sources/From Workspace',[Name,'/From Workspace',num2str(p)],'Position',[150 height_offset+((A(4)-A(2))/2-10) 200 height_offset+((A(4)-A(2))/2+10)]);
        set_param([Name,'/From Workspace',num2str(p)],'VariableName',['VR.trailer' num2str(p-1)])
        FromWorkspaceHandles = get_param([Name,'/From Workspace',num2str(p)],'PortHandles');
        SubsysPortHandles = get_param([Name,'/VR sink'],'PortHandles');
        ScopePortHandles = get_param([Name,'/Demux',num2str(p)],'PortHandles');
        add_line(Name,FromWorkspaceHandles.Outport(1),ScopePortHandles.Inport(1),'autorouting','on');
        for u = 1:26
            add_line(Name,ScopePortHandles.Outport(u),SubsysPortHandles.Inport(nodes_offset+u),'autorouting','on');
        end
    elseif t2 == 3 && a == 4
        add_block('simulink/Signal Routing/Demux',[Name, '/Demux',num2str(p)],'outputs','32','Position',[left_offset height_offset left_offset+5 height_offset+num_of_outputs*10+18*10]);
        A = get_param([Name, '/Demux',num2str(p)],'Position');
        add_block('simulink/Sources/From Workspace',[Name,'/From Workspace',num2str(p)],'Position',[150 height_offset+((A(4)-A(2))/2-10) 200 height_offset+((A(4)-A(2))/2+10)]);
        set_param([Name,'/From Workspace',num2str(p)],'VariableName',['VR.trailer' num2str(p-1)])
        FromWorkspaceHandles = get_param([Name,'/From Workspace',num2str(p)],'PortHandles');
        SubsysPortHandles = get_param([Name,'/VR sink'],'PortHandles');
        ScopePortHandles = get_param([Name,'/Demux',num2str(p)],'PortHandles');
        add_line(Name,FromWorkspaceHandles.Outport(1),ScopePortHandles.Inport(1),'autorouting','on');
        for u = 1:32
            add_line(Name,ScopePortHandles.Outport(u),SubsysPortHandles.Inport(nodes_offset+u),'autorouting','on');
        end
    elseif t2 == 3 && a == 5
        add_block('simulink/Signal Routing/Demux',[Name, '/Demux',num2str(p)],'outputs','38','Position',[left_offset height_offset left_offset+5 height_offset+num_of_outputs*10+24*10]);    
        A = get_param([Name, '/Demux',num2str(p)],'Position');
        add_block('simulink/Sources/From Workspace',[Name,'/From Workspace',num2str(p)],'Position',[150 height_offset+((A(4)-A(2))/2-10) 200 height_offset+((A(4)-A(2))/2+10)]);
        set_param([Name,'/From Workspace',num2str(p)],'VariableName',['VR.trailer' num2str(p-1)])
        FromWorkspaceHandles = get_param([Name,'/From Workspace',num2str(p)],'PortHandles');
        SubsysPortHandles = get_param([Name,'/VR sink'],'PortHandles');
        ScopePortHandles = get_param([Name,'/Demux',num2str(p)],'PortHandles');
        add_line(Name,FromWorkspaceHandles.Outport(1),ScopePortHandles.Inport(1),'autorouting','on');
        for u = 1:38
            add_line(Name,ScopePortHandles.Outport(u),SubsysPortHandles.Inport(nodes_offset+u),'autorouting','on');
        end

    elseif t2 == 4 && a == 1 && d == 1
        add_block('simulink/Signal Routing/Demux',[Name, '/Demux_dolly',num2str(p)],'outputs','10','Position',[left_offset height_offset left_offset+5 height_offset+num_of_outputs*10]);
        A = get_param([Name, '/Demux_dolly',num2str(p)],'Position');
        add_block('simulink/Sources/From Workspace',[Name,'/From Workspace dolly',num2str(p)],'Position',[150 height_offset+((A(4)-A(2))/2-10) 200 height_offset+((A(4)-A(2))/2+10)]);
        set_param([Name,'/From Workspace dolly',num2str(p)],'VariableName',['VR.dolly' num2str(p-1)])
        FromWorkspaceHandles = get_param([Name,'/From Workspace dolly',num2str(p)],'PortHandles');
        SubsysPortHandles = get_param([Name,'/VR sink'],'PortHandles');
        ScopePortHandles = get_param([Name,'/Demux_dolly',num2str(p)],'PortHandles');
        add_line(Name,FromWorkspaceHandles.Outport(1),ScopePortHandles.Inport(1),'autorouting','on');
        for u = 1:10
            add_line(Name,ScopePortHandles.Outport(u),SubsysPortHandles.Inport(nodes_offset+u),'autorouting','on');
        end

        add_block('simulink/Signal Routing/Demux',[Name, '/Demux',num2str(p)],'outputs','14','Position',[left_offset height_offset left_offset+5 height_offset+num_of_outputs*10]);
        A = get_param([Name, '/Demux',num2str(p)],'Position');
        add_block('simulink/Sources/From Workspace',[Name,'/From Workspace',num2str(p)],'Position',[150 height_offset+((A(4)-A(2))/2-10) 200 height_offset+((A(4)-A(2))/2+10)]);
        set_param([Name,'/From Workspace',num2str(p)],'VariableName',['VR.trailer' num2str(p-1)])
        FromWorkspaceHandles = get_param([Name,'/From Workspace',num2str(p)],'PortHandles');
        SubsysPortHandles = get_param([Name,'/VR sink'],'PortHandles');
        ScopePortHandles = get_param([Name,'/Demux',num2str(p)],'PortHandles');
        add_line(Name,FromWorkspaceHandles.Outport(1),ScopePortHandles.Inport(1),'autorouting','on');
        for u = 1:14
            add_line(Name,ScopePortHandles.Outport(u),SubsysPortHandles.Inport(nodes_offset+10+u),'autorouting','on');
        end

    elseif t2 == 4 && a == 1 && d == 2
        add_block('simulink/Signal Routing/Demux',[Name, '/Demux_dolly',num2str(p)],'outputs','16','Position',[left_offset height_offset left_offset+5 height_offset+num_of_outputs*10]);
        A = get_param([Name, '/Demux_dolly',num2str(p)],'Position');
        add_block('simulink/Sources/From Workspace',[Name,'/From Workspace dolly',num2str(p)],'Position',[150 height_offset+((A(4)-A(2))/2-10) 200 height_offset+((A(4)-A(2))/2+10)]);
        set_param([Name,'/From Workspace dolly',num2str(p)],'VariableName',['VR.dolly' num2str(p-1)])
        FromWorkspaceHandles = get_param([Name,'/From Workspace dolly',num2str(p)],'PortHandles');
        SubsysPortHandles = get_param([Name,'/VR sink'],'PortHandles');
        ScopePortHandles = get_param([Name,'/Demux_dolly',num2str(p)],'PortHandles');
        add_line(Name,FromWorkspaceHandles.Outport(1),ScopePortHandles.Inport(1),'autorouting','on');
        for u = 1:16
            add_line(Name,ScopePortHandles.Outport(u),SubsysPortHandles.Inport(nodes_offset+u),'autorouting','on');
        end

        add_block('simulink/Signal Routing/Demux',[Name, '/Demux',num2str(p)],'outputs','14','Position',[left_offset height_offset left_offset+5 height_offset+num_of_outputs*10+6*10]);
        A = get_param([Name, '/Demux',num2str(p)],'Position');
        add_block('simulink/Sources/From Workspace',[Name,'/From Workspace',num2str(p)],'Position',[150 height_offset+((A(4)-A(2))/2-10) 200 height_offset+((A(4)-A(2))/2+10)]);
        set_param([Name,'/From Workspace',num2str(p)],'VariableName',['VR.trailer' num2str(p-1)])
        FromWorkspaceHandles = get_param([Name,'/From Workspace',num2str(p)],'PortHandles');
        SubsysPortHandles = get_param([Name,'/VR sink'],'PortHandles');
        ScopePortHandles = get_param([Name,'/Demux',num2str(p)],'PortHandles');
        add_line(Name,FromWorkspaceHandles.Outport(1),ScopePortHandles.Inport(1),'autorouting','on');
        for u = 1:14
            add_line(Name,ScopePortHandles.Outport(u),SubsysPortHandles.Inport(nodes_offset+16+u),'autorouting','on');
        end
    elseif t2 == 4 && a == 2 && d == 1
        add_block('simulink/Signal Routing/Demux',[Name, '/Demux_dolly',num2str(p)],'outputs','10','Position',[left_offset height_offset left_offset+5 height_offset+num_of_outputs*10]);
        A = get_param([Name, '/Demux_dolly',num2str(p)],'Position');
        add_block('simulink/Sources/From Workspace',[Name,'/From Workspace dolly',num2str(p)],'Position',[150 height_offset+((A(4)-A(2))/2-10) 200 height_offset+((A(4)-A(2))/2+10)]);
        set_param([Name,'/From Workspace dolly',num2str(p)],'VariableName',['VR.dolly' num2str(p-1)])
        FromWorkspaceHandles = get_param([Name,'/From Workspace dolly',num2str(p)],'PortHandles');
        SubsysPortHandles = get_param([Name,'/VR sink'],'PortHandles');
        ScopePortHandles = get_param([Name,'/Demux_dolly',num2str(p)],'PortHandles');
        add_line(Name,FromWorkspaceHandles.Outport(1),ScopePortHandles.Inport(1),'autorouting','on');
        for u = 1:10
            add_line(Name,ScopePortHandles.Outport(u),SubsysPortHandles.Inport(nodes_offset+u),'autorouting','on');
        end

        add_block('simulink/Signal Routing/Demux',[Name, '/Demux',num2str(p)],'outputs','20','Position',[left_offset height_offset left_offset+5 height_offset+num_of_outputs*10+6*10]);
        A = get_param([Name, '/Demux',num2str(p)],'Position');
        add_block('simulink/Sources/From Workspace',[Name,'/From Workspace',num2str(p)],'Position',[150 height_offset+((A(4)-A(2))/2-10) 200 height_offset+((A(4)-A(2))/2+10)]);
        set_param([Name,'/From Workspace',num2str(p)],'VariableName',['VR.trailer' num2str(p-1)])
        FromWorkspaceHandles = get_param([Name,'/From Workspace',num2str(p)],'PortHandles');
        SubsysPortHandles = get_param([Name,'/VR sink'],'PortHandles');
        ScopePortHandles = get_param([Name,'/Demux',num2str(p)],'PortHandles');
        add_line(Name,FromWorkspaceHandles.Outport(1),ScopePortHandles.Inport(1),'autorouting','on');
        for u = 1:20
            add_line(Name,ScopePortHandles.Outport(u),SubsysPortHandles.Inport(nodes_offset+10+u),'autorouting','on');
        end
    elseif t2 == 4 && a == 2 && d == 2
        add_block('simulink/Signal Routing/Demux',[Name, '/Demux_dolly',num2str(p)],'outputs','16','Position',[left_offset height_offset left_offset+5 height_offset+num_of_outputs*10]);
        A = get_param([Name, '/Demux_dolly',num2str(p)],'Position');
        add_block('simulink/Sources/From Workspace',[Name,'/From Workspace dolly',num2str(p)],'Position',[150 height_offset+((A(4)-A(2))/2-10) 200 height_offset+((A(4)-A(2))/2+10)]);
        set_param([Name,'/From Workspace dolly',num2str(p)],'VariableName',['VR.dolly' num2str(p-1)])
        FromWorkspaceHandles = get_param([Name,'/From Workspace dolly',num2str(p)],'PortHandles');
        SubsysPortHandles = get_param([Name,'/VR sink'],'PortHandles');
        ScopePortHandles = get_param([Name,'/Demux_dolly',num2str(p)],'PortHandles');
        add_line(Name,FromWorkspaceHandles.Outport(1),ScopePortHandles.Inport(1),'autorouting','on');
        for u = 1:16
            add_line(Name,ScopePortHandles.Outport(u),SubsysPortHandles.Inport(nodes_offset+u),'autorouting','on');
        end

        add_block('simulink/Signal Routing/Demux',[Name, '/Demux',num2str(p)],'outputs','20','Position',[left_offset height_offset left_offset+5 height_offset+num_of_outputs*10+12*10]);
        A = get_param([Name, '/Demux',num2str(p)],'Position');
        add_block('simulink/Sources/From Workspace',[Name,'/From Workspace',num2str(p)],'Position',[150 height_offset+((A(4)-A(2))/2-10) 200 height_offset+((A(4)-A(2))/2+10)]);
        set_param([Name,'/From Workspace',num2str(p)],'VariableName',['VR.trailer' num2str(p-1)])
        FromWorkspaceHandles = get_param([Name,'/From Workspace',num2str(p)],'PortHandles');
        SubsysPortHandles = get_param([Name,'/VR sink'],'PortHandles');
        ScopePortHandles = get_param([Name,'/Demux',num2str(p)],'PortHandles');
        add_line(Name,FromWorkspaceHandles.Outport(1),ScopePortHandles.Inport(1),'autorouting','on');
        for u = 1:20
            add_line(Name,ScopePortHandles.Outport(u),SubsysPortHandles.Inport(nodes_offset+16+u),'autorouting','on');
        end
    elseif t2 == 4 && a == 3 && d == 1
        add_block('simulink/Signal Routing/Demux',[Name, '/Demux_dolly',num2str(p)],'outputs','10','Position',[left_offset height_offset left_offset+5 height_offset+num_of_outputs*10]);
        A = get_param([Name, '/Demux_dolly',num2str(p)],'Position');
        add_block('simulink/Sources/From Workspace',[Name,'/From Workspace dolly',num2str(p)],'Position',[150 height_offset+((A(4)-A(2))/2-10) 200 height_offset+((A(4)-A(2))/2+10)]);
        set_param([Name,'/From Workspace dolly',num2str(p)],'VariableName',['VR.dolly' num2str(p-1)])
        FromWorkspaceHandles = get_param([Name,'/From Workspace dolly',num2str(p)],'PortHandles');
        SubsysPortHandles = get_param([Name,'/VR sink'],'PortHandles');
        ScopePortHandles = get_param([Name,'/Demux_dolly',num2str(p)],'PortHandles');
        add_line(Name,FromWorkspaceHandles.Outport(1),ScopePortHandles.Inport(1),'autorouting','on');
        for u = 1:10
            add_line(Name,ScopePortHandles.Outport(u),SubsysPortHandles.Inport(nodes_offset+u),'autorouting','on');
        end

        add_block('simulink/Signal Routing/Demux',[Name, '/Demux',num2str(p)],'outputs','26','Position',[left_offset height_offset left_offset+5 height_offset+num_of_outputs*10+12*10]);
        A = get_param([Name, '/Demux',num2str(p)],'Position');
        add_block('simulink/Sources/From Workspace',[Name,'/From Workspace',num2str(p)],'Position',[150 height_offset+((A(4)-A(2))/2-10) 200 height_offset+((A(4)-A(2))/2+10)]);
        set_param([Name,'/From Workspace',num2str(p)],'VariableName',['VR.trailer' num2str(p-1)])
        FromWorkspaceHandles = get_param([Name,'/From Workspace',num2str(p)],'PortHandles');
        SubsysPortHandles = get_param([Name,'/VR sink'],'PortHandles');
        ScopePortHandles = get_param([Name,'/Demux',num2str(p)],'PortHandles');
        add_line(Name,FromWorkspaceHandles.Outport(1),ScopePortHandles.Inport(1),'autorouting','on');
        for u = 1:26
            add_line(Name,ScopePortHandles.Outport(u),SubsysPortHandles.Inport(nodes_offset+10+u),'autorouting','on');
        end
    elseif t2 == 4 && a == 3 && d == 2
        add_block('simulink/Signal Routing/Demux',[Name, '/Demux_dolly',num2str(p)],'outputs','16','Position',[left_offset height_offset left_offset+5 height_offset+num_of_outputs*10]);
        A = get_param([Name, '/Demux_dolly',num2str(p)],'Position');
        add_block('simulink/Sources/From Workspace',[Name,'/From Workspace dolly',num2str(p)],'Position',[150 height_offset+((A(4)-A(2))/2-10) 200 height_offset+((A(4)-A(2))/2+10)]);
        set_param([Name,'/From Workspace dolly',num2str(p)],'VariableName',['VR.dolly' num2str(p-1)])
        FromWorkspaceHandles = get_param([Name,'/From Workspace dolly',num2str(p)],'PortHandles');
        SubsysPortHandles = get_param([Name,'/VR sink'],'PortHandles');
        ScopePortHandles = get_param([Name,'/Demux_dolly',num2str(p)],'PortHandles');
        add_line(Name,FromWorkspaceHandles.Outport(1),ScopePortHandles.Inport(1),'autorouting','on');
        for u = 1:16
            add_line(Name,ScopePortHandles.Outport(u),SubsysPortHandles.Inport(nodes_offset+u),'autorouting','on');
        end

        add_block('simulink/Signal Routing/Demux',[Name, '/Demux',num2str(p)],'outputs','26','Position',[left_offset height_offset left_offset+5 height_offset+num_of_outputs*10+18*10]);
        A = get_param([Name, '/Demux',num2str(p)],'Position');
        add_block('simulink/Sources/From Workspace',[Name,'/From Workspace',num2str(p)],'Position',[150 height_offset+((A(4)-A(2))/2-10) 200 height_offset+((A(4)-A(2))/2+10)]);
        set_param([Name,'/From Workspace',num2str(p)],'VariableName',['VR.trailer' num2str(p-1)])
        FromWorkspaceHandles = get_param([Name,'/From Workspace',num2str(p)],'PortHandles');
        SubsysPortHandles = get_param([Name,'/VR sink'],'PortHandles');
        ScopePortHandles = get_param([Name,'/Demux',num2str(p)],'PortHandles');
        add_line(Name,FromWorkspaceHandles.Outport(1),ScopePortHandles.Inport(1),'autorouting','on');
        for u = 1:26
            add_line(Name,ScopePortHandles.Outport(u),SubsysPortHandles.Inport(nodes_offset+16+u),'autorouting','on');
        end
    elseif t2 == 4 && a == 4 && d == 1
        add_block('simulink/Signal Routing/Demux',[Name, '/Demux_dolly',num2str(p)],'outputs','10','Position',[left_offset height_offset left_offset+5 height_offset+num_of_outputs*10]);
        A = get_param([Name, '/Demux_dolly',num2str(p)],'Position');
        add_block('simulink/Sources/From Workspace',[Name,'/From Workspace dolly',num2str(p)],'Position',[150 height_offset+((A(4)-A(2))/2-10) 200 height_offset+((A(4)-A(2))/2+10)]);
        set_param([Name,'/From Workspace dolly',num2str(p)],'VariableName',['VR.dolly' num2str(p-1)])
        FromWorkspaceHandles = get_param([Name,'/From Workspace dolly',num2str(p)],'PortHandles');
        SubsysPortHandles = get_param([Name,'/VR sink'],'PortHandles');
        ScopePortHandles = get_param([Name,'/Demux_dolly',num2str(p)],'PortHandles');
        add_line(Name,FromWorkspaceHandles.Outport(1),ScopePortHandles.Inport(1),'autorouting','on');
        for u = 1:10
            add_line(Name,ScopePortHandles.Outport(u),SubsysPortHandles.Inport(nodes_offset+u),'autorouting','on');
        end

        add_block('simulink/Signal Routing/Demux',[Name, '/Demux',num2str(p)],'outputs','32','Position',[left_offset height_offset left_offset+5 height_offset+num_of_outputs*10+18*10]);
        A = get_param([Name, '/Demux',num2str(p)],'Position');
        add_block('simulink/Sources/From Workspace',[Name,'/From Workspace',num2str(p)],'Position',[150 height_offset+((A(4)-A(2))/2-10) 200 height_offset+((A(4)-A(2))/2+10)]);
        set_param([Name,'/From Workspace',num2str(p)],'VariableName',['VR.trailer' num2str(p-1)])
        FromWorkspaceHandles = get_param([Name,'/From Workspace',num2str(p)],'PortHandles');
        SubsysPortHandles = get_param([Name,'/VR sink'],'PortHandles');
        ScopePortHandles = get_param([Name,'/Demux',num2str(p)],'PortHandles');
        add_line(Name,FromWorkspaceHandles.Outport(1),ScopePortHandles.Inport(1),'autorouting','on');
        for u = 1:32
            add_line(Name,ScopePortHandles.Outport(u),SubsysPortHandles.Inport(nodes_offset+10+u),'autorouting','on');
        end
    elseif t2 == 4 && a == 4 && d == 2
        add_block('simulink/Signal Routing/Demux',[Name, '/Demux_dolly',num2str(p)],'outputs','16','Position',[left_offset height_offset left_offset+5 height_offset+num_of_outputs*10]);
        A = get_param([Name, '/Demux_dolly',num2str(p)],'Position');
        add_block('simulink/Sources/From Workspace',[Name,'/From Workspace dolly',num2str(p)],'Position',[150 height_offset+((A(4)-A(2))/2-10) 200 height_offset+((A(4)-A(2))/2+10)]);
        set_param([Name,'/From Workspace dolly',num2str(p)],'VariableName',['VR.dolly' num2str(p-1)])
        FromWorkspaceHandles = get_param([Name,'/From Workspace dolly',num2str(p)],'PortHandles');
        SubsysPortHandles = get_param([Name,'/VR sink'],'PortHandles');
        ScopePortHandles = get_param([Name,'/Demux_dolly',num2str(p)],'PortHandles');
        add_line(Name,FromWorkspaceHandles.Outport(1),ScopePortHandles.Inport(1),'autorouting','on');
        for u = 1:16
            add_line(Name,ScopePortHandles.Outport(u),SubsysPortHandles.Inport(nodes_offset+u),'autorouting','on');
        end

        add_block('simulink/Signal Routing/Demux',[Name, '/Demux',num2str(p)],'outputs','32','Position',[left_offset height_offset left_offset+5 height_offset+num_of_outputs*10+24*10]);
        A = get_param([Name, '/Demux',num2str(p)],'Position');
        add_block('simulink/Sources/From Workspace',[Name,'/From Workspace',num2str(p)],'Position',[150 height_offset+((A(4)-A(2))/2-10) 200 height_offset+((A(4)-A(2))/2+10)]);
        set_param([Name,'/From Workspace',num2str(p)],'VariableName',['VR.trailer' num2str(p-1)])
        FromWorkspaceHandles = get_param([Name,'/From Workspace',num2str(p)],'PortHandles');
        SubsysPortHandles = get_param([Name,'/VR sink'],'PortHandles');
        ScopePortHandles = get_param([Name,'/Demux',num2str(p)],'PortHandles');
        add_line(Name,FromWorkspaceHandles.Outport(1),ScopePortHandles.Inport(1),'autorouting','on');
        for u = 1:32
            add_line(Name,ScopePortHandles.Outport(u),SubsysPortHandles.Inport(nodes_offset+16+u),'autorouting','on');
        end
    elseif t2 == 4 && a == 5 && d == 1
        add_block('simulink/Signal Routing/Demux',[Name, '/Demux_dolly',num2str(p)],'outputs','10','Position',[left_offset height_offset left_offset+5 height_offset+num_of_outputs*10]);
        A = get_param([Name, '/Demux_dolly',num2str(p)],'Position');
        add_block('simulink/Sources/From Workspace',[Name,'/From Workspace dolly',num2str(p)],'Position',[150 height_offset+((A(4)-A(2))/2-10) 200 height_offset+((A(4)-A(2))/2+10)]);
        set_param([Name,'/From Workspace dolly',num2str(p)],'VariableName',['VR.dolly' num2str(p-1)])
        FromWorkspaceHandles = get_param([Name,'/From Workspace dolly',num2str(p)],'PortHandles');
        SubsysPortHandles = get_param([Name,'/VR sink'],'PortHandles');
        ScopePortHandles = get_param([Name,'/Demux_dolly',num2str(p)],'PortHandles');
        add_line(Name,FromWorkspaceHandles.Outport(1),ScopePortHandles.Inport(1),'autorouting','on');
        for u = 1:10
            add_line(Name,ScopePortHandles.Outport(u),SubsysPortHandles.Inport(nodes_offset+u),'autorouting','on');
        end

        add_block('simulink/Signal Routing/Demux',[Name, '/Demux',num2str(p)],'outputs','38','Position',[left_offset height_offset left_offset+5 height_offset+num_of_outputs*10+24*10]);
        A = get_param([Name, '/Demux',num2str(p)],'Position');
        add_block('simulink/Sources/From Workspace',[Name,'/From Workspace',num2str(p)],'Position',[150 height_offset+((A(4)-A(2))/2-10) 200 height_offset+((A(4)-A(2))/2+10)]);
        set_param([Name,'/From Workspace',num2str(p)],'VariableName',['VR.trailer' num2str(p-1)])
        FromWorkspaceHandles = get_param([Name,'/From Workspace',num2str(p)],'PortHandles');
        SubsysPortHandles = get_param([Name,'/VR sink'],'PortHandles');
        ScopePortHandles = get_param([Name,'/Demux',num2str(p)],'PortHandles');
        add_line(Name,FromWorkspaceHandles.Outport(1),ScopePortHandles.Inport(1),'autorouting','on');
        for u = 1:38
            add_line(Name,ScopePortHandles.Outport(u),SubsysPortHandles.Inport(nodes_offset+10+u),'autorouting','on');
        end
    elseif t2 == 4 && a == 5 && d == 2
        add_block('simulink/Signal Routing/Demux',[Name, '/Demux_dolly',num2str(p)],'outputs','16','Position',[left_offset height_offset left_offset+5 height_offset+num_of_outputs*10]);
        A = get_param([Name, '/Demux_dolly',num2str(p)],'Position');
        add_block('simulink/Sources/From Workspace',[Name,'/From Workspace dolly',num2str(p)],'Position',[150 height_offset+((A(4)-A(2))/2-10) 200 height_offset+((A(4)-A(2))/2+10)]);
        set_param([Name,'/From Workspace dolly',num2str(p)],'VariableName',['VR.dolly' num2str(p-1)])
        FromWorkspaceHandles = get_param([Name,'/From Workspace dolly',num2str(p)],'PortHandles');
        SubsysPortHandles = get_param([Name,'/VR sink'],'PortHandles');
        ScopePortHandles = get_param([Name,'/Demux_dolly',num2str(p)],'PortHandles');
        add_line(Name,FromWorkspaceHandles.Outport(1),ScopePortHandles.Inport(1),'autorouting','on');
        for u = 1:16
            add_line(Name,ScopePortHandles.Outport(u),SubsysPortHandles.Inport(nodes_offset+u),'autorouting','on');
        end

        add_block('simulink/Signal Routing/Demux',[Name, '/Demux',num2str(p)],'outputs','38','Position',[left_offset height_offset left_offset+5 height_offset+num_of_outputs*10+30*10]);
        A = get_param([Name, '/Demux',num2str(p)],'Position');
        add_block('simulink/Sources/From Workspace',[Name,'/From Workspace',num2str(p)],'Position',[150 height_offset+((A(4)-A(2))/2-10) 200 height_offset+((A(4)-A(2))/2+10)]);
        set_param([Name,'/From Workspace',num2str(p)],'VariableName',['VR.trailer' num2str(p-1)])
        FromWorkspaceHandles = get_param([Name,'/From Workspace',num2str(p)],'PortHandles');
        SubsysPortHandles = get_param([Name,'/VR sink'],'PortHandles');
        ScopePortHandles = get_param([Name,'/Demux',num2str(p)],'PortHandles');
        add_line(Name,FromWorkspaceHandles.Outport(1),ScopePortHandles.Inport(1),'autorouting','on');
        for u = 1:38
            add_line(Name,ScopePortHandles.Outport(u),SubsysPortHandles.Inport(nodes_offset+16+u),'autorouting','on');
        end

    elseif t2 == 5 && a == 1
        add_block('simulink/Signal Routing/Demux',[Name, '/Demux',num2str(p)],'outputs','18','Position',[left_offset height_offset left_offset+5 height_offset+num_of_outputs*10]);
        A = get_param([Name, '/Demux',num2str(p)],'Position');
        add_block('simulink/Sources/From Workspace',[Name,'/From Workspace',num2str(p)],'Position',[150 height_offset+((A(4)-A(2))/2-10) 200 height_offset+((A(4)-A(2))/2+10)]);
        set_param([Name,'/From Workspace',num2str(p)],'VariableName',['VR.trailer' num2str(p-1)])
        FromWorkspaceHandles = get_param([Name,'/From Workspace',num2str(p)],'PortHandles');
        SubsysPortHandles = get_param([Name,'/VR sink'],'PortHandles');
        ScopePortHandles = get_param([Name,'/Demux',num2str(p)],'PortHandles');
        add_line(Name,FromWorkspaceHandles.Outport(1),ScopePortHandles.Inport(1),'autorouting','on');
        for u = 1:18
            add_line(Name,ScopePortHandles.Outport(u),SubsysPortHandles.Inport(nodes_offset+u),'autorouting','on');
        end
    elseif t2 == 5 && a == 2
        add_block('simulink/Signal Routing/Demux',[Name, '/Demux',num2str(p)],'outputs','24','Position',[left_offset height_offset left_offset+5 height_offset+num_of_outputs*10+6*10]);
        A = get_param([Name, '/Demux',num2str(p)],'Position');
        add_block('simulink/Sources/From Workspace',[Name,'/From Workspace',num2str(p)],'Position',[150 height_offset+((A(4)-A(2))/2-10) 200 height_offset+((A(4)-A(2))/2+10)]);
        set_param([Name,'/From Workspace',num2str(p)],'VariableName',['VR.trailer' num2str(p-1)])
        FromWorkspaceHandles = get_param([Name,'/From Workspace',num2str(p)],'PortHandles');
        SubsysPortHandles = get_param([Name,'/VR sink'],'PortHandles');
        ScopePortHandles = get_param([Name,'/Demux',num2str(p)],'PortHandles');
        add_line(Name,FromWorkspaceHandles.Outport(1),ScopePortHandles.Inport(1),'autorouting','on');
        for u = 1:24
            add_line(Name,ScopePortHandles.Outport(u),SubsysPortHandles.Inport(nodes_offset+u),'autorouting','on');
        end
    elseif t2 == 5 && a == 3
        add_block('simulink/Signal Routing/Demux',[Name, '/Demux',num2str(p)],'outputs','30','Position',[left_offset height_offset left_offset+5 height_offset+num_of_outputs*10+12*10]);
        A = get_param([Name, '/Demux',num2str(p)],'Position');
        add_block('simulink/Sources/From Workspace',[Name,'/From Workspace',num2str(p)],'Position',[150 height_offset+((A(4)-A(2))/2-10) 200 height_offset+((A(4)-A(2))/2+10)]);
        set_param([Name,'/From Workspace',num2str(p)],'VariableName',['VR.trailer' num2str(p-1)])
        FromWorkspaceHandles = get_param([Name,'/From Workspace',num2str(p)],'PortHandles');
        SubsysPortHandles = get_param([Name,'/VR sink'],'PortHandles');
        ScopePortHandles = get_param([Name,'/Demux',num2str(p)],'PortHandles');
        add_line(Name,FromWorkspaceHandles.Outport(1),ScopePortHandles.Inport(1),'autorouting','on');
        for u = 1:30
            add_line(Name,ScopePortHandles.Outport(u),SubsysPortHandles.Inport(nodes_offset+u),'autorouting','on');
        end
    elseif t2 == 5 && a == 4
        add_block('simulink/Signal Routing/Demux',[Name, '/Demux',num2str(p)],'outputs','36','Position',[left_offset height_offset left_offset+5 height_offset+num_of_outputs*10+18*10]);
        A = get_param([Name, '/Demux',num2str(p)],'Position');
        add_block('simulink/Sources/From Workspace',[Name,'/From Workspace',num2str(p)],'Position',[150 height_offset+((A(4)-A(2))/2-10) 200 height_offset+((A(4)-A(2))/2+10)]);
        set_param([Name,'/From Workspace',num2str(p)],'VariableName',['VR.trailer' num2str(p-1)])
        FromWorkspaceHandles = get_param([Name,'/From Workspace',num2str(p)],'PortHandles');
        SubsysPortHandles = get_param([Name,'/VR sink'],'PortHandles');
        ScopePortHandles = get_param([Name,'/Demux',num2str(p)],'PortHandles');
        add_line(Name,FromWorkspaceHandles.Outport(1),ScopePortHandles.Inport(1),'autorouting','on');
        for u = 1:36
            add_line(Name,ScopePortHandles.Outport(u),SubsysPortHandles.Inport(nodes_offset+u),'autorouting','on');
        end

    elseif t2 == 6 && a == 1
        add_block('simulink/Signal Routing/Demux',[Name, '/Demux',num2str(p)],'outputs','12','Position',[left_offset height_offset left_offset+5 height_offset+num_of_outputs*10]);
        A = get_param([Name, '/Demux',num2str(p)],'Position');
        add_block('simulink/Sources/From Workspace',[Name,'/From Workspace',num2str(p)],'Position',[150 height_offset+((A(4)-A(2))/2-10) 200 height_offset+((A(4)-A(2))/2+10)]);
        set_param([Name,'/From Workspace',num2str(p)],'VariableName',['VR.trailer' num2str(p-1)])
        FromWorkspaceHandles = get_param([Name,'/From Workspace',num2str(p)],'PortHandles');
        SubsysPortHandles = get_param([Name,'/VR sink'],'PortHandles');
        ScopePortHandles = get_param([Name,'/Demux',num2str(p)],'PortHandles');
        add_line(Name,FromWorkspaceHandles.Outport(1),ScopePortHandles.Inport(1),'autorouting','on');
        for u = 1:12
            add_line(Name,ScopePortHandles.Outport(u),SubsysPortHandles.Inport(nodes_offset+u),'autorouting','on');
        end
    elseif t2 == 6 && a == 2
        add_block('simulink/Signal Routing/Demux',[Name, '/Demux',num2str(p)],'outputs','18','Position',[left_offset height_offset left_offset+5 height_offset+num_of_outputs*10+6*10]);
        A = get_param([Name, '/Demux',num2str(p)],'Position');
        add_block('simulink/Sources/From Workspace',[Name,'/From Workspace',num2str(p)],'Position',[150 height_offset+((A(4)-A(2))/2-10) 200 height_offset+((A(4)-A(2))/2+10)]);
        set_param([Name,'/From Workspace',num2str(p)],'VariableName',['VR.trailer' num2str(p-1)])
        FromWorkspaceHandles = get_param([Name,'/From Workspace',num2str(p)],'PortHandles');
        SubsysPortHandles = get_param([Name,'/VR sink'],'PortHandles');
        ScopePortHandles = get_param([Name,'/Demux',num2str(p)],'PortHandles');
        add_line(Name,FromWorkspaceHandles.Outport(1),ScopePortHandles.Inport(1),'autorouting','on');
        for u = 1:18
            add_line(Name,ScopePortHandles.Outport(u),SubsysPortHandles.Inport(nodes_offset+u),'autorouting','on');
        end
    elseif t2 == 6 && a == 3
        add_block('simulink/Signal Routing/Demux',[Name, '/Demux',num2str(p)],'outputs','24','Position',[left_offset height_offset left_offset+5 height_offset+num_of_outputs*10+12*10]);
        A = get_param([Name, '/Demux',num2str(p)],'Position');
        add_block('simulink/Sources/From Workspace',[Name,'/From Workspace',num2str(p)],'Position',[150 height_offset+((A(4)-A(2))/2-10) 200 height_offset+((A(4)-A(2))/2+10)]);
        set_param([Name,'/From Workspace',num2str(p)],'VariableName',['VR.trailer' num2str(p-1)])
        FromWorkspaceHandles = get_param([Name,'/From Workspace',num2str(p)],'PortHandles');
        SubsysPortHandles = get_param([Name,'/VR sink'],'PortHandles');
        ScopePortHandles = get_param([Name,'/Demux',num2str(p)],'PortHandles');
        add_line(Name,FromWorkspaceHandles.Outport(1),ScopePortHandles.Inport(1),'autorouting','on');
        for u = 1:24
            add_line(Name,ScopePortHandles.Outport(u),SubsysPortHandles.Inport(nodes_offset+u),'autorouting','on');
        end
    elseif t2 == 6 && a == 4
        add_block('simulink/Signal Routing/Demux',[Name, '/Demux',num2str(p)],'outputs','30','Position',[left_offset height_offset left_offset+5 height_offset+num_of_outputs*10+18*10]);
        A = get_param([Name, '/Demux',num2str(p)],'Position');
        add_block('simulink/Sources/From Workspace',[Name,'/From Workspace',num2str(p)],'Position',[150 height_offset+((A(4)-A(2))/2-10) 200 height_offset+((A(4)-A(2))/2+10)]);
        set_param([Name,'/From Workspace',num2str(p)],'VariableName',['VR.trailer' num2str(p-1)])
        FromWorkspaceHandles = get_param([Name,'/From Workspace',num2str(p)],'PortHandles');
        SubsysPortHandles = get_param([Name,'/VR sink'],'PortHandles');
        ScopePortHandles = get_param([Name,'/Demux',num2str(p)],'PortHandles');
        add_line(Name,FromWorkspaceHandles.Outport(1),ScopePortHandles.Inport(1),'autorouting','on');
        for u = 1:30
            add_line(Name,ScopePortHandles.Outport(u),SubsysPortHandles.Inport(nodes_offset+u),'autorouting','on');
        end
    end    
end

if exist('bg1')
    S.axes1 = axes('Position',[0.01 0.01 0.06 0.06],...
               'Units','Normalized');
    image(bg1);  
    axis off;
end

if exist('bg2')
    S.axes2 = axes('Position',[0.07 0.01 0.06 0.06],...
               'Units','Normalized');   
    image(bg2);          
    axis off;
end

if exist('bg3')
    S.axes3 = axes('Position',[0.14 0.01 0.06 0.06],...
               'Units','Normalized');   
    image(bg3);          
    axis off;
end

if exist('bg4')
    S.axes4 = axes('Position',[0.21 0.01 0.06 0.06],...
               'Units','Normalized');   
    image(bg4);          
    axis off;
end

if exist('bg5')
    S.axes5 = axes('Position',[0.28 0.01 0.06 0.06],...
               'Units','Normalized');   
    image(bg5);          
    axis off;
end

if p >= 1
    S.Truckname_edit = uicontrol(S.f, 'Style','edit',...
                                 'Units','Normalized',...
                                 'Position',[0.41 0.85 0.2 0.05],...
                                 'backgroundcolor','w',...
                                 'String',truckname,...
                                 'FontSize', 10,...
                                 'FontWeight','bold',...
                                 'FontUnits','Normalized',...
                                 'Callback',@Truckname); 
end

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

close(S.hWait)

function Back_callback(source,eventdata) 
global jObj S
back = 1;
waitScreen
LHV_TOOL
jObj.stop;
close(S.hWait)

function tractor_callback(source, eventdata)
global start_window t1 jObj S
start_window=0; t1=1;
waitScreen; pre_processor_hauling
jObj.stop; closereq; close(S.hWait) 

function truck_callback(source, eventdata)
global start_window t1 jObj S
start_window=0; t1=2;    
waitScreen; pre_processor_hauling
jObj.stop; closereq; close(S.hWait)

function truck_king_callback(source, eventdata)
global start_window t1 jObj S
start_window=0; t1=3;
waitScreen; pre_processor_hauling
jObj.stop; closereq; close(S.hWait)

function Semitrailer_callback(source, eventdata)
global start_window t2 jObj S
start_window=0; t2=1;
waitScreen; pre_processor_trailing
jObj.stop; closereq; close(S.hWait)

function Semitrailer_king_callback(source, eventdata)
global start_window t2 jObj S
start_window=0; t2=3;
waitScreen; pre_processor_trailing
jObj.stop; closereq; close(S.hWait)

function Semitrailer_doll_callback(eventdata, handles)
global start_window t2 jObj S
start_window=0; t2=2;
waitScreen; pre_processor_trailing_doll
jObj.stop; closereq; close(S.hWait)

function semitrailerkingpindoll_button_Callback(source, eventdata)
global start_window t2 jObj S
start_window=0; t2=4;
waitScreen; pre_processor_trailing_doll
jObj.stop; closereq; close(S.hWait)

function trailer_callback(source, eventdata)
global start_window t2 jObj S
start_window=0; t2=5;
waitScreen; pre_processor_trailing
jObj.stop; closereq; close(S.hWait)

function dbtrailer_callback(source, eventdata)
global start_window t2 jObj S
start_window=0; t2=6;
waitScreen; pre_processor_trailing
jObj.stop; closereq; close(S.hWait)

function saveModel_callback(source,eventdata)
global num_of_nodes fid Name a trailer_name S start_window file_name axle_tractor axle_trailer axle_dolly conf p truckname custom truck_name sprung_mass sprung_mass_dolly default tractor_code trailer_code zcg zcg_load wheelbase width_firstaxle tractor mindist2axles_nbtrailer mindist2axles_nbdolly t2_trailer width vehiculelength mindist2axles
start_window=0;
addpath model/SavedModel_OwnSimulation/OriginalFiles
truckname = get(S.Truckname_edit,'String');

wrl_end(fid)

NodesWritten = cellstr('CamPos1')';
FieldsWritten = cellstr(repmat(strvcat('translation'),1,1))';
temp = strcat(NodesWritten',repmat('.',1,1),strcat(FieldsWritten',repmat('#',1,1)));
str = cat(2,temp{:}); % deal out and concatenate  

h_vrsink=find_system('referenceblock','vrlib/VR Sink');
h_vrsink=char(h_vrsink);
x = get_param(h_vrsink, 'FieldsWritten');
set_param(h_vrsink, 'FieldsWritten', [x,str],'Position',[400 10 500 10+num_of_nodes*10]);    
    
ScopePortHandles = get_param([Name,'/Demux1'],'PortHandles');
SubsysPortHandles = get_param([Name,'/VR sink'],'PortHandles');
add_line(Name,ScopePortHandles.Outport(6),SubsysPortHandles.Inport(num_of_nodes+1),'autorouting','on');
        
save_system(Name, [Name,'_anim']);
set_param(file_name,'StopTime','tmax')
set_param(file_name,'StopFcn', 'sim_stop_function')
set_param(file_name,'PreLoadFcn','')
set_param(file_name,'InitFcn', '')
save_system(file_name)
save_system(file_name, Name);

eval('save LZV_custom','axle_tractor axle_trailer axle_dolly conf p custom default')
load components.mat;
tyre_data = gencode(tyres);
A = char(tyre_data);
load_system(file_name);
set_param(file_name,'StopTime','tmax')
set_param(file_name,'InitFcn', A)
set_param(file_name,'StopFcn', 'sim_stop_function')
set_param(file_name,'PreLoadFcn','addpath library; warning off; set_param(bdroot,''SimulationCommand'',''update'');')
add_line(strcat(file_name),strcat(trailer_name,'/1'),strcat('DriverTL/4'),'autorouting','on')

if a == 1
    set_param(strcat(file_name,'/DriverTL/selector1'),'OutputSignals','axle1.traileraxle_pos')
elseif a == 2
    set_param(strcat(file_name,'/DriverTL/selector1'),'OutputSignals','axle2.traileraxle_pos')
elseif a == 3
    set_param(strcat(file_name,'/DriverTL/selector1'),'OutputSignals','axle3.traileraxle_pos')
elseif a == 4
    set_param(strcat(file_name,'/DriverTL/selector1'),'OutputSignals','axle4.traileraxle_pos')
elseif a == 5    
    set_param(strcat(file_name,'/DriverTL/selector1'),'OutputSignals','axle5.traileraxle_pos')
end

save_system(file_name)

newpathname = 'model\SavedModel_OwnSimulation\';
if isdir([newpathname,truckname]) == 0
    mkdir([newpathname,truckname]);
    newpathname2 = [newpathname,truckname];
    Default_modelname = [truckname,'.slx'];
    [filename,pathname] = uiputfile([newpathname2,'\',Default_modelname],'Select (or create a new) folder for saving files');
    [~,name,~] = fileparts(filename);
    wrlname = [name,'.wrl'];
    animname = [name, '_anim.slx'];
    
    if isequal(filename,0) || isequal(pathname,0)
       disp('User selected Cancel')
    else

    copyfile('model\SavedModel_OwnSimulation\OriginalFiles\postprocessing_original', [pathname 'postprocessing']);
    copyfile('model\SavedModel_OwnSimulation\OriginalFiles\run_original',            [pathname 'run']);
    copyfile('model\SavedModel_OwnSimulation\OriginalFiles\simresults_original',     [pathname 'simresults']);
    copyfile('model\SavedModel_OwnSimulation\OriginalFiles\visualization_original',  [pathname 'visualization']);
    copyfile('LZV_custom.slx',                                         [pathname filename]);
    copyfile([Name,'_anim.slx'],                                       [pathname animname])
    copyfile([Name,'.wrl'],                                            [pathname wrlname])    
    copyfile('library',                                                [pathname 'library']);
    copyfile('model\manual_gearbox.m',                                 [pathname 'manual_gearbox.m']);
    copyfile('model\manual_gearbox_18.m',                              [pathname 'manual_gearbox_18.m']);
    copyfile('model\sim_stop_function.m',                              [pathname 'sim_stop_function.m']);
    copyfile('model\SavedModel_OwnSimulation\OriginalFiles\Do_visualization.m',                      [pathname 'Do_visualization.m']);
    copyfile('model\SavedModel_OwnSimulation\OriginalFiles\sim_wrapper_OwnSimulation.m',             [pathname 'sim_wrapper.m']);

    %% Create simulation execution *.m file

    m_filename = ['Do_' strrep(filename, '.slx', '.m')];
    fullFileName = fullfile(pathname, m_filename);
    save(fullFileName);
    fileID = fopen(fullFileName, 'wt');
    fprintf(fileID, 'addpath run\n\n');
    fprintf(fileID, '%% ===========================FILE DESCRIPTION=============================\n');
    fprintf(fileID, '%% It is possible to do simulate 20 PBS standards by this script. To\n');
    fprintf(fileID, '%% run a simulation, uncomment the desired line by pressing ctrl-T. To\n');
    fprintf(fileID, '%% comment a line out, press ctrl-R. Simulate the statics simulation for\n');
    fprintf(fileID, '%% initializing the vertical axle loads of the truck configuration. You \n');
    fprintf(fileID, '%% can modify the number of iterations. The recalculated loads are \n');
    fprintf(fileID, '%% automatically saved in the Simulink model.\n\n');
    fprintf(fileID, '%% After running the statics simulation, you can do the simulations you\n'); 
    fprintf(fileID, '%% want. The simulations results are automatically saved in the simresults\n');
    fprintf(fileID, '%% folder. Run the Do_all_parallel line to run all the simulations in a\n');
    fprintf(fileID, '%% parallel sesion. You can find Do_all_parallel.m in the run folder\m');
    fprintf(fileID, '%% To plot the results, open Do_postprocessing.m and run the desired\n');
    fprintf(fileID, '%% postprocessing line\n');
    fprintf(fileID, '%% =========================================================================\n\n');
    fprintf(fileID, 'run_Statics(''%s'',2); %% number of iterations (0 (zero): no iteration)\n\n' ,strrep(filename, '.slx',''));
    fprintf(fileID, '%% Do_all_parallel(''%s'');\n\n', strrep(filename, '.slx',''));
    fprintf(fileID, '%% C1_run_Startability(''%s'',20,1); %% grade; friction coefficient\n', strrep(filename, '.slx',''));
    fprintf(fileID, '%% C2_run_Gradeability_motion(''%s'',1); %% friction coefficient\n', strrep(filename, '.slx',''));
    fprintf(fileID, '%% C3_run_Acceleration(''%s'',1); %% friction coefficient\n', strrep(filename, '.slx',''));
    fprintf(fileID, '%% C4_run_Overtaking(''%s'');\n', strrep(filename, '.slx',''));
    fprintf(fileID, '%% C5_run_Tracking(''%s'',1); %% friction coefficient\n', strrep(filename, '.slx',''));
    fprintf(fileID, '%% C6_run_RideQuality(''%s'',''TNO_Banked.rdf'',1); %% road file; friction coefficient\n', strrep(filename, '.slx',''));
    fprintf(fileID, '%% C7_run_SweptPath(''%s'',1); %% friction coefficient\n', strrep(filename, '.slx',''));
    fprintf(fileID, '%% C8_run_FrontalSwing(''%s'',1); %% friction coefficient\n', strrep(filename, '.slx',''));
    fprintf(fileID, '%% C9_run_TailSwing(''%s'',1); %% friction coefficient\n', strrep(filename, '.slx',''));
    fprintf(fileID, '%% C10_run_TyreFriction(''%s'',1); %% friction coefficient\n', strrep(filename, '.slx',''));
    fprintf(fileID, '%% C11_run_Rollover(''%s'',40,1); %% velocity (km/h); friction coefficient\n', strrep(filename, '.slx',''));
    fprintf(fileID, '%% C12_run_RearwardAmpli(''%s'',20,1); %% amplitude (degrees); friction coefficient\n', strrep(filename, '.slx',''));
    fprintf(fileID, '%% C13_run_Offtracking(''%s'',30,1); %% amplitude (degrees); friction coefficient\n', strrep(filename, '.slx',''));
    fprintf(fileID, '%% C14_run_YawDamping(''%s'',35,1); %% amplitude (degrees); friction coefficient\n', strrep(filename, '.slx',''));
    fprintf(fileID, '%% C15_run_HandlingQuality(''%s'',1); %% friction coefficient\n', strrep(filename, '.slx',''));
    fprintf(fileID, '%% C16_run_DirectionalStability(''%s'',1,1,1); %% friction coefficient, ABS included:1, Valve included:1\n', strrep(filename, '.slx',''));
    fprintf(fileID, '%% run_Sidewind(''%s'',0,50,1); %% wind angle; wind speed; friction coefficient\n', strrep(filename, '.slx',''));
    fprintf(fileID, '%% run_SweptPath360(''%s'',1); %% friction coefficient\n', strrep(filename, '.slx',''));
    fprintf(fileID, '%% run_Turn90R8(''%s'',1); %% friction coefficient\n', strrep(filename, '.slx',''));
    fprintf(fileID, '%% run_CRG(''%s'',30); %% vehicle velocity [km/h]\n', strrep(filename, '.slx',''));
    fclose(fileID);

    %% Create initializing *.m file
    baseFileName = 'Initialize.m';
    fullFileName = fullfile(pathname, baseFileName);
    save(fullFileName);
    fileID = fopen(fullFileName, 'wt');
    fprintf(fileID, 'modelname = ''%s'';\n', strrep(filename, '.slx', ''));
    if isempty(p)
    else
        fprintf(fileID, 'p = %.f;\n', p);
    end
    fprintf(fileID, 'axle_tractor = %.f;\n', axle_tractor);

    if isempty(axle_trailer)
    else 
          fprintf(fileID, 'axle_trailer = ');
    [rows cols] = size(axle_trailer);
    x = repmat('%d\t',1,(cols-1));
    fprintf(fileID,[ '[' x,'%d]; \n'],axle_trailer'); 
    end
    fprintf(fileID, 'truck_name = ''%s'';\n', truck_name);

    fprintf(fileID, 'sprung_mass_dolly = ');
    [rows cols] = size(sprung_mass_dolly);
    x = repmat('%d\t',1,(cols-1));
    fprintf(fileID,[ '[' x,'%d]; \n'],sprung_mass_dolly');

    fprintf(fileID, 'sprung_mass = ');
    [rows cols] = size(sprung_mass);
    x = repmat('%d\t',1,(cols-1));
    fprintf(fileID,[ '[' x,'%d]; \n'],sprung_mass');

    if isempty(axle_dolly)
    else
      fprintf(fileID, 'axle_dolly = ');
    [rows cols] = size(axle_dolly);
    x = repmat('%d\t',1,(cols-1));
    fprintf(fileID,[ '[' x,'%d]; \n'],axle_dolly'); 

    end
    % fprintf(fileID, 'conf = %.f;\n', conf);
    fprintf(fileID, 'tractor_code = %.f;\n', tractor_code);
    fprintf(fileID, 'vehiculelength = %.1f;\n', vehiculelength);
    if isempty(trailer_code)
    else
          fprintf(fileID, 'trailer_code = ');
    [rows cols] = size(trailer_code);
    x = repmat('%d\t',1,(cols-1));
    fprintf(fileID,[ '[' x,'%d]; \n'],trailer_code'); 
    end
    fprintf(fileID, 'zcg = ');
    [rows cols] = size(zcg);
    x = repmat('%d\t',1,(cols-1));
    fprintf(fileID,[ '[' x,'%d]; \n'],zcg');
    fprintf(fileID, 'zcg_load = ');
    [rows cols] = size(zcg_load);
    x = repmat('%d\t',1,(cols-1));
    fprintf(fileID,[ '[' x,'%d]; \n'],zcg_load');
    fprintf(fileID, 'wheelbase = %.1f;\n', wheelbase);
    fprintf(fileID, 'width_firstaxle = %.1f;\n', width_firstaxle);
    fprintf(fileID, 'tractor = %.f;\n', tractor);
    fprintf(fileID, 'mindist2axles = %.3f;\n', mindist2axles);
    if isempty(mindist2axles_nbtrailer)
    else
        fprintf(fileID, 'mindist2axles_nbtrailer = %.3f;\n', mindist2axles_nbtrailer);
    end
    if isempty(mindist2axles_nbdolly)
    else
        fprintf(fileID, 'mindist2axles_nbdolly = %.3f;\n', mindist2axles_nbdolly);
    end
    if isempty(t2_trailer)
    else
        fprintf(fileID, 't2_trailer = %f;\n', t2_trailer);
    end
    if isempty(width)
    else
        fprintf(fileID, 'width = %f;\n', width);
    end
    fclose(fileID);

    %% Create postprocessing *.m file
    baseFileName = 'Do_postprocessing.m';
    fullFileName = fullfile(pathname, baseFileName);
    save(fullFileName);
    fileID = fopen(fullFileName, 'wt');
    fprintf(fileID, 'global S\n\n');
    fprintf(fileID, 'addpath(genpath(''postprocessing''));\n');
    fprintf(fileID, 'post_processing;\n\n');
        
    fprintf(fileID, '%% C1_startability_postprocessing\n');
    fprintf(fileID, '%% C2_gradeability_postprocessing\n');
    fprintf(fileID, '%% C3_acceleration_postprocessing\n');
    fprintf(fileID, '%% C4_overtaking_postprocessing\n');
    fprintf(fileID, '%% C5_tracking_postprocessing\n');
    fprintf(fileID, '%% C6_ridequality_postprocessing\n');
    fprintf(fileID, '%% C7_sweptpath_postprocessing\n');
    fprintf(fileID, '%% C8_frontalswing_postprocessing\n');
    fprintf(fileID, '%% C9_tailswing_postprocessing\n');
    fprintf(fileID, '%% C10_friction_postprocessing\n');
    fprintf(fileID, '%% C11_rollover_postprocessing\n');
    fprintf(fileID, '%% C12_rearward_postprocessing\n');
    fprintf(fileID, '%% C13_offtracking_postprocessing\n');
    fprintf(fileID, '%% C14_yawdamping_postprocessing\n');
    fprintf(fileID, '%% C15_handlingquality_postprocessing\n');
    fprintf(fileID, '%% C16_directionalstability_postprocessing\n');
    fprintf(fileID, '%% sidewind_postprocessing\n');
    fprintf(fileID, '%% statics_postprocessing\n');
    fprintf(fileID, '%% sweptpath360_postprocessing\n');
    fprintf(fileID, '%% turn90r8_postprocessing\n');
    fprintf(fileID, '%% CRG_postprocessing\n\n');
    fprintf(fileID, 'set(S.f,''visible'',''on'');\n');
    fprintf(fileID, 'pause(2)\n');
    fprintf(fileID, 'figure(S.f)\n');
    fprintf(fileID, 'robot = java.awt.Robot;\n');
    fprintf(fileID, 'robot.keyPress(java.awt.event.KeyEvent.VK_ALT);\n');             
    fprintf(fileID, 'robot.keyPress(java.awt.event.KeyEvent.VK_SPACE);  \n');   
    fprintf(fileID, 'robot.keyRelease(java.awt.event.KeyEvent.VK_SPACE); \n');   
    fprintf(fileID, 'robot.keyRelease(java.awt.event.KeyEvent.VK_ALT);  \n');   
    fprintf(fileID, 'robot.keyPress(java.awt.event.KeyEvent.VK_X); \n');   
    fprintf(fileID, 'robot.keyRelease(java.awt.event.KeyEvent.VK_X); \n');   
    fclose(fileID);

    end
    closereq
else
    errordlg('Folder name already exist, please rename the truck','Folder name error');
end

function Next_callback(source, eventdata)
global start_window usesaved S Name fid num_of_nodes file_name jObj p trailer_name a
usesaved=0; start_window=0;
wrl_end(fid)

NodesWritten = cellstr('CamPos1')';
FieldsWritten = cellstr(repmat(strvcat('translation'),1,1))';
temp = strcat(NodesWritten',repmat('.',1,1),strcat(FieldsWritten',repmat('#',1,1)));
str = cat(2,temp{:}); % deal out and concatenate  

h_vrsink=find_system('referenceblock','vrlib/VR Sink');
h_vrsink=char(h_vrsink);
x = get_param(h_vrsink, 'FieldsWritten');
set_param(h_vrsink, 'FieldsWritten', [x,str],'Position',[400 10 500 10+num_of_nodes*10]);    
    
ScopePortHandles = get_param([Name,'/Demux1'],'PortHandles');
SubsysPortHandles = get_param([Name,'/VR sink'],'PortHandles');
add_line(Name,ScopePortHandles.Outport(6),SubsysPortHandles.Inport(num_of_nodes+1),'autorouting','on');
        
add_line(strcat(file_name),strcat(trailer_name,'/1'),strcat('DriverTL/4'),'autorouting','on')

if a == 1
    set_param(strcat(file_name,'/DriverTL/selector1'),'OutputSignals','axle1.traileraxle_pos')
elseif a == 2
    set_param(strcat(file_name,'/DriverTL/selector1'),'OutputSignals','axle2.traileraxle_pos')
elseif a == 3
    set_param(strcat(file_name,'/DriverTL/selector1'),'OutputSignals','axle3.traileraxle_pos')
elseif a == 4
    set_param(strcat(file_name,'/DriverTL/selector1'),'OutputSignals','axle4.traileraxle_pos')
elseif a == 5    
    set_param(strcat(file_name,'/DriverTL/selector1'),'OutputSignals','axle5.traileraxle_pos')
end

save_system(Name, [Name,'_anim']);
set_param(file_name,'StopTime','tmax')
set_param(file_name,'StopFcn', 'sim_stop_function')
set_param(file_name,'PreLoadFcn','')
set_param(file_name,'InitFcn', '')
save_system(file_name)
save_system(file_name, Name);

custom_core_simulation; closereq

function Truckname(source,eventdata)
global S truckname

String = get(S.Truckname_edit, 'String');
 if isempty(String)
   set(S.Truckname_edit,'String',truckname);
 end