_job = player getVariable ["GM_Job", "Unemployed"];
if !(_job isEqualTo "Unemployed") exitWith {hint "You are already employed somewhere! Please leave your current job before signing up for a new one! Press F8 to leave your job!"};

 hint parseText format["<t size='1.5' color='#ffffff'>New Job:</t><br /><t size='1.2' color='#ffffff'>Welcome to your new job as a Journalist. Your aim is to report on local occurances and expose corruption! You can press F8 at any time to quit your job!<br /><br />People can use the tipline by clicking F7, you are capable of responding to those tips. Have fun working for Lakeside 7 News."];
 
player setVariable ["GM_Job", "Lakeside 7 News", true];

_vehicle = "d3s_nemises_savana_7channel" createVehicle (getMarkerPos "newsVehSpawn");
player moveInDriver _vehicle;

gm_playerJobVehicle = _vehicle;

life_vehicles pushBackUnique _vehicle;		

_vehicle addItemCargo ["V_Press_F", 1];


journalistRadioChannel radioChannelAdd [player];

waitUntil {(player getVariable "restrained") || player getVariable ["GM_Job", "Unemployed"] isEqualTo "Unemployed" || !alive player};
	if (player getVariable "restrained") exitWith {journalistRadioChannel radioChannelRemove [player]; hint "You have been fired from the Lakeside News Company for being in trouble with the Police!"; [] call life_fnc_signOff;};
	if (player getVariable ["GM_Job", "Unemployed"] isEqualTo "Unemployed") exitWith {journalistRadioChannel radioChannelRemove [player]; hint "You are no longer employed with the Lakeside News Company!"};
	if (!alive player) exitWith {journalistRadioChannel radioChannelRemove [player]; hint "You are no longer employed with the Taxi Company since you are dead!"; [] call life_fnc_signOff;};