function res = radiation_inflow()
power_rate_sun = 1.5e3; %W/m^2

%Surface Area calculation:

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
    
    exposed_surface = surface_area/2;
    
    res = .625 * exposed_surface * power_rate_sun;

end
