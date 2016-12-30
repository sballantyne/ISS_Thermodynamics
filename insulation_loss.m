
function p = insulation_loss(current_energy)
    %Input: [thickness (m), insulation constant(W/m*K)]
    Aluminum1 = [2e-3 130];
    Kevlar = [2.3e-3 0.04];
    Nextel = [2.3e-3 1.24];
    Aluminum2 = [4.8e-3 130];

    %ISS Air:
    air_specific_heat = 1.01; % J/g*C
    air_volume = 935; % m^3
    air_density = 1.225e3; %g/m^3

    air_mass = air_volume * air_density; % g
    air_heat_cap = air_mass * air_specific_heat;
    
    %ISS Module Lengths:
    Zarya_length = 12.56; %m
    Unity_length = 5.47; %m
    Zvezda_length = 13.1; %m
    Destiny_length = 8.53; %m
    Harmony_length = 7.2; %m
    Columbus_length = 7; %m
    Kibo_length = 11.19; %m
    Cupola_length = 1.5; %m 
    Tranquility_length = 6.5; %m
    
    %ISS Module Radii:
    Zarya_radius = 4.1/2; %m
    Unity_radius = 4.57/2; %m
    Zvezda_radius = 4.15/2; %m
    Destiny_radius = 4.27/2; %m
    Harmony_radius = 4.48/2; %m
    Columbus_radius = 4.5/2; %m
    Kibo_radius = 4.4/2; %m
    Cupola_radius = 2.95/2; %m
    Tranquility_radius = 4.25/2; %m
    
    %Module Packing, length * radius for surface area calculation simplification:
    Zarya_lxr = Zarya_length * Zarya_radius;
    Unity_lxr = Unity_length * Unity_radius;
    Zvezda_lxr = Zvezda_length * Zvezda_radius;
    Destiny_lxr = Destiny_length * Destiny_radius;
    Harmony_lxr = Harmony_length * Harmony_radius;
    Columbus_lxr = Columbus_length * Columbus_radius;
    Kibo_lxr = Kibo_length * Kibo_radius;
    Cupola_lxr = Cupola_length * Cupola_radius;
    Tranquility_lxr = Tranquility_length * Tranquility_radius;
    
    %ISS Module Surface Areas:
    surface_area = 2*pi*(Zarya_lxr + Unity_lxr + Zvezda_lxr + Destiny_lxr ...
        + Harmony_lxr + Columbus_lxr + Kibo_lxr + Cupola_lxr + ...
        Tranquility_lxr);
    
    r_value = Aluminum1(1)/Aluminum1(2) + Kevlar(1)/Kevlar(2) + ...
        Nextel(1)/Nextel(2) + Aluminum2(1)/Aluminum2(2); % K * (m^2)/W

    u_value = 1/r_value; % W / K * (m^2)

    current_temp = current_energy/air_heat_cap; 

    p = u_value * current_temp * surface_area;
   
end

