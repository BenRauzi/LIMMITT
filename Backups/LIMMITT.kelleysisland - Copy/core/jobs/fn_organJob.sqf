_job = player getVariable ["GM_Job", "Unemployed"];
if !(_job isEqualTo "Lakeside Organ Couriers") exitWith { ["Error", "You are not employed as an organ courier!", "Failure"] call Harris_Notifications;};
["Job", "You have received a job, you must deliver the organs which are loaded in your vehicle to Los Diablos Hospital. Completing this will provide you with $10,000", "General"] call Harris_Notifications;

gm_playerJobVehicle setVariable ["HasOrgans", true, true];
