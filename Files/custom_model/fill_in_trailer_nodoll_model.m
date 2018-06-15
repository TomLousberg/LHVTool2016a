global S trailer_tyre1 trailer_tyre2 trailer_tyre3 trailer_tyre4 trailer_tyre5 tyres a t2 p trailer_name zcg zcg_load xconn vehiculeconnec sprung_mass vehiculelength width trailer_number axle2connec mindist2axles_nbtrailer mindist2axles t2_trailer
load components

%Calculation of the maximal width of this trailer 
%Calculation of the maximal width
D=str2double(get(S.axle1trackwidth_edit,'String')); % [m]
valaxle1=get(S.axle1tyres_popupmenu,'Value');
if valaxle1==1
    D=D+0.318;
elseif valaxle1==2
    D=D+0.318;
elseif valaxle1==3
    D=D+0.385;
end
E=str2double(get(S.axle2trackwidth_edit,'String')); % [m]
valaxle2=get(S.axle2tyres_popupmenu,'Value');
if valaxle2==1
    E=E+0.318;
elseif valaxle2==2
    E=E+0.318;
elseif valaxle2==3
    E=E+0.385;
end
F=str2double(get(S.axle3trackwidth_edit,'String')); % [m]
valaxle3=get(S.axle3tyres_popupmenu,'Value');
if valaxle3==1
    F=F+0.318;
elseif valaxle3==2
    F=F+0.318;
elseif valaxle3==3
    F=F+0.385;
end
F1=str2double(get(S.axle4trackwidth_edit,'String')); % [m]
valaxle4=get(S.axle4tyres_popupmenu,'Value');
if valaxle4==1
    F1=F1+0.318;
elseif valaxle4==2
    F1=F1+0.318;
elseif valaxle4==3
    F1=F1+0.385;
end
F2=str2double(get(S.axle5trackwidth_edit,'String')); % [m]
valaxle5=get(S.axle5tyres_popupmenu,'Value');
if valaxle5==1
    F1=F2+0.318;
elseif valaxle5==2
    F2=F2+0.318;
elseif valaxle5==3
    F2=F2+0.385;
end
L=str2double(get(S.loadwidth_edit,'String')); % [m]

width_axle=max(max(E,D),max(max(F,F1),max(F2,L)));
width_trailer1=width_axle;
width=max(max(max(E,D),max(F,F1)),max(width,max(F2,L)));

%Mesure of the minimal distance between two group of axles
A=str2double(get(S.axle1xpos_edit,'String')); % [m]
B=str2double(get(S.axle2xpos_edit,'String')); % [m]
C=str2double(get(S.axle3xpos_edit,'String')); % [m]
C1=str2double(get(S.axle4xpos_edit,'String')); % [m]
C2=str2double(get(S.axle5xpos_edit,'String')); % [m]
M=str2double(get(S.connectionxpos_edit,'String')); % [m]
J=str2double(get(S.ftoconn_edit,'String')); % [m]

trailer_number=trailer_number+1;

if t2==1
	mindist2axles1=axle2connec+A;
	axle2connec=M-(A+B+C+C1+C2);
elseif t2==3
	mindist2axles1=axle2connec+A;
	axle2connec=M-(A+B+C+C1+C2);
elseif t2==5
        mindist2axles1=axle2connec+A;
        if mindist2axles1<mindist2axles
            mindist2axles=mindist2axles1;
            mindist2axles_nbtrailer=trailer_number;
            t2_trailer=t2*10+1;
        end
        if a<=3
            mindist2axles2=B;
        elseif a==4
            mindist2axles2=C;
        end
        if mindist2axles2<mindist2axles
            mindist2axles=mindist2axles2;
            mindist2axles_nbtrailer=trailer_number;
            t2_trailer=t2*10+2;
        end
	axle2connec=M-(B+C+C1);
elseif t2==6
	mindist2axles1=axle2connec+A+J;
	axle2connec=M-(A+B+C+C1);
end

if t2==1 || t2==3 || t2==6
    if mindist2axles1<mindist2axles
        mindist2axles=mindist2axles1;
        mindist2axles_nbtrailer=trailer_number;
        t2_trailer=t2;
    end
end

