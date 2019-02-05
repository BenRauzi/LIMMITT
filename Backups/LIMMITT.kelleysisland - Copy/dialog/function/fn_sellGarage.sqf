#include <macro.h>
/*
	File: fn_sellGarage.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sells a vehicle from the garage.
*/
if(life_antispam isEqualTo 1) exitWith {};
life_antispam = 1;


private["_vehicle","_vid","_pid","_unit","_price"];
disableSerialization;


if(lbCurSel 2802 == -1) exitWith {hint localize "STR_Global_NoSelection"};
_vehicle = lbData[2802,(lbCurSel 2802)];
_vehicle = (call compile format["%1",_vehicle]) select 0;
_vid = lbValue[2802,(lbCurSel 2802)];
_pid = getPlayerUID player;
_unit = player;



closeDialog 0;

if(isNil "_vehicle") exitWith {hint localize "STR_Garage_Selection_Error"};

_price = [_vehicle,__GETC__(life_garage_sell)] call fnc_index;
if(_price == -1) then {_price = 1000;} else {_price = (__GETC__(life_garage_sell) select _price) select 1;};

[[_vid,_pid,_price,player,life_garage_type],"TON_fnc_vehicleDelete",false,false] spawn bis_fnc_mp;

_log = format ["%1 has sold their %2 - %3 for %4", getPlayerUID player, str _vid, str _vehicle, _price];
[_log,"BIS_fnc_log", false, false] call BIS_fnc_MP;

closeDialog 0;

_content = format ["%1 [%2] Just sold a car for $%3", name player, getPlayerUID player, _price];
[[_content],"DB_fnc_logToLogs",false,false] spawn bis_fnc_mp;

[] spawn {sleep 1.5; life_antispam = 0;};
