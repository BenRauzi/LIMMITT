/*
	Author: Ben Harris
	Description: Gathers the Weed
*/

Harris_gatherWeed = {
	params["_ct"];

	if (isNil {_ct getVariable "growingPlant"}) exitWith {};
	_ammount = round (random 5);

	if (_ammount < 1) then {
		_ammount = 1;
	};
	for "_i" from 1 to _ammount do {
		player addItem "Harris_weedBag";
	};

	deleteVehicle (_ct getVariable "growingPlant");
	["Success", "You have gathered the dank weed", true] spawn Harris_Notifications;	

	_ct setVariable ["growingPlant", nil, false];
	_ct setVariable ["weedReady",nil,true];
};