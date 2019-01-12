/*
	Author: Ben Harris
	Description: Plants Weed
*/

Harris_plantWeed = {
	params["_ct"];

	if !(((player distance (nearestBuilding player)) > 15) || (count (nearestObjects [player, ["Land_Portable_generator_F"], 20]) > 0)) exitWith { ["Error", "You must be near a building or have a generator nearby", true] spawn Harris_Notificiations; };
	player removeItem "Harris_weedSeeds";
	_plant = "JD_MJ" createVehicle getPosATL _ct;
	_plant setPosAtl (getPosATL _ct);
	test = _plant;
	_ct setVariable ["growingPlant", _plant, false];
	_plant setVariable ["grownWeed", false, true];
	_plant setVariable ["pot", _ct, true];

	_plant attachTo [_ct, [0,0,-0.5]];

	[_plant, _ct] spawn Harris_growWeed;

	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
};