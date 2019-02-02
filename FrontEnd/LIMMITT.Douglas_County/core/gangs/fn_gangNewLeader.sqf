#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Something about being a quitter.
*/
private["_unit","_unitID","_members","_action","_index"];
disableSerialization;

if((lbCurSel 2621) == -1) exitWith {["Error", localize "STR_GNOTF_TransferSelect", "Failure"] call Harris_Notifications;};
_unit = call compile format["%1",getSelData(2621)];
if(isNull _unit) exitWith {}; //Bad unit?
if(_unit == player) exitWith {["Error", localize "STR_GNOTF_TransferSelf", "Failure"] call Harris_Notifications;};

_action = [
	format[localize "STR_GNOTF_TransferMSG",_unit getVariable ["realname",name _unit]],
	localize "STR_Gang_Transfer",
	localize "STR_Global_Yes",
	localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if(_action) then {
	_unitID = getPlayerUID _unit;
	if(_unitID == "") exitWith {hint "Bad UID?"}; //Unlikely?
	grpPlayer setVariable["gang_owner",_unitID,true];
	grpPlayer selectLeader _unit;
	[[_unit,grpPlayer],"clientGangLeader",_unit,false] spawn bis_fnc_mp; //Boot that bitch!
	[[3,grpPlayer],"TON_fnc_updateGang",false,false] spawn bis_fnc_mp; //Update the database.
} else {
	["General", localize "STR_GNOTF_TransferCancel", "General"] call Harris_Notifications;
};
[] call life_fnc_gangMenu;