/*
	File: fn_vInteractionMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Replaces the mass addactions for various vehicle actions
*/
#define Btn1 37450
#define Btn2 37451
#define Btn3 37452
#define Btn4 37453
#define Btn5 37454
#define Btn6 37455
#define Btn7 37456
#define Title 37401
#define Btn8 37457

private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7"];
if(!dialog) then {
	createDialog "vInteraction_Menu";
};
disableSerialization;
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _curTarget) exitWith {closeDialog 0;}; //Bad target
_isVehicle = if((_curTarget isKindOf "landVehicle") OR (_curTarget isKindOf "Ship") OR (_curTarget isKindOf "Air") OR (_curTarget isKindOf "Bicycle") OR (_curTarget isKindOf "Motorbike") OR (_curTarget isKindOf "Motorcycle") OR (_curTarget isKindOf "A3L_Tahoe_Base")) then {true} else {false};
if(!_isVehicle) exitWith {closeDialog 0;};
_display = findDisplay 37400;
_Btn1 = _display displayCtrl Btn1;
_Btn2 = _display displayCtrl Btn2;
_Btn3 = _display displayCtrl Btn3;
_Btn4 = _display displayCtrl Btn4;
_Btn5 = _display displayCtrl Btn5;
_Btn6 = _display displayCtrl Btn6;
_Btn7 = _display displayCtrl Btn7;
_Btn8 = _display displayCtrl Btn8;
life_vInact_curTarget = _curTarget;

//Set Repair Action
_Btn1 ctrlSetText localize "STR_vInAct_Repair";
_Btn1 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_repairTruck;";

if( damage _curTarget < 1 ) then {_Btn1 ctrlEnable true;} else {_Btn1 ctrlEnable false;};

_Btn8 ctrlShow false;