%Mesure of center of gravity - z position
mass=str2double(get(S.loadmass_edit,'String')); % [m]
rho=str2double(get(S.loadrho_edit,'String')); % [m]
K=str2double(get(S.loadlenght_edit,'String')); % [m]
L=str2double(get(S.loadwidth_edit,'String')); % [m]
O=str2double(get(S.loadzcoord_edit,'String')); % [m]
zcg(p+1)=O+(mass/(K*L*2*rho));
zcg_load(p+1)=(mass/(K*L*2*rho));

%Sprung Mass
chassismass=str2double(get(S.chassismass_edit,'String')); % [kg]
dbmass=str2double(get(S.dbmass_edit,'String')); % [kg]
if isnan(dbmass)
    dbmass = 0;
end

sprung_mass(p+1)=mass+dbmass+chassismass;

%%
    chassis_lenght=str2double(get(S.chassislenght_edit,'String')); % [m]
    chassis_width=str2double(get(S.chassiswidth_edit,'String')); % [m]
    chassis_height=str2double(get(S.chassisheight_edit,'String')); % [m]
    chassis_mass=str2double(get(S.chassismass_edit,'String')); % [kg]
    fronttoconnection_x=str2double(get(S.ftoconn_edit,'String')); % [m]
    connection_xpos1=str2double(get(S.connectionxpos_edit,'String')); % [m] ------------------    J
    connection_zpos=str2double(get(S.connectionzpos_edit,'String')); % [m]
    
    axle1_xpos1=str2double(get(S.axle1xpos_edit,'String')); % [m]          ------------   A
if t2==6
    connection_xpos=xconn-fronttoconnection_x-connection_xpos1; %
    db_mass=str2double(get(S.dbmass_edit,'String')); % [kg]
    axle1_xpos=xconn-fronttoconnection_x-axle1_xpos1;
elseif t2==5
    connection_xpos=xconn-connection_xpos1-axle1_xpos1; %
    axle1_xpos=xconn-axle1_xpos1;
else
    connection_xpos=xconn-connection_xpos1; %
    axle1_xpos=xconn-axle1_xpos1;
end
    axle1_fzstat=str2double(get(S.axle1fzstat_edit,'String')); % [N]
    axle1_kspring=str2double(get(S.axle1spring_edit,'String')); % [N/m]
    axle1_bdamper=str2double(get(S.axle1damper_edit,'String')); % [Ns/m]
    axle1_kroll=str2double(get(S.axle1roll_edit,'String')); % [Nm/rad]
    axle1_mass=str2double(get(S.axle1mass_edit,'String')); % [kg]
    axle1_trackwidth=str2double(get(S.axle1trackwidth_edit,'String')); % [m]
    axle1_zrollcenter=str2double(get(S.axle1zrollcenter_edit,'String')); % [m]
    axle1_yd=str2double(get(S.axle1yd_edit,'String')); % [m]
    axle1_ys=str2double(get(S.axle1ys_edit,'String')); % [m]
    straxle1=get(S.axle1tyres_popupmenu,'String');
    valaxle1=get(S.axle1tyres_popupmenu,'Value');
    axle1_tyre=strcat('library/tyres/',straxle1(valaxle1));
    tyres.trailer(p,1)=axle1_tyre;
    trailer_tyre1 = strcat(straxle1(valaxle1));
    
if a>=2    
    axle2_xpos1=str2double(get(S.axle2xpos_edit,'String')); % [m]
    axle2_xpos=axle1_xpos-axle2_xpos1;
    axle2_fzstat=str2double(get(S.axle1fzstat_edit,'String')); % [N]
    axle2_kspring=str2double(get(S.axle2spring_edit,'String')); % [N/m]
    axle2_bdamper=str2double(get(S.axle2damper_edit,'String')); % [Ns/m]
    axle2_kroll=str2double(get(S.axle2roll_edit,'String')); % [Nm/rad]
    axle2_mass=str2double(get(S.axle2mass_edit,'String')); % [kg]
    axle2_trackwidth=str2double(get(S.axle2trackwidth_edit,'String')); % [m]
    axle2_zrollcenter=str2double(get(S.axle2zrollcenter_edit,'String')); % [m]
    axle2_yd=str2double(get(S.axle2yd_edit,'String')); % [m]
    axle2_ys=str2double(get(S.axle2ys_edit,'String')); % [m]
    straxle2=get(S.axle2tyres_popupmenu,'String');
    valaxle2=get(S.axle2tyres_popupmenu,'Value');
    axle2_tyre=strcat('library/tyres/',straxle2(valaxle2));
    tyres.trailer(p,2)=axle2_tyre;
    trailer_tyre2 = strcat(straxle2(valaxle2));
