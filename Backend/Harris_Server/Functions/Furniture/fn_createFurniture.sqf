/*
	Author: Ben Harris
	Description: Creates Furniture Object  ----- Note: Saving System not implemented - Ready - but will not be implemented until housing update. This is simply for crafting table use
*/


Harris_createFurniture = {
	params["_type"];
	_pos = position player;
	_furniture = _type createVehicle _pos;
	_furniture attachTo [player, [0,1,0]];

	_furniture allowDamage false;

	player setVariable ["carryingObject", _furniture, true];

	if (isPlayer player) then {
		_msg = "<img width='300px'image='\Harris_Client\misc\logo.paa'/><br/><t align = 'center' shadow = '1' size='1.3' font='PuristaBold'>LIMMITT Network<br />Furniture System</t> <br /><br /><t align = 'center' shadow = '1' size='1' font='PuristaBold'>Basic Controls</t> <br /><br /><t align = 'center' shadow = '1' size='1' color='#00f428' font='PuristaBold'>Page UP -> Raise</t> <br /><br /><t align = 'center' shadow = '1' size='1' color='#D00000' font='PuristaBold'>Page DOWN -> Lower</t>";

		hintSilent parseText (_msg);

		sleep 8;

		hintSilent "";
	};
};
