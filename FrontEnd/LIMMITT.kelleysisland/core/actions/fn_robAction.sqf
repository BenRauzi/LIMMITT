/*
	File: fn_robAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the robbing process?
*/
private["_target"];
_target = cursorTarget;

//Error checks
if(isNull _target) exitWith {};
if(!isPlayer _target) exitWith {};

player switchMove "amovpknlmstpsnonwnondnon_amovpknlmstpsraswlnrdnon";
[[player,"amovpknlmstpsnonwnondnon_amovpknlmstpsraswlnrdnon"],"life_fnc_animSync",true,false] spawn bis_fnc_mp;

if(_target getVariable["robbed",false]) exitWith {};
[[player],"life_fnc_robPerson",_target,false] spawn bis_fnc_mp;
_reason = "211";

//life_karma = life_karma - 50;
_target setVariable["robbed",TRUE,TRUE];
_target setVariable["search",true,true];
[player,player,_reason] spawn life_fnc_createEvidence;