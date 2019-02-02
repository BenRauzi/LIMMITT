/*
	File: fn_untie.sqf
*/
private["_unit"];
_unit = cursorTarget;

if((life_action_inUse) || (player getVariable "tied") || (player getVariable "restrained")) exitWith { 
titleText["You can not do that.","PLAIN"];
titleFadeOut 5;
}; 

if(isNull _unit || !(_unit getVariable "blindfolded")) exitWith {};


_unit setVariable["blindfolded",false,true];
