/*
	File: fn_stripAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Retrains the target.
*/

private["_unit"];
_unit = cursorTarget;


if((life_action_inUse) || (player getVariable "tied") || (player getVariable "restrained")) exitWith { 
titleText["You can not do that.","PLAIN"];
titleFadeOut 5;
}; 

if(isNull _unit) exitWith {}; //Not valid
if(!(_unit getVariable "tied")) exitWith { titleText ["This individual needs to be tied up!","PLAIN"]; };

if(player == _unit) exitWith {};
if(!isPlayer _unit) exitWith {};
//Broadcast!

life_action_inUse = true;

playSound3D ["cg_sndimg\sounds\tieup.ogg", player, false, getPosASL player, 1, 1, 125];
_randycunt = 3;
_num = 1;
_myposy = getPos player;
while {_randycunt > _num} do {
	_randycunt = _randycunt - 1;
	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
	uiSleep 1;
};

[[],"life_fnc_removeWeaponAction",_unit,false] spawn bis_fnc_mp;
life_action_inUse = false;
