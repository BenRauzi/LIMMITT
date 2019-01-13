/*
	Author: Ben Harris
	Description: Whitelists cop while ingame
*/

Harris_whitelist = {
	
	_level = parseNumber (lbText [ 2100, ( lbCurSel 2100 ) ]);	

	[_arrHandle, _uid] remoteExecCall ["Server_fnc_copUpdate", 2];
};
