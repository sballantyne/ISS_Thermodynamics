function res = electrical_heat(sunlight)
    PV_power = 49.3e3; %PV Power, 248 kW
    battery_power = 158.4e3; %Battery Power, 158.4 kW
    if sunlight == true
        res = PV_power;
    else
        res = battery_power;
end
