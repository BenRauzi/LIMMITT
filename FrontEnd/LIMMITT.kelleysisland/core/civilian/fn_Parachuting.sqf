#include <macro.h>

private ["_num","_color","_backpackName","_backpackItems","_x"];

if(playerSide in [west,independent]) then {["Get back to work!", "You shouldn't be doing this while working, but go have some fun!", "Warning"] call Harris_Notifications;}; 
titleCut ["", "BLACK FADED", 999];

life_action_inUse = true;
uiSleep 2;

_backpackName = backpack player;
_backpackItems = backpackItems player;
uiSleep 1;

removeBackpack player;
player addBackpack "B_Parachute"; 
player setPos [getPos player select 0, getPos player select 1, 500]; //500 m. up
uiSleep 2;

titlecut [" ","BLACK IN",3]; 
player say2d "skydive";
["Finished!", "You are now skydiving, have fun!", "Success"] call Harris_Notifications;

waitUntil {(vehicle player != player)};	
	

	_num = floor(random 2);

	_color = switch (_num) do {
		case 0: {"SmokeShell";};
		case 1: {"SmokeShellGreen";};
		case 2: {"SmokeShellRed";};
	};

	_smoke = _color createVehicle position player;
    _smoke attachTo [vehicle player, [0,-0.1,1.5]];

waitUntil {isTouchingGround player};
	uiSleep 1;
	player allowDamage true;
	["Finished!", "We hope you enjoyed your time", "Success"] call Harris_Notifications;
	
	removeBackpack player;
	uiSleep 1;
	
	player addBackpack _backpackName;
	clearBackpackCargo player;
	{
		[_x,true,true] call life_fnc_handleItem;
	} foreach _backpackItems;


life_action_inUse = false; 