end

if a>=3    
    axle3_xpos1=str2double(get(S.axle3xpos_edit,'String')); % [m]
    axle3_xpos=axle2_xpos-axle3_xpos1;
    axle3_fzstat=str2double(get(S.axle1fzstat_edit,'String')); % [N]
    axle3_kspring=str2double(get(S.axle3spring_edit,'String')); % [N/m]
    axle3_bdamper=str2double(get(S.axle3damper_edit,'String')); % [Ns/m]
    axle3_kroll=str2double(get(S.axle3roll_edit,'String')); % [Nm/rad]
    axle3_mass=str2double(get(S.axle3mass_edit,'String')); % [kg]
    axle3_trackwidth=str2double(get(S.axle3trackwidth_edit,'String')); % [m]
    axle3_zrollcenter=str2double(get(S.axle3zrollcenter_edit,'String')); % [m]
    axle3_yd=str2double(get(S.axle3yd_edit,'String')); % [m]
    axle3_ys=str2double(get(S.axle3ys_edit,'String')); % [m]
    straxle3=get(S.axle3tyres_popupmenu,'String');
    valaxle3=get(S.axle3tyres_popupmenu,'Value');
    axle3_tyre=strcat('library/tyres/',straxle3(valaxle3));
    tyres.trailer(p,3)=axle3_tyre;
    trailer_tyre3 = strcat(straxle3(valaxle3));
end

if a>=4 
    axle4_xpos1=str2double(get(S.axle4xpos_edit,'String')); % [m]
    axle4_xpos=axle3_xpos-axle4_xpos1;
    axle4_fzstat=str2double(get(S.axle1fzstat_edit,'String')); % [N]
    axle4_kspring=str2double(get(S.axle4spring_edit,'String')); % [N/m]
    axle4_bdamper=str2double(get(S.axle4damper_edit,'String')); % [Ns/m]
    axle4_kroll=str2double(get(S.axle4roll_edit,'String')); % [Nm/rad]
    axle4_mass=str2double(get(S.axle4mass_edit,'String')); % [kg]
    axle4_trackwidth=str2double(get(S.axle4trackwidth_edit,'String')); % [m]
    axle4_zrollcenter=str2double(get(S.axle4zrollcenter_edit,'String')); % [m]
    axle4_yd=str2double(get(S.axle4yd_edit,'String')); % [m]
    axle4_ys=str2double(get(S.axle4ys_edit,'String')); % [m]
    straxle4=get(S.axle4tyres_popupmenu,'String');
    valaxle4=get(S.axle4tyres_popupmenu,'Value');
    axle4_tyre=strcat('library/tyres/',straxle4(valaxle4));
    tyres.trailer(p,4)=axle4_tyre;
    trailer_tyre4 = strcat(straxle4(valaxle4));
end

if a==5
    axle5_xpos1=str2double(get(S.axle5xpos_edit,'String')); % [m]
    axle5_xpos=axle4_xpos-axle5_xpos1;
    axle5_fzstat=str2double(get(S.axle1fzstat_edit,'String')); % [N]
    axle5_kspring=str2double(get(S.axle5spring_edit,'String')); % [N/m]
    axle5_bdamper=str2double(get(S.axle5damper_edit,'String')); % [Ns/m]
    axle5_kroll=str2double(get(S.axle5roll_edit,'String')); % [Nm/rad]
    axle5_mass=str2double(get(S.axle5mass_edit,'String')); % [kg]
    axle5_trackwidth=str2double(get(S.axle5trackwidth_edit,'String')); % [m]
    axle5_zrollcenter=str2double(get(S.axle5zrollcenter_edit,'String')); % [m]
    axle5_yd=str2double(get(S.axle5yd_edit,'String')); % [m]
    axle5_ys=str2double(get(S.axle5ys_edit,'String')); % [m]
    straxle5=get(S.axle5tyres_popupmenu,'String');
    valaxle5=get(S.axle5tyres_popupmenu,'Value');
    axle5_tyre=strcat('library/tyres/',straxle5(valaxle5));
    tyres.trailer(p,5)=axle5_tyre;
    trailer_tyre5 = strcat(straxle5(valaxle5));
