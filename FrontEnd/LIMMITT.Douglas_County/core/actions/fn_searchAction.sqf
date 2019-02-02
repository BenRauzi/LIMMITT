/*
	File: fn_searchAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the searching process.
*/
private["_unit"];
_unit = cursorTarget;
if(isNull _unit) exitWith { hint "You appear to not be looking at anyone to search.."; };

_unit setVariable["search",true,true];


