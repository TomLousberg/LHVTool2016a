global t1 choice conf a S

if t1==1 %tractor
    if a==2
        % chassis
        chassis_front_lenght=2.6; % [m]
        front2firstaxle=1.1; % [m]
        chassis_front_width=1.5; % [m]
        chassis_front_height=0.3; % [m]
        chassis_front_mass=1349; % [kg]
        chassis_rear_lenght=3.3; % [m]
        chassis_rear_width=1.5; % [m]
        chassis_rear_height=0.3; % [m]
        chassis_rear_mass=400; % [kg]
        connection_xpos=3.06; % [m]
        connection_zpos=1.15; % [m]
        % axle 1
        axle1_xpos=0; % [m]
        axle1_fzstat=7500*9.81; % [N]
        axle1_kspring=300000; % [N/m]
        axle1_bdamper=15000; % [Ns/m]
        axle1_kroll=200000; % [Nm/rad]
        axle1_mass=475; % [kg]
        axle1_trackwidth=2; % [m]
        axle1_zrollcenter=0; % [m]
        axle1_yd=1; % [m]
        axle1_ys=0.85; % [m]
        valaxle1=2;
        % axle 2    
        axle2_xpos=3.80; % [m]
        axle2_fzstat=11500*9.81; % [N]
        axle2_kspring=320000; % [N/m]
        axle2_bdamper=15000; % [Ns/m]
        axle2_kroll=500000; % [Nm/rad]
        axle2_mass=1000; % [kg]
        axle2_trackwidth=2.15; % [m]
        axle2_zrollcenter=0.30; % [m]
        axle2_yd=1; % [m]
        axle2_ys=0.75; % [m]
        valaxle2=1;
        
    elseif a==3
        % chassis
        chassis_front_lenght=2.6; % [m]
        front2firstaxle=1.1; % [m]
        chassis_front_width=1.5; % [m]
        chassis_front_height=0.3; % [m]
        chassis_front_mass=1349; % [kg]
        chassis_rear_lenght=4.7; % [m]
        chassis_rear_width=1.5; % [m]
        chassis_rear_height=0.3; % [m]
        chassis_rear_mass=580; % [kg]
        connection_xpos=4.46; % [m]
        connection_zpos=1.15; % [m]
        % axle 1
        axle1_xpos=0; % [m]
        axle1_fzstat=7500*9.81; % [N]
        axle1_kspring=300000; % [N/m]
        axle1_bdamper=15000; % [Ns/m]
        axle1_kroll=200000; % [Nm/rad]
        axle1_mass=475; % [kg]
        axle1_trackwidth=2; % [m]
        axle1_zrollcenter=0; % [m]
        axle1_yd=1; % [m]
        axle1_ys=0.85; % [m]
        valaxle1=2;
        % axle 2    
        axle2_xpos=3.80; % [m]
        axle2_fzstat=11500*9.81; % [N]
        axle2_kspring=320000; % [N/m]
        axle2_bdamper=15000; % [Ns/m]
        axle2_kroll=500000; % [Nm/rad]
        axle2_mass=1000; % [kg]
        axle2_trackwidth=2.15; % [m]
        axle2_zrollcenter=0.30; % [m]
        axle2_yd=1; % [m]
        axle2_ys=0.75; % [m]
        valaxle2=1;
        % axle 3
        axle3_xpos=1.4; % [m]
        axle3_fzstat=11500*9.81; % [N]
        axle3_kspring=320000; % [N/m]
        axle3_bdamper=15000; % [Ns/m]
        axle3_kroll=500000; % [Nm/rad]
        axle3_mass=1000; % [kg]
        axle3_trackwidth=2.15; % [m]
        axle3_zrollcenter=0.30; % [m]
        axle3_yd=1; % [m]
        axle3_ys=0.75; % [m]
        valaxle3=1;
        
    elseif a==4
        % chassis
        chassis_front_lenght=2.6; % [m]
        front2firstaxle=1.1; % [m]
        chassis_front_width=1.5; % [m]
        chassis_front_height=0.3; % [m]
        chassis_front_mass=1349; % [kg]
        chassis_rear_lenght=5.1; % [m]
        chassis_rear_width=1.5; % [m]
        chassis_rear_height=0.3; % [m]
        chassis_rear_mass=840; % [kg]
        connection_xpos=5.86; % [m]
        connection_zpos=1.15; % [m]
        % axle 1
        axle1_xpos=0; % [m]
        axle1_fzstat=7500*9.81; % [N]
        axle1_kspring=300000; % [N/m]
        axle1_bdamper=15000; % [Ns/m]
        axle1_kroll=200000; % [Nm/rad]
        axle1_mass=475; % [kg]
        axle1_trackwidth=2; % [m]
        axle1_zrollcenter=0; % [m]
        axle1_yd=1; % [m]
        axle1_ys=0.85; % [m]
        valaxle1=2;
        % axle 2    
        axle2_xpos=3.80; % [m]
        if conf==1
            axle2_fzstat=7500*9.81; % [N]
            axle2_kspring=300000; % [N/m]
            axle2_bdamper=15000; % [Ns/m]
            axle2_kroll=200000; % [Nm/rad]
            axle2_mass=475; % [kg]
            axle2_trackwidth=2; % [m]
            axle2_zrollcenter=0; % [m]
            axle2_yd=1; % [m]
            axle2_ys=0.85; % [m]
            valaxle2=2;
        elseif conf==2
            axle2_fzstat=11500*9.81; % [N]
            axle2_kspring=320000; % [N/m]
            axle2_bdamper=15000; % [Ns/m]
            axle2_kroll=500000; % [Nm/rad]
            axle2_mass=1000; % [kg]
            axle2_trackwidth=2.15; % [m]
            axle2_zrollcenter=0.30; % [m]
            axle2_yd=1; % [m]
            axle2_ys=0.75; % [m]
            valaxle2=1;
        end
        % axle 3
        axle3_xpos=1.4; % [m]
        axle3_fzstat=11500*9.81; % [N]
        axle3_kspring=320000; % [N/m]
        axle3_bdamper=15000; % [Ns/m]
        axle3_kroll=500000; % [Nm/rad]
        axle3_mass=1000; % [kg]
        axle3_trackwidth=2.15; % [m]
        axle3_zrollcenter=0.30; % [m]
        axle3_yd=1; % [m]
        axle3_ys=0.75; % [m]
        valaxle3=1;
        % axle 4
        axle4_xpos=1.4; % [m]
        if conf==1
            axle4_fzstat=11500*9.81; % [N]
            axle4_kspring=320000; % [N/m]
            axle4_bdamper=15000; % [Ns/m]
            axle4_kroll=500000; % [Nm/rad]
            axle4_mass=1000; % [kg]
            axle4_trackwidth=2.15; % [m]
            axle4_zrollcenter=0.30; % [m]
            axle4_yd=1; % [m]
            axle4_ys=0.75; % [m]
            valaxle4=1;
        elseif conf==2
            axle4_fzstat=7500*9.81; % [N]
            axle4_kspring=300000; % [N/m]
            axle4_bdamper=15000; % [Ns/m]
            axle4_kroll=200000; % [Nm/rad]
            axle4_mass=475; % [kg]
            axle4_trackwidth=2; % [m]
            axle4_zrollcenter=0; % [m]
            axle4_yd=1; % [m]
            axle4_ys=0.85; % [m]
            valaxle4=2;
        end
    end
    
