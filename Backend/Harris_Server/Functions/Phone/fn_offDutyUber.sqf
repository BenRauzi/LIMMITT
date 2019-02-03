/*
	Author: Ben Harris
	Description: Phone - Read Function Name
*/

Harris_offDutyUber = {
	_ubers = missionNamespace getVariable "uberDrivers";
	_ubers deleteAt (_ubers find [player, profileNamespace getVariable "yourNumber"]);
	missionNamespace setVariable ["uberDrivers", _ubers, true];	
	isUber = nil;

	[] call Harris_uberOpened;
};