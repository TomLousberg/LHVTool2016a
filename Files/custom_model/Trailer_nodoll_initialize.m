global t2 a S

if t2==1
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
        axle1_fzstat=5300*9.81; % [N]
    elseif a==5
        axle1_xpos=5; % [m]
        axle1_fzstat=4500*9.81; % [N]
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
        axle2_fzstat=5300*9.81; % [N]
    elseif a==5
        axle2_fzstat=4500*9.81; % [N]
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
        axle3_fzstat=5300*9.81; % [N]
    elseif a==5
        axle3_fzstat=4500*9.81; % [N]
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
        axle4_fzstat=5300*9.81; % [N]
    elseif a==5
        axle4_fzstat=4500*9.81; % [N]
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
    axle5_fzstat=4500*9.81; % [N]
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
    
elseif t2==3
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
        axle1_fzstat=5100*9.81; % [N]
    elseif a==5
        axle1_xpos=5; % [m]
        axle1_fzstat=4500*9.81; % [N]
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
        axle2_fzstat=5100*9.81; % [N]
    elseif a==5
        axle2_fzstat=4500*9.81; % [N]
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
        axle3_fzstat=5100*9.81; % [N]
    elseif a==5
        axle3_fzstat=4500*9.81; % [N]
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
        axle4_fzstat=5100*9.81; % [N]
    elseif a==5
        axle4_fzstat=4500*9.81; % [N]
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
    axle5_fzstat=4500*9.81; % [N]
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
    
elseif t2==5
    if a==2
        chassis_lenght=7.82; % [m]
        chassis_width=2.55; % [m]
        chassis_height=0.3; % [m]
        chassis_mass=3700; % [kg]
        fronttoconnection_x=1.2; % [m]
        connection_xpos=5.62; % [m]
        connection_zpos=0.9; % [m]
        
        axle1_xpos=2.7; % [m]
        axle1_fzstat=7500*9.81; % [N]
        axle1_kspring=394000; % [N/m]
        axle1_bdamper=20000; % [Ns/m]
        axle1_kroll=1516000; % [Nm/rad]
        axle1_mass=400; % [kg]
        axle1_trackwidth=2; % [m]
        axle1_zrollcenter=0.2; % [m]
        axle1_yd=1; % [m]
        axle1_ys=1; % [m]
        valaxle1=3;
    
        axle2_xpos=5.42; % [m]
        axle2_fzstat=7500*9.81; % [N]
        axle2_kspring=394000; % [N/m]
        axle2_bdamper=20000; % [Ns/m]
        axle2_kroll=1516000; % [Nm/rad]
        axle2_mass=400; % [kg]
        axle2_trackwidth=2; % [m]
        axle2_zrollcenter=0.2; % [m]
        axle2_yd=1; % [m]
        axle2_ys=1; % [m]
        valaxle2=3;
    
        load_lenght=7.82; % [m]
        load_width=2.55; % [m]
        load_rho=250; % [kg/m^3]
        load_mass=10000; % [kg]
        load_z=1.3; % [m]
        cgratio=50; %[%]
    elseif a==3
        chassis_lenght=10; % [m]
        chassis_width=2.55; % [m]
        chassis_height=0.3; % [m]
        chassis_mass=4050; % [kg]
        fronttoconnection_x=1.2; % [m]
        connection_xpos=7.8; % [m]
        connection_zpos=0.9; % [m]
    
        axle1_xpos=2.7; % [m]
        axle1_fzstat=9333*9.81; % [N]
        axle1_kspring=394000; % [N/m]
        axle1_bdamper=20000; % [Ns/m]
        axle1_kroll=1516000; % [Nm/rad]
        axle1_mass=400; % [kg]
        axle1_trackwidth=2; % [m]
        axle1_zrollcenter=0.2; % [m]
        axle1_yd=1; % [m]
        axle1_ys=1; % [m]
        valaxle1=3;
    
        axle2_xpos=5; % [m]
        axle2_fzstat=9333*9.81; % [N]
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
        axle3_fzstat=9333*9.81; % [N]
        axle3_kspring=394000; % [N/m]
        axle3_bdamper=20000; % [Ns/m]
        axle3_kroll=1516000; % [Nm/rad]
        axle3_mass=400; % [kg]
        axle3_trackwidth=2; % [m]
        axle3_zrollcenter=0.2; % [m]
        axle3_yd=1; % [m]
        axle3_ys=1; % [m]
        valaxle3=3;
    
        load_lenght=10; % [m]
        load_width=2.55; % [m]
        load_rho=350; % [kg/m^3]
        load_mass=22000; % [kg]
        load_z=1.3; % [m]
        cgratio=50; %[%]
    elseif a==4
        chassis_lenght=10; % [m]
        chassis_width=2.55; % [m]
        chassis_height=0.3; % [m]
        chassis_mass=4050; % [kg]
        fronttoconnection_x=1.2; % [m]
        connection_xpos=7.8; % [m]
        connection_zpos=0.9; % [m]
    
        axle1_xpos=2.1; % [m]
        axle1_fzstat=5500*9.81; % [N]
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
        axle2_fzstat=5500*9.81; % [N]
        axle2_kspring=394000; % [N/m]
        axle2_bdamper=20000; % [Ns/m]
        axle2_kroll=1516000; % [Nm/rad]
        axle2_mass=400; % [kg]
        axle2_trackwidth=2; % [m]
        axle2_zrollcenter=0.2; % [m]
        axle2_yd=1; % [m]
        axle2_ys=1; % [m]
        valaxle2=3;
    
        axle3_xpos=4.5; % [m]
        axle3_fzstat=8800*9.81; % [N]
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
        axle4_fzstat=8800*9.81; % [N]
        axle4_kspring=394000; % [N/m]
        axle4_bdamper=20000; % [Ns/m]
        axle4_kroll=1516000; % [Nm/rad]
        axle4_mass=400; % [kg]
        axle4_trackwidth=2; % [m]
        axle4_zrollcenter=0.2; % [m]
        axle4_yd=1; % [m]
        axle4_ys=1; % [m]
        valaxle4=3;
    
        load_lenght=10; % [m]
        load_width=2.55; % [m]
        load_rho=350; % [kg/m^3]
        load_mass=22000; % [kg]
        load_z=1.3; % [m]
        cgratio=50; %[%]
    end
    
