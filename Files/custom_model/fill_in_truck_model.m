global tractor_tyre1 tractor_tyre2 tractor_tyre3 tractor_tyre4  tyres a conf t1 zcg zcg_load truck_name xconn vehiculeconnec vehiculelength sprung_mass wheelbase width width_firstaxle tractor mindist2axles axle2connec mindist2axles_nbtrailer trailer_number dolly_number
global chassis_front_lenght chassis_rear_lenght load_lenght

%Calculation of the width of the first axle
width_firstaxle=str2double(get(S.axle1trackwidth_edit,'String')); % [m]

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
G=str2double(get(S.axle4trackwidth_edit,'String')); % [m]
valaxle4=get(S.axle4tyres_popupmenu,'Value');
if valaxle4==1
    G=G+0.318;
elseif valaxle4==2
    G=G+0.318;
elseif valaxle4==3
    G=G+0.385;
end
Q=str2double(get(S.loadwidth_edit,'String')); % [m]

width=max(max(max(E,D),F),max(G,Q));

%Mesure of the minimal distance between two group of axles
A=str2double(get(S.axle2xpos_edit,'String')); % [m]
B=str2double(get(S.axle3xpos_edit,'String')); % [m]
C=str2double(get(S.axle4xpos_edit,'String')); % [m]
N=str2double(get(S.connectionxpos_edit,'String')); % [m]

%Calculation of the wheelbase
wheelbase=A+(B+C)/2;

axle2connec=N-(A+B+C);
mindist2axles=A;
mindist2axles_nbtrailer=0;
trailer_number=0;
dolly_number=0;

%Mesure of center of gravity - z position
mass=str2double(get(S.loadmass_edit,'String')); % [m]
if isnan(mass)
    mass = 0;
end
rho=str2double(get(S.loadrho_edit,'String')); % [m]
Q=str2double(get(S.loadwidth_edit,'String')); % [m]
P=str2double(get(S.loadlenght_edit,'String')); % [m]
R=str2double(get(S.loadzcoord_edit,'String')); % [m]
O=str2double(get(S.connectionzpos_edit,'String')); % [m]
if t1==2 || t1==3
    zcg(1)=R+(mass/(Q*P*2*rho));
    zcg_load(1)=(mass/(Q*P*2*rho));
elseif t1==1
    zcg(1)=O;
    zcg_load(1)=0;
end

%Sprung Mass
engine=1800;
front_mass=str2double(get(S.chassisfrontmass_edit,'String')); % [kg]
rear_mass=str2double(get(S.chassisrearmass_edit,'String')); % [kg]
sprung_mass(1)=front_mass+rear_mass+mass+engine;

%%
    chassis_front_lenght=str2double(get(S.chassisfrontlenght_edit,'String')); % H [m]
    front2firstaxle=str2double(get(S.front2firstaxle_edit,'String')); % [m]
    chassis_front_width=str2double(get(S.chassisfrontwidth_edit,'String')); % [m]
    chassis_front_height=str2double(get(S.chassisfrontheight_edit,'String')); % [m]
    chassis_front_mass=str2double(get(S.chassisfrontmass_edit,'String')); % [kg]
    chassis_rear_lenght=str2double(get(S.chassisrearlenght_edit,'String')); % K [m]
    chassis_rear_width=str2double(get(S.chassisrearwidth_edit,'String')); % [m]
    chassis_rear_height=str2double(get(S.chassisrearheight_edit,'String')); % [m]
    chassis_rear_mass=str2double(get(S.chassisrearmass_edit,'String')); % [kg]
    connection_xpos=-str2double(get(S.connectionxpos_edit,'String')); % [m]
    connection_zpos=str2double(get(S.connectionzpos_edit,'String')); % [m]
    xconn=connection_xpos;
    
    axle1_xpos=str2double(get(S.axle1xpos_edit,'String')); % [m]
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
    tyres.truck(1)=axle1_tyre;
    tractor_tyre1 = strcat(straxle1(valaxle1));
  
    axle2_xpos=-str2double(get(S.axle2xpos_edit,'String')); % [m]
    axle2_fzstat=str2double(get(S.axle2fzstat_edit,'String')); % [N]
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
    tyres.truck(2)=axle2_tyre;
    tractor_tyre2 = strcat(straxle2(valaxle2));
    
