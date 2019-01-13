#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Prompts the user about disbanding the gang and if the user accepts the gang will be
	disbanded and removed from the database.
*/
private["_action"];

_action = [
	localize "STR_GNOTF_DisbandWarn",
	localize "STR_Gang_Disband_Gang",
	localize "STR_Global_Yes",
	localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if(_action) then {
	["Gang Removed", localize "STR_GNOTF_DisbandGangPro", "Success"] call Harris_Notifications;
	[[grpPlayer],"TON_fnc_removeGang",false,false] spawn bis_fnc_mp;
} else {
	hint localize "STR_GNOTF_DisbandGangCanc";
	["Gang Disbanded", localize "STR_GNOTF_DisbandGangCanc", "Success"] call Harris_Notifications;
};