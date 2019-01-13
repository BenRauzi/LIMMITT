/*
	File: fn_giveMoney.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gives the selected amount of money to the selected player.
*/
private["_unit","_amount"];
_amount = ctrlText 2018;
ctrlShow[2001,false];
if((lbCurSel 2022) == -1) exitWith {["Error", "No one was selected!", "Failure"] call Harris_Notifications;ctrlShow[2001,true];};
_unit = lbData [2022,lbCurSel 2022];
_unit = call compile format["%1",_unit];
if(isNil "_unit") exitWith {ctrlShow[2001,true];};
if(_unit == player) exitWith {ctrlShow[2001,true];};
if(isNull _unit) exitWith {ctrlShow[2001,true];};

//A series of checks *ugh*
if(!life_use_atm) exitWith {["Error", "You recently robbed the bank! You can't give money away just yet.", "Failure"] call Harris_Notifications;ctrlShow[2001,true];};
if(!([_amount] call fnc_isnumber)) exitWith {["Error", "You didn't enter an actual number format.", "Failure"] call Harris_Notifications;ctrlShow[2001,true];};
if(parseNumber(_amount) <= 0) exitWith {["Error", "You need to enter an actual amount you want to give.", "Failure"] call Harris_Notifications;ctrlShow[2001,true];};
if(parseNumber(_amount) > LIMMITTCASH) exitWith {["Error", "You don't have that much to give!", "Failure"] call Harris_Notifications;ctrlShow[2001,true];};
if(isNull _unit) exitWith {ctrlShow[2001,true];};
if(isNil "_unit") exitWith {ctrlShow[2001,true]; ["Error", "The selected player is not within range", "Failure"] call Harris_Notifications;};
["Success", format["You gave $%1 to %2",[(parseNumber(_amount))] call life_fnc_numberText,_unit getVariable["realname",name _unit]], "Success"] call Harris_Notifications;
LIMMITTCASH = LIMMITTCASH - (parseNumber(_amount));
if(parseNumber(_amount) > 15000) then {
	[0] call SOCK_fnc_updatePartial;
};
[] call SOCK_fnc_updateRequest;
[[_unit,_amount,player],"life_fnc_receiveMoney",_unit,false] spawn bis_fnc_mp;
[] call life_fnc_p_updateMenu;

_content = format ["%1 [%2] Just Handed $%5 to %3 [%4]", name player, getPlayerUID player, name _unit, getPlayerUID _unit, _amount];
[[_content],"DB_fnc_logToLogs",false,false] spawn bis_fnc_mp;

ctrlShow[2001,true];