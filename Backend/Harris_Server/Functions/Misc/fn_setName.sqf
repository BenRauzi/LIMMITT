/*
	Author: Ben Harris
	Description: Sets player name
*/
Harris_setName = {
	
	if (ctrlText 1400 != "") then {
		profileNamespace setVariable [str (getPlayerUID Harris_toSetName), ctrlText 1400];
	} else {
		profileNamespace setVariable [str (getPlayerUID Harris_toSetName), nil];
	};
	
};