end

    load_lenght=str2double(get(S.loadlenght_edit,'String')); % [m]
    load_width=str2double(get(S.loadwidth_edit,'String')); % [m]
    load_rho=str2double(get(S.loadrho_edit,'String')); % [m]
    load_mass=str2double(get(S.loadmass_edit,'String')); % [kg]
    load_z=str2double(get(S.loadzcoord_edit,'String')); % [m]
    cg_ratio=str2double(get(S.cgratio_edit,'String')); %[%]

    save components.mat tyres
    evalin('base','load components')    

%%    
    % chassis
    set_param(strcat('LZV_custom/',trailer_name),'friction_coeff',num2str(1));
    set_param(strcat('LZV_custom/',trailer_name),'l_chassis',num2str(chassis_lenght));
    set_param(strcat('LZV_custom/',trailer_name),'w_chassis',num2str(chassis_width));
    set_param(strcat('LZV_custom/',trailer_name),'h_chassis',num2str(chassis_height));
    set_param(strcat('LZV_custom/',trailer_name),'chassis_mass',num2str(chassis_mass));
if t2==1 || t2==2 || t2==3 || t2==4     
    set_param(strcat('LZV_custom/',trailer_name),'x5th',num2str(fronttoconnection_x));
    set_param(strcat('LZV_custom/',trailer_name),'width_trailer1',num2str(width_trailer1));
elseif t2==5
    set_param(strcat('LZV_custom/',trailer_name),'lturn',num2str(fronttoconnection_x));     %J 
    set_param(strcat('LZV_custom/',trailer_name),'lbar',num2str(axle1_xpos1));      %A
elseif t2==6
    set_param(strcat('LZV_custom/',trailer_name),'lbar',num2str(fronttoconnection_x));
    set_param(strcat('LZV_custom/',trailer_name),'drawbar_mass',num2str(db_mass));
end
    set_param(strcat('LZV_custom/',trailer_name),'xref',num2str(xconn));
    set_param(strcat('LZV_custom/',trailer_name),'xconn',num2str(connection_xpos));
    set_param(strcat('LZV_custom/',trailer_name),'zconn',num2str(connection_zpos));
    % axle 1
    set_param(strcat('LZV_custom/',trailer_name,'/Trailer_axle1'),'xpos',num2str(axle1_xpos));
    set_param(strcat('LZV_custom/',trailer_name,'/Trailer_axle1'),'Fzstat',num2str(axle1_fzstat));
    set_param(strcat('LZV_custom/',trailer_name,'/Trailer_axle1'),'Kspring',num2str(axle1_kspring));
    set_param(strcat('LZV_custom/',trailer_name,'/Trailer_axle1'),'Bdamper',num2str(axle1_bdamper));
    set_param(strcat('LZV_custom/',trailer_name,'/Trailer_axle1'),'Kroll',num2str(axle1_kroll));
    set_param(strcat('LZV_custom/',trailer_name,'/Trailer_axle1'),'axle_mass',num2str(axle1_mass));
    set_param(strcat('LZV_custom/',trailer_name,'/Trailer_axle1'),'tw',num2str(axle1_trackwidth));
    set_param(strcat('LZV_custom/',trailer_name,'/Trailer_axle1'),'zrc',num2str(axle1_zrollcenter));
    set_param(strcat('LZV_custom/',trailer_name,'/Trailer_axle1'),'yd',num2str(axle1_yd));
    set_param(strcat('LZV_custom/',trailer_name,'/Trailer_axle1'),'ys',num2str(axle1_ys));
    set_param(strcat('LZV_custom/',trailer_name,'/Trailer_axle1'),'width_axle',num2str(width_axle));
    set_param(strcat('LZV_custom/',trailer_name,'/Trailer_axle1'),'tpfname',strcat('tyres.trailer{',num2str(p),',1}'));
    % axle 2
