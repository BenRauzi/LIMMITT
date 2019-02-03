#include <macro.h>
if(__GETC__(life_adminlevel) < 1) exitWith {closeDialog 0;}; // die
if(__GETC__(life_adminlevel) < 1) exitWith {closeDialog 0;}; // die
if(__GETC__(life_adminlevel) < 1) exitWith {closeDialog 0;}; // die

_vehicleList = (configfile >> "CfgVehicles") call BIS_fnc_getCfgSubClasses;

createDialog "aaa"; 
adminMenuLastOpenedArray = playableUnits;
{
	_memer = format ["Name: %1 - %2", name _x, side _x];
	_entry = lbAdd[866123, _memer];
	lbSetData [866123, adminMenuLastOpenedArray find _x, getPlayerUID _x];
	_pic = (getText (configFile >> 'CfgWeapons' >> currentWeapon _x >> 'picture')); 
	lbSetPicture [866123, adminMenuLastOpenedArray find _x, _pic];
} forEach adminMenuLastOpenedArray;

{
	_entry = lbAdd[1311234, _x];
} forEach adminMenuLogs;

{
	_entry = lbAdd[8661231231, _x];
} forEach _vehicleList;


lbSetCurSel [866123, 0];