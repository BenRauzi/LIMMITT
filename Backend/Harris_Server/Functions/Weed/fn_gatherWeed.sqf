/*
	Author: Ben Harris
	Description: Gathers the Weed
*/

Harris_gatherWeed = {
	params["_ct"];

	_amount = round (random 3);

	if (_amount < 1) then {
		_amount = 1;
	};
	for "_i" from 1 to _amount do {
		if (player canAdd "Harris_weedBag") then {
			player addItem "Harris_weedBag";
		} else {
			_holder = "groundWeaponHolder" createVehicle position player;
			_holder setPosAtl (getposAtl Player);
			_holder addItemCargoGlobal ["Harris_weedBag", 1];
		};
	};

	["Success", "You have gathered the dank weed", "Success"] spawn Harris_Notifications;	

	_ct animate ["stage_8",0];
	_ct setVariable ["growingPlant", nil, false];
	_ct setVariable ["weedReady",nil,true];
};