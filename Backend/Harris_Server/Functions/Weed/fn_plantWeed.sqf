/*
	Author: Ben Harris
	Description: Plants Weed
*/

Harris_plantWeed = {
	params["_ct"];

	if !("Harris_weedSeeds" in items player) exitWith {["Error", "You need seeds to grow weed", "Failure"] call Harris_Notifications;};
	player removeItem "Harris_weedSeeds";
	
	_plant = "Foski_Marijuana" createVehicle (getPosATL _ct);
	_plant setPosAtl (getPosATL _ct);
	_ct setVariable ["growingPlant", _plant, false];
	_plant setVariable ["grownWeed", false, true];
	_plant setVariable ["pot", _ct, true];

	_plant attachTo [_ct];

	[_plant, _ct] spawn Harris_growWeed;

	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
};

