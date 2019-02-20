/*
	Author: Ben Harris
	Description: Spawns the oil
*/

Harris_oilSpawned = {
	params["_ct"];

	if (isNil "oilHolder") then { oilHolder = objNull };
	if (isNull oilHolder) then {
		oilHolder = "groundWeaponHolder" createVehicle position _ct;
		oilHolder attachTo [_ct,[0,-5,-1.5]];
		detach oilHolder;
	};
	oilHolder addItemCargoGlobal ["Harris_oilBarrel", 1];
};