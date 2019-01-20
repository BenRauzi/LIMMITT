/*
	Author: Ben Harris
	Description: Gathers the Weed
*/

Harris_gatherWeed = {
	params["_ct"];

	if (isNil {_ct getVariable "growingPlant"}) exitWith {};
	_ammount = round (random 3);

	if (_ammount < 1) then {
		_ammount = 1;
	};
	for "_i" from 1 to _ammount do {
		if (player canAdd "Harris_weedBag") then {
			player addItem "Harris_weedBag";
		} else {
			_holder = "groundWeaponHolder" createVehicle position player;
			_holder setPosAtl (getposAtl Player);
			_holder addItemCargoGlobal ["Harris_weedBag", 1];
		};
	};

	deleteVehicle (_ct getVariable "growingPlant");
	["Success", "You have gathered the dank weed", "Success"] spawn Harris_Notifications;	

	_ct setVariable ["growingPlant", nil, false];
	_ct setVariable ["weedReady",nil,true];
};