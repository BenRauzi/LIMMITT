/*
	Author: Ben Harris
	Description: Starts the robbery of the Bank Vault

	Harris_bankRobberyTime = 5;
	Harris_recentRobberyTime = 15;
*/

HRP_fnc_robBank = {
	params["_bank"];

	if ((west countSide playableUnits) < Foski_copsNeeded2RobBank) exitWith {["Error", "There are not enough on-duty law enforcement to commit this crime.", "Failure"] spawn Harris_Notifications;};
	if !("Harris_c4" in (items player)) exitWith {["Error", "You need a blasting charge!", "Failure"] spawn Harris_Notifications;};
	if (_bank getVariable "recentlyRobbed") exitWith {["Error", "This bank was recently robbed.", "Failure"] spawn Harris_Notifications;};
		
	_bank setVariable ["inRobbery", true, true];
	_pos = getPosAtl player;
	
	for "_i" from 0 to 1 do {
		["!!BANK ROBBERY IN PROGRESS!!"] remoteExecCall ["Harris_serverMsg", 0];
	};


	missionNamespace setVariable ["inRobbery", true, true];
	[_bank] spawn Harris_checkBank;
	sleep (Harris_bankRobberyTime * 60);

	if !(_bank getVariable "inRobbery") exitWith {};

	{
		if (isPlayer _x) then {
			["!!CHARGE ABOUT TO DETONATE, STAND BACK FROM THE VAULT!!"] remoteExecCall ["Harris_serverMsg", _x];
		};
	} forEach nearestObjects [_bank, [], 20];

	_bank allowDamage false;
	"R_60mm_HE" createvehicle _pos; 

	["Success", "You have breached the Vault", "Success"] spawn Harris_Notifications;
	_bank setVariable ["inRobbery", false, true];
	_bank setVariable ["vaultUnlocked", true, true];
};