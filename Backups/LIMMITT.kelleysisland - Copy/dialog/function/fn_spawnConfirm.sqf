/*
	File: fn_spawnConfirm.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Spawns the player where he selected.
*/
private["_spCfg","_sp","_spawnPos"];
closeDialog 0;
cutText ["","BLACK IN"];
if(count life_spawn_point == 0) then
{
	private["_sp","_spCfg"];
	_spCfg = [playerSide] call life_fnc_spawnPointCfg;
	_sp = _spCfg select 0;

	if(playerSide == civilian) then
	{
		if(isNil {(call compile format["%1", _sp select 0])}) then {
			player setPos (getMarkerPos (_sp select 0));

			// Run our code for hospital spawn
			if ((!life_firstSpawn) && (_sp select 0 == "civ_spawn_1")) then
			{
				[] call A3L_Fnc_HospitalSpawn;
			};


		} else {
			_spawnPos = (call compile format["%1", _sp select 0]) call BIS_fnc_selectRandom;
			_spawnPos = _spawnPos buildingPos 0;
			player setPos _spawnPos;



		};
	}
		else
	{
		player setPos (getMarkerPos (_sp select 0));

		// Run our code for hospital spawn
		if ((!life_firstSpawn) && (_sp select 0 == "civ_spawn_1")) then
		{
		[] call A3L_Fnc_HospitalSpawn;
		};
	};
	titleText[format["%2 %1",_sp select 1,localize "STR_Spawn_Spawned"],"BLACK IN"];
}
	else
{
	if(playerSide == civilian) then
	{
		if(isNil {(call compile format["%1",life_spawn_point select 0])}) then {
			if((["house",life_spawn_point select 0] call BIS_fnc_inString)) then {
				private["_bPos","_house","_pos"];
				_house = nearestObjects [getMarkerPos (life_spawn_point select 0),["House_F"],10] select 0;
				_bPos = [_house] call life_fnc_getBuildingPositions;

				if(count _bPos == 0) exitWith {
					player setPos (getMarkerPos (life_spawn_point select 0));
				};

				_pos = _bPos call BIS_fnc_selectRandom;
				player setPosATL _pos;
			} else {
				player setPos (getMarkerPos (life_spawn_point select 0));
			};
		} else {
			_spawnPos = (call compile format["%1", life_spawn_point select 0]) call BIS_fnc_selectRandom;
			_spawnPos = _spawnPos buildingPos 0;
			player setPos _spawnPos;
		};
	}
		else
	{
		player setPos (getMarkerPos (life_spawn_point select 0));
	};
	titleText[format["%2 %1",life_spawn_point select 1,localize "STR_Spawn_Spawned"],"BLACK IN"];
};

[] spawn
{
   private["_handle"];
   cutText ["","BLACK IN"];
   [] execVM "scripts\cameraScreen.sqf";
   _handle = [] execVM "scripts\cameraHeight.sqf";
   waitUntil {scriptDone _handle};

   [] call life_fnc_hudSetup;
};

life_shop_cam cameraEffect ["TERMINATE","BACK"];
camDestroy life_shop_cam;

[] call life_fnc_initStatusbar;
if (license_civ_driver) then {player setVariable ["LicenseDriver", true, true];};
