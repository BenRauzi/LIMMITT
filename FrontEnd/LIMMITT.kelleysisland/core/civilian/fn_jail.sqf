/*
	File: fn_jail.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the initial process of jailing.
*/
private["_bad","_unit", "_pos"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
hint format["%1", _unit];
if(isNull _unit) exitWith {}; //Dafuq?
if(_unit != player) exitWith {}; //Dafuq?
if(life_is_arrested) exitWith {}; //Dafuq i'm already arrested
_bad = [_this,1,false,[false]] call BIS_fnc_param;
player setVariable["restrained",false,true];
player setVariable["Escorting",false,true];
player setVariable["transporting",false,true];

titleText[localize "STR_Jail_Warn","PLAIN"];
["General",  localize "STR_Jail_LicenseNOTF", "General"] call Harris_Notifications;
_pos = selectRandom ["jail_marker","jail_marker_2","jail_marker_3","jail_marker_4","jail_marker_5","jail_marker_6"];
player setPos (getMarkerPos _pos);

if (uniform player == "A3L_Prisoner_Outfit") then 
{
	A3L_Fnc_OldUniform = "A3L_Shirt";
} 
else
{
	A3L_Fnc_OldUniform = Uniform player;
};

if(_bad) then
{
	waitUntil {alive player};
	uiSleep 1;
};

//Check to make sure they goto check
if(player distance (getMarkerPos _pos) > 40) then
{
	player setPos (getMarkerPos _pos);
};

[1] call life_fnc_removeLicenses;
if(asdih_inv_heroinu > 0) then {[false,"heroinu",asdih_inv_heroinu] call life_fnc_handleInv;};
if(asdih_inv_heroinp > 0) then {[false,"heroinp",asdih_inv_heroinp] call life_fnc_handleInv;};
if(asdih_inv_coke > 0) then {[false,"cocaine",asdih_inv_coke] call life_fnc_handleInv;};
if(asdih_inv_cokep > 0) then {[false,"cocainep",asdih_inv_cokep] call life_fnc_handleInv;};
if(asdih_inv_turtle > 0) then {[false,"turtle",asdih_inv_turtle] call life_fnc_handleInv;};
if(asdih_inv_cannabis > 0) then {[false,"cannabis",asdih_inv_cannabis] call life_fnc_handleInv;};
if(asdih_inv_marijuana > 0) then {[false,"marijuana",asdih_inv_marijuana] call life_fnc_handleInv;};
life_is_arrested = true;

removeAllWeapons player;
{player removeMagazine _x} foreach (magazines player);

[[player,_bad],"life_fnc_jailSys",false,false] spawn bis_fnc_mp;
[5] call SOCK_fnc_updatePartial;