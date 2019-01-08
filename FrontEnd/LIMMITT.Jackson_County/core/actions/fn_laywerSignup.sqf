/*
	File: fn_lawyerSignup.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Called when the player attempts to post bail.
	Needs to be revised.
*/
private["_unit"];

_myposy = getPos player;

_nearestPlayer = nearestObjects[getPosATL _unit,["man"],3] select 1; 
life_govPay = false;

if ( side _nearestPlayer == west && side player == civilian ) then {
	life_govPay = true;
	[[0,format["%1 just signed up for bonus Government Payments - if this person is not a Judge/Lawyer they can be prosecuted.",name player]],"life_fnc_broadcast",(position player) nearEntities [["Man"], 50],false] spawn bis_fnc_mp;

	while{life_govPay} do {
		uiSleep 300;
		LIMMITTCASH = LIMMITTCASH + 4000;	
		hint "You just got paid $4000 for Government Work";
		if( player distance _myposy > 50 ) exitwith {
			hint "Your Government Payments have stopped.";
			life_govPay = false;
		};
		if (!alive player) exitWith {
			life_govPay = false;
		};
	};
} else {
	hint "You need a Police Officer standing next to you to sign up, you also need to be Civilian.";	
};

