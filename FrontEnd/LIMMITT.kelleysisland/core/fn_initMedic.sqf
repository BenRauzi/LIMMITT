#include <macro.h>
/*
	File: fn_initMedic.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Initializes the medic..
*/

// TFR Variables API
tf_no_auto_long_range_radio = true; 

TF_terrain_interception_coefficient = 1;


private["_end"];
player addRating 99999999;
waitUntil {!(isNull (findDisplay 46))};

if !(isClass(configfile >> "CfgPatches" >> "JD_F350")) then {
	["NotUpdated",false,true] call BIS_fnc_endMission;
	uiSleep 35;
};

if((__GETC__(life_medicLevel)) < 1) exitWith {
	["Notwhitelisted",FALSE,TRUE] call BIS_fnc_endMission;
	uiSleep 35;
};

// Custom Paychecks for Medic's Created by Dez Edited by Killian
life_paycheck = 2350 + 600 * __GETC__(life_medicLevel);
			
[false] spawn life_fnc_spawnMenu;
[] execVM "core\welcomemedic.sqf";
waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.

player setVariable ["GM_Job","Paramedic", true];