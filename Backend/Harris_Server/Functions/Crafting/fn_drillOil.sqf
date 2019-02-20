/*
	Author: Ben Harris
	Description: Starts pumping oil
*/
Harris_drillOil = {
	params ["_ct"]; 
	
	_v = false;
	{
		if (player distance (getMarkerPos _x) < 120) then {
			_v = true;
		};
	} forEach Harris_oilFields;

	rate =  0.1;
	if !(_v) then {
		rate =  0.025;
	};

	_ct setVariable ['isDrillingOil', true,true];

	_i = 0.1;
	while {true} do
	{
		if (isNull _ct) exitWith {};
		if !(_ct getVariable ['isDrillingOil', false]) exitWith {};
		sleep 3;
		if ((call compile(str _i) % 1) == 0) then {[_ct] call Harris_oilSpawned; };
		_i = _i + rate;
	};
	_ct setVariable ['isDrillingOil', nil,true]
};