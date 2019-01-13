/*
	Author: Ben Harris
	Description: Inventory Opened Fixed
*/
Harris_inventoryOpened = {
	disableSerialization;
	private["_container","_unit"];
	_unit = _this select 0;
	_container = _this select 1;

	_vehicle = vehicle player;
	_handle = false;

	if (player getVariable ["Foski_Restrained", false] || player getVariable ["Foski_Surrender", false]) exitWith {
		_handle = true;
		_handle;
	};

	_isPack = getNumber(configFile >> "CfgVehicles" >> (typeOf _container) >> "isBackpack");
	if(_isPack == 1) then {
		["Error","You cannot loot backpacks","Failure"] spawn Harris_Notifications;
		_handle = true;
		_handle;
	};

	if((typeOf _container) in ["Box_IND_Grenades_F","B_supplyCrate_F"]) exitWith {
		_house = nearestBuilding (getPosATL player);
		if(!(_house in life_vehicles) && {(_house getVariable ["locked",false])}) then {
			["Error","This house is locked","Failure"] spawn Harris_Notifications;
			_handle = true;
			_handle;
		};
	};

	if(_container isKindOf "LandVehicle" OR _container isKindOf "Ship" OR _container isKindOf "Air") exitWith {
		if(!(_container in life_vehicles) && {(locked _container) == 2}) exitWith {
			["Error","This Vehicle is locked","Failure"] spawn Harris_Notifications;
			_handle = true;
			_handle;
		};
	};

	//Allow alive players who've been knocked out to be looted, just not the dead ones

	if(_container isKindOf "Man" && !alive _container) exitWith {
		["Error","You can't loot dead bodies","Failure"] spawn Harris_Notifications;
		_handle = true;
		_handle;
	};



	if(_container isKindOf "Car" || _container isKindOf "Ship" || _container isKindOf "Air" || _container isKindOf "Motorcycle") exitWith {

		if(!(_container in life_vehicles) && {(locked _container) == 2}) exitWith {
			["Error","This Vehicle is locked","Failure"] spawn Harris_Notifications;
			_handle = true;
			_handle;
		};
	};

	if !(_handle) exitWith {
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

		false;
	};
};