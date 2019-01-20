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

	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	["Success","You Gathered the Weed", "Success"] call Harris_Notifications;

	deleteVehicle (_ct getVariable "growingPlant");

	_ct setVariable ["growingPlant", nil, false];
	_ct setVariable ["weedReady",nil,true];
};