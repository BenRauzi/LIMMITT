#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the invite process?
*/
private["_unit"];
disableSerialization;

if((lbCurSel 2632) == -1) exitWith {hint localize "STR_GNOTF_SelectPerson" ["Error", localize "STR_GNOTF_SelectPerson", "Failure"] call Harris_Notifications;};
_unit = call compile format["%1",getSelData(2632)];
if(isNull _unit) exitWith {}; //Bad unit?
if(_unit == player) exitWith {["Error", localize "STR_GNOTF_InviteSelf", "Failure"] call Harris_Notifications;};
if(!isNil {(group _unit) getVariable "gang_name"}) exitWith {["Error", "You are already in a gang", "Failure"] call Harris_Notifications;}; //Added

if(count(grpPlayer getVariable ["gang_members",8]) == (grpPlayer getVariable ["gang_maxMembers",8])) exitWith {hint localize "STR_GNOTF_MaxSlot"};

_action = [
	format[localize "STR_GNOTF_InvitePlayerMSG",_unit getVariable ["realname",name _unit]],
	localize "STR_Gang_Invitation",
	localize "STR_Global_Yes",
	localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if(_action) then {
	[[profileName,grpPlayer],"life_fnc_gangInvite",_unit,false] spawn bis_fnc_mp;
	_members = grpPlayer getVariable "gang_members";
	_members set[count _members,getPlayerUID _unit];
	grpPlayer setVariable["gang_members",_members,true];
	["Success", format[localize "STR_GNOTF_InviteSent",_unit getVariable["realname",name _unit]], "Success"] call Harris_Notifications;
} else {
	["Info", localize "STR_GNOTF_InviteCancel", "Info"] call Harris_Notifications;
};