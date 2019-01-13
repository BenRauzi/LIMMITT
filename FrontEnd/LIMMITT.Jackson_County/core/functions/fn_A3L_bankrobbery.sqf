// Give money, check variable 5 minutes or w/e
private ["_timer"];

_cops = (west countSide playableUnits);
if(_cops < 8) exitWith { ["Not enough cops", "You need atleast 8 cops online to grab dirty money...", "Failure"] call Harris_Notifications;}; 

if (animationState player == "AinvPknlMstpSnonWnonDnon_medic_1") exitwith {["You're already grabbing a bag of cash!",30,"red"] call A3L_Fnc_Msg;};
if (count (attachedobjects player) > 0) exitwith {["You are already carrying a bag of cash.",30,"red"] call A3L_Fnc_Msg;}; 
if ((_this select 3) getVariable "robbed") exitwith {["This stash of cash was recently robbed.",30,"red"] call A3L_Fnc_Msg;};
if !(gm_vault animationPhase "d_l_Anim" == 1) exitWith {["The vault is not open?.",15,"red"] call A3L_Fnc_Msg;};

_sum = ["dirty money",1,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if (!(_sum > 0)) exitWith {["No inventory space", "You do not have the room for dirty money in your inventory!", "Failure"] call Harris_Notifications;};

_timer = 5 + (floor(random 5));
["Grabbing the money.. this may take a few minutes!",30,"blue"] call A3L_Fnc_Msg;
(_this select 3) setVariable ["robbed",true,true];

[_timer,(_this select 3)] spawn {
_timer = _this select 0;
_stash = _this select 1;

	while {_timer > 0} do {

			if(life_istazed) exitWith {}; //Tazed
			if(life_interrupted) exitWith {};

			if((player getVariable["restrained",false])) exitWith {};
		
				if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
					[[player,"AinvPknlMstpSnonWnonDnon_medic_1"],"life_fnc_animSync",true,false] spawn bis_fnc_mp;
					player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
				};
			
				_timer = _timer - 0.5;
				if (_timer < 1) exitwith {
						["You have gathered some dirty money!",30,"green"] call A3L_Fnc_Msg;
						[[0,format["%1 has grabbed dirty money from the bank vault!",getPlayerUID player]],"life_fnc_broadcast",civilian,false] spawn bis_fnc_mp;	
						[[0,format["%1 has grabbed dirty money from the bank vault!",getPlayerUID player]],"life_fnc_broadcast",west,false] spawn bis_fnc_mp;		
						
						asdih_inv_dirtymoney = asdih_inv_dirtymoney + 1;
				};	
		uiSleep 1.5;
	};
};