if a>=2    
    set_param(strcat('LZV_custom/',trailer_name,'/Trailer_axle2'),'xpos',num2str(axle2_xpos));
    set_param(strcat('LZV_custom/',trailer_name,'/Trailer_axle2'),'Fzstat',num2str(axle2_fzstat));
    set_param(strcat('LZV_custom/',trailer_name,'/Trailer_axle2'),'Kspring',num2str(axle2_kspring));
    set_param(strcat('LZV_custom/',trailer_name,'/Trailer_axle2'),'Bdamper',num2str(axle2_bdamper));
    set_param(strcat('LZV_custom/',trailer_name,'/Trailer_axle2'),'Kroll',num2str(axle2_kroll));
    set_param(strcat('LZV_custom/',trailer_name,'/Trailer_axle2'),'axle_mass',num2str(axle2_mass));
    set_param(strcat('LZV_custom/',trailer_name,'/Trailer_axle2'),'tw',num2str(axle2_trackwidth));
    set_param(strcat('LZV_custom/',trailer_name,'/Trailer_axle2'),'zrc',num2str(axle2_zrollcenter));
    set_param(strcat('LZV_custom/',trailer_name,'/Trailer_axle2'),'yd',num2str(axle2_yd));
    set_param(strcat('LZV_custom/',trailer_name,'/Trailer_axle2'),'ys',num2str(axle2_ys));
    set_param(strcat('LZV_custom/',trailer_name,'/Trailer_axle2'),'width_axle',num2str(width_axle));
    set_param(strcat('LZV_custom/',trailer_name,'/Trailer_axle2'),'tpfname',strcat('tyres.trailer{',num2str(p),',2}'));
end
    % axle 3
if a>=3    
    set_param(strcat('LZV_custom/',trailer_name,'/Trailer_axle3'),'xpos',num2str(axle3_xpos));
    set_param(strcat('LZV_custom/',trailer_name,'/Trailer_axle3'),'Fzstat',num2str(axle3_fzstat));
    set_param(strcat('LZV_custom/',trailer_name,'/Trailer_axle3'),'Kspring',num2str(axle3_kspring));
    set_param(strcat('LZV_custom/',trailer_name,'/Trailer_axle3'),'Bdamper',num2str(axle3_bdamper));
    set_param(strcat('LZV_custom/',trailer_name,'/Trailer_axle3'),'Kroll',num2str(axle3_kroll));
    set_param(strcat('LZV_custom/',trailer_name,'/Trailer_axle3'),'axle_mass',num2str(axle3_mass));
    set_param(strcat('LZV_custom/',trailer_name,'/Trailer_axle3'),'tw',num2str(axle3_trackwidth));
    set_param(strcat('LZV_custom/',trailer_name,'/Trailer_axle3'),'zrc',num2str(axle3_zrollcenter));
    set_param(strcat('LZV_custom/',trailer_name,'/Trailer_axle3'),'yd',num2str(axle3_yd));
    set_param(strcat('LZV_custom/',trailer_name,'/Trailer_axle3'),'ys',num2str(axle3_ys));
    set_param(strcat('LZV_custom/',trailer_name,'/Trailer_axle3'),'width_axle',num2str(width_axle));
    set_param(strcat('LZV_custom/',trailer_name,'/Trailer_axle3'),'tpfname',strcat('tyres.trailer{',num2str(p),',3}'));
end
    % axle 4
if a>=4
    set_param(strcat('LZV_custom/',trailer_name,'/Trailer_axle4'),'xpos',num2str(axle4_xpos));
    set_param(strcat('LZV_custom/',trailer_name,'/Trailer_axle4'),'Fzstat',num2str(axle4_fzstat));
    set_param(strcat('LZV_custom/',trailer_name,'/Trailer_axle4'),'Kspring',num2str(axle4_kspring));
    set_param(strcat('LZV_custom/',trailer_name,'/Trailer_axle4'),'Bdamper',num2str(axle4_bdamper));
    set_param(strcat('LZV_custom/',trailer_name,'/Trailer_axle4'),'Kroll',num2str(axle4_kroll));
    set_param(strcat('LZV_custom/',trailer_name,'/Trailer_axle4'),'axle_mass',num2str(axle4_mass));
    set_param(strcat('LZV_custom/',trailer_name,'/Trailer_axle4'),'tw',num2str(axle4_trackwidth));
    set_param(strcat('LZV_custom/',trailer_name,'/Trailer_axle4'),'zrc',num2str(axle4_zrollcenter));
    set_param(strcat('LZV_custom/',trailer_name,'/Trailer_axle4'),'yd',num2str(axle4_yd));
    set_param(strcat('LZV_custom/',trailer_name,'/Trailer_axle4'),'ys',num2str(axle4_ys));
    set_param(strcat('LZV_custom/',trailer_name,'/Trailer_axle4'),'width_axle',num2str(width_axle));
    set_param(strcat('LZV_custom/',trailer_name,'/Trailer_axle4'),'tpfname',strcat('tyres.trailer{',num2str(p),',4}'));
