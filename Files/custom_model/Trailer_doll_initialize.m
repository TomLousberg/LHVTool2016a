global a d t2 S

%% Dolly
    chassis_lenght=1.6; % [m]
    chassis_width=0.8; % [m]
    chassis_height=0.2; % [m]
    chassis_mass=500; % [kg]
    connection_xpos=3.5; % [m]
    connection_zpos=1.15; % [m]
    
    axle1_xpos=0.7; % [m]
    axle1_fzstat=6700*9.81; % [N]
    axle1_kspring=394000; % [N/m]
    axle1_bdamper=20000; % [Ns/m]
    axle1_kroll=1516000; % [Nm/rad]
    axle1_mass=400; % [kg]
    axle1_trackwidth=2; % [m]
    axle1_zrollcenter=0.2; % [m]
    axle1_yd=1; % [m]
    axle1_ys=1; % [m]
    valaxle1=3;
    
    axle2_xpos=0.7; % [m]
    axle2_fzstat=6700*9.81; % [N]
    axle2_kspring=394000; % [N/m]
    axle2_bdamper=20000; % [Ns/m]
    axle2_kroll=1516000; % [Nm/rad]
    axle2_mass=400; % [kg]
    axle2_trackwidth=2; % [m]
    axle2_zrollcenter=0.2; % [m]
    axle2_yd=1; % [m]
    axle2_ys=1; % [m]
    valaxle2=3;
    
    % chassis
set(S.dolly_chassislenght_edit,'String',num2str(chassis_lenght));
set(S.dolly_chassiswidth_edit,'String',num2str(chassis_width));
set(S.dolly_chassisheight_edit,'String',num2str(chassis_height));
set(S.dolly_chassismass_edit,'String',num2str(chassis_mass));
set(S.dolly_connectionxpos_edit,'String',num2str(connection_xpos));
set(S.dolly_connectionzpos_edit,'String',num2str(connection_zpos));
    % axle 1
set(S.dolly_axle1xpos_edit,'String',num2str(axle1_xpos));
set(S.dolly_axle1fzstat_edit,'String',num2str(axle1_fzstat));
set(S.dolly_axle1mass_edit,'String',num2str(axle1_mass));
set(S.dolly_axle1spring_edit,'String',num2str(axle1_kspring));
set(S.dolly_axle1damper_edit,'String',num2str(axle1_bdamper));
set(S.dolly_axle1roll_edit,'String',num2str(axle1_kroll));
set(S.dolly_axle1trackwidth_edit,'String',num2str(axle1_trackwidth));
set(S.dolly_axle1zrollcenter_edit,'String',num2str(axle1_zrollcenter));
set(S.dolly_axle1yd_edit,'String',num2str(axle1_yd));
set(S.dolly_axle1ys_edit,'String',num2str(axle1_ys));
set(S.dolly_axle1tyres_popupmenu,'Value',valaxle1);
    % axle 2
if d==2
set(S.dolly_axle2xpos_edit,'String',num2str(axle2_xpos));
set(S.dolly_axle2fzstat_edit,'String',num2str(axle2_fzstat));
set(S.dolly_axle2mass_edit,'String',num2str(axle2_mass));
set(S.dolly_axle2spring_edit,'String',num2str(axle2_kspring));
set(S.dolly_axle2damper_edit,'String',num2str(axle2_bdamper));
set(S.dolly_axle2roll_edit,'String',num2str(axle2_kroll));
set(S.dolly_axle2trackwidth_edit,'String',num2str(axle2_trackwidth));
set(S.dolly_axle2zrollcenter_edit,'String',num2str(axle2_zrollcenter));
set(S.dolly_axle2yd_edit,'String',num2str(axle2_yd));
set(S.dolly_axle2ys_edit,'String',num2str(axle2_ys));
set(S.dolly_axle2tyres_popupmenu,'Value',valaxle2);
end
    
