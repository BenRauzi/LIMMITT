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

if (_container getVariable ["GM_InUse", false]) exitWith {
		hint "This container is in use!";
		gm_containerInUse = true;
		[] spawn {
			waitUntil {!isNull (findDisplay 602)};
				closeDialog 0;
				uiSleep 0.1;
				closeDialog 0;
				uiSleep 0.1;
				closeDialog 0;
		};
};

if (_vehicle != player && _vehicle getVariable ["GM_InUse", false]) exitWIth {
	hint "This vehicle inventory is in use!";
	gm_containerInUse = true;
		[] spawn {
			waitUntil {!isNull (findDisplay 602)};
				closeDialog 0;
				uiSleep 0.1;
				closeDialog 0;
				uiSleep 0.1;
				closeDialog 0;
		};	
};


if (_vehicle != player) then { _vehicle setVariable ["GM_InUse", true, true]; };

_container setVariable ["GM_InUse", true, true];

_isPack = getNumber(configFile >> "CfgVehicles" >> (typeOf _container) >> "isBackpack");
if(_isPack == 1) then {
	hint localize "STR_MISC_Backpack";
	[] spawn {
		waitUntil {!isNull (findDisplay 602)};
			closeDialog 0;
			uiSleep 0.1;
			closeDialog 0;
			uiSleep 0.1;
			closeDialog 0;
			_container setVariable ["GM_InUse", false, true];
	};
};

if((typeOf _container) in ["Box_IND_Grenades_F","B_supplyCrate_F"]) exitWith {
	_house = nearestBuilding (getPosATL player);
	if(!(_house in life_vehicles) && {(_house getVariable ["locked",false])}) then {
		hint localize "STR_House_ContainerDeny";
		[] spawn {
			waitUntil {!isNull (findDisplay 602)};
			closeDialog 0;
			uiSleep 0.1;
			closeDialog 0;
			uiSleep 0.1;
			closeDialog 0;
			_container setVariable ["GM_InUse", false, true];
		};
	};
};

if(_container isKindOf "LandVehicle" OR _container isKindOf "Ship" OR _container isKindOf "Air") exitWith {
	if(!(_container in life_vehicles) && {(locked _container) == 2}) exitWith {
		hint localize "STR_MISC_VehInventory";
		[] spawn {
			waitUntil {!isNull (findDisplay 602)};
			closeDialog 0;
			uiSleep 0.1;
			closeDialog 0;
			uiSleep 0.1;
			closeDialog 0;
			_container setVariable ["GM_InUse", false, true];
		};
	};
};

//Allow alive players who've been knocked out to be looted, just not the dead ones
if(_container isKindOf "Man" && !alive _container) exitWith {
	hint localize "STR_NOTF_NoLootingPerson";
	[] spawn {
		waitUntil {!isNull (findDisplay 602)};
		closeDialog 0;
		uiSleep 0.1;
		closeDialog 0;
		uiSleep 0.1;
		closeDialog 0;
		_container setVariable ["GM_InUse", false, true];
	};
};

if(_container isKindOf "Car" || _container isKindOf "Ship" || _container isKindOf "Air" || _container isKindOf "Motorcycle") exitWith {

	if(!(_container in life_vehicles) && {(locked _container) == 2}) exitWith {
		hint "You're not allowed to open the vehicles inventory while it's locked.";
		[] spawn {
			waitUntil {!isNull (findDisplay 602)};
				closeDialog 0;
				uiSleep 0.1;
				closeDialog 0;
				uiSleep 0.1;
				closeDialog 0;
				_container setVariable ["GM_InUse", false, true];
		};
	};
};



