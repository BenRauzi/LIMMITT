/*
	Author: Ben Harris
	Description: Sirens for D3S
*/

Harris_code2 = {
	_veh = vehicle player;
	if !(_veh getVariable ["lightson", false]) then {
		_veh setVariable ["lightson", true,true];
		_veh execVM '\d3s_scripts\scripts\code2_7.sqf';
	};
	if (_veh getVariable ["sirensOn", false]) then {
		_veh setVariable ['sirensOn',false, true];
	};
};