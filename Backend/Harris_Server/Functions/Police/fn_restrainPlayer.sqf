/*
	Author: Nicholas Jo'Foski
	Description: Restrains a player
*/

Foski_restrainPlayer ={
	params ["_person"];
	if (isNil "_person") exitWith {};
	_relDir = _person getRelDir player;
	_pos = "";
	if (_relDir < 90 || _relDir > 270) then {_pos = "front"}; // Front
	if (_relDir > 90 && _relDir < 270) then {_pos = "back"}; // Back
	[_pos] remoteExecCall ["Foski_playerRestrained", _person];
};