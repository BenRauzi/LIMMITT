_job = player getVariable ["GM_Job", "Unemployed"];
if !(_job isEqualTo "Unemployed") exitWith {hint "You are already employed somewhere! Please leave your current job before signing up for a new one! Press F8 to leave your job!"};

 hint parseText format["<t size='1.5' color='#ffffff'>New Job:</t><br /><t size='1.2' color='#ffffff'>Welcome to your new job as a Taxi Driver. When someone presses F7 to call for a taxi you can respond, you are required to get a radio and be on the Taxi frequency 34.1. You can press F8 at any time to quit your job<br /><br />You are suggested to carry a firearm in the event that someone fails to pay their fee. Please make the fee clear before setting off."];

player setVariable ["GM_Job", "Lakeside Valley Taxi Company", true];

_vehicle = "d3s_crown_98_T1" createVehicle (getMarkerPos "taxiVehSpawn");
player moveInDriver _vehicle;

gm_playerJobVehicle = _vehicle;

life_vehicles pushBackUnique _vehicle;		

taxiRadioChannel radioChannelAdd [player];

waitUntil {(player getVariable "restrained") || player getVariable ["GM_Job", "Unemployed"] isEqualTo "Unemployed" || !alive player};
	if (player getVariable "restrained") exitWith { [] call life_fnc_signOff; hint "You have been fired from the Taxi Company for being in trouble with the Police!";  taxiRadioChannel radioChannelRemove [player];};
	if (player getVariable ["GM_Job", "Unemployed"] isEqualTo "Unemployed") exitWith {hint "You are no longer employed with the Taxi Company!"; taxiRadioChannel radioChannelRemove [player];};
	if (!alive player) exitWith {  [] call life_fnc_signOff; hint "You are no longer employed with the Taxi Company since you are dead!";  taxiRadioChannel radioChannelRemove [player];};