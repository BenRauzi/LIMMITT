/*
	Author: Ben Harris
	Description: Creates Furniture Object  ----- Note: Saving System not implemented - Ready - but will not be implemented until housing update. This is simply for crafting table use
*/


Harris_createFurniture = {
	params["_type", "_remove"];
	_pos = position player;
	_furniture = _type createVehicle _pos;

	switch(_type) do
	{
		case "Land_oil_pump":
		{
			_furniture attachTo [player, [0,3,2.12]];
			_furniture setDir ((_furniture getRelDir player) + 90);
		};
		case "JD_Pot":
		{
			_furniture attachTo [player, [0,1,0.2]];
		};
		default
		{
			_furniture attachTo [player, [0,1,0.4]];
			_furniture setDir ((_furniture getRelDir player) + 90);
		};
	};

	_furniture allowDamage false;

	player setVariable ["carryingObject", _furniture, true];

	if (!isNil "_remove") then {
		player removeItem _remove;
	};
	
	if (isPlayer player) then {
		_msg = "<t align = 'center' shadow = '1' size='1.3' font='PuristaBold'>LIMMITT Network<br />Furniture System</t> <br /><br /><t align = 'center' shadow = '1' size='1' font='PuristaBold'>Basic Controls</t> <br /><br /><t align = 'center' shadow = '1' size='1' color='#00f428' font='PuristaBold'>Page UP -> Raise</t> <br /><br /><t align = 'center' shadow = '1' size='1' color='#D00000' font='PuristaBold'>Page DOWN -> Lower</t>";

		hintSilent parseText (_msg);

		sleep 8;

		hintSilent "";
	};
};