%% Semitrailer    
if t2==2    
    chassis_lenght=13.6; % [m]
    chassis_width=2.55; % [m]
    chassis_height=0.3; % [m]
    chassis_mass=4050; % [kg]
    fronttoconnection_x=1.6; % [m]
    connection_xpos=11; % [m]
    connection_zpos=0.6; % [m]
        
    if a<=3
        axle1_xpos=7.075; % [m]
        axle1_fzstat=7200*9.81; % [N]
    elseif a==4
        axle1_xpos=6.5; % [m]
        axle1_fzstat=6000*9.81; % [N]
    elseif a==5
        axle1_xpos=5; % [m]
        axle1_fzstat=5000*9.81; % [N]
    end
    axle1_kspring=394000; % [N/m]
    axle1_bdamper=20000; % [Ns/m]
    axle1_kroll=1516000; % [Nm/rad]
    axle1_mass=400; % [kg]
    axle1_trackwidth=2; % [m]
    axle1_zrollcenter=0.2; % [m]
    axle1_yd=1; % [m]
    axle1_ys=1; % [m]
    valaxle1=3;
    
    axle2_xpos=1.4; % [m]
    if a<=3
        axle2_fzstat=7200*9.81; % [N]
    elseif a==4
        axle2_fzstat=6000*9.81; % [N]
    elseif a==5
        axle3_fzstat=5000*9.81; % [N]
    end
    axle2_kspring=394000; % [N/m]
    axle2_bdamper=20000; % [Ns/m]
    axle2_kroll=1516000; % [Nm/rad]
    axle2_mass=400; % [kg]
    axle2_trackwidth=2; % [m]
    axle2_zrollcenter=0.2; % [m]
    axle2_yd=1; % [m]
    axle2_ys=1; % [m]
    valaxle2=3;
    
    axle3_xpos=1.4; % [m]
    if a<=3
        axle3_fzstat=7200*9.81; % [N]
    elseif a==4
        axle3_fzstat=6000*9.81; % [N]
    elseif a==5
        axle3_fzstat=5000*9.81; % [N]
    end
    axle3_kspring=394000; % [N/m]
    axle3_bdamper=20000; % [Ns/m]
    axle3_kroll=1516000; % [Nm/rad]
    axle3_mass=400; % [kg]
    axle3_trackwidth=2; % [m]
    axle3_zrollcenter=0.2; % [m]
    axle3_yd=1; % [m]
    axle3_ys=1; % [m]
    valaxle3=3;
    
    axle4_xpos=1.4; % [m]
    if a==4
        axle4_fzstat=6000*9.81; % [N]
    elseif a==5
        axle4_fzstat=5000*9.81; % [N]
    end
    axle4_kspring=394000; % [N/m]
    axle4_bdamper=20000; % [Ns/m]
    axle4_kroll=1516000; % [Nm/rad]
    axle4_mass=400; % [kg]
    axle4_trackwidth=2; % [m]
    axle4_zrollcenter=0.2; % [m]
    axle4_yd=1; % [m]
    axle4_ys=1; % [m]
    valaxle4=3;
    
    axle5_xpos=1.4; % [m]
    axle5_fzstat=5000*9.81; % [N]
    axle5_kspring=394000; % [N/m]
    axle5_bdamper=20000; % [Ns/m]
    axle5_kroll=1516000; % [Nm/rad]
    axle5_mass=400; % [kg]
    axle5_trackwidth=2; % [m]
    axle5_zrollcenter=0.2; % [m]
    axle5_yd=1; % [m]
    axle5_ys=1; % [m]
    valaxle5=3;
    
    load_lenght=13.6; % [m]
    load_width=2.55; % [m]
    load_rho=350; % [kg/m^3]
    load_mass=27000; % [kg]
    load_z=1.3; % [m]
    cgratio=50; %[%]
    
