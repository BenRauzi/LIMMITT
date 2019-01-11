/*
	File: fn_knockedOut.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts and monitors the knocked out state.
*/
private["_target","_who","_obj"];
_target = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_who = [_this,1,"",[""]] call BIS_fnc_param;
if(isNull _target) exitWith {};
if(_target != player) exitWith {};
if(_who == "") exitWith {};

titleText[format[localize "STR_Civ_KnockedOut",_who],"PLAIN"];

player setVariable["robbed",FALSE,TRUE];

[] spawn {
	player setVariable ["tf_unable_to_use_radio", true];
	player setVariable ["tf_voiceVolume", 0, true];
	[] call KK_fnc_forceRagdoll;
	sleep 7;
	player setVariable ["tf_unable_to_use_radio", false];
	player setVariable ["tf_voiceVolume", 1, true];
};

//player playMoveNow "Incapacitated";
//_obj = "Land_ClutterCutter_small_F" createVehicle (getPosATL player);
//_obj setPosATL (getPosATL player);
//player attachTo [_obj,[0,0,0]];
[] call life_fnc_stage3pain;



//if(!(player getVariable["restrained",false]) && !(player getVariable["tied",false])) then {
//	player playMoveNow "amovppnemstpsraswrfldnon";
//};

