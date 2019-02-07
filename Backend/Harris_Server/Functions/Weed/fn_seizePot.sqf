/*
	Author: Ben Harris
	Description: Seizes Pot
*/
Harris_seizePot = {
	params["_ct"];
	
	player playMove 'AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon';
	deleteVehicle _ct;
	["Success", "This pot has been seized", "Success"] call Harris_Notifications;
};