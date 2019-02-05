/*
	Author: Ben Harris
	Description: Phone - Read Function Name
*/


Harris_uberOpened = {
	waitUntil {!isNull (findDisplay 5027)};
	lbClear 1500;

	arr = (missionNamespace getVariable "uberDrivers");
	_count = 0;
	{
		if (isNull (_x select 0)) then {
			arr deleteAt (_forEachIndex - _count);
			_count = _count + 1;
		};
	} forEach (missionNamespace getVariable "uberDrivers");

	missionNamespace setVariable ["uberDrivers", arr, true];

	{
		_index = lbAdd[1500,name (_x select 0)];
		lbSetData [1500, _index, str _forEachIndex];
	} forEach (missionNamespace getVariable "uberDrivers");

	ctrlSetText[1602, "N/A"];
	ctrlSetText[1603, "None"];

	if (!isNil "isUber") then {
		ctrlShow [1203, true];
		ctrlShow [1604, false];
		ctrlShow [1205, false];
		ctrlShow [1605, true];
	} else {
		ctrlShow [1203, false];
		ctrlShow [1604, true];
		ctrlShow [1205, true];
		ctrlShow [1605, false];
	};

	if (count (missionNamespace getVariable 'uberDrivers') == 0) exitWith {};
	lbSetCurSel [1500,0];

	
};