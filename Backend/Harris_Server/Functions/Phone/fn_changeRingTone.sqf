/*
	Author: Ben Harris
	Description: Phone - Read Function Name
*/


Harris_changeRingTone = {
	params["_index"];

	_ringTone = lbData [2100, _index];
	
	if (isNil "settingsLoad") then {
		playSound _ringTone;
	} else {
		settingsLoad = nil;
	};	

	if (_ringTone != profileNamespace getVariable ["ringTone", ""]) then {
		profileNamespace setVariable ["ringTone", _ringTone];
		saveProfileNamespace;	
	};
};