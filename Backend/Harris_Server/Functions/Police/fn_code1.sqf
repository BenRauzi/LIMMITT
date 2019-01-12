/*
	Author: Ben Harris
	Description: Sirens for D3S
*/

Harris_code1 = {
	_veh = vehicle player;
	if (_veh getVariable ["lightson", false]) then {
		_veh execVM '\d3s_scripts\scripts\code2_7.sqf';
		_veh setVariable ["lightson", nil,true];

		if (_veh getVariable ["sirensOn", false]) then {
			_veh setVariable ['sirensOn',false, true];
		};
	};
};