elseif t1==2 %truck
    if a==2
        % chassis
        chassis_front_lenght=2.6; % [m]
        front2firstaxle=1.1; % [m]
        chassis_front_width=1.5; % [m]
        chassis_front_height=0.3; % [m]
        chassis_front_mass=1339; % [kg]
        chassis_rear_lenght=5.74; % [m]
        chassis_rear_width=1.5; % [m]
        chassis_rear_height=0.3; % [m]
        chassis_rear_mass=2050; % [kg]
        connection_xpos=7.05; % [m]
        connection_zpos=0.9; % [m]
        % axle 1
        axle1_xpos=0; % [m]
        axle1_fzstat=7500*9.81; % [N]
        axle1_kspring=300000; % [N/m]
        axle1_bdamper=15000; % [Ns/m]
        axle1_kroll=200000; % [Nm/rad]
        axle1_mass=475; % [kg]
        axle1_trackwidth=2; % [m]
        axle1_zrollcenter=0; % [m]
        axle1_yd=1; % [m]
        axle1_ys=0.85; % [m]
        valaxle1=2;
        % axle 2    
        axle2_xpos=5; % [m]
        axle2_fzstat=9250*9.81; % [N]
        axle2_kspring=320000; % [N/m]
        axle2_bdamper=15000; % [Ns/m]
        axle2_kroll=500000; % [Nm/rad]
        axle2_mass=1000; % [kg]
        axle2_trackwidth=2.15; % [m]
        axle2_zrollcenter=0.30; % [m]
        axle2_yd=1; % [m]
        axle2_ys=0.75; % [m]
        valaxle2=1;
        % load
        load_lenght=6.04; % [m]
        load_width=2.55; % [m]
        load_mass=9600; % [kg]
        load_rho=350; % [kg/m^3]
        load_z=1.3; %[m]
        cgratio=50; %[%]
        
    elseif a==3
        % chassis
        chassis_front_lenght=2.6; % [m]
        front2firstaxle=1.1; % [m]
        chassis_front_width=1.5; % [m]
        chassis_front_height=0.3; % [m]
        chassis_front_mass=1339; % [kg]
        chassis_rear_lenght=7.52; % [m]
        chassis_rear_width=1.5; % [m]
        chassis_rear_height=0.3; % [m]
        chassis_rear_mass=2960; % [kg]
        connection_xpos=8.35; % [m]
        connection_zpos=0.9; % [m]
        % axle 1
        axle1_xpos=0; % [m]
        axle1_fzstat=7500*9.81; % [N]
        axle1_kspring=300000; % [N/m]
        axle1_bdamper=15000; % [Ns/m]
        axle1_kroll=200000; % [Nm/rad]
        axle1_mass=475; % [kg]
        axle1_trackwidth=2; % [m]
        axle1_zrollcenter=0; % [m]
        axle1_yd=1; % [m]
        axle1_ys=0.85; % [m]
        valaxle1=2;
        % axle 2    
        axle2_xpos=5; % [m]
        axle2_fzstat=9250*9.81; % [N]
        axle2_kspring=320000; % [N/m]
        axle2_bdamper=15000; % [Ns/m]
        axle2_kroll=500000; % [Nm/rad]
        axle2_mass=1000; % [kg]
        axle2_trackwidth=2.15; % [m]
        axle2_zrollcenter=0.30; % [m]
        axle2_yd=1; % [m]
        axle2_ys=0.75; % [m]
        valaxle2=1;
        % axle 3
        axle3_xpos=1.4; % [m]
        axle3_fzstat=9250*9.81; % [N]
        axle3_kspring=320000; % [N/m]
        axle3_bdamper=15000; % [Ns/m]
        axle3_kroll=500000; % [Nm/rad]
        axle3_mass=1000; % [kg]
        axle3_trackwidth=2.15; % [m]
        axle3_zrollcenter=0.3; % [m]
        axle3_yd=1; % [m]
        axle3_ys=0.75; % [m]
        valaxle3=1;
        % load
        load_lenght=7.82; % [m]
        load_width=2.55; % [m]
        load_mass=15000; % [kg]
        load_rho=350; % [kg/m^3]
        load_z=1.3; %[m]
        cgratio=50; %[%]
        
    elseif a==4
        if choice==1
        % chassis
        chassis_front_lenght=2.6; % [m]
        front2firstaxle=1.1; % [m]
        chassis_front_width=1.5; % [m]
        chassis_front_height=0.3; % [m]
        chassis_front_mass=1319; % [kg]
        chassis_rear_lenght=9.4; % [m]
        chassis_rear_width=1.5; % [m]
        chassis_rear_height=0.3; % [m]
        chassis_rear_mass=4280; % [kg]
        connection_xpos=9.6; % [m]
        connection_zpos=0.6; % [m]
        % axle 1
        axle1_xpos=0; % [m]
        axle1_fzstat=7400*9.81; % [N]
        axle1_kspring=300000; % [N/m]
        axle1_bdamper=15000; % [Ns/m]
        axle1_kroll=200000; % [Nm/rad]
        axle1_mass=475; % [kg]
        axle1_trackwidth=2; % [m]
        axle1_zrollcenter=0; % [m]
        axle1_yd=1; % [m]
        axle1_ys=0.85; % [m]
        valaxle1=2;
        % axle 2
        axle2_xpos=5.1; % [m]
        if conf==1
            axle2_fzstat=7400*9.81; % [N]
            axle2_kspring=300000; % [N/m]
            axle2_bdamper=15000; % [Ns/m]
            axle2_kroll=200000; % [Nm/rad]
            axle2_mass=475; % [kg]
            axle2_trackwidth=2; % [m]
            axle2_zrollcenter=0; % [m]
            axle2_yd=1; % [m]
            axle2_ys=0.85; % [m]
            valaxle2=2;
        elseif conf==2
            axle2_fzstat=8900*9.81; % [N]
            axle2_kspring=320000; % [N/m]
            axle2_bdamper=15000; % [Ns/m]
            axle2_kroll=500000; % [Nm/rad]
            axle2_mass=1000; % [kg]
            axle2_trackwidth=2.15; % [m]
            axle2_zrollcenter=0.30; % [m]
            axle2_yd=1; % [m]
            axle2_ys=0.75; % [m]
            valaxle2=1;
        end
        % axle 3
        axle3_xpos=1.4; % [m]
        axle3_fzstat=8900*9.81; % [N]
        axle3_kspring=320000; % [N/m]
        axle3_bdamper=15000; % [Ns/m]
        axle3_kroll=500000; % [Nm/rad]
        axle3_mass=1000; % [kg]
        axle3_trackwidth=2.15; % [m]
        axle3_zrollcenter=0.3; % [m]
        axle3_yd=1; % [m]
        axle3_ys=0.75; % [m]
        valaxle3=1;
        % axle 4
        axle4_xpos=1.4; % [m]
        if conf==1
            axle4_fzstat=8900*9.81; % [N]
            axle4_kspring=320000; % [N/m]
            axle4_bdamper=15000; % [Ns/m]
            axle4_kroll=500000; % [Nm/rad]
            axle4_mass=1000; % [kg]
            axle4_trackwidth=2.15; % [m]
            axle4_zrollcenter=0.30; % [m]
            axle4_yd=1; % [m]
            axle4_ys=0.75; % [m]
            valaxle4=1;
        elseif conf==2
            axle4_fzstat=7400*9.81; % [N]
            axle4_kspring=300000; % [N/m]
            axle4_bdamper=15000; % [Ns/m]
            axle4_kroll=200000; % [Nm/rad]
            axle4_mass=475; % [kg]
            axle4_trackwidth=2; % [m]
            axle4_zrollcenter=0; % [m]
            axle4_yd=1; % [m]
            axle4_ys=0.85; % [m]
            valaxle4=2;
        end
        % load
        load_lenght=9.6; % [m]
        load_width=2.55; % [m]
        load_mass=19000; % [kg]
        load_rho=350; % [kg/m^3]
        load_z=1.3; %[m]
        cgratio=50; %[%]
        end
    end
    
