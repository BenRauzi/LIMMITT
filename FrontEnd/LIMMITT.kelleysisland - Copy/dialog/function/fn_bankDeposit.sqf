/*
	File: fn_bankDeposit.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Figure it out.
*/
private["_value"];
_value = parseNumber(ctrlText 2702);

//Series of stupid checks
if(_value > 999999) exitWith { ["Error",localize "STR_ATM_GreaterThan", "Failure"] call Harris_Notifications;};
if(_value < 0) exitWith {};
if(!([str(_value)] call life_fnc_isnumeric)) exitWith {["Error",localize "STR_ATM_notnumeric", "Failure"] call Harris_Notifications;};
if(_value > LIMMITTCASH) exitWith {["Error",localize "STR_ATM_NotEnoughCash", "Failure"] call Harris_Notifications;};

LIMMITTCASH = LIMMITTCASH - _value;
gm_memecash = gm_memecash + _value;

["Deposited",format[localize "STR_ATM_DepositMSG",[_value] call life_fnc_numberText], "Success"] call Harris_Notifications;
[] call life_fnc_atmMenu;
[6] call SOCK_fnc_updatePartial;
