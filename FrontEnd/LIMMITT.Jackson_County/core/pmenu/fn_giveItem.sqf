/*
	File: fn_giveItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gives the selected item & amount to the selected player and
	removes the item & amount of it from the players virtual
	inventory.
*/
private["_unit","_val"];
_val = ctrlText 2010;
ctrlShow[2002,false];
if((lbCurSel 2023) == -1) exitWith {["Error", "No one was selected!", "Failure"] call Harris_Notifications; ctrlShow[2002,true];};
_unit = lbData [2023,lbCurSel 2023];
_unit = call compile format["%1",_unit];
if((lbCurSel 2005) == -1) exitWith {["Error", "You didn't select an item you wanted to give.", "Failure"] call Harris_Notifications;ctrlShow[2002,true];};
_item = lbData [2005,(lbCurSel 2005)];
if(isNil "_unit") exitWith {ctrlShow[2002,true];};
if(_unit == player) exitWith {ctrlShow[2002,true];};
if(isNull _unit) exitWith {ctrlShow[2002,true];};

//A series of checks *ugh*
if(!([_val] call fnc_isnumber)) exitWith { ["Error", "You didn't enter an actual number format.", "Failure"] call Harris_Notifications; ctrlShow[2002,true];};
if(parseNumber(_val) <= 0) exitWith { ["Error", "You need to enter an actual amount you want to give.", "Failure"] call Harris_Notifications;ctrlShow[2002,true];};
if(isNil "_unit") exitWith {ctrlShow[2001,true]; ["Error", "The selected player is not within range", "Failure"] call Harris_Notifications;};
if(!([false,_item,(parseNumber _val)] call life_fnc_handleInv)) exitWith { ["Error", "Couldn't give that much of that item, maybe you don't have that amount?", "Failure"] call Harris_Notifications;ctrlShow[2002,true];};
[[_unit,_val,_item,player],"life_fnc_receiveItem",_unit,false] spawn bis_fnc_mp;
_type = [_item,0] call life_fnc_varHandle;
_type = [_type] call life_fnc_varToStr;
["Success",  format["You gave %1 %2 %3",_unit getVariable["realname",name _unit],_val,_type], "Success"] call Harris_Notifications;
[] call life_fnc_p_updateMenu;

ctrlShow[2002,true];