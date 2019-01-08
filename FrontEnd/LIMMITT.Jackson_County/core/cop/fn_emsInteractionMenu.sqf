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

private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_diseaseon","_koildebiiii","_koildebiii","_koildebii","_koildebi","_koildeb"];
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

_diseaseon = "No Disease";

_bleedingon = "No Head Trauma";
_woundedon = "No Chest Trauma";
_unconciouson = "No Leg Trauma";
_fractureon = "No Arm Trauma";

_koildeb = 1;
_koildeb = life_pInact_curTarget getVariable "bleedingon";

_koildebi = 1;
_koildebi = life_pInact_curTarget getVariable "woundedon";

_koildebii = 1;
_koildebii = life_pInact_curTarget getVariable "fractureon";

_koildebiii = 1;
_koildebiii = life_pInact_curTarget getVariable "unconciouson";

_koildebiiii = 1;
_koildebiiii = life_pInact_curTarget getVariable "diseaseon";


if(_koildebiiii > 1) then {
			if(_koildebiiii == 2) then {
				_diseaseon = "Ebola Symptoms";	
			};

			if(_koildebiiii == 3) then {
				_diseaseon = "Sars Symptoms";	
			};

			if(_koildebiiii == 4) then {
				_diseaseon = "Heavy Infection";	
			};

			if(_koildebiiii == 5) then {
				_diseaseon = "Small Pox";	
			};

			if(_koildebiiii == 6) then {
				_diseaseon = "Influenza";	
			};

			if(_koildebiiii > 6) then {
				_diseaseon = "Malaria";	
			};
};

if(_koildebiii > 1) then {
				if(_koildebiii == 2) then {
					_unconciouson = "Left Leg Cuts";	
				};

				if(_koildebiii == 3) then {
					_unconciouson = "Left Leg Wound";	
				};

				if(_koildebiii == 4) then {
					_unconciouson = "Left Leg Fracture";	
				};

				if(_koildebiii == 5) then {
					_unconciouson = "Right Leg Cuts";	
				};

				if(_koildebiii == 6) then {
					_unconciouson = "Right Leg Wound";	
				};

				if(_koildebiii == 7) then {
					_unconciouson = "Right Leg Fracture";	
				};
};


if(_koildebii > 1) then {
				if(_koildebii == 2) then {
					_fractureon = "Left Arm Cuts";	
				};

				if(_koildebii == 3) then {
					_fractureon = "Left Arm Wound";	
				};

				if(_koildebii == 4) then {
					_fractureon = "Left Arm Fracture";	
				};

				if(_koildebii == 5) then {
					_fractureon = "Right Arm Cuts";	
				};

				if(_koildebii == 6) then {
					_fractureon = "Right Arm Wound";	
				};

				if(_koildebii == 7) then {
					_fractureon = "Right Arm Fracture";	
				};
};


if(_koildebi > 1) then {
				if(_koildebi == 2) then {
					_woundedon = "Chest Cuts";	
				};

				if(_koildebi == 3) then {
					_woundedon = "Chest Wounds";	
				};

				if(_koildebi == 4) then {
					_woundedon = "Chest Fracture";	
				};

				if(_koildebi == 5) then {
					_woundedon = "Internal Bleeding";	
				};
};

if(_koildeb > 1) then {
				if(_koildeb == 2) then {
					_bleedingon = "Head Cuts";	
				};

				if(_koildeb == 3) then {
					_bleedingon = "Head Wounds";	
				};

				if(_koildeb == 4) then {
					_bleedingon = "Head Fracture";	
				};

				if(_koildeb == 5) then {
					_bleedingon = "Brain Swelling";	
				};
};




_Btn1 ctrlSetText format["%1", _bleedingon];
_Btn1 buttonSetAction "[life_pInact_curTarget] call life_fnc_bandagePlayer; closeDialog 0;";
if((life_pInact_curTarget getVariable "bleedingon") > 1) then { _Btn1 ctrlEnable true;} else {_Btn1 ctrlEnable false;};

_Btn2 ctrlSetText format["%1", _woundedon];
_Btn2 buttonSetAction "[life_pInact_curTarget] call life_fnc_stitchPlayer; closeDialog 0;";
if((life_pInact_curTarget getVariable "woundedon") > 1) then { _Btn2 ctrlEnable true;} else {_Btn2 ctrlEnable false;};

_Btn3 ctrlSetText format["%1", _fractureon];
_Btn3 buttonSetAction "[life_pInact_curTarget] call life_fnc_splintPlayer; closeDialog 0;";
if((life_pInact_curTarget getVariable "fractureon") > 1) then { _Btn3 ctrlEnable true;} else {_Btn3 ctrlEnable false;};

_Btn4 ctrlSetText format["%1", _unconciouson];
_Btn4 buttonSetAction "[life_pInact_curTarget] call life_fnc_epipenPlayer; closeDialog 0;";
if((life_pInact_curTarget getVariable "unconciouson") > 1) then { _Btn4 ctrlEnable true;} else {_Btn4 ctrlEnable false;};

_Btn5 ctrlSetText format["%1", _diseaseon];
_Btn5 buttonSetAction "[life_pInact_curTarget] call life_fnc_emsInteractionMenu2;";
if(_koildebiiii > 1 || _diseaseon != "No Disease") then { _Btn5 ctrlEnable true; } else { _Btn5 ctrlEnable false; };
