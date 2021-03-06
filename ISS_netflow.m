function res = ISS_netflow()
%% Define Variables
habitable_volume = 935; %m^3
air_density = 1.225e3; %g/m^3
air_specific_heat = 1.005; %J/(g * K)
air_mass = habitable_volume * air_density; %g

%% Initial Energy:
initialTemp = 295.15; %Average temp onboard ISS in K
initialEnergy = tempToEnergy(initialTemp, air_mass, air_specific_heat); %Initial onboard energy in J

%% Time Settings
initialTime = 0; %sec
finalTime = 60 * 90; %sec = 90 min

%% Netflow Loop
    [T, U] = ode45(@netFlows, [initialTime, finalTime], initialEnergy);
    
%% Results
output_energy = U;
% subplot(3,1,1)
% plot(T/60, output_energy, 'b-')
% xlabel('Time (min)')
% ylabel('Energy (J)')
title('Internal Thermal Energy Aboard ISS')

output_temp_K = energyToTemp(U, air_mass, air_specific_heat);
% subplot(3,1,2)
% plot(T/60, output_temp_K, 'g-')
% xlabel('Time (min)')
% ylabel('Temperature (K)')

output_temp_F = ((output_temp_K - 273.15) * 1.8) + 32;
% subplot(3,1,3)
plot(T/60, output_temp_F, 'g-')
xlabel('Time (min)')
ylabel('Temperature (F)')


    function res = netFlows(~, U)
        current_energy = U;
        inflow = radiation_inflow() + electrical_heat(true) + body_heat();
        outflow = radiation_outflow(current_energy) + window_radiation_outflow(current_energy)+ cooling_system ;
        res = inflow - outflow;
    end

end

function res = energyToTemp(U, m, c)
res = U/(m*c);
end

function res = tempToEnergy(T, m, c)
res = T * m * c;
end
