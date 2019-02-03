#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Deposits money into the players gang bank.
*/
private["_value"];
_value = parseNumber(ctrlText 2702);

//Series of stupid checks
if(_value > 999999) exitWith {["Error", localize "STR_ATM_GreaterThan", "Failure"] call Harris_Notifications;};
if(_value < 0) exitWith {};
if(!([str(_value)] call life_fnc_isnumeric)) exitWith {["Error", localize "STR_ATM_notnumeric", "Failure"] call Harris_Notifications;};
if(_value > gm_memecash) exitWith {["Error", localize "STR_NOTF_NotEnoughFunds", "Failure"] call Harris_Notifications;};

__SUB__(gm_memecash,_value);
_gFund = grpPlayer getVariable ["gang_bank",0];
_gFund = _gFund + _value;
grpPlayer setVariable ["gang_bank",_gFund,true];

["Success", format[localize "STR_ATM_DepositGang",[_value] call life_fnc_numberText], "Success"] call Harris_Notifications;

[] call life_fnc_atmMenu;
[] call SOCK_fnc_updateRequest; //Silent Sync
[[1,grpPlayer],"TON_fnc_updateGang",false,false] spawn bis_fnc_mp;
