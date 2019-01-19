/*
	Author: Ben Harris
	Description: Removes Furniture Object  ----- Note: Saving System not implemented - Ready - but will not be implemented until housing update. This is simply for crafting table use
*/


Harris_removeFurniture = {
	
	_object = player getVariable ['carryingObject', objNull];

	_item = "";
	switch (typeOf _object) do
	{
		case "A3L_WorkBench":
		{
			_item = "Harris_workBench";
		};
		case "JDPot":
		{
			_item = "Harris_Pot";

			if !(isNil {_object getVariable 'growingPlant'}) then {
				deleteVehicle (_object getVariable 'growingPlant');
			};
		};
	};

	deleteVehicle _object;
	player setVariable ['carryingObject', nil];

	if (player canAdd _item) then {
		player addItem _item;
	} else {
		_holder = "groundWeaponHolder" createVehicle position player;
		_holder setPos (getpos Player);
		_holder addItemCargoGlobal [_item, 1];
	};
};

Harris_seizeWeed = {
	params["_ct"];

	_ct setVariable ['growingPlant', nil, true];
	deleteVehicle (_ct getVariable 'growingPlant');
};