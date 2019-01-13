/*
	COPY PASTE TIME
*/
private["_val"];
_val = parseNumber(ctrlText 2702);
if(_val > 999999) exitWith {["Max Amount", localize "STR_ATM_WithdrawMax", "Failure"] call Harris_Notifications;};
if(_val < 0) exitwith {};
if(!([str(_val)] call life_fnc_isnumeric)) exitWith {["Error", localize "STR_ATM_notnumeric", "Failure"] call Harris_Notifications;};
if(_val > gm_memecash) exitWith {["Error", localize "STR_ATM_NotEnoughFunds", "Failure"] call Harris_Notifications;};
if(_val < 100 && gm_memecash > 20000000) exitWith {["Error", localize "STR_ATM_WithdrawMin", "Failure"] call Harris_Notifications;}; //Temp fix for something.

LIMMITTCASH = LIMMITTCASH + _val;
gm_memecash = gm_memecash - _val;
["Success", format [localize "STR_ATM_WithdrawSuccess",[_val] call life_fnc_numberText], "Success"] call Harris_Notifications;
[] call life_fnc_atmMenu;
[6] call SOCK_fnc_updatePartial; //Silent Sync
