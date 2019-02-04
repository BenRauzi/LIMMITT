/*
	File: fn_knockoutAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Knocks out the target.
*/
private["_target"];
_target = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

//Error checks
if(isNull _target) exitWith {};
if(!isPlayer _target) exitWith {};
if(player distance _target > 4) exitWith {};
life_knockout = true;
[[player,"AwopPercMstpSgthWrflDnon_End2"],"life_fnc_animSync",nil,false] spawn bis_fnc_mp;
uiSleep 0.08;
[[_target,profileName],"life_fnc_knockedOut",_target,false] spawn bis_fnc_mp;
//life_karma = life_karma - 1;
uiSleep 3;
life_knockout = false;