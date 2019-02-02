#include <macro.h>
/*
	File: fn_actionKeyHandler.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master action key handler, handles requests for picking up various items and
	interacting with other players (Cops = Cop Menu for unrestrain,escort,stop escort, arrest (if near cop hq), etc).
*/
private["_curTarget","_isWater", "_veh"];
_curTarget = cursorTarget;
gm_ground_cursorObject = cursorObject;
if(life_action_inUse) exitWith {}; //Action is in use, exit to prevent spamming.
if(life_interrupted) exitWith {life_interrupted = false;};
_isWater = surfaceIsWater (getPosASL player);
if(isNull _curTarget) exitWith {
	if(_isWater) then {
		private["_fish"];
		_fish = (nearestObjects[getPos player,["Fish_Base_F"],3]) select 0;
		if(!isNil "_fish") then {
			[_fish] call life_fnc_catchFish;
		};
	};
};

if(_curTarget isKindOf "House_F" && {player distance _curTarget < 12} OR ((nearestObject [[16019.5,16952.9,0],"Land_Dome_Big_F"]) == _curTarget OR (nearestObject [[16019.5,16952.9,0],"Land_Research_house_V1_F"]) == _curTarget)) exitWith {
	[_curTarget] call life_fnc_houseMenu;
};

if(dialog) exitWith {}; //Don't bother when a dialog is open.
if(vehicle player != player) exitWith {}; //He's in a vehicle, cancel!
life_action_inUse = true;

//Temp fail safe.
[] spawn {
	uiSleep 60;
	life_action_inUse = false;
};

if ((getDammage cursorObject isEqualTo 1) && cursorObject in (nearestTerrainObjects [player, [], 25]) && (player getVariable ["GM_Job", "Unemployed"] isEqualTo "Private Repairs Contractor")) exitWith {
	[cursorObject] call life_fnc_repairGround;
};

_curTarget = cursorTarget;
if(!dialog && playerSide == independent && _curTarget isKindOf "Man") exitwith {
	if(!alive _curTarget) then {
		[_curTarget] call life_fnc_revivePlayer;
	} else {
		[_curTarget] call life_fnc_emsInteractionMenu;
	};
};

if(!alive _curTarget && playerSide != independent && !dialog && _curTarget isKindOf "Man" && typeOf _curTarget != "Turtle_F") then {
		if(side _curTarget == independent || side _curTarget == west || side _curTarget == civilian) exitwith {
			if( asdih_inv_medkit > 0 ) then { 
				[_curTarget] call life_fnc_CPRPlayer;
			} else {
				["Medkit Required","You have no medkit for CPR","Failure"] spawn Harris_Notifications;
			};
		};
};

if (typeOf _curTarget IN ["A3L_Wheat","A3L_Cannabis","A3L_Corn","A3L_Beans","CL_Drugscannabis1","A3L_Cotton","Ficus_Bush_1","A3L_Pumpkin","A3L_Sunflower","Oleander2"]) then {
	[] call fnc_harvest;
};

if(playerSide != independent && !dialog && typeOf _curTarget == "cl_evidencebox") exitWith {
	if(playerSide == west) then {
		[] call life_fnc_gatherEvidence;
	};
	if(playerSide == civilian) then {
		[] call life_fnc_destroyEvidence;
	};	
};


