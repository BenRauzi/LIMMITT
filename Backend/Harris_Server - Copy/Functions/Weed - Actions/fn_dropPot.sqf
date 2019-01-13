/*
	Author: Ben Harris
	Description: Drop Weed Pot
*/

Harris_fnc_dropPot = {
	
	player removeAction dropACtion;
	pot = player getVariable "carryingPot";

	pot setVariable ["drugPot", true, true];

	detach pot;

	Harris_carryingPot = false;

	player setVariable ["carryingPot", nil, true];

	pot addAction ["Plant Weed", "[_this select 0] call Harris_fnc_plantWeed"];

	pot addAction ["Take Pot", "[_this select 0] call Harris_fnc_removePot"];

	pot addAction ["Pickup Pot", "[_this select 0] call Harris_fnc_removePot"];
};