elseif t2==6
    if a==1
        chassis_lenght=4; % [m]
        chassis_width=2.55; % [m]
        chassis_height=0.3; % [m]
        chassis_mass=105; % [kg]
        fronttoconnection_x=2; % [m]
        drawbar_mass=400; % [kg]
        connection_xpos=3; % [m]
        connection_zpos=0.6; % [m]
        
        axle1_xpos=2.2; % [m]
        axle1_fzstat=8100*9.81; % [N]
        axle1_kspring=394000; % [N/m]
        axle1_bdamper=20000; % [Ns/m]
        axle1_kroll=1516000; % [Nm/rad]
        axle1_mass=400; % [kg]
        axle1_trackwidth=2; % [m]
        axle1_zrollcenter=0.2; % [m]
        axle1_yd=1; % [m]
        axle1_ys=1; % [m]
        valaxle1=3;
        
        load_lenght=4; % [m]
        load_width=2.55; % [m]
        load_rho=350; % [kg/m^3]
        load_mass=8000; % [kg]
        load_z=1.3; % [m]
        cgratio=50; %[%]
    elseif a==2
        chassis_lenght=6.5; % [m]
        chassis_width=2.55; % [m]
        chassis_height=0.3; % [m]
        chassis_mass=2300; % [kg]
        fronttoconnection_x=2; % [m]
        drawbar_mass=400; % [kg]
        connection_xpos=5.5; % [m]
        connection_zpos=0.6; % [m]
    
        axle1_xpos=2.41; % [m]
        axle1_fzstat=8600*9.81; % [N]
        axle1_kspring=394000; % [N/m]
        axle1_bdamper=20000; % [Ns/m]
        axle1_kroll=1516000; % [Nm/rad]
        axle1_mass=400; % [kg]
        axle1_trackwidth=2; % [m]
        axle1_zrollcenter=0.2; % [m]
        axle1_yd=1; % [m]
        axle1_ys=1; % [m]
        valaxle1=3;
    
        axle2_xpos=1.8; % [m]
        axle2_fzstat=8600*9.81; % [N]
        axle2_kspring=394000; % [N/m]
        axle2_bdamper=20000; % [Ns/m]
        axle2_kroll=1516000; % [Nm/rad]
        axle2_mass=400; % [kg]
        axle2_trackwidth=2; % [m]
        axle2_zrollcenter=0.2; % [m]
        axle2_yd=1; % [m]
        axle2_ys=1; % [m]
        valaxle2=3;
    
        load_lenght=6.5; % [m]
        load_width=2.55; % [m]
        load_rho=350; % [kg/m^3]
        load_mass=13000; % [kg]
        load_z=1.3; % [m]
        cgratio=50; %[%]
    elseif a==3
        chassis_lenght=10; % [m]
        chassis_width=2.55; % [m]
        chassis_height=0.3; % [m]
        chassis_mass=3550; % [kg]
        fronttoconnection_x=2; % [m]
        drawbar_mass=500; % [kg]
        connection_xpos=9; % [m]
        connection_zpos=0.6; % [m]
    
        axle1_xpos=3.25; % [m]
        axle1_fzstat=9100*9.81; % [N]
        axle1_kspring=394000; % [N/m]
        axle1_bdamper=20000; % [Ns/m]
        axle1_kroll=1516000; % [Nm/rad]
        axle1_mass=400; % [kg]
        axle1_trackwidth=2; % [m]
        axle1_zrollcenter=0.2; % [m]
        axle1_yd=1; % [m]
        axle1_ys=1; % [m]
        valaxle1=3;
    
        axle2_xpos=1.8; % [m]
        axle2_fzstat=9100*9.81; % [N]
        axle2_kspring=394000; % [N/m]
        axle2_bdamper=20000; % [Ns/m]
        axle2_kroll=1516000; % [Nm/rad]
        axle2_mass=400; % [kg]
        axle2_trackwidth=2; % [m]
        axle2_zrollcenter=0.2; % [m]
        axle2_yd=1; % [m]
        axle2_ys=1; % [m]
        valaxle2=3;
    
        axle3_xpos=1.8; % [m]
        axle3_fzstat=9100*9.81; % [N]
        axle3_kspring=394000; % [N/m]
        axle3_bdamper=20000; % [Ns/m]
        axle3_kroll=1516000; % [Nm/rad]
        axle3_mass=400; % [kg]
        axle3_trackwidth=2; % [m]
        axle3_zrollcenter=0.2; % [m]
        axle3_yd=1; % [m]
        axle3_ys=1; % [m]
        valaxle3=3;
    
        load_lenght=10; % [m]
        load_width=2.55; % [m]
        load_rho=350; % [kg/m^3]
        load_mass=22000; % [kg]
        load_z=1.3; % [m]
        cgratio=50; %[%]
    elseif a==4
        chassis_lenght=10; % [m]
        chassis_width=2.55; % [m]
        chassis_height=0.3; % [m]
        chassis_mass=3550; % [kg]
        fronttoconnection_x=2; % [m]
        drawbar_mass=500; % [kg]
        connection_xpos=9; % [m]
        connection_zpos=0.6; % [m]
    
        axle1_xpos=3.25; % [m]
        axle1_fzstat=7000*9.81; % [N]
        axle1_kspring=394000; % [N/m]
        axle1_bdamper=20000; % [Ns/m]
        axle1_kroll=1516000; % [Nm/rad]
        axle1_mass=400; % [kg]
        axle1_trackwidth=2; % [m]
        axle1_zrollcenter=0.2; % [m]
        axle1_yd=1; % [m]
        axle1_ys=1; % [m]
        valaxle1=3;
    
        axle2_xpos=1.8; % [m]
        axle2_fzstat=7000*9.81; % [N]
        axle2_kspring=394000; % [N/m]
        axle2_bdamper=20000; % [Ns/m]
        axle2_kroll=1516000; % [Nm/rad]
        axle2_mass=400; % [kg]
        axle2_trackwidth=2; % [m]
        axle2_zrollcenter=0.2; % [m]
        axle2_yd=1; % [m]
        axle2_ys=1; % [m]
        valaxle2=3;
    
        axle3_xpos=1.8; % [m]
        axle3_fzstat=7000*9.81; % [N]
        axle3_kspring=394000; % [N/m]
        axle3_bdamper=20000; % [Ns/m]
        axle3_kroll=1516000; % [Nm/rad]
        axle3_mass=400; % [kg]
        axle3_trackwidth=2; % [m]
        axle3_zrollcenter=0.2; % [m]
        axle3_yd=1; % [m]
        axle3_ys=1; % [m]
        valaxle3=3;
    
        axle4_xpos=1.8; % [m]
        axle4_fzstat=7000*9.81; % [N]
        axle4_kspring=394000; % [N/m]
        axle4_bdamper=20000; % [Ns/m]
        axle4_kroll=1516000; % [Nm/rad]
        axle4_mass=400; % [kg]
        axle4_trackwidth=2; % [m]
        axle4_zrollcenter=0.2; % [m]
        axle4_yd=1; % [m]
        axle4_ys=1; % [m]
        valaxle4=3;
    
        load_lenght=10; % [m]
        load_width=2.55; % [m]
        load_rho=350; % [kg/m^3]
        load_mass=22000; % [kg]
        load_z=1.3; % [m]
        cgratio=50; %[%]
    end
