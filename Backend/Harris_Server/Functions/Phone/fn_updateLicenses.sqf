/*
	Author: Ben Harris
	Description: Phone - Read Function Name
*/


Harris_updateLicenses = {
	waitUntil {!isNull (findDisplay 5022)};

	_dialog = findDisplay 5022;
	_licenses = [];
	_side = str (playerSide);
	{
		if((_x select 1) == _side) then
		{
			_str = [_x select 0] call life_fnc_varToStr;
			_val = missionNamespace getVariable (_x select 0);
			if(_val) then
			{
				_licenses pushBack _str;
			};
		};
	} foreach life_licenses;

	if(str _licenses == "[]") then
	{
		_licenses = ["No Licenses"];
	};
	
	{
		lbAdd [2702, _x];
	} forEach _licenses;
};