/*
	Author: Ben Harris
	Description: Phone - Read Function Name
*/


Harris_onUberLbChanged = {
	params["_index"];
	_uberID = ((missionNamespace getVariable "uberDrivers") select _index);
	_uber = _uberID select 0;
	Harris_numberToCall = _uberID select 1;
	

	ctrlSetText[1602, str (player distance _uber)];
	_vehicle = vehicle _uber;
	if (_vehicle == _uber) then {
		_vehicle = "None";
	} else {
		_vehicle = [typeOf _vehicle] call Harris_getVehicleName;
	};

	ctrlSetText[1603, _vehicle];
};