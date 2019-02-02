/*
	Author: Ben Harris
	Description: Phone - Read Function Name
*/


Harris_openSettings = {
	waitUntil {!isNull (findDisplay 5008)};
	settingsLoad = true;

	{
		_index = lbAdd [2100, _x select 0];
		lbSetData [2100, _index, _x select 1];

		if (_x select 1 isEqualTo (profileNamespace getVariable ["ringTone", "iphone_ringtone"])) then {
			lbSetCurSel [2100, _forEachIndex];
		};
	} forEach Harris_ringtones;

	if (profileNamespace getVariable ["anonCalling", false]) then {
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

	if (profileNamespace getVariable ["blockingCalls", false]) then {
		ctrlShow [1202, true];
		ctrlShow [1606, false];
		ctrlShow [1204, false];
		ctrlShow [1607, true];
	} else {
		ctrlShow [1202, false];
		ctrlShow [1606, true];
		ctrlShow [1204, true];
		ctrlShow [1607, false];
	};

	{
		if (_x select 2) then {
			_index = lbAdd [2101, _x select 0];
			lbSetData [2101, _index, _x select 1];
		};
		if (_x select 1 == profileNamespace getVariable ["colour", "Default"]) then {
			lbSetCurSel [2101, _forEachIndex];
		};
	} forEach Harris_twitterColours;

	if (lbCurSel 2101 == -1) then {
		profileNamespace setVariable ["colour", "Default"];
		lbSetCurSel [2101, 0];
	};
};