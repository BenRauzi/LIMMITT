_job = player getVariable ["GM_Job", "Unemployed"];
if !(_job isEqualTo "Unemployed") exitWith {hint "You are already employed somewhere! Please leave your current job before signing up for a new one! Press F8 to leave your job!"};

_jobPosition = getPos player;

 hint parseText format["<t size='1.5' color='#ffffff'>New Job:</t><br /><t size='1.2' color='#ffffff'>Welcome to your job as a security guard. We do not provide firearms, so you must aquire one yourself. Your job is to protect 
 	the bank from robbers, and ensure nobody enters with a firearm."];

player setVariable ["GM_Job", "Bank Security", true];

waitUntil {(player getVariable "restrained") || player getVariable ["GM_Job", "Unemployed"] isEqualTo "Unemployed" || !alive player || player distance _jobPosition > 600};
	if (player getVariable "restrained") exitWith { [] call life_fnc_signOff; hint "You have been fired from the Bank Security for being in trouble with the Police!";;
	if (player getVariable ["GM_Job", "Unemployed"] isEqualTo "Unemployed") exitWith {hint "You are no longer employed with the Bank Security!";;
	if (!alive player) exitWith {  [] call life_fnc_signOff; hint "You are no longer employed with the Bank Security since you are dead!";};
	if (player distance _jobPosition > 600) exitWith {  [] call life_fnc_signOff; hint "You are no longer employed with the Bank Security since you have left the bank vicinity!";};