if(playerSide == west) then {
	_Btn2 ctrlSetText localize "STR_vInAct_Registration";
	_Btn2 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_searchVehAction;";
	
	_Btn3 ctrlSetText localize "STR_vInAct_SearchVehicle";
	_Btn3 buttonSetAction "[life_vInact_curTarget] spawn fnc_searchVehicle;";
	
	_Btn4 ctrlSetText localize "STR_vInAct_PullOut";
	_Btn4 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_pulloutAction;";

	if(count crew _curTarget == 0) then {_Btn4 ctrlEnable false;};
	
	_Btn5 ctrlSetText localize "STR_vInAct_Impound";
	_Btn5 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_impoundAction;";

	_Btn8 ctrlShow false;
	_Btn8 ctrlSetText "Check Drivers License";
	_Btn8 buttonSetAction "[[driver _curTarget],""life_fnc_licenseCheck"",life_pInact_curTarget,FALSE] spawn bis_fnc_mp";
	if (isNull driver _curTarget) then {_Btn8 ctrlEnable false;};
	_Btn8 ctrlShow false;

	if(_curTarget isKindOf "Ship") then {
		_Btn6 ctrlSetText localize "STR_vInAct_PushBoat";
		_Btn6 buttonSetAction "[] spawn life_fnc_pushObject; closeDialog 0;";
		if(_curTarget isKindOf "Ship" && {local _curTarget} && {count crew _curTarget == 0}) then { _Btn6 ctrlEnable true;} else {_Btn6 ctrlEnable false};
	} else {
		if(typeOf (_curTarget) in ["C_Kart_01_Blu_F","C_Kart_01_Red_F","C_Kart_01_Fuel_F","C_Kart_01_Vrana_F"]) then {
			_Btn6 ctrlSetText localize "STR_vInAct_GetInKart";
			_Btn6 buttonSetAction "player moveInDriver life_vInact_curTarget; closeDialog 0;";
			if(count crew _curTarget == 0 && {canMove _curTarget} && {locked _curTarget == 0}) then {_Btn6 ctrlEnable true;} else {_Btn6 ctrlEnable false};
		} else {
			_Btn6 ctrlSetText localize "STR_vInAct_Unflip";
			_Btn6 buttonSetAction "life_vInact_curTarget setPos [getPos life_vInact_curTarget select 0, getPos life_vInact_curTarget select 1, (getPos life_vInact_curTarget select 2)+0.5]; closeDialog 0;";
			if(count crew _curTarget == 0 && {canMove _curTarget}) then { _Btn6 ctrlEnable false;} else {_Btn6 ctrlEnable true;};
		};
	};	
} else {
if(playerSide == independent) then {
		if(_curTarget isKindOf "Ship") then {
		_Btn2 ctrlSetText localize "STR_vInAct_PushBoat";
		_Btn2 buttonSetAction "[] spawn life_fnc_pushObject; closeDialog 0;";
		if(_curTarget isKindOf "Ship" && {local _curTarget} && {count crew _curTarget == 0}) then { _Btn2 ctrlEnable true;} else {_Btn2 ctrlEnable false};
	} else {
		if(typeOf (_curTarget) in ["C_Kart_01_Blu_F","C_Kart_01_Red_F","C_Kart_01_Fuel_F","C_Kart_01_Vrana_F"]) then {
			_Btn2 ctrlSetText localize "STR_vInAct_GetInKart";
			_Btn2 buttonSetAction "player moveInDriver life_vInact_curTarget; closeDialog 0;";
			if(count crew _curTarget == 0 && {canMove _curTarget} && {locked _curTarget == 0}) then {_Btn2 ctrlEnable true;} else {_Btn2 ctrlEnable false};
		} else {
			_Btn2 ctrlSetText localize "STR_vInAct_Unflip";
			_Btn2 buttonSetAction "life_vInact_curTarget setPos [getPos life_vInact_curTarget select 0, getPos life_vInact_curTarget select 1, (getPos life_vInact_curTarget select 2)+0.5]; closeDialog 0;";
			if(count crew _curTarget == 0 && {canMove _curTarget}) then { _Btn2 ctrlEnable false;} else {_Btn2 ctrlEnable true;};
		};
	};
	
	if(typeOf _curTarget == "O_Truck_03_device_F") then {
		_Btn3 ctrlSetText localize "STR_vInAct_DeviceMine";
		_Btn3 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_deviceMine";
		if(!isNil {(_curTarget getVariable "mining")} OR !local _curTarget && {_curTarget in life_vehicles}) then {
			_Btn3 ctrlEnable false;
		} else {
			_Btn3 ctrlEnable true;
		};
	} else {
		_Btn3 ctrlShow false;
	};

	_Btn4 ctrlSetText "Impound Vehicle";
	_Btn4 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_impoundAction;";

	_Btn5 ctrlShow false;

	_Btn6 ctrlShow false;
}
else {
	
	if(_curTarget isKindOf "Ship") then {
		_Btn2 ctrlSetText localize "STR_vInAct_PushBoat";
		_Btn2 buttonSetAction "[] spawn life_fnc_pushObject; closeDialog 0;";
		if(_curTarget isKindOf "Ship" && {local _curTarget} && {count crew _curTarget == 0}) then { _Btn2 ctrlEnable true;} else {_Btn2 ctrlEnable false};
	} else {
		if(typeOf (_curTarget) in ["C_Kart_01_Blu_F","C_Kart_01_Red_F","C_Kart_01_Fuel_F","C_Kart_01_Vrana_F"]) then {
			_Btn2 ctrlSetText localize "STR_vInAct_GetInKart";
			_Btn2 buttonSetAction "player moveInDriver life_vInact_curTarget; closeDialog 0;";
			if(count crew _curTarget == 0 && {canMove _curTarget} && {locked _curTarget == 0}) then {_Btn2 ctrlEnable true;} else {_Btn2 ctrlEnable false};
		} else {
			_Btn2 ctrlSetText localize "STR_vInAct_Unflip";
			_Btn2 buttonSetAction "life_vInact_curTarget setPos [getPos life_vInact_curTarget select 0, getPos life_vInact_curTarget select 1, (getPos life_vInact_curTarget select 2)+0.5]; closeDialog 0;";
		};
	};
	
	if(typeOf _curTarget == "O_Truck_03_device_F") then {
		_Btn3 ctrlSetText localize "STR_vInAct_DeviceMine";
		_Btn3 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_deviceMine";
		if(!isNil {(_curTarget getVariable "mining")} OR !local _curTarget && {_curTarget in life_vehicles}) then {
			_Btn3 ctrlEnable false;
		} else {
			_Btn3 ctrlEnable true;
		};
	} else {
		_Btn3 ctrlShow false;
	};
	
	_Btn4 ctrlSetText localize "STR_vInAct_PullOut";
	_Btn4 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_pulloutAction;";
	if(cursorTarget in life_vehicles && player distance cursorTarget < 5) then {_Btn4 ctrlEnable true;} else {	_Btn4 ctrlEnable false;};

	_Btn5 ctrlShow false;



	_Btn6 ctrlShow false;
};



};

_Btn7 ctrlSetText "Push Vehicle";
_Btn7 buttonSetAction "[] spawn life_fnc_pushVehicle2; closeDialog 0;";