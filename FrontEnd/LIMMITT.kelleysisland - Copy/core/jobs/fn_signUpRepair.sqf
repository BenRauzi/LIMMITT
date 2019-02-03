_job = player getVariable ["GM_Job", "Unemployed"];
if !(_job isEqualTo "Unemployed") exitWith {hint "You are already employed somewhere! Please leave your current job before signing up for a new one! Press F8 to leave your job!"};

 hint parseText format["<t size='1.5' color='#ffffff'>New Job:</t><br /><t size='1.2' color='#ffffff'>Welcome to your new job as a private Repairs Contractor. When someone presses F7 to call for a repairman you can respond, you are also now capable of repairing objects! You can press F8 at any time to quit your job."];

player setVariable ["GM_Job", "Private Repairs Contractor", true];	

repairRadioChannel radioChannelAdd [player];

waitUntil {(player getVariable "restrained") || player getVariable ["GM_Job", "Unemployed"] isEqualTo "Unemployed" || !alive player};
	if (player getVariable "restrained") exitWith { [] call life_fnc_signOff; hint "You have been fired from the Repair Job for being in trouble with the Police!"; repairRadioChannel radioChannelRemove [player];};
	if (player getVariable ["GM_Job", "Unemployed"] isEqualTo "Unemployed") exitWith {hint "You are no longer employed as a Repairman!";  repairRadioChannel radioChannelRemove [player];};
	if (!alive player) exitWith {  [] call life_fnc_signOff; hint "You are no longer employed with the Repair Services since you are dead!";  repairRadioChannel radioChannelRemove [player];};