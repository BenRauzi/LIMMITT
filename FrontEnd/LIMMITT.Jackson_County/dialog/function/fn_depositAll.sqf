/*
	File: fn_bankDeposit.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Figure it out.
*/
private["_value"];
_value = LIMMITTCASH;

//Series of stupid checks
if(_value > 999999) exitWith {hint localize "STR_ATM_GreaterThan";};
if(_value < 0) exitWith {};
if(!([str(_value)] call life_fnc_isnumeric)) exitWith {hint localize "STR_ATM_notnumeric"};
if(_value > LIMMITTCASH) exitWith {hint localize "STR_ATM_NotEnoughCash"};

LIMMITTCASH = LIMMITTCASH - _value;
gm_memecash = gm_memecash + _value;

hint "You have deposited everything in your wallet into the ATM!";
[] call life_fnc_atmMenu;
[6] call SOCK_fnc_updatePartial;
