/*
	Author: Ben Harris
	Description: Phone - Read Function Name
*/

Harris_switchAnonCalling = {
	params["_type"];

	if (_type) then {
		profileNamespace setVariable ["anonCalling", true];
		ctrlShow [1203, true];
		ctrlShow [1604, false];
		ctrlShow [1205, false];
		ctrlShow [1605, true];
	} else {
		profileNamespace setVariable ["anonCalling", false];
		ctrlShow [1203, false];
		ctrlShow [1604, true];
		ctrlShow [1205, true];
		ctrlShow [1605, false];
	};
};