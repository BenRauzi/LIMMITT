/*
	Author: Ben Harris
	Description: Pickup Pot
*/

Harris_fnc_pickUpPot = {
	params["_ct"];

	dropACtion = player  addAction ["Drop Pot", "[_this select 0] call Harris_fnc_dropPot"];
	 
	Harris_carryingPot = true;

	_potDir = getDir _ct;
	_playerDir = getDir player;

	_dir = _potDir - _playerDir;

	_ct attachTo [player];
	_ct setDir _dir;

	player setVariable ["carryingPot", _ct];
};