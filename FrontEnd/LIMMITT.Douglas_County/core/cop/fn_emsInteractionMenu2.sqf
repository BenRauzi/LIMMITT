/*
	File: fn_emsInteractionMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
*/
#define Btn1 37450
#define Btn2 37451
#define Btn3 37452
#define Btn4 37453
#define Btn5 37454
#define Title 37401

private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5"];
if(!dialog) then {
	createDialog "pInteraction_Menu";
};
disableSerialization;
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _curTarget) exitWith {closeDialog 0;}; //Bad target

if(!isPlayer _curTarget) exitWith {closeDialog 0;}; //Bad side check?

_display = findDisplay 37400;
_Btn1 = _display displayCtrl Btn1;
_Btn2 = _display displayCtrl Btn2;
_Btn3 = _display displayCtrl Btn3;
_Btn4 = _display displayCtrl Btn4;
_Btn5 = _display displayCtrl Btn5;
life_pInact_curTarget = _curTarget;


_Btn1 ctrlSetText format["Cool Player", life_hunger];
_Btn1 buttonSetAction "[life_pInact_curTarget] call life_fnc_coolPlayer; closeDialog 0;";
if((life_pInact_curTarget getVariable "diseaseon") > 1) then { _Btn1 ctrlEnable true;} else {_Btn1 ctrlEnable false;};

_Btn2 ctrlSetText format["Heat Player", life_hunger];
_Btn2 buttonSetAction "[life_pInact_curTarget] call life_fnc_heatPlayer; closeDialog 0;";
if((life_pInact_curTarget getVariable "diseaseon") > 1) then { _Btn2 ctrlEnable true;} else {_Btn2 ctrlEnable false;};

_Btn3 ctrlSetText format["Fluid Drip", life_hunger];
_Btn3 buttonSetAction "[life_pInact_curTarget] call life_fnc_HydratePlayer; closeDialog 0;";
if((life_pInact_curTarget getVariable "diseaseon") > 1) then { _Btn3 ctrlEnable true;} else {_Btn3 ctrlEnable false;};

_Btn4 ctrlSetText format["Anti-Viral Player", life_hunger];
_Btn4 buttonSetAction "[life_pInact_curTarget] call life_fnc_AntiViralPlayer; closeDialog 0;";
if((life_pInact_curTarget getVariable "diseaseon") > 1) then { _Btn4 ctrlEnable true;} else {_Btn4 ctrlEnable false;};

_Btn5 ctrlSetText format["Heavy Sedative", life_hunger];
_Btn5 buttonSetAction "[life_pInact_curTarget] call life_fnc_painkillerPlayer; closeDialog 0;";
if((life_pInact_curTarget getVariable "diseaseon") > 1) then { _Btn5 ctrlEnable true;} else {_Btn5 ctrlEnable false;};



