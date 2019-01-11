#include "..\..\script_macros.hpp"
/*
    File: fn_licenseCheck.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Returns the licenses to the cop.
*/
private ["_cop","_suspect"];
_cop = param [0,objNull,[objNull]];
_suspect = param [1,objNull,[objNull]];
_return = "No Warrants";
_returnList = [];

_uid = getPlayerUID _suspect;
{
	if (_uid isEqualTo (_x select 1)) then {
		_return = "Active Warrants";
		_returnList = (_x select 2);
	};
} forEach life_wanted_list;

[_return,_returnList] remoteExecCall ["life_fnc_computerWarrantsList",_cop];
