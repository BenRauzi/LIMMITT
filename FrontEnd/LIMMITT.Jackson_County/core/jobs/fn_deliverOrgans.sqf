_vehicle = assignedVehicle player;
_job = player getVariable ["GM_Job", "Unemployed"];

if !(gm_playerJobVehicle getVariable ["HasOrgans", false]) exitWith {["Error",  "The vehicle does not have organs loaded in it?", "Info"] call Harris_Notifications;};
if !(_job isEqualTo "Lakeside Organ Couriers") exitWith {["Error",  "You are not employed as an organ courier!", "Failure"] call Harris_Notifications;};
if ((player distance gm_playerJobVehicle) > 20) exitWith { ["Info",  "The job vehicle loaded with organs is too far away!", "Info"] call Harris_Notifications;};

gm_playerJobVehicle setVariable ["HasOrgans", false, true];
LIMMITTCASH = LIMMITTCASH + 10000;

["Success", "You have delivered organs from Lakeside Hospital to Los Diablos Hospital and earnt $10000, It has been added to your wallet!", "Success"] call Harris_Notifications;