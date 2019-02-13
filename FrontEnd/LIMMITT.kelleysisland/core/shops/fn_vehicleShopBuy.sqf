/*
	File: fn_vehicleShopBuy.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Does something with vehicle purchasing.
*/
private["_mode","_spawnPoints","_className","_basePrice","_colorIndex","_spawnPoint","_vehicle","_sp","_vh","_box","_offset"];
_mode = _this select 0;
if((lbCurSel 2302) == -1) exitWith {hint localize "STR_Shop_Veh_DidntPick"};
_className = lbData[2302,(lbCurSel 2302)];
_vIndex = lbValue[2302,(lbCurSel 2302)];
_vehicleList = [life_veh_shop select 0] call life_fnc_vehicleListCfg; _basePrice = (_vehicleList select _vIndex) select 1;
 if(_mode) then {_basePrice = round(_basePrice * 1.5)};
_colorIndex = lbValue[2304,(lbCurSel 2304)];

//Series of checks (YAY!)
if(_basePrice < 0) exitWith {}; //Bad price entry
if(LIMMITTCASH < _basePrice) exitWith {hint format[localize "STR_Shop_Veh_NotEnough",[_basePrice - LIMMITTCASH] call life_fnc_numberText];};
if(!([_className] call life_fnc_vehShopLicenses) && _className != "B_MRAP_01_hmg_F") exitWith {hint localize "STR_Shop_Veh_NoLicense"};

_spawnPoints = life_veh_shop select 1;
_spawnPoint = "";

if((life_veh_shop select 0) == "med_air_hs") then {
	if(count(nearestObjects[(getMarkerPos _spawnPoints),["Air"],35]) == 0) exitWith {_spawnPoint = _spawnPoints};
} else {
	//Check if there is multiple spawn points and find a suitable spawnpoint.
	if(typeName _spawnPoints == typeName []) then {
		//Find an available spawn point.
		{if(count(nearestObjects[(getMarkerPos _x),["Car","Motorcycle","Ship","Air"],5]) == 0) exitWith {_spawnPoint = _x};} foreach _spawnPoints;
	} else {
		if(count(nearestObjects[(getMarkerPos _spawnPoints),["Car","Motorcycle","Ship","Air"],5]) == 0) exitWith {_spawnPoint = _spawnPoints};
	};
};


if(_spawnPoint == "") exitWith {hint localize "STR_Shop_Veh_Block";};
LIMMITTCASH = LIMMITTCASH - _basePrice;

