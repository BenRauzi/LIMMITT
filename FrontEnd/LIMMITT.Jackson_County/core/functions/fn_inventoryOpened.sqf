/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	For the mean time it blocks the player from opening another persons backpack
*/
disableSerialization;
private["_container","_unit"];
if(count _this == 1) exitWith {false};
_unit = _this select 0;
_container = _this select 1;

_vehicle = vehicle player;

if (player getVariable ["Foski_Restrained", false]) then {
	_handle = true;
	_handle;
};

[] spawn
{
	waitUntil {!isNull (findDisplay 602)};

	((findDisplay 602) displayCtrl 638) ctrlSetEventHandler ["LBDblClick", "[638 ,_this select 1] call Harris_useItemPhysical;"];  
	((findDisplay 602) displayCtrl 633) ctrlSetEventHandler ["LBDblClick", "[633 ,_this select 1] call Harris_useItemPhysical;"];  
	((findDisplay 602) displayCtrl 640) ctrlSetEventHandler ["LBDblClick", "[640 ,_this select 1] call Harris_useItemPhysical;"];  
	((findDisplay 602) displayCtrl 619) ctrlSetEventHandler ["LBDblClick", "[619 ,_this select 1] call Harris_useItemPhysical;"];
};
	

if (vehicle player != player) then {
		[] spawn {
		waitUntil {!isNull (findDisplay 602)};
		_display = (findDisplay 602);
		_vest = (_display displayCtrl 6381);
		_vest ctrlSetPosition [-110, -110];
		_vest ctrlCommit 0;

		_vest = (_display displayCtrl 6382);
		_vest ctrlSetPosition [-110, -110];
		_vest ctrlCommit 0;

		_vest = (_display displayCtrl 6305);
		_vest ctrlSetPosition [-110, -110];
		_vest ctrlCommit 0;
		};
};



_isPack = getNumber(configFile >> "CfgVehicles" >> (typeOf _container) >> "isBackpack");
if(_isPack == 1) then {
	hint localize "STR_MISC_Backpack";
	handle = true;
	handle;
};

if((typeOf _container) in ["Box_IND_Grenades_F","B_supplyCrate_F"]) exitWith {
	_house = nearestBuilding (getPosATL player);
	if(!(_house in life_vehicles) && {(_house getVariable ["locked",false])}) then {
		hint localize "STR_House_ContainerDeny";
		handle = true;
		handle;
	};
};

if(_container isKindOf "LandVehicle" OR _container isKindOf "Ship" OR _container isKindOf "Air") exitWith {
	if(!(_container in life_vehicles) && {(locked _container) == 2}) exitWith {
		hint localize "STR_MISC_VehInventory";
		handle = true;
		handle;
	};
};

//Allow alive players who've been knocked out to be looted, just not the dead ones
if(_container isKindOf "Man" && !alive _container) exitWith {
	hint localize "STR_NOTF_NoLootingPerson";
	handle = true;
	handle;
};

if(_container isKindOf "Man" && !alive _container) exitWith {
	hint localize "STR_NOTF_NoLootingPerson";
	handle = true;
	handle;
};



if(_container isKindOf "Car" || _container isKindOf "Ship" || _container isKindOf "Air" || _container isKindOf "Motorcycle") exitWith {

	if(!(_container in life_vehicles) && {(locked _container) == 2}) exitWith {
		hint "You're not allowed to open the vehicles inventory while it's locked.";
		handle = true;
		handle;
	};
};




