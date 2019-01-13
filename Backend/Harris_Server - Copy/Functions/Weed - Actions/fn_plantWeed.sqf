/*
	Author: Ben Harris
	Description: Plants Weed
*/

Harris_fnc_plantWeed = {
	params["_ct"];

	removeAllActions _ct;
	if !(((player distance (nearestBuilding player)) > 15) || (count (nearestObjects [player, ["Land_Portable_generator_F"], 20]) > 0)) exitWith { ["Error", "You must be near a building or have a generator nearby", true] spawn Harris_fnc_Notificiations; };
	_plant = "JDMarijuana" createVehicle getPosATL _ct;
	_plant setPosAtl (getPosATL _ct);
	_ct setVariable ["growingPlant", _plant, false];
	_plant setVariable ["grownWeed", false, true];
	_plant setVariable ["pot", _ct, true];

	_plant attachTo [_ct, [0,0,-0.5]];

	[_plant, _ct] spawn Harris_fnc_growWeed;

	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
};