end
    % axle 5
if a==5
    set_param(strcat('LZV_custom/',trailer_name,'/Trailer_axle5'),'xpos',num2str(axle5_xpos));
    set_param(strcat('LZV_custom/',trailer_name,'/Trailer_axle5'),'Fzstat',num2str(axle5_fzstat));
    set_param(strcat('LZV_custom/',trailer_name,'/Trailer_axle5'),'Kspring',num2str(axle5_kspring));
    set_param(strcat('LZV_custom/',trailer_name,'/Trailer_axle5'),'Bdamper',num2str(axle5_bdamper));
    set_param(strcat('LZV_custom/',trailer_name,'/Trailer_axle5'),'Kroll',num2str(axle5_kroll));
    set_param(strcat('LZV_custom/',trailer_name,'/Trailer_axle5'),'axle_mass',num2str(axle5_mass));
    set_param(strcat('LZV_custom/',trailer_name,'/Trailer_axle5'),'tw',num2str(axle5_trackwidth));
    set_param(strcat('LZV_custom/',trailer_name,'/Trailer_axle5'),'zrc',num2str(axle5_zrollcenter));
    set_param(strcat('LZV_custom/',trailer_name,'/Trailer_axle5'),'yd',num2str(axle5_yd));
    set_param(strcat('LZV_custom/',trailer_name,'/Trailer_axle5'),'ys',num2str(axle5_ys));
    set_param(strcat('LZV_custom/',trailer_name,'/Trailer_axle5'),'width_axle',num2str(width_axle));
    set_param(strcat('LZV_custom/',trailer_name,'/Trailer_axle5'),'tpfname',strcat('tyres.trailer{',num2str(p),',5}'));
end
    % load
    set_param(strcat('LZV_custom/',trailer_name),'l_load',num2str(load_lenght));
    set_param(strcat('LZV_custom/',trailer_name),'w_load',num2str(load_width));
    set_param(strcat('LZV_custom/',trailer_name),'rho',num2str(load_rho));
    set_param(strcat('LZV_custom/',trailer_name),'mass_load',num2str(load_mass));
    set_param(strcat('LZV_custom/',trailer_name),'cgratio',num2str(cg_ratio));
if t2==6
    set_param(strcat('LZV_custom/',trailer_name,'/load'),'zload',num2str(load_z));   
    set_param(strcat('LZV_custom/',trailer_name,'/load'),'cgratio',num2str(cg_ratio));
else        
    set_param(strcat('LZV_custom/',trailer_name,'/load1'),'zload',num2str(load_z));
    set_param(strcat('LZV_custom/',trailer_name,'/load2'),'zload',num2str(load_z));
end

xconn=connection_xpos;   

%Mesure of the length of the vehicule
M=connection_xpos1;
G=chassis_lenght;
A=axle1_xpos1;
J=fronttoconnection_x;
K=load_lenght;
if t2==1
    vehiculelength=vehiculeconnec+(G-J);
    vehiculeconnec=vehiculeconnec+(M);
elseif t2==5
    vehiculelength=vehiculeconnec+(A-J+K);
    vehiculeconnec=vehiculeconnec+(A+M);
elseif t2==6
    vehiculelength=vehiculeconnec+(J+K);
    vehiculeconnec=vehiculeconnec+(J+M);
elseif t2==3
    vehiculelength=vehiculeconnec+(G-J); 
    vehiculeconnec=vehiculeconnec+(A);
end