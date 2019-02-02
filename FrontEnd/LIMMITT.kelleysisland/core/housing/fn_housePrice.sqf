#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Buys the house?
*/
private["_house","_uid","_action","_houseCfg"];
_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_uid = getPlayerUID player;

if(isNull _house) exitWith {};
if(!(_house isKindOf "House_F")) exitWith {};
_houseCfg = [(typeOf _house)] call life_fnc_houseConfig;
if(count _houseCfg == 0) exitWith {};



_costs = (_houseCfg select 0);
_storage = (_houseCfg select 1);
_costs = _costs / 1000000;

["Info", format ["Cost: %1 Million ---- Storage: %2 Crates", _costs, _storage], "Info"] call Harris_Notifications;



