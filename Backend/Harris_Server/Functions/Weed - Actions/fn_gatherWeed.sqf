/*
	Author: Ben Harris
	Description: Gather Weed
*/

Harris_carryingPot = false;
Harris_growTime = 1;


Harris_fnc_gatherWeed = {
	params["_ct"];

	if (isNil {_ct getVariable "growingPlant"}) exitWith {};
	_ammount = round (random 3);

	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	["Success","You Gathered the Weed", "Success"] call Harris_Notifications;

	deleteVehicle (_ct getVariable "growingPlant");

	_ct setVariable ["growingPlant", nil, false];
	_ct setVariable ["weedReady",nil,true];

};

