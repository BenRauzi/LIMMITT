/*
	Author: Ben Harris
	Description: Seizes Weed
*/
Harris_seizeWeed = {
	params["_ct"];

	_ct setVariable ['growingPlant', nil, true];
	deleteVehicle (_ct getVariable 'growingPlant');
};