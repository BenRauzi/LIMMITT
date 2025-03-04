#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Prompts the player about an invite.
*/
private["_name","_group"];
_name = [_this,0,"",[""]] call BIS_fnc_param;
_group = [_this,1,grpNull,[grpNull]] call BIS_fnc_param;
if(_name == "" OR isNull _group) exitWith {}; //Fail horn anyone?
if(!isNil {(group player) getVariable "gang_name"}) exitWith {["Error", "You are already in a gang", "Failure"] call Harris_Notifications;};

_gangName = _group getVariable "gang_name";
_action = [
	format[localize "STR_GNOTF_InviteMSG",_name,_gangName],
	localize "STR_Gang_Invitation",
	localize "STR_Global_Yes",
	localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if(_action) then {
	[player] join _group;
	[[4,_group],"TON_fnc_updateGang",false,false] spawn bis_fnc_mp;
} else {
	_grpMembers = grpPlayer getVariable "gang_members";
	_grpMembers = _grpMembers - [steamid];
	grpPlayer setVariable["gang_members",_grpMembers,true];
	[[4,_grpMembers],"TON_fnc_updateGang",false,false] spawn bis_fnc_mp;
};