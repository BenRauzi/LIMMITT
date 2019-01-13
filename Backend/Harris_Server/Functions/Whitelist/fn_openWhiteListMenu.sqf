/*
	Author: Ben Harris
	Description: Whitelists a player
*/
Harris_openWhiteListMenu = {
	params["_ct"];

	Harris_toWhitelist = _ct;

	createDialog "Harris_whiteList";

	for "_i" from 0 to 10 do {
		lbAdd [2100, str _i];
	};	
};
