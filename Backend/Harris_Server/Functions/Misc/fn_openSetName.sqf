/*
	Author: Ben Harris
	Description: Open Set Name Menu
*/

Harris_openSetName = {
	params["_ct"];

	createDialog "Harris_setName";
	
	Harris_toSetName = _ct;
	_currentName = profileNamespace getVariable	[str (getPlayerUID Harris_toSetName), "Unknown"];
	ctrlSetText	[1000, format ["Current Name: %1"], _currentName];
};