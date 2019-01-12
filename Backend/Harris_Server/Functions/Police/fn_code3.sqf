/*
	Author: Ben Harris
	Description: Sirens for D3S
*/

Harris_code3 = {
	_veh = vehicle player;
	if !(_veh getVariable ["lightson", false]) then {
		_veh setVariable ["lightson", true,true];
		
		_veh execVM '\d3s_scripts\scripts\code2_7.sqf';
	};

	_veh setVariable ['sirensOn',true, true];

	[_veh] spawn {
		_veh = _this select 0;
		while {true} do
		{
			if(isNull driver _veh || !alive player || !(_veh getVariable ['sirensOn',false])) exitWith {};
			_veh say3D "JDSiren1";
			sleep 10;
			if(isNull driver _veh || !alive player || !(_veh getVariable ['sirensOn',false])) exitWith {};
			_veh say3D "JDSiren2";
			sleep 4;
			if(isNull driver _veh || !alive player || !(_veh getVariable ['sirensOn',false])) exitWith {};
			_veh say3D "JDSiren3";
			sleep 4;
		};	
	};	
};