//If target is a player then check if we can use the cop menu.
if(isPlayer _curTarget && _curTarget isKindOf "Man") then {
	if(_curTarget distance player < 5 && !dialog && playerSide == west) then {
		[_curTarget] call life_fnc_copInteractionMenu;
	};
} else {
	//OK, it wasn't a player so what is it?
	private["_isVehicle","_miscItems","_money"];
	_isVehicle = if((_curTarget isKindOf "landVehicle") OR (_curTarget isKindOf "Ship") OR (_curTarget isKindOf "Air")) then {true} else {false};
	_miscItems = ["Land_BottlePlastic_V1_F","Land_TacticalBacon_F","Land_Can_V3_F","Land_CanisterFuel_F","Land_Suitcase_F","Land_uiSleeping_bag_blue_folded_F","Land_Screwdriver_V1_F","Land_ButaneCanister_F","Land_Antibiotic_F","Land_VitaminBottle_F","Land_DisinfectantSpray_F","Land_MobilePhone_smart_F","cl_weed_bag","cl_lock_pick","cl_lock_pick","cl_poppy_seeds","cl_donut","cl_fast_rope","Land_Bandage_F","Land_Pillow_grey_F","cl3_pintglass","cl_evidencebox","cl_glass_cocktail","cl_plastic_bag","cl_coal","Land_SatellitePhone_F","Land_Battery_F","Land_Defibrillator_F"];
	_animalTypes = ["Salema_F","Ornate_random_F","Mackerel_F","Tuna_F","Mullet_F","CatShark_F","Turtle_F"];
	_money = "cg_money_stack_1";
	
	//It's a vehicle! open the vehicle interaction key!
	if(_isVehicle) then {
		if(!dialog) then {
			if(player distance _curTarget < ((boundingBox _curTarget select 1) select 0) + 2) then {
				[_curTarget] call life_fnc_vInteractionMenu;
			};
		};
	} else {
		//Is it a animal type?
		if((typeOf _curTarget) in _animalTypes) then {
			if((typeOf _curTarget) == "Turtle_F" && !alive _curTarget) then {
				private["_handle"];
				_handle = [_curTarget] spawn life_fnc_catchTurtle;
				waitUntil {scriptDone _handle};
			} else {
				private["_handle"];
				_handle = [_curTarget] spawn life_fnc_catchFish;
				waitUntil {scriptDone _handle};
			};
		} else {
			//OK, it wasn't a vehicle so let's see what else it could be?
			if((typeOf _curTarget) in _miscItems) then {
				//OK, it was a misc item (food,water,etc).


				if ((typeOf _curTarget) == "Land_Screwdriver_V1_F") then {
					private ["_var"];
					_var = _curTarget getVariable "pickup";
					if (isNil "_var") exitwith {};
					if (_var) then {
						if (count (attachedobjects player) > 0) exitwith {["You are already carrying something.",30,"red"] call A3L_Fnc_Msg;}; 
						if (side player == west) then {
								_veh = _this select 0;

								["Bring this to the PD for a reward!",30,"blue"] call A3L_Fnc_Msg;
								_curTarget setVariable ["pickup",false,true];
								_curTarget attachto [player, [0.005,-.002,-0.02], "RightHandMiddle1"];
								_curTarget setVectorDirAndUp [[-0.01,0.01,0],[-0.01,0.01,0]];
								_curTarget setpos (getpos _veh);

								_id = player addAction ["Drop Item", {detach (_this select 3)},_curTarget];
								
								[_curTarget,_id] spawn {
									_id = _this select 1;
									_suitcaseDeleted = false;
									while {(_veh IN (attachedObjects player)) OR (_suitcaseDeleted)} do {
										if ((!(vehicle player == player)) && (!(_suitcaseDeleted))) then 
										{
											player removeAction _id;
											detach _veh;
											deleteVehicle _veh;
											_suitcaseDeleted = true;
										};
										
										if ((_suitcaseDeleted) && (vehicle player == player)) then {
											_veh = "Land_Screwdriver_V1_F" createvehicle (getpos player);
											{_veh disableCollisionWith _x} foreach playableUnits;
											_veh setVariable ["pickup",false,true];
											_veh attachto [player, [0.005,-.002,-0.02], "RightHandMiddle1"];
											_veh setVectorDirAndUp [[-0.01,0.01,0],[-0.01,0.01,0]];
											_veh setpos (getpos _veh);
											_id = player addAction ["Drop Bag of Cash", {detach (_this select 3)},_veh];
											_suitcaseDeleted = false;
										};
									
										if((life_istazed) && (!(_suitcaseDeleted))) exitWith {detach _veh;};
										if((life_interrupted) && (!(_suitcaseDeleted))) exitWith {detach _veh;};
										if((player getVariable["restrained",false]) && (!(_suitcaseDeleted))) exitWith {detach _veh;};
										if (!(alive player)) exitwith {detach _veh;};
										
										uiSleep 0.1;
									};
									
									detach _veh;
									_veh setVariable ["pickup",true,true];
									player removeAction _id;
								};						
						};
						
						if (side player == civilian) then {
								["You got a shank!",30,"blue"] call A3L_Fnc_Msg;
								_curTarget setVariable ["pickup",false,true];
								_curTarget attachto [player, [0.005,-.002,-0.02], "RightHandMiddle1"];
								_curTarget setVectorDirAndUp [[-0.01,0.01,0],[-0.01,0.01,0]];
								_curTarget setpos (getpos _veh);
								_id = player addAction ["Drop Item", {detach (_this select 3)},_curTarget];
								
								[_curTarget,_id] spawn {
									_veh = _this select 0;
									_id = _this select 1;
									_suitcaseDeleted = false;
									while {(_veh IN (attachedObjects player)) OR (_suitcaseDeleted)} do {
										if ((!(vehicle player == player)) && (!(_suitcaseDeleted))) then 
										{
											player removeAction _id;
											detach _veh;
											deleteVehicle _veh;
											_suitcaseDeleted = true;
										};
										
										if ((_suitcaseDeleted) && (vehicle player == player)) then {
										_veh = "Land_Screwdriver_V1_F" createvehicle (getpos player);
										{_veh disableCollisionWith _x} foreach playableUnits;
										_veh setVariable ["pickup",false,true];
										_veh attachto [player, [0.005,-.002,-0.02], "RightHandMiddle1"];
										_veh setVectorDirAndUp [[-0.01,0.01,0],[-0.01,0.01,0]];
										_veh setpos (getpos _veh);
										_id = player addAction ["Drop Item", {detach (_this select 3)},_veh];
										_suitcaseDeleted = false;
										};
										
										if((life_istazed) && (!(_suitcaseDeleted))) exitWith {detach _veh;};
										if((life_interrupted) && (!(_suitcaseDeleted))) exitWith {detach _veh;};
										if((player getVariable["restrained",false]) && (!(_suitcaseDeleted))) exitWith {detach _veh;};
										if (!(alive player)) exitwith {detach _veh;};
										uiSleep 0.1;
									};
									
									detach _veh;
									_veh setVariable ["pickup",true,true];
									player removeAction _id;
								};
						};
					};
				};
				






















				if ((typeOf _curTarget) == "Land_uiSleeping_bag_blue_folded_F") then {
					private ["_var"];
					_var = _curTarget getVariable "pickup";
					if (isNil "_var") exitwith {};
					if (_var) then {
						if (count (attachedobjects player) > 0) exitwith {["You are already carrying a suitcase.",30,"red"] call A3L_Fnc_Msg;}; 
						if (side player == west) then {
								_veh = _this select 0;

								["Bring this suitcase to the PD for a reward!",30,"blue"] call A3L_Fnc_Msg;
								_curTarget setVariable ["pickup",false,true];
								_curTarget attachto [player, [0.1,-0.18,0], "rfemur"];
								_curTarget setVectorDirAndUp [[0.5,0.5,0],[-0.5,0.5,0]];
								_curTarget setpos (getpos _veh);

								_id = player addAction ["Drop Bag of Cash", {detach (_this select 3)},_curTarget];
								
								[_curTarget,_id] spawn {
									_id = _this select 1;
									_suitcaseDeleted = false;
									while {(_veh IN (attachedObjects player)) OR (_suitcaseDeleted)} do {
										if ((!(vehicle player == player)) && (!(_suitcaseDeleted))) then 
										{
											player removeAction _id;
											detach _veh;
											deleteVehicle _veh;
											_suitcaseDeleted = true;
										};
										
										if ((_suitcaseDeleted) && (vehicle player == player)) then {
											_veh = "Land_uiSleeping_bag_blue_folded_F" createvehicle (getpos player);
											{_veh disableCollisionWith _x} foreach playableUnits;
											_veh setVariable ["pickup",false,true];
											_veh attachto [player, [0.1,-0.18,0], "rfemur"];
											_veh setVectorDirAndUp [[0.5,0.5,0],[-0.5,0.5,0]];
											_veh setpos (getpos _veh);
											_id = player addAction ["Drop Bag of Cash", {detach (_this select 3)},_veh];
											_suitcaseDeleted = false;
										};
									
										if((life_istazed) && (!(_suitcaseDeleted))) exitWith {detach _veh;};
										if((life_interrupted) && (!(_suitcaseDeleted))) exitWith {detach _veh;};
										if((player getVariable["restrained",false]) && (!(_suitcaseDeleted))) exitWith {detach _veh;};
										if (!(alive player)) exitwith {detach _veh;};
										
										uiSleep 0.1;
									};
									
									detach _veh;
									_veh setVariable ["pickup",true,true];
									player removeAction _id;
								};						
						};
						
						if (side player == civilian) then {
								["Bring this suitcase to a trader to get the cash!",30,"blue"] call A3L_Fnc_Msg;
								_curTarget setVariable ["pickup",false,true];
								_curTarget attachto [player, [0.1,-0.18,0], "rfemur"];
								_curTarget setVectorDirAndUp [[0.5,0.5,0],[-0.5,0.5,0]];
								_curTarget setpos (getpos _veh);
								_id = player addAction ["Drop Bag of Cash", {detach (_this select 3)},_curTarget];
								
								[_curTarget,_id] spawn {
									_veh = _this select 0;
									_id = _this select 1;
									_suitcaseDeleted = false;
									while {(_veh IN (attachedObjects player)) OR (_suitcaseDeleted)} do {
										if ((!(vehicle player == player)) && (!(_suitcaseDeleted))) then 
										{
											player removeAction _id;
											detach _veh;
											deleteVehicle _veh;
											_suitcaseDeleted = true;
										};
										
										if ((_suitcaseDeleted) && (vehicle player == player)) then {
											_veh = "Land_uiSleeping_bag_blue_folded_F" createvehicle (getpos player);
											{_veh disableCollisionWith _x} foreach playableUnits;
											_veh setVariable ["pickup",false,true];
											_veh attachto [player, [0.1,-0.18,0], "rfemur"];
											_veh setVectorDirAndUp [[0.5,0.5,0],[-0.5,0.5,0]];
											_veh setpos (getpos _veh);
										_id = player addAction ["Drop Bag of Cash", {detach (_this select 3)},_veh];
										_suitcaseDeleted = false;
										};
										
										if((life_istazed) && (!(_suitcaseDeleted))) exitWith {detach _veh;};
										if((life_interrupted) && (!(_suitcaseDeleted))) exitWith {detach _veh;};
										if((player getVariable["restrained",false]) && (!(_suitcaseDeleted))) exitWith {detach _veh;};
										if (!(alive player)) exitwith {detach _veh;};
										uiSleep 0.1;
									};
									
									detach _veh;
									_veh setVariable ["pickup",true,true];
									player removeAction _id;
								};
						};
					};
				};
				






















				private["_handle"];
				_handle = [_curTarget] spawn life_fnc_pickupItem;
				waitUntil {scriptDone _handle};
			} else {
				//It wasn't a misc item so is it money?
				if((typeOf _curTarget) == _money && {!(_curTarget getVariable["inUse",false])}) then {
					private["_handle"];
					_curTarget setVariable["inUse",TRUE,TRUE];
					_handle = [_curTarget] spawn life_fnc_pickupMoney;
					waitUntil {scriptDone _handle};
				};
			};
		};
	};
};