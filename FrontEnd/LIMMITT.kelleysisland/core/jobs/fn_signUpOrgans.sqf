_job = player getVariable ["GM_Job", "Unemployed"];
if !(_job isEqualTo "Unemployed") exitWith {hint "You are already employed somewhere! Please leave your current job before signing up for a new one! Press F8 to leave your job!"};

 hint parseText format["<t size='1.5' color='#ffffff'>New Job:</t><br /><t size='1.2' color='#ffffff'>Welcome to your new job as an organ courier. You can quit your job at any time using F8!<br /><br />Your job is to deliver organs from Lakeside Hospital to Los Diablos Hospital. Visit reception to get tasked with a job, you will earn $10000 each time you transfer a set of organs."];

player setVariable ["GM_Job", "Lakeside Organ Couriers", true];

_vehicle = "d3s_nemises_savana_05_2" createVehicle (getMarkerPos "organCarSpawn");
player moveInDriver _vehicle;

gm_playerJobVehicle = _vehicle;

life_vehicles pushBackUnique _vehicle;		

waitUntil {(player getVariable "restrained") || player getVariable ["GM_Job", "Unemployed"] isEqualTo "Unemployed" || !alive player};
	if (player getVariable "restrained") exitWith { [] call life_fnc_signOff; hint "You have been fired from the courier company for being in trouble with the Police!"};
	if (player getVariable ["GM_Job", "Unemployed"] isEqualTo "Unemployed") exitWith {hint "You are no longer employed with the Courier Company!"};
	if (!alive player) exitWith { [] call life_fnc_signOff; hint "You are no longer employed with the Courier Company since you are dead!"};