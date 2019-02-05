#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	32 hours...
*/
private["_unit","_unitID","_members"];
disableSerialization;

if((lbCurSel 2621) == -1) exitWith {["Error", localize "STR_GNOTF_SelectKick", "Failure"] call Harris_Notifications;};
_unit = call compile format["%1",getSelData(2621)];
if(isNull _unit) exitWith {}; //Bad unit?
if(_unit == player) exitWith {["Error", localize "STR_GNOTF_KickSelf", "Failure"] call Harris_Notifications;};

_unitID = getPlayerUID _unit;
_members = grpPlayer getVariable "gang_members";
if(isNil "_members") exitWith {};
if(typeName _members != "ARRAY") exitWith {};
_members = _members - [_unitID];
grpPlayer setVariable["gang_members",_members,true];

[[_unit,grpPlayer],"clientGangKick",_unit,false] spawn bis_fnc_mp; //Boot that bitch!
[[4,grpPlayer],"TON_fnc_updateGang",false,false] spawn bis_fnc_mp; //Update the database.
[] call life_fnc_gangMenu;