%Window Radiation heat loss
%returns energy lost over time through window (sink) 

function p = window_radiation_outflow(current_energy)

    %Input: [thickness (m), insulation constant(W/m*K)
    fused_silica = [0.094234 1.38];
    borosilicate = [0.071374 1.14];

    %ISS Air:
    air_specific_heat = 1.01; % J/g*C
    air_volume = 935; % m^3
    air_density = 1.225e3; %g/m^3

    air_mass = air_volume * air_density; % g
    air_heat_cap = air_mass * air_specific_heat;
    
%     ISS Module Lengths
%     Cupola_length = 1.5; %m 

    %ISS Module Radii
    Cupola_radius = 2.95/2; %m
    
    
    %ISS Module Surface Areas:
    surface_area = pi*(Cupola_radius)^2;
    
    r_value = fused_silica(1)/fused_silica(2) + borosilicate(1)/borosilicate(2); % K * (m^2)/W

    u_value = 1/r_value; % W / K * (m^2)

    current_temp = current_energy/air_heat_cap; 

    p = u_value * current_temp * surface_area; %Power loss in watts after conduction
   
end
