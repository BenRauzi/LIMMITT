#include <macro.h>
/*
	File: fn_initCop.sqf
	Author: Bryan "Tonic" Boardwine
	Edited: Lewis Grant & Killian Dolan
	
	Description:
	Cop Initialization file.
*/

// TFR Variables API
tf_no_auto_long_range_radio = true; 

TF_terrain_interception_coefficient = 1;

private["_end"];
player addRating 9999999;
waitUntil {!(isNull (findDisplay 46))};
_end = false;
if(life_blacklisted) exitWith
{
	["Blacklisted",false,true] call BIS_fnc_endMission;
	uiSleep 30;
};

if !(isClass(configfile >> "CfgPatches" >> "JD_F350")) then {
	["NotUpdated",false,true] call BIS_fnc_endMission;
	uiSleep 35;
};


if((__GETC__(life_coplevel) == 0) && (__GETC__(life_adminlevel) == 0)) then {
	["NotWhitelisted",false,true] call BIS_fnc_endMission;
	uiSleep 35;
};

//if(!(str(player) in ["cop_1","cop_2","cop_3","cop_4"])) then { };

// Set Paycheck for Police For Each rank
switch (__GETC__(life_coplevel)) do 
			{
	             case 1: {life_paycheck = life_paycheck + 2850;}; // Rank 1
	             case 2: {life_paycheck = life_paycheck + 3450;}; // Rank 2
	             case 3: {life_paycheck = life_paycheck + 4050;}; // Rank 3
	             case 4: {life_paycheck = life_paycheck + 4650;}; // Rank 4
	             case 5: {life_paycheck = life_paycheck + 5250;}; // Rank 5 
	             case 6: {life_paycheck = life_paycheck + 5850;}; // Rank 6
	             case 7: {life_paycheck = life_paycheck + 6450;}; // Rank 7
			};


player setVariable["rank",(__GETC__(life_coplevel)),true];
[false] spawn life_fnc_spawnMenu;
[] execVM "core\welcomecop.sqf";
waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.

//player setVariable ["tf_sendingDistanceMultiplicator", 1, true];
//player setVariable ["tf_receivingDistanceMultiplicator", 1, true];
player setVariable ["copLevel",1,true];

player setVariable ["GM_Job","Law Enforcement", true];