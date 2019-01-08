#include "\life_server\script_macros.hpp"

/*
	Heisen
	Strip Searching Criminals e.g. Blacks
*/


//--- Police Action to commit a Strip Search
fnc_stripSearch = {
	
	params [
		["_player",objNull]
	];

	//--- Tonic Checks
	if(isNull _player) exitWith {}; 
	if(isNil "_player") exitwith {}; 
	if(!(_player isKindOf "Man")) exitWith {}; 
	if(!isPlayer _player) exitWith {}; 
	
	if(!(_player getVariable "restrained")) exitWith {
		["Person isn't restrained",20,"red"] call A3L_fnc_msg;
	}; 

	if(_player distance player > 3) exitWith {
		["Person is too far!",20,"red"] call A3L_fnc_msg;
	}; 
	
	["Strip Searching Person..",20,"blue"] call A3L_fnc_msg;
	
	[] remoteExec ["fnc_stripPlayer",_player];
	
};


//--- Strip Player
//return: -- uniform, vest, backpack, hat, assigneditems, items, primaryweapon, secondaryweapon, primaryweaponattachments, secondarygunattachments, magazines
fnc_stripPlayer = {

	private ["_holder"];

	_primaryWeapon = primaryWeapon player;
	_secondaryWeapon = handgunWeapon player;

	_primaryWeaponItems = primaryWeaponItems player;
	_secondaryWeaponItems = secondaryWeaponItems player;

	_holder = createVehicle ["groundweaponholder",getPos player,[],0,"CAN_COLLIDE"]; //--- Create ground weapon holder
	
	{
		_holder addItemCargoGlobal [_x,1];
		player removeItemFromBackpack _x;
	} forEach (backpackItems player);
	
	{
		_holder addItemCargoGlobal [_x,1];
		player removeItemFromVest _x;
	} forEach (vestItems player);
	
	{
		_holder addItemCargoGlobal [_x,1];
		player removeItemFromUniform _x;
	} forEach (uniformItems player);
	
	{
		_holder addItemCargoGlobal [_x,1];
		player unassignItem _x;
	} forEach (assigneditems player);

	_holder addWeaponCargoGlobal [_primaryWeapon,1];
	_holder addWeaponCargoGlobal [_secondaryWeapon,1];
	
	{ 
		_holder addItemCargoGlobal [_x,1];
	} forEach _primaryWeaponItems;
	
	{ 
		_holder addItemCargoGlobal [_x,1];
	} forEach _secondaryWeaponItems;
	
	_holder addItemCargoGlobal [(goggles player),1];
	_holder addItemCargoGlobal [(headgear player),1];
	_holder addItemCargoGlobal [(vest player),1];
	_holder addItemCargoGlobal [(uniform player),1];
	_holder addItemCargoGlobal [(binocular player),1];
	_holder addBackpackCargoGlobal [(backpack player),1];
	
	player removeWeaponGlobal _primaryWeapon;
	player removeWeaponGlobal _secondaryWeapon;

	removeGoggles player;
	removeHeadgear player;
	removeVest player;
	removeUniform player;
	removeBackpack player;

	player removeWeapon (binocular player);
	
	removeAllItems player;
	
	["You have been Strip Searched!",20,"red"] call A3L_fnc_msg;
};