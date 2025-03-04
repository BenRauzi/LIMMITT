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
if((_house getVariable["house_owned",false])) exitWith {["Error", "This house is already owned even though you shouldn't be seeing this hint...",  "Failure"] call Harris_Notifications;};
if(!isNil {(_house getVariable "house_sold")}) exitWith {["Notification", localize "STR_House_Sell_Process",  "General"] call Harris_Notifications;};
if(!license_civ_home) exitWith {["No License", localize "STR_House_License",  "Failure"] call Harris_Notifications;};

//if(count life_houses >= (__GETC__(life_houseLimit))) exitWith {hint format[localize "STR_House_Max_House",__GETC__(life_houseLimit)]};
closeDialog 0;

_houseCfg = [(typeOf _house)] call life_fnc_houseConfig;
if(count _houseCfg == 0) exitWith {};

_cost = (_houseCfg select 0);
_costs = _cost / 1000000;
if(gm_memecash < _cost) exitWith { ["Cost", format ["You need (%1 Million Dollars) to buy this.", _costs],  "Info"] call Harris_Notifications;};




_action = [
	format[localize "STR_House_BuyMSG",
	[(_houseCfg select 0)] call life_fnc_numberText,
	(_houseCfg select 1)],localize "STR_House_Purchase",localize "STR_Global_Buy",localize "STR_Global_Cancel"
] call BIS_fnc_guiMessage;

if(_action) then {
	_content = format ["%1 has just brought a house for %2", name player, (_houseCfg select 0)];
	[[_content],"DB_fnc_logToLogs",false,false] spawn bis_fnc_mp;

	[[_uid,_house],"TON_fnc_addHouse",false,false] spawn bis_fnc_mp;
	_house setVariable["house_owner",[_uid,profileName],true];
	_house setVariable["locked",true,true];
	_house setVariable["Trunk",[[],0],true];
	_house setVariable["containers",[],true];
	_house setVariable["uid",round(random 99999),true];
	gm_memecash = gm_memecash - (_houseCfg select 0);
	life_vehicles set[count life_vehicles,_house];
	life_houses set[count life_houses,[str(getPosATL _house),[]]];
	[1] call SOCK_fnc_updatePartial;
	_marker = createMarkerLocal [format["house_%1",(_house getVariable "uid")],getPosATL _house];
	_houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");
	_marker setMarkerTextLocal _houseName;
	_marker setMarkerColorLocal "ColorBlue";
	_marker setMarkerTypeLocal "loc_Lighthouse";
	_numOfDoors = getNumber(configFile >> "CfgVehicles" >> (typeOf _house) >> "numberOfDoors");
	for "_i" from 1 to _numOfDoors do {
		_house setVariable[format["bis_disabled_Door_%1",_i],1,true];
	};
};
