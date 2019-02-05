/*
	Author: Ben Harris
	Description: Seizes Weed
*/
Harris_seizeWeed = {
	params["_ct"];

	_plant = _ct getVariable ['growingPlant', objNull];
	deleteVehicle _plant;	
	_ct setVariable ['growingPlant', nil, true];
	_ct setVariable ["seized",true,true];

	["Success", "This weed has been seized", "Success"] call Harris_Notifications;
};