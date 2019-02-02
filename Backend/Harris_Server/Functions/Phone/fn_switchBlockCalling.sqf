/*
	Author: Ben Harris
	Description: Phone - Read Function Name
*/

Harris_switchBlockCalling = {
	params["_type"];

	if (_type) then {
		profileNamespace setVariable ["blockingCalls", true];
		ctrlShow [1202, true];
		ctrlShow [1606, false];
		ctrlShow [1204, false];
		ctrlShow [1607, true];
	} else {
		profileNamespace setVariable ["blockingCalls", nil];
		ctrlShow [1202, false];
		ctrlShow [1606, true];
		ctrlShow [1204, true];
		ctrlShow [1607, false];
	};
};