elseif t2==4
    chassis_lenght=12; % [m]
    chassis_width=2.55; % [m]
    chassis_height=0.3; % [m]
    chassis_mass=3050; % [kg]
    fronttoconnection_x=1.6; % [m]
    connection_xpos=8.79; % [m]
    connection_zpos=1.15; % [m]
    
    if a<=3
        axle1_xpos=7.075; % [m]
        axle1_fzstat=6400*9.81; % [N]
    elseif a==4
        axle1_xpos=6.5; % [m]
        axle1_fzstat=4100*9.81; % [N]
    elseif a==5
        axle1_xpos=5; % [m]
        axle1_fzstat=3500*9.81; % [N]
    end
    axle1_kspring=394000; % [N/m]
    axle1_bdamper=20000; % [Ns/m]
    axle1_kroll=1516000; % [Nm/rad]
    axle1_mass=400; % [kg]
    axle1_trackwidth=2; % [m]
    axle1_zrollcenter=0.2; % [m]
    axle1_yd=1; % [m]
    axle1_ys=1; % [m]
    valaxle1=3;
    
    axle2_xpos=1.4; % [m]
    if a<=3
        axle2_fzstat=6400*9.81; % [N]
    elseif a==4
        axle2_fzstat=4100*9.81; % [N]
    elseif a==5
        axle2_fzstat=3500*9.81; % [N]
    end
    axle2_kspring=394000; % [N/m]
    axle2_bdamper=20000; % [Ns/m]
    axle2_kroll=1516000; % [Nm/rad]
    axle2_mass=400; % [kg]
    axle2_trackwidth=2; % [m]
    axle2_zrollcenter=0.2; % [m]
    axle2_yd=1; % [m]
    axle2_ys=1; % [m]
    valaxle2=3;
    
    axle3_xpos=1.4; % [m]
    if a<=3
        axle3_fzstat=6400*9.81; % [N]
    elseif a==4
        axle3_fzstat=4100*9.81; % [N]
    elseif a==5
        axle3_fzstat=3500*9.81; % [N]
    end
    axle3_kspring=394000; % [N/m]
    axle3_bdamper=20000; % [Ns/m]
    axle3_kroll=1516000; % [Nm/rad]
    axle3_mass=400; % [kg]
    axle3_trackwidth=2; % [m]
    axle3_zrollcenter=0.2; % [m]
    axle3_yd=1; % [m]
    axle3_ys=1; % [m]
    valaxle3=3;
    
    axle4_xpos=1.4; % [m]
    if a==4
        axle4_fzstat=4100*9.81; % [N]
    elseif a==5
        axle4_fzstat=3500*9.81; % [N]
    end
    axle4_kspring=394000; % [N/m]
    axle4_bdamper=20000; % [Ns/m]
    axle4_kroll=1516000; % [Nm/rad]
    axle4_mass=400; % [kg]
    axle4_trackwidth=2; % [m]
    axle4_zrollcenter=0.2; % [m]
    axle4_yd=1; % [m]
    axle4_ys=1; % [m]
    valaxle4=3;
    
    axle5_xpos=1.4; % [m]
    axle5_fzstat=3500*9.81; % [N]
    axle5_kspring=394000; % [N/m]
    axle5_bdamper=20000; % [Ns/m]
    axle5_kroll=1516000; % [Nm/rad]
    axle5_mass=400; % [kg]
    axle5_trackwidth=2; % [m]
    axle5_zrollcenter=0.2; % [m]
    axle5_yd=1; % [m]
    axle5_ys=1; % [m]
    valaxle5=3;
    
    load_lenght=7.82; % [m]
    load_width=2.55; % [m]
    load_rho=350; % [kg/m^3]
    load_mass=14500; % [kg]
    load_z=1.3; % [m]
    cgratio=50; %[%]
    
end
    
    % chassis
set(S.trailer_chassislenght_edit,'String',num2str(chassis_lenght));
set(S.trailer_chassiswidth_edit,'String',num2str(chassis_width));
set(S.trailer_chassisheight_edit,'String',num2str(chassis_height));
set(S.trailer_chassismass_edit,'String',num2str(chassis_mass));
set(S.trailer_ftoconn_edit,'String',num2str(fronttoconnection_x));
set(S.trailer_connectionxpos_edit,'String',num2str(connection_xpos));
set(S.trailer_connectionzpos_edit,'String',num2str(connection_zpos));
    % axle 1
set(S.trailer_axle1xpos_edit,'String',num2str(axle1_xpos));
set(S.trailer_axle1fzstat_edit,'String',num2str(axle1_fzstat));
set(S.trailer_axle1mass_edit,'String',num2str(axle1_mass));
set(S.trailer_axle1spring_edit,'String',num2str(axle1_kspring));
set(S.trailer_axle1damper_edit,'String',num2str(axle1_bdamper));
set(S.trailer_axle1roll_edit,'String',num2str(axle1_kroll));
set(S.trailer_axle1trackwidth_edit,'String',num2str(axle1_trackwidth));
set(S.trailer_axle1zrollcenter_edit,'String',num2str(axle1_zrollcenter));
set(S.trailer_axle1yd_edit,'String',num2str(axle1_yd));
set(S.trailer_axle1ys_edit,'String',num2str(axle1_ys));
set(S.trailer_axle1tyres_popupmenu,'Value',valaxle1);
    % axle 2
