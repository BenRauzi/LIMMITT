/*
	File: fn_wantedFetch.sqf
	Author: Bryan "Tonic" Boardwine"
	
	Description:
	Displays wanted list information sent from the server.
*/

private["_ret","_list","_jailedUnits"];
_ret = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _ret) exitWith {};

_ret = owner _ret;
_jailedUnits = [];
{if(_x distance (getMarkerPos "jail_marker") < 120) then {_jailedUnits set[count _jailedUnits,getPlayerUID _x]}} count playableUnits;

_list = [];
{
_uid = _x select 1;
if([_uid] call life_fnc_isUIDActive) then
{
if(!(_uid in _jailedUnits)) then {
_list set[count _list,_x];
};
};
} foreach life_wanted_list;
[[_list],"life_fnc_wantedList",_ret,false] spawn bis_fnc_mp;