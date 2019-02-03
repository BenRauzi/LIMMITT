/*
	Author: Ben Harris
	Description: Phone - Read Function Name
*/

Harris_getVehicleName = {
	params ["_class"];

	_return = getText(configFile >> "CfgVehicles" >> _class >> "displayName");

	_return;
};