elseif t1==3 %truck with kingpin
    if a==2
        % chassis
        chassis_front_lenght=2.6; % [m]
        front2firstaxle=1.1; % [m]
        chassis_front_width=1.5; % [m]
        chassis_front_height=0.3; % [m]
        chassis_front_mass=1319; % [kg]
        chassis_rear_lenght=7.5; % [m]
        chassis_rear_width=1.5; % [m]
        chassis_rear_height=0.3; % [m]
        chassis_rear_mass=4280; % [kg]
        connection_xpos=8.4; % [m]
        connection_zpos=1.15; % [m]
        % axle 1
        axle1_xpos=0; % [m]
        axle1_fzstat=7500*9.81; % [N]
        axle1_kspring=300000; % [N/m]
        axle1_bdamper=15000; % [Ns/m]
        axle1_kroll=200000; % [Nm/rad]
        axle1_mass=475; % [kg]
        axle1_trackwidth=2; % [m]
        axle1_zrollcenter=0; % [m]
        axle1_yd=1; % [m]
        axle1_ys=0.85; % [m]
        valaxle1=2;
        % axle 2
        axle2_xpos=8.05; % [m]
        axle2_fzstat=10000*9.81; % [N]
        axle2_kspring=320000; % [N/m]
        axle2_bdamper=15000; % [Ns/m]
        axle2_kroll=500000; % [Nm/rad]
        axle2_mass=1000; % [kg]
        axle2_trackwidth=2.15; % [m]
        axle2_zrollcenter=0.30; % [m]
        axle2_yd=1; % [m]
        axle2_ys=0.75; % [m]
        valaxle2=1;
        % load
        load_lenght=5; % [m]
        load_width=2.55; % [m]
        load_mass=5000; % [kg]
        load_rho=350; % [kg/m^3]
        load_z=1.3; %[m]
        cgratio=50; %[%]
        
    elseif a==3
        % chassis
        chassis_front_lenght=2.6; % [m]
        front2firstaxle=1.1; % [m]
        chassis_front_width=1.5; % [m]
        chassis_front_height=0.3; % [m]
        chassis_front_mass=1319; % [kg]
        chassis_rear_lenght=7.5; % [m]
        chassis_rear_width=1.5; % [m]
        chassis_rear_height=0.3; % [m]
        chassis_rear_mass=4280; % [kg]
        connection_xpos=8.4; % [m]
        connection_zpos=1.15; % [m]
        % axle 1
        axle1_xpos=0; % [m]
        axle1_fzstat=7500*9.81; % [N]
        axle1_kspring=300000; % [N/m]
        axle1_bdamper=15000; % [Ns/m]
        axle1_kroll=200000; % [Nm/rad]
        axle1_mass=475; % [kg]
        axle1_trackwidth=2; % [m]
        axle1_zrollcenter=0; % [m]
        axle1_yd=1; % [m]
        axle1_ys=0.85; % [m]
        valaxle1=2;
        % axle 2
        axle2_xpos=6.65; % [m]
        axle2_fzstat=10000*9.81; % [N]
        axle2_kspring=320000; % [N/m]
        axle2_bdamper=15000; % [Ns/m]
        axle2_kroll=500000; % [Nm/rad]
        axle2_mass=1000; % [kg]
        axle2_trackwidth=2.15; % [m]
        axle2_zrollcenter=0.30; % [m]
        axle2_yd=1; % [m]
        axle2_ys=0.75; % [m]
        valaxle2=1;
        % axle 3
        axle3_xpos=1.4; % [m]
        axle3_fzstat=10000*9.81; % [N]
        axle3_kspring=320000; % [N/m]
        axle3_bdamper=15000; % [Ns/m]
        axle3_kroll=500000; % [Nm/rad]
        axle3_mass=1000; % [kg]
        axle3_trackwidth=2.15; % [m]
        axle3_zrollcenter=0.3; % [m]
        axle3_yd=1; % [m]
        axle3_ys=0.75; % [m]
        valaxle3=1;
        % load
        load_lenght=5; % [m]
        load_width=2.55; % [m]
        load_mass=7850; % [kg]
        load_rho=350; % [kg/m^3]
        load_z=1.3; %[m]
        cgratio=50; %[%]
        
    elseif a==4
        if choice==1
        % chassis
        chassis_front_lenght=2.6; % [m]
        front2firstaxle=1.1; % [m]
        chassis_front_width=1.5; % [m]
        chassis_front_height=0.3; % [m]
        chassis_front_mass=1319; % [kg]
        chassis_rear_lenght=7.5; % [m]
        chassis_rear_width=1.5; % [m]
        chassis_rear_height=0.3; % [m]
        chassis_rear_mass=4280; % [kg]
        connection_xpos=8.4; % [m]
        connection_zpos=1.15; % [m]
        % axle 1
        axle1_xpos=0; % [m]
        axle1_fzstat=7500*9.81; % [N]
        axle1_kspring=300000; % [N/m]
        axle1_bdamper=15000; % [Ns/m]
        axle1_kroll=200000; % [Nm/rad]
        axle1_mass=475; % [kg]
        axle1_trackwidth=2; % [m]
        axle1_zrollcenter=0; % [m]
        axle1_yd=1; % [m]
        axle1_ys=0.85; % [m]
        valaxle1=2;
        % axle 2
        axle2_xpos=5.25; % [m]
        if conf==1
            axle2_fzstat=7500*9.81; % [N]
            axle2_kspring=300000; % [N/m]
            axle2_bdamper=15000; % [Ns/m]
            axle2_kroll=200000; % [Nm/rad]
            axle2_mass=475; % [kg]
            axle2_trackwidth=2; % [m]
            axle2_zrollcenter=0; % [m]
            axle2_yd=1; % [m]
            axle2_ys=0.85; % [m]
            valaxle2=2;
        elseif conf==2
            axle2_fzstat=10000*9.81; % [N]
            axle2_kspring=320000; % [N/m]
            axle2_bdamper=15000; % [Ns/m]
            axle2_kroll=500000; % [Nm/rad]
            axle2_mass=1000; % [kg]
            axle2_trackwidth=2.15; % [m]
            axle2_zrollcenter=0.30; % [m]
            axle2_yd=1; % [m]
            axle2_ys=0.75; % [m]
            valaxle2=1;
        end
        % axle 3
        axle3_xpos=1.4; % [m]
        axle3_fzstat=10000*9.81; % [N]
        axle3_kspring=320000; % [N/m]
        axle3_bdamper=15000; % [Ns/m]
        axle3_kroll=500000; % [Nm/rad]
        axle3_mass=1000; % [kg]
        axle3_trackwidth=2.15; % [m]
        axle3_zrollcenter=0.3; % [m]
        axle3_yd=1; % [m]
        axle3_ys=0.75; % [m]
        valaxle3=1;
        % axle 4
        axle4_xpos=1.4; % [m]
        if conf==1
            axle4_fzstat=10000*9.81; % [N]
            axle4_kspring=320000; % [N/m]
            axle4_bdamper=15000; % [Ns/m]
            axle4_kroll=500000; % [Nm/rad]
            axle4_mass=1000; % [kg]
            axle4_trackwidth=2.15; % [m]
            axle4_zrollcenter=0.30; % [m]
            axle4_yd=1; % [m]
            axle4_ys=0.75; % [m]
            valaxle4=1;
        elseif conf==2
            axle4_fzstat=7500*9.81; % [N]
            axle4_kspring=300000; % [N/m]
            axle4_bdamper=15000; % [Ns/m]
            axle4_kroll=200000; % [Nm/rad]
            axle4_mass=475; % [kg]
            axle4_trackwidth=2; % [m]
            axle4_zrollcenter=0; % [m]
            axle4_yd=1; % [m]
            axle4_ys=0.85; % [m]
            valaxle4=2;
        end
        % load
        load_lenght=5; % [m]
        load_width=2.55; % [m]
        load_mass=10000; % [kg]
        load_rho=350; % [kg/m^3]
        load_z=1.3; %[m]
        cgratio=50; %[%]
        end
    end
