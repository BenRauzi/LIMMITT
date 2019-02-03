#include <macro.h>
/*
	File: fn_unimpound.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Yeah... Gets the vehicle from the garage.
*/
private["_vehicle","_vid","_pid","_unit","_price"];
disableSerialization;
if(lbCurSel 2802 == -1) exitWith {["Error",localize "STR_Global_NoSelection","Failure"] spawn Harris_Notifications;};
_vehicle = lbData[2802,(lbCurSel 2802)];
_vehicle = (call compile format["%1",_vehicle]) select 0;
_vid = lbValue[2802,(lbCurSel 2802)];
_pid = getPlayerUID player;
_unit = player;

if(isNil "_vehicle") exitWith { ["Error",localize "STR_Garage_Selection_Error","Failure"] spawn Harris_Notifications;};

_price = [_vehicle,__GETC__(life_garage_prices)] call fnc_index;
if(_price == -1) then {_price = 1000;} else {_price = (__GETC__(life_garage_prices) select _price) select 1;};
if(gm_memecash < _price) exitWith {hint format[(localize "STR_Garage_CashError"),[_price] call life_fnc_numberText];};

if(typeName life_garage_sp == "ARRAY") then {
	[[_vid,_pid,life_garage_sp select 0,_unit,_price,life_garage_sp select 1],"TON_fnc_spawnVehicle",false,false] spawn bis_fnc_mp;
} else {
	if(life_garage_sp in ["medic_spawn_1","medic_spawn_2","medic_spawn_3"]) then {
		[[_vid,_pid,life_garage_sp,_unit,_price],"TON_fnc_spawnVehicle",false,false] spawn bis_fnc_mp;
	} else {
		if (life_garage_sp == "dcso_air") {
			[[_vid,_pid,([(getMarkerPos life_garage_sp) select 0,(getMarkerPos life_garage_sp) select 1,8.5]),_unit,_price,markerDir life_garage_sp],"TON_fnc_spawnVehicle",false,false] spawn bis_fnc_mp;
		} else {
			[[_vid,_pid,(getMarkerPos life_garage_sp),_unit,_price,markerDir life_garage_sp],"TON_fnc_spawnVehicle",false,false] spawn bis_fnc_mp;
		};
	};
};

["Success",localize "STR_Garage_SpawningVeh","Success"] spawn Harris_Notifications;

gm_memecash = gm_memecash - _price;