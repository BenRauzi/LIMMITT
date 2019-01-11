_vehicle = assignedVehicle player;
_job = player getVariable ["GM_Job", "Unemployed"];

if !(gm_playerJobVehicle getVariable ["HasOrgans", false]) exitWith {hint "The vehicle does not have organs loaded in it?"};
if !(_job isEqualTo "Lakeside Organ Couriers") exitWith {hint "You are not employed as an organ courier!"};
if ((player distance gm_playerJobVehicle) > 20) exitWith {hint "The job vehicle loaded with organs is too far away!"};

gm_playerJobVehicle setVariable ["HasOrgans", false, true];
LIMMITTCASH = LIMMITTCASH + 10000;

hint "You have delivered organs from Lakeside Hospital to Los Diablos Hospital and earnt $10000, It has been added to your wallet!";