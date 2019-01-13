/*
	File: fn_virt_menu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Initialize the virtual shop menu.
*/
private["_shop"];
_shop = _this select 3;
if(isNil {_shop}) exitWith {};
life_shop_type = _shop;
life_shop_npc = _this select 0;
if(_shop == "cop" && playerSide != west) exitWith {  ["Error", localize "STR_NOTF_NotACop", "Failure"] call Harris_Notifications; };
if(_shop == "ems" && playerSide != independent) exitWith {["Error", "You are not a medic!", "Failure"] call Harris_Notifications;};
createDialog "shops_menu";

[] call life_fnc_virt_update;