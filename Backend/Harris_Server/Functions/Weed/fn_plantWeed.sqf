/*
	Author: Ben Harris
	Description: Plants Weed
*/

Harris_plantWeed = {
	params["_ct"];

	if !("Harris_weedSeeds" in items player) exitWith {["Error", "You need seeds to grow weed", "Failure"] call Harris_Notifications; };
	player removeItem "Harris_weedSeeds";
	

	_ct setVariable ["growingPlant", true, true];

	[_ct] spawn Harris_growWeed;

	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
};

