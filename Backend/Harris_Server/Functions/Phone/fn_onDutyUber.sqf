/*
	Author: Ben Harris
	Description: Phone - Read Function Name
*/

Harris_onDutyUber = {
	_ubers = missionNamespace getVariable ["uberDrivers", []];
	_ubers pushBack [player, profileNamespace getVariable "yourNumber"];
	missionNamespace setVariable ["uberDrivers", _ubers, true];	
	isUber = true;

	[] call Harris_uberOpened;
};