end
   
      
if choice==1
    % chassis
set(S.chassisfrontlenght_edit,'String',num2str(chassis_front_lenght));
set(S.front2firstaxle_edit,'String',num2str(front2firstaxle));
set(S.chassisfrontwidth_edit,'String',num2str(chassis_front_width));
set(S.chassisfrontheight_edit,'String',num2str(chassis_front_height));
set(S.chassisfrontmass_edit,'String',num2str(chassis_front_mass));
set(S.chassisrearlenght_edit,'String',num2str(chassis_rear_lenght));
set(S.chassisrearwidth_edit,'String',num2str(chassis_rear_width));
set(S.chassisrearheight_edit,'String',num2str(chassis_rear_height));
set(S.chassisrearmass_edit,'String',num2str(chassis_rear_mass));
set(S.connectionxpos_edit,'String',num2str(connection_xpos));
set(S.connectionzpos_edit,'String',num2str(connection_zpos));
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
    if a==4
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
    % load
    if t1==2 || t1==3
set(S.loadlenght_edit,'String',num2str(load_lenght));
set(S.loadwidth_edit,'String',num2str(load_width));
set(S.loadmass_edit,'String',num2str(load_mass));
set(S.loadrho_edit,'String',num2str(load_rho));
set(S.loadzcoord_edit,'String',num2str(load_z));
set(S.cgratio_edit,'String',num2str(cgratio));
    end
end