["Success", format[localize "STR_Shop_Veh_Bought",getText(configFile >> "CfgVehicles" >> _className >> "displayName"),[_basePrice] call life_fnc_numberText], "Success"] spawn Harris_Notifications;
//Spawn the vehicle and prep it.
switch (life_veh_shop select 0) do { // Switch Statement added by Nicholas Jo'Foski on the 03/01/2019
	case "med_air_hs" : {
	 	_vehicle = createVehicle [_className, (getMarkerPos _spawnPoint), [], 0, "NONE"];
		waitUntil {!isNil "_vehicle"}; //Wait?
		_vehicle allowDamage false; //Temp disable damage handling..
		_vehicle lock 2;
		_vehicle setVectorUp (surfaceNormal (getMarkerPos _spawnPoint));
		_vehicle setDir (markerDir _spawnPoint);
		_vehicle setPos (getMarkerPos _spawnPoint);
		[[_vehicle,_colorIndex],"life_fnc_colorVehicle",true,false] spawn bis_fnc_mp;
		[_vehicle] call life_fnc_clearVehicleAmmo;
		[[_vehicle,"trunk_in_use",false,true],"TON_fnc_setObjVar",false,false] spawn bis_fnc_mp;
		[[_vehicle,"vehicle_info_owners",[[getPlayerUID player,profileName]],true],"TON_fnc_setObjVar",false,false] spawn bis_fnc_mp;
		_vehicle disableTIEquipment true; //No Thermals.. They're cheap but addictive.
	}; 
	case "dcso_air" : { // Spawn on top of helipad added by Nicholas Jo'Foski on the 03/01/2019
		_vehicle = createVehicle [_className, (getMarkerPos _spawnPoint), [], 0, "NONE"];
		waitUntil {!isNil "_vehicle"}; //Wait?
		_vehicle allowDamage false; //Temp disable damage handling..
		_vehicle lock 2;
		_vehicle setVectorUp (surfaceNormal (getMarkerPos _spawnPoint));
		_vehicle setDir (markerDir _spawnPoint);
		_vehicle setPos [(getMarkerPos _spawnPoint) select 0,(getMarkerPos _spawnPoint) select 1,8.5];
		[[_vehicle,_colorIndex],"life_fnc_colorVehicle",true,false] spawn bis_fnc_mp;
		[_vehicle] call life_fnc_clearVehicleAmmo;
		_vehicle setVariable["trunk_in_use",false,true];
		_vehicle setVariable["vehicle_info_owners",[[getPlayerUID player,profileName]],true];
		_vehicle disableTIEquipment true; //No Thermals.. They're cheap but addictive.
	}; 
	case "dcfd_air" : { // Spawn on top of helipad added by Nicholas Jo'Foski on the 13/02/2019
		_vehicle = createVehicle [_className, (getMarkerPos _spawnPoint), [], 0, "NONE"];
		waitUntil {!isNil "_vehicle"}; //Wait?
		_vehicle allowDamage false; //Temp disable damage handling..
		_vehicle lock 2;
		_vehicle setVectorUp (surfaceNormal (getMarkerPos _spawnPoint));
		_vehicle setDir (markerDir _spawnPoint);
		_vehicle setPos [(getMarkerPos _spawnPoint) select 0,(getMarkerPos _spawnPoint) select 1,19.5];
		[[_vehicle,_colorIndex],"life_fnc_colorVehicle",true,false] spawn bis_fnc_mp;
		[_vehicle] call life_fnc_clearVehicleAmmo;
		_vehicle setVariable["trunk_in_use",false,true];
		_vehicle setVariable["vehicle_info_owners",[[getPlayerUID player,profileName]],true];
		_vehicle disableTIEquipment true; //No Thermals.. They're cheap but addictive.
	}; 
	default {
		_vehicle = createVehicle [_className, (getMarkerPos _spawnPoint), [], 0, "NONE"];
		waitUntil {!isNil "_vehicle"}; //Wait?
		_vehicle allowDamage false; //Temp disable damage handling..
		_vehicle lock 2;
		_vehicle setVectorUp (surfaceNormal (getMarkerPos _spawnPoint));
		_vehicle setDir (markerDir _spawnPoint);
		_vehicle setPos (getMarkerPos _spawnPoint);
		[[_vehicle,_colorIndex],"life_fnc_colorVehicle",true,false] spawn bis_fnc_mp;
		[_vehicle] call life_fnc_clearVehicleAmmo;
		_vehicle setVariable["trunk_in_use",false,true];
		_vehicle setVariable["vehicle_info_owners",[[getPlayerUID player,profileName]],true];
		_vehicle disableTIEquipment true; //No Thermals.. They're cheap but addictive.
	}; 
};
/*
if((life_veh_shop select 0) == "med_air_hs") then {
	_vehicle = createVehicle [_className, (getMarkerPos _spawnPoint), [], 0, "NONE"];
	waitUntil {!isNil "_vehicle"}; //Wait?
	_vehicle allowDamage false; //Temp disable damage handling..
	_vehicle lock 2;
	_vehicle setVectorUp (surfaceNormal (getMarkerPos _spawnPoint));
	_vehicle setDir (markerDir _spawnPoint);
	_vehicle setPos (getMarkerPos _spawnPoint);
	[[_vehicle,_colorIndex],"life_fnc_colorVehicle",true,false] spawn bis_fnc_mp;
	[_vehicle] call life_fnc_clearVehicleAmmo;
	_vehicle setVariable["trunk_in_use",false,true];
	_vehicle setVariable["vehicle_info_owners",[[getPlayerUID player,profileName]],true];
	_vehicle disableTIEquipment true; //No Thermals.. They're cheap but addictive.
} else {
	_vehicle = createVehicle [_className, (getMarkerPos _spawnPoint), [], 0, "NONE"];
	waitUntil {!isNil "_vehicle"}; //Wait?
	_vehicle allowDamage false; //Temp disable damage handling..
	_vehicle lock 2;
	_vehicle setVectorUp (surfaceNormal (getMarkerPos _spawnPoint));
	_vehicle setDir (markerDir _spawnPoint);
	_vehicle setPos (getMarkerPos _spawnPoint);
	[[_vehicle,_colorIndex],"life_fnc_colorVehicle",true,false] spawn bis_fnc_mp;
	[_vehicle] call life_fnc_clearVehicleAmmo;
	_vehicle setVariable["trunk_in_use",false,true];
	_vehicle setVariable["vehicle_info_owners",[[getPlayerUID player,profileName]],true];
	_vehicle disableTIEquipment true; //No Thermals.. They're cheap but addictive.
};
*/
switch(playerSide) do {
	case west: {
		[_vehicle,"cop_offroad",true] spawn life_fnc_vehicleAnimate;
		if(_className == "IVORY_PRIUS") then {
			[_vehicle,"cop_prius",true] spawn life_fnc_vehicleAnimate;
		};
		if(_className == "IVORY_REV") then {
			[_vehicle,"cop_rev",true] spawn life_fnc_vehicleAnimate;
		};
		if(_className == "B_APC_Wheeled_01_cannon_F") then {
			[_vehicle,"cop_apc",true] spawn life_fnc_vehicleAnimate;
		};
	};
	
	case civilian: {
		if(_className == "B_Heli_Light_01_F") then {
			[_vehicle,"civ_littlebird",true] spawn life_fnc_vehicleAnimate;
		};
		if(_className == "IVORY_PRIUS" && _colorIndex == 11) then {
			[_vehicle,"taxi_prius",true] spawn life_fnc_vehicleAnimate;
		};
		if(_className == "IVORY_PRIUS" && (_colorIndex == 7 OR _colorIndex == 8 OR _colorIndex == 9 OR _colorIndex == 10)) then {
			[_vehicle,"sports_prius",true] spawn life_fnc_vehicleAnimate;
		};
	};
	
	case independent: {
		[_vehicle,"med_offroad",true] spawn life_fnc_vehicleAnimate;
		if(_className == "IVORY_PRIUS") then {
			[_vehicle,"med_prius",true] spawn life_fnc_vehicleAnimate;
		};
	};
};

_vehicle allowDamage true;

life_vehicles set[count life_vehicles,_vehicle]; //Add err to the chain.
if(_mode) then {
	if(!(_className in ["B_G_Offroad_01_armed_F","B_MRAP_01_hmg_F"])) then {
		[[(getPlayerUID player),playerSide,_vehicle,_colorIndex],"TON_fnc_vehicleCreate",false,false] spawn bis_fnc_mp;
	};
};

[0] call SOCK_fnc_updatePartial; //Sync silently because it's obviously silently..
closeDialog 0; //Exit the menu.
true;

_box = boundingBox _vehicle;  
_offset = _box select 1;  //Gets an array with the maximum bounding values
_offset = _offset select 2; //Gets the Maxmimum Z height
_offset = _offset + 0.8; //Just a few inches more...

_sp = visiblePosition _vehicle;
_sp = _sp vectorAdd [0,0,_offset]; 
_vh = createVehicle ["Sign_Arrow_Large_F", _sp ,[],0,"NONE"];
_vh setPos _sp; 

[0] call SOCK_fnc_updatePartial;
playSound "buyCar";
closeDialog 0; //Exit the menu.
true;

uiSleep 10;
deleteVehicle _vh;
