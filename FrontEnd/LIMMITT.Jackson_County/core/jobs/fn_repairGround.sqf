	/*
	File: fn_revivePlayer.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the revive process on the player.
*/
_target = _this select 0;

["General", "Repairing ground object!", "General"] call Harris_Notifications;

life_action_inUse = true; //Lockout the controls.

//Setup our progress bar
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable ["life_progress",displayNull];
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["Repairing Ground Object (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

//Lets reuse the same thing!
while {true} do
{

	if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
		[[player,"AinvPknlMstpSnonWnonDnon_medic_1"],"life_fnc_animSync",true,false] spawn bis_fnc_mp;
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};

	uiSleep 0.2;
	_cP = _cP + 0.01;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["Repairing Ground Object (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1 OR !alive player) exitWith {};
	if(life_istazed) exitWith {}; //Tazed
	if(life_interrupted) exitWith {};
	if((player getVariable["restrained",false])) exitWith {};
	if(player distance _target > 4) exitWith {_badDistance = true;};
};

//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
player playActionNow "stop";

if(!alive player OR life_istazed) exitWith {life_action_inUse = false;};
if((player getVariable["restrained",false])) exitWith {life_action_inUse = false;};
if(!isNil "_badDistance") exitWith {systemChat "You moved too far"; life_action_inUse = false;};
if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};

_target setDamage 0;

life_action_inUse = false;

