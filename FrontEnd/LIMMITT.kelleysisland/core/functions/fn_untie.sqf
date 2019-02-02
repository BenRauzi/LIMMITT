/*
	File: fn_untie.sqf
*/
private["_unit"];
_unit = cursorTarget;
if((life_action_inUse) || (player getVariable "tied") || (player getVariable "restrained")) exitWith { 
titleText["You can not do that.","PLAIN"];
titleFadeOut 5;
}; 
if(isNull _unit || !(_unit getVariable "tied")) exitWith {};

_unit setVariable["tied",false,true];
//[[0,format["%1 was released by %2.", name _unit, name player]],"life_fnc_broadcast",west,false] spawn bis_fnc_mp;