if a>=3
    axle3_xpos1=str2double(get(S.axle3xpos_edit,'String')); % [m]
    axle3_xpos=axle2_xpos-axle3_xpos1;
    axle3_fzstat=str2double(get(S.axle3fzstat_edit,'String')); % [N]
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
    tyres.truck(3)=axle3_tyre;
    tractor_tyre3 = strcat(straxle3(valaxle3));
end

if a==4
    axle4_xpos1=str2double(get(S.axle4xpos_edit,'String')); % [m]
    axle4_xpos=axle3_xpos-axle4_xpos1;
    axle4_fzstat=str2double(get(S.axle4fzstat_edit,'String')); % [N]
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
    tyres.truck(4)=axle4_tyre;
    tractor_tyre4 = strcat(straxle4(valaxle4));
end

if t1>=2
    load_lenght=str2double(get(S.loadlenght_edit,'String')); % [m]
    load_width=str2double(get(S.loadwidth_edit,'String')); % [m]
    load_mass=str2double(get(S.loadmass_edit,'String')); % [kg]
    load_rho=str2double(get(S.loadrho_edit,'String')); % [kg/m^3]
    load_z=str2double(get(S.loadzcoord_edit,'String')); %[m]
    cg_ratio=str2double(get(S.cgratio_edit,'String')); %[%]
end
        
save components.mat tyres

%%
    set_param(strcat('LZV_custom/','DriverTL/','Air Drag'),'ref_area',num2str(width*4.15));
    set_param(strcat('LZV_custom/',truck_name,'/Cabin'),'width',num2str(width));
    if a == 2
        set_param(strcat('LZV_custom/',truck_name,'/Driveline4x2'),'adjust_engine',num2str(0));
    else
        set_param(strcat('LZV_custom/',truck_name,'/Driveline6x4'),'adjust_engine',num2str(0));
    end
    
    % chassis
    set_param(strcat('LZV_custom/',truck_name),'friction_coeff',num2str(1));
    set_param(strcat('LZV_custom/',truck_name),'flenght',num2str(chassis_front_lenght));
    set_param(strcat('LZV_custom/',truck_name),'front2firstaxle',num2str(front2firstaxle));
    set_param(strcat('LZV_custom/',truck_name),'fwidth',num2str(chassis_front_width));
    set_param(strcat('LZV_custom/',truck_name),'fheight',num2str(chassis_front_height));
    set_param(strcat('LZV_custom/',truck_name),'front_mass',num2str(chassis_front_mass));
    set_param(strcat('LZV_custom/',truck_name),'rlenght',num2str(chassis_rear_lenght));
    set_param(strcat('LZV_custom/',truck_name),'rwidth',num2str(chassis_rear_width));
    set_param(strcat('LZV_custom/',truck_name),'rheight',num2str(chassis_rear_height));
    set_param(strcat('LZV_custom/',truck_name),'rear_mass',num2str(chassis_rear_mass));
    if a==4
        set_param(strcat('LZV_custom/',truck_name),'conf',num2str(conf));
    end
    set_param(strcat('LZV_custom/',truck_name),'xconn',num2str(connection_xpos));
    set_param(strcat('LZV_custom/',truck_name),'zconn',num2str(connection_zpos));
    if conf==1
%         set_param(strcat('LZV_custom/',truck_name),'xaxle',num2str(axle3_xpos));
        set_param(strcat('LZV_custom/',truck_name),'xaxle',num2str(axle2_xpos));
    elseif conf==2
        set_param(strcat('LZV_custom/',truck_name),'xaxle',num2str(axle2_xpos));
    end
    
    % axle 1
    set_param(strcat('LZV_custom/',truck_name),'xref',num2str(axle1_xpos));
    set_param(strcat('LZV_custom/',truck_name,'/Steer_axle1'),'Fzstat',num2str(axle1_fzstat));
    set_param(strcat('LZV_custom/',truck_name,'/Steer_axle1'),'Kspring',num2str(axle1_kspring));
    set_param(strcat('LZV_custom/',truck_name,'/Steer_axle1'),'Bdamper',num2str(axle1_bdamper));
    set_param(strcat('LZV_custom/',truck_name,'/Steer_axle1'),'Kroll',num2str(axle1_kroll));
    set_param(strcat('LZV_custom/',truck_name,'/Steer_axle1'),'axle_mass',num2str(axle1_mass));
    set_param(strcat('LZV_custom/',truck_name,'/Steer_axle1'),'tw',num2str(axle1_trackwidth));
    set_param(strcat('LZV_custom/',truck_name,'/Steer_axle1'),'zrc',num2str(axle1_zrollcenter));
    set_param(strcat('LZV_custom/',truck_name,'/Steer_axle1'),'yd',num2str(axle1_yd));
    set_param(strcat('LZV_custom/',truck_name,'/Steer_axle1'),'ys',num2str(axle1_ys));
    set_param(strcat('LZV_custom/',truck_name,'/Steer_axle1'),'width_firstaxle',num2str(width_firstaxle));
    set_param(strcat('LZV_custom/',truck_name,'/Steer_axle1'),'tpfname','tyres.truck{1}');
 
     % axle 2   
 if a==2 || a==3  
    set_param(strcat('LZV_custom/',truck_name,'/Drive_axle1'),'xpos',num2str(axle2_xpos));
    set_param(strcat('LZV_custom/',truck_name,'/Drive_axle1'),'Fzstat',num2str(axle2_fzstat));
    set_param(strcat('LZV_custom/',truck_name,'/Drive_axle1'),'Kspring',num2str(axle2_kspring));
    set_param(strcat('LZV_custom/',truck_name,'/Drive_axle1'),'Bdamper',num2str(axle2_bdamper));
    set_param(strcat('LZV_custom/',truck_name,'/Drive_axle1'),'Kroll',num2str(axle2_kroll));
    set_param(strcat('LZV_custom/',truck_name,'/Drive_axle1'),'axle_mass',num2str(axle2_mass));
    set_param(strcat('LZV_custom/',truck_name,'/Drive_axle1'),'tw',num2str(axle2_trackwidth));
    set_param(strcat('LZV_custom/',truck_name,'/Drive_axle1'),'zrc',num2str(axle2_zrollcenter));
    set_param(strcat('LZV_custom/',truck_name,'/Drive_axle1'),'yd',num2str(axle2_yd));
    set_param(strcat('LZV_custom/',truck_name,'/Drive_axle1'),'ys',num2str(axle2_ys));
    set_param(strcat('LZV_custom/',truck_name,'/Drive_axle1'),'tpfname','tyres.truck{2}');
 end
 
 if a==4    
    if conf==1
        set_param(strcat('LZV_custom/',truck_name,'/Steer_axle2'),'xpos',num2str(axle2_xpos));
        set_param(strcat('LZV_custom/',truck_name,'/Steer_axle2'),'Fzstat',num2str(axle2_fzstat));
        set_param(strcat('LZV_custom/',truck_name,'/Steer_axle2'),'Kspring',num2str(axle2_kspring));
        set_param(strcat('LZV_custom/',truck_name,'/Steer_axle2'),'Bdamper',num2str(axle2_bdamper));
        set_param(strcat('LZV_custom/',truck_name,'/Steer_axle2'),'Kroll',num2str(axle2_kroll));
        set_param(strcat('LZV_custom/',truck_name,'/Steer_axle2'),'axle_mass',num2str(axle2_mass));
        set_param(strcat('LZV_custom/',truck_name,'/Steer_axle2'),'tw',num2str(axle2_trackwidth));
        set_param(strcat('LZV_custom/',truck_name,'/Steer_axle2'),'zrc',num2str(axle2_zrollcenter));
        set_param(strcat('LZV_custom/',truck_name,'/Steer_axle2'),'yd',num2str(axle2_yd));
        set_param(strcat('LZV_custom/',truck_name,'/Steer_axle2'),'ys',num2str(axle2_ys));
        set_param(strcat('LZV_custom/',truck_name,'/Steer_axle2'),'tpfname','tyres.truck{2}');
     elseif conf==2
        set_param(strcat('LZV_custom/',truck_name,'/Drive_axle2'),'xpos',num2str(axle2_xpos));
        set_param(strcat('LZV_custom/',truck_name,'/Drive_axle2'),'Fzstat',num2str(axle2_fzstat));
        set_param(strcat('LZV_custom/',truck_name,'/Drive_axle2'),'Kspring',num2str(axle2_kspring));
        set_param(strcat('LZV_custom/',truck_name,'/Drive_axle2'),'Bdamper',num2str(axle2_bdamper));
        set_param(strcat('LZV_custom/',truck_name,'/Drive_axle2'),'Kroll',num2str(axle2_kroll));
        set_param(strcat('LZV_custom/',truck_name,'/Drive_axle2'),'axle_mass',num2str(axle2_mass));
        set_param(strcat('LZV_custom/',truck_name,'/Drive_axle2'),'tw',num2str(axle2_trackwidth));
        set_param(strcat('LZV_custom/',truck_name,'/Drive_axle2'),'zrc',num2str(axle2_zrollcenter));
        set_param(strcat('LZV_custom/',truck_name,'/Drive_axle2'),'yd',num2str(axle2_yd));
        set_param(strcat('LZV_custom/',truck_name,'/Drive_axle2'),'ys',num2str(axle2_ys));
        set_param(strcat('LZV_custom/',truck_name,'/Drive_axle2'),'tpfname','tyres.truck{2}');
    end
 end
 
      % axle 3
 if a==3
    set_param(strcat('LZV_custom/',truck_name,'/Drive_axle2'),'xpos',num2str(axle3_xpos));
    set_param(strcat('LZV_custom/',truck_name,'/Drive_axle2'),'Fzstat',num2str(axle3_fzstat));
    set_param(strcat('LZV_custom/',truck_name,'/Drive_axle2'),'Kspring',num2str(axle3_kspring));
    set_param(strcat('LZV_custom/',truck_name,'/Drive_axle2'),'Bdamper',num2str(axle3_bdamper));
    set_param(strcat('LZV_custom/',truck_name,'/Drive_axle2'),'Kroll',num2str(axle3_kroll));
    set_param(strcat('LZV_custom/',truck_name,'/Drive_axle2'),'axle_mass',num2str(axle3_mass));
    set_param(strcat('LZV_custom/',truck_name,'/Drive_axle2'),'tw',num2str(axle3_trackwidth));
    set_param(strcat('LZV_custom/',truck_name,'/Drive_axle2'),'zrc',num2str(axle3_zrollcenter));
    set_param(strcat('LZV_custom/',truck_name,'/Drive_axle2'),'yd',num2str(axle3_yd));
    set_param(strcat('LZV_custom/',truck_name,'/Drive_axle2'),'ys',num2str(axle3_ys));
    set_param(strcat('LZV_custom/',truck_name,'/Drive_axle2'),'tpfname','tyres.truck{3}');
 end
   
 if a==4  
    % axle 3
    set_param(strcat('LZV_custom/',truck_name,'/Drive_axle1'),'xpos',num2str(axle3_xpos));
    set_param(strcat('LZV_custom/',truck_name,'/Drive_axle1'),'Fzstat',num2str(axle3_fzstat));
    set_param(strcat('LZV_custom/',truck_name,'/Drive_axle1'),'Kspring',num2str(axle3_kspring));
    set_param(strcat('LZV_custom/',truck_name,'/Drive_axle1'),'Bdamper',num2str(axle3_bdamper));
    set_param(strcat('LZV_custom/',truck_name,'/Drive_axle1'),'Kroll',num2str(axle3_kroll));
    set_param(strcat('LZV_custom/',truck_name,'/Drive_axle1'),'axle_mass',num2str(axle3_mass));
    set_param(strcat('LZV_custom/',truck_name,'/Drive_axle1'),'tw',num2str(axle3_trackwidth));
    set_param(strcat('LZV_custom/',truck_name,'/Drive_axle1'),'zrc',num2str(axle3_zrollcenter));
    set_param(strcat('LZV_custom/',truck_name,'/Drive_axle1'),'yd',num2str(axle3_yd));
    set_param(strcat('LZV_custom/',truck_name,'/Drive_axle1'),'ys',num2str(axle3_ys));
    set_param(strcat('LZV_custom/',truck_name,'/Drive_axle1'),'tpfname','tyres.truck{3}');
 end
 
 if a==4
    % axle 4    
    if conf==1
        set_param(strcat('LZV_custom/',truck_name,'/Drive_axle2'),'xpos',num2str(axle4_xpos));
        set_param(strcat('LZV_custom/',truck_name,'/Drive_axle2'),'Fzstat',num2str(axle4_fzstat));
        set_param(strcat('LZV_custom/',truck_name,'/Drive_axle2'),'Kspring',num2str(axle4_kspring));
        set_param(strcat('LZV_custom/',truck_name,'/Drive_axle2'),'Bdamper',num2str(axle4_bdamper));
        set_param(strcat('LZV_custom/',truck_name,'/Drive_axle2'),'Kroll',num2str(axle4_kroll));
        set_param(strcat('LZV_custom/',truck_name,'/Drive_axle2'),'axle_mass',num2str(axle4_mass));
        set_param(strcat('LZV_custom/',truck_name,'/Drive_axle2'),'tw',num2str(axle4_trackwidth));
        set_param(strcat('LZV_custom/',truck_name,'/Drive_axle2'),'zrc',num2str(axle4_zrollcenter));
        set_param(strcat('LZV_custom/',truck_name,'/Drive_axle2'),'yd',num2str(axle4_yd));
        set_param(strcat('LZV_custom/',truck_name,'/Drive_axle2'),'ys',num2str(axle4_ys));
        set_param(strcat('LZV_custom/',truck_name,'/Drive_axle2'),'tpfname','tyres.truck{4}');
    elseif conf==2
        set_param(strcat('LZV_custom/',truck_name,'/Steer_axle2'),'xpos',num2str(axle4_xpos));
        set_param(strcat('LZV_custom/',truck_name,'/Steer_axle2'),'Fzstat',num2str(axle4_fzstat));
        set_param(strcat('LZV_custom/',truck_name,'/Steer_axle2'),'Kspring',num2str(axle4_kspring));
        set_param(strcat('LZV_custom/',truck_name,'/Steer_axle2'),'Bdamper',num2str(axle4_bdamper));
        set_param(strcat('LZV_custom/',truck_name,'/Steer_axle2'),'Kroll',num2str(axle4_kroll));
        set_param(strcat('LZV_custom/',truck_name,'/Steer_axle2'),'axle_mass',num2str(axle4_mass));
        set_param(strcat('LZV_custom/',truck_name,'/Steer_axle2'),'tw',num2str(axle4_trackwidth));
        set_param(strcat('LZV_custom/',truck_name,'/Steer_axle2'),'zrc',num2str(axle4_zrollcenter));
        set_param(strcat('LZV_custom/',truck_name,'/Steer_axle2'),'yd',num2str(axle4_yd));
        set_param(strcat('LZV_custom/',truck_name,'/Steer_axle2'),'ys',num2str(axle4_ys));
        set_param(strcat('LZV_custom/',truck_name,'/Steer_axle2'),'tpfname','tyres.truck{4}'); 
    end  
 end

    % load
 if t1>=2
    set_param(strcat('LZV_custom/',truck_name),'l_load',num2str(load_lenght));
    set_param(strcat('LZV_custom/',truck_name),'mass_load',num2str(load_mass));
    set_param(strcat('LZV_custom/',truck_name),'rho',num2str(load_rho));
    set_param(strcat('LZV_custom/',truck_name),'w_load',num2str(load_width));
    set_param(strcat('LZV_custom/',truck_name),'cgratio',num2str(cg_ratio));
    set_param(strcat('LZV_custom/',truck_name,'/load'),'cgratio',num2str(cg_ratio));
    set_param(strcat('LZV_custom/',truck_name,'/load'),'zload',num2str(load_z));
 end
 
%Mesure of the length of the vehicule
H=chassis_front_lenght;
N=(-connection_xpos);
K=chassis_rear_lenght;
if t1==1
    tractor=1;
    vehiculeconnec=1.475+N;
    vehiculelength=H+K;
elseif t1==2
    tractor=0;
    vehiculeconnec=1.475+N;
    vehiculelength=H+K;
elseif t1==3
    tractor=0;
    vehiculeconnec=1.475+N;
    vehiculelength=H+K;
end