if a>=2
set(S.trailer_axle2xpos_edit,'String',num2str(axle2_xpos));
set(S.trailer_axle2fzstat_edit,'String',num2str(axle2_fzstat));
set(S.trailer_axle2mass_edit,'String',num2str(axle2_mass));
set(S.trailer_axle2spring_edit,'String',num2str(axle2_kspring));
set(S.trailer_axle2damper_edit,'String',num2str(axle2_bdamper));
set(S.trailer_axle2roll_edit,'String',num2str(axle2_kroll));
set(S.trailer_axle2trackwidth_edit,'String',num2str(axle2_trackwidth));
set(S.trailer_axle2zrollcenter_edit,'String',num2str(axle2_zrollcenter));
set(S.trailer_axle2yd_edit,'String',num2str(axle2_yd));
set(S.trailer_axle2ys_edit,'String',num2str(axle2_ys));
set(S.trailer_axle2tyres_popupmenu,'Value',valaxle2);
end
    % axle 3
if a>=3
set(S.trailer_axle3xpos_edit,'String',num2str(axle3_xpos));
set(S.trailer_axle3fzstat_edit,'String',num2str(axle3_fzstat));
set(S.trailer_axle3mass_edit,'String',num2str(axle3_mass));
set(S.trailer_axle3spring_edit,'String',num2str(axle3_kspring));
set(S.trailer_axle3damper_edit,'String',num2str(axle3_bdamper));
set(S.trailer_axle3roll_edit,'String',num2str(axle3_kroll));
set(S.trailer_axle3trackwidth_edit,'String',num2str(axle3_trackwidth));
set(S.trailer_axle3zrollcenter_edit,'String',num2str(axle3_zrollcenter));
set(S.trailer_axle3yd_edit,'String',num2str(axle3_yd));
set(S.trailer_axle3ys_edit,'String',num2str(axle3_ys));
set(S.trailer_axle3tyres_popupmenu,'Value',valaxle3);
end
    % axle 4
if a>=4
set(S.trailer_axle4xpos_edit,'String',num2str(axle4_xpos));
set(S.trailer_axle4fzstat_edit,'String',num2str(axle4_fzstat));
set(S.trailer_axle4mass_edit,'String',num2str(axle4_mass));
set(S.trailer_axle4spring_edit,'String',num2str(axle4_kspring));
set(S.trailer_axle4damper_edit,'String',num2str(axle4_bdamper));
set(S.trailer_axle4roll_edit,'String',num2str(axle4_kroll));
set(S.trailer_axle4trackwidth_edit,'String',num2str(axle4_trackwidth));
set(S.trailer_axle4zrollcenter_edit,'String',num2str(axle4_zrollcenter));
set(S.trailer_axle4yd_edit,'String',num2str(axle4_yd));
set(S.trailer_axle4ys_edit,'String',num2str(axle4_ys));
set(S.trailer_axle4tyres_popupmenu,'Value',valaxle4);
end
    % axle 5
if a==5
set(S.trailer_axle5xpos_edit,'String',num2str(axle5_xpos));
set(S.trailer_axle5fzstat_edit,'String',num2str(axle5_fzstat));
set(S.trailer_axle5mass_edit,'String',num2str(axle5_mass));
set(S.trailer_axle5spring_edit,'String',num2str(axle5_kspring));
set(S.trailer_axle5damper_edit,'String',num2str(axle5_bdamper));
set(S.trailer_axle5roll_edit,'String',num2str(axle5_kroll));
set(S.trailer_axle5trackwidth_edit,'String',num2str(axle5_trackwidth));
set(S.trailer_axle5zrollcenter_edit,'String',num2str(axle5_zrollcenter));
set(S.trailer_axle5yd_edit,'String',num2str(axle5_yd));
set(S.trailer_axle5ys_edit,'String',num2str(axle5_ys));
set(S.trailer_axle5tyres_popupmenu,'Value',valaxle5);
end
    % load
set(S.trailer_loadlenght_edit,'String',num2str(load_lenght));
set(S.trailer_loadwidth_edit,'String',num2str(load_width));
set(S.trailer_loadrho_edit,'String',num2str(load_rho));
set(S.trailer_loadmass_edit,'String',num2str(load_mass));
set(S.trailer_loadzcoord_edit,'String',num2str(load_z));
set(S.trailer_cgratio_edit,'String',num2str(cgratio));