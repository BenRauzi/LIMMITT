/*
	File: fn_initCiv.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Initializes the civilian.
*/

// TFR Variables API
tf_no_auto_long_range_radio = true; 

TF_terrain_interception_coefficient = 1;

private["_spawnPos"];

if !(isClass(configfile >> "CfgPatches" >> "JD_F350")) then {
	["NotUpdated",false,true] call BIS_fnc_endMission;
	uiSleep 35;
};

if(life_is_arrested) then
{
	[false,false,life_arrestMinutes,life_arrestReason] call fnc_jailsetup;
}
	else
{
	[false] spawn life_fnc_spawnMenu;
	[] execVM "core\welcomeciv.sqf";
	waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
	waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
};

player addRating 9999999;
[] call life_fnc_zoneCreator;


player setVariable ["GM_Job","Unemployed", true];