end


    % chassis
set(S.chassislenght_edit,'String',num2str(chassis_lenght));
set(S.chassiswidth_edit,'String',num2str(chassis_width));
set(S.chassisheight_edit,'String',num2str(chassis_height));
set(S.chassismass_edit,'String',num2str(chassis_mass));
set(S.ftoconn_edit,'String',num2str(fronttoconnection_x));
set(S.connectionxpos_edit,'String',num2str(connection_xpos));
set(S.connectionzpos_edit,'String',num2str(connection_zpos));
if t2==6
set(S.dbmass_edit,'String',num2str(drawbar_mass));
end
    % axle 1
set(S.axle1xpos_edit,'String',num2str(axle1_xpos));
set(S.axle1fzstat_edit,'String',num2str(axle1_fzstat));
set(S.axle1mass_edit,'String',num2str(axle1_mass));
set(S.axle1spring_edit,'String',num2str(axle1_kspring));
set(S.axle1damper_edit,'String',num2str(axle1_bdamper));
set(S.axle1roll_edit,'String',num2str(axle1_kroll));
set(S.axle1trackwidth_edit,'String',num2str(axle1_trackwidth));
set(S.axle1zrollcenter_edit,'String',num2str(axle1_zrollcenter));
set(S.axle1yd_edit,'String',num2str(axle1_yd));
set(S.axle1ys_edit,'String',num2str(axle1_ys));
set(S.axle1tyres_popupmenu,'Value',valaxle1);
    % axle 2
if a>=2
set(S.axle2xpos_edit,'String',num2str(axle2_xpos));
set(S.axle2fzstat_edit,'String',num2str(axle2_fzstat));
set(S.axle2mass_edit,'String',num2str(axle2_mass));
set(S.axle2spring_edit,'String',num2str(axle2_kspring));
set(S.axle2damper_edit,'String',num2str(axle2_bdamper));
set(S.axle2roll_edit,'String',num2str(axle2_kroll));
set(S.axle2trackwidth_edit,'String',num2str(axle2_trackwidth));
set(S.axle2zrollcenter_edit,'String',num2str(axle2_zrollcenter));
set(S.axle2yd_edit,'String',num2str(axle2_yd));
set(S.axle2ys_edit,'String',num2str(axle2_ys));
set(S.axle2tyres_popupmenu,'Value',valaxle2);
end
    % axle 3
if a>=3
set(S.axle3xpos_edit,'String',num2str(axle3_xpos));
set(S.axle3fzstat_edit,'String',num2str(axle3_fzstat));
set(S.axle3mass_edit,'String',num2str(axle3_mass));
set(S.axle3spring_edit,'String',num2str(axle3_kspring));
set(S.axle3damper_edit,'String',num2str(axle3_bdamper));
set(S.axle3roll_edit,'String',num2str(axle3_kroll));
set(S.axle3trackwidth_edit,'String',num2str(axle3_trackwidth));
set(S.axle3zrollcenter_edit,'String',num2str(axle3_zrollcenter));
set(S.axle3yd_edit,'String',num2str(axle3_yd));
set(S.axle3ys_edit,'String',num2str(axle3_ys));
set(S.axle3tyres_popupmenu,'Value',valaxle3);
end
    % axle 4
if a>=4
set(S.axle4xpos_edit,'String',num2str(axle4_xpos));
set(S.axle4fzstat_edit,'String',num2str(axle4_fzstat));
set(S.axle4mass_edit,'String',num2str(axle4_mass));
set(S.axle4spring_edit,'String',num2str(axle4_kspring));
set(S.axle4damper_edit,'String',num2str(axle4_bdamper));
set(S.axle4roll_edit,'String',num2str(axle4_kroll));
set(S.axle4trackwidth_edit,'String',num2str(axle4_trackwidth));
set(S.axle4zrollcenter_edit,'String',num2str(axle4_zrollcenter));
set(S.axle4yd_edit,'String',num2str(axle4_yd));
set(S.axle4ys_edit,'String',num2str(axle4_ys));
set(S.axle4tyres_popupmenu,'Value',valaxle4);
end
    % axle 5
if a==5
set(S.axle5xpos_edit,'String',num2str(axle5_xpos));
set(S.axle5fzstat_edit,'String',num2str(axle5_fzstat));
set(S.axle5mass_edit,'String',num2str(axle5_mass));
set(S.axle5spring_edit,'String',num2str(axle5_kspring));
set(S.axle5damper_edit,'String',num2str(axle5_bdamper));
set(S.axle5roll_edit,'String',num2str(axle5_kroll));
set(S.axle5trackwidth_edit,'String',num2str(axle5_trackwidth));
set(S.axle5zrollcenter_edit,'String',num2str(axle5_zrollcenter));
set(S.axle5yd_edit,'String',num2str(axle5_yd));
set(S.axle5ys_edit,'String',num2str(axle5_ys));
set(S.axle5tyres_popupmenu,'Value',valaxle5);
end
    % load
set(S.loadlenght_edit,'String',num2str(load_lenght));
set(S.loadwidth_edit,'String',num2str(load_width));
set(S.loadrho_edit,'String',num2str(load_rho));
set(S.loadmass_edit,'String',num2str(load_mass));
set(S.loadzcoord_edit,'String',num2str(load_z));
set(S.cgratio_edit,'String',num2str(cgratio));