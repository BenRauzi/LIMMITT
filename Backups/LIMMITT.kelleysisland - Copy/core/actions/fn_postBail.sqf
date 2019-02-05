/*
	File: fn_postBail.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Called when the player attempts to post bail.
	Needs to be revised.
*/
private["_unit"];
_unit = _this select 1;
_myposy = getPos _unit;
if(life_bail_paid) exitWith {};
if(isNil {life_bail_amount}) then {life_bail_amount = 1000000;};
if(!isNil "life_canpay_bail") exitWith {hint localize "STR_NOTF_Bail_Post"};
if(gm_memecash < life_bail_amount) exitWith {hint format[localize "STR_NOTF_Bail_NotEnough",life_bail_amount];};

_nearestPlayer = nearestObjects[getPosATL _unit,["man"],6] select 1; 

if(isNil "_nearestPlayer") exitwith {hint "You need a Police Officer standing next to you to pay bail.";};

_timer = 60;
while {_timer > 0} do {
		hintsilent format ["%1 second until you are processed - do NOT move.",_timer];
		uiSleep 1;
		_timer = _timer - 1;
};

if( _unit distance _myposy > 3 ) exitwith {
	hint "You moved to far away.";
};



if ( side _nearestPlayer == west ) then {
	gm_memecash = gm_memecash - life_bail_amount;
	player setPos (getMarkerPos "jail_release");
	life_bail_paid = true;
	[[0,format[localize "STR_NOTF_Bail_Bailed", _unit getVariable ["realname",name _unit]]],"life_fnc_broadcast",true,false] spawn bis_fnc_mp;
};

