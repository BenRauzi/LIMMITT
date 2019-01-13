/*
	Author: Ben Harris
	Description: Plant Pot
*/
Harris_fnc_plantPot = {
	
	if (Harris_carryingPot) exitWith {};
	
	closeDialog 0;

	Harris_carryingPot = true;
	_pot = "JDPot" createVehicle position player;

	_pot attachTo [player, [0,1.5,0.21]];

	_pot allowDamage false;

	player setVariable ["carryingPot", _pot];

	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";

	dropACtion = player  addAction ["Drop Pot", "[_this select 0] call Harris_fnc_dropPot"];
};
