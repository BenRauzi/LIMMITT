/*
	Author: Ben Harris
	Description: Phone - Read Function Name
*/

Harris_setBackground = {
	params["_id"];

	profileNamespace setVariable ["background", _id];
	saveProfileNamespace;	
};