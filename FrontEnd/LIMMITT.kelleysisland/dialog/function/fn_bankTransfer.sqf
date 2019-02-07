/*
	File: fn_bankTransfer.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Figure it out again.
*/
private["_val","_unit","_tax"];
_val = parseNumber(ctrlText 2702);
_unit = call compile format["%1",(lbData[2703,(lbCurSel 2703)])];
if(isNull _unit) exitWith {};
if((lbCurSel 2703) == -1) exitWith { ["Failure", localize "STR_ATM_NoneSelected", "Failure"] call Harris_Notifications;};
if (_unit == "N/A") exitWith {["Failure",  "There is no one online to transfer money too.", "Failure"] call Harris_Notifications;};
if(isNil "_unit") exitWith { ["Failure", localize "STR_ATM_DoesntExist", "Failure"] call Harris_Notifications;};
if(_val > 999999) exitWith {["Failure", localize "STR_ATM_TransferMax", "Failure"] call Harris_Notifications;};
if(_val < 0) exitwith {};
if(!([str(_val)] call life_fnc_isnumeric)) exitWith {["Failure", localize "STR_ATM_notnumeric", "Failure"] call Harris_Notifications; };
if(_val > gm_memecash) exitWith {["Failure", localize "STR_ATM_NotEnough", "Failure"] call Harris_Notifications; };
_tax = [_val] call life_fnc_taxRate;
if((_val + _tax) > gm_memecash) exitWith {["Failure", format[localize "STR_ATM_SentMoneyFail",_val,_tax], "Failure"] call Harris_Notifications;};

gm_memecash = gm_memecash - (_val + _tax);

[[_val,profileName],"clientWireTransfer",_unit,false] spawn bis_fnc_mp;
[] call life_fnc_atmMenu;
["Success", format[localize "STR_ATM_SentMoneySuccess",[_val] call life_fnc_numberText,_unit getVariable["realname",name _unit],[_tax] call life_fnc_numberText], "Success"] call Harris_Notifications;
[1] call SOCK_fnc_updatePartial;

_content = format ["%1 [%2] Just Transferred $%5 to %3 [%4]", name player, getPlayerUID player, name _unit, getPlayerUID _unit, _val];
[[_content],"DB_fnc_logToLogs",false,false] spawn bis_fnc_mp;