/*
	File: fn_onPlayerKilled.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	When the player dies collect various information about that player
	and pull up the death dialog / camera functionality.
*/
private["_unit","_killer"];
disableSerialization;
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_killer = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;

//Set some vars
_unit setVariable["Revive",FALSE,TRUE]; //Set the corpse to a revivable state.
_unit setVariable["name",profileName,TRUE]; //Set my name so they can say my name.
_unit setVariable["restrained",FALSE,TRUE];
_unit setVariable["Escorting",FALSE,TRUE];
_unit setVariable["transporting",FALSE,TRUE]; //Why the fuck do I have this? Is it used?
_unit setVariable["steam64id",(getPlayerUID player),true]; //Set the UID.
_unit setVariable ["EMSON",1,true];

gm_loadOut = getUnitLoadout _unit;		
removeAllWeapons _unit;



//Setup our camera view
life_deathCamera  = "CAMERA" camCreate (getPosATL _unit);
showCinemaBorder FALSE;
life_deathCamera cameraEffect ["Internal","Back"];
createDialog "DeathScreen";
life_deathCamera camSetTarget _unit;
life_deathCamera camSetRelPos [0,22,22];
life_deathCamera camSetFOV .5;
life_deathCamera camSetFocus [50,0];
life_deathCamera camCommit 0;

_killerName = name _killer;
_killerDistance = _unit distance _killer;



_nameDisplay = ((findDisplay 7300) displayCtrl 1000);
_nameDisplay ctrlSetText format["Killed By: %1", _killerName];

_nameDisplay1 = ((findDisplay 7300) displayCtrl 1002);
_nameDisplay1 ctrlSetText format["Distance: %1", _killerDistance];

if(!isNull _killer && {_killer != _unit}) then {
	_logName = name player;
	[[0,format["You have killed %1 from %2m",_logName, _killerDistance]],"life_fnc_broadcast",_killer,false] spawn bis_fnc_mp;

	_content = format ["%1 [%2] Just killed %3 from %4m", name _killer, getPlayerUID _killer, name player, _killerDistance];
	[[_content],"DB_fnc_logToLogs",false,false] spawn bis_fnc_mp;
};

[] call Life_fnc_createNewLifePoint;

(findDisplay 7300) displaySetEventHandler ["KeyDown","if((_this select 1) == (_this select 1)) then {true}"]; //Block the ESC menu

//Create a thread for something?
_unit spawn
{
	private["_maxTime","_RespawnBtn","_Timer"];
	disableSerialization;
	_RespawnBtn = ((findDisplay 7300) displayCtrl 7302);
	_Timer = ((findDisplay 7300) displayCtrl 7301);
	
	if (independent countSide playableUnits == 0) then {
		_maxTime = time + (life_respawn_timer * 20);
	} else {
		_maxTime = time + (life_respawn_timer * 60);
	};
	
	_RespawnBtn ctrlEnable false;
	waitUntil {_Timer ctrlSetText format[localize "STR_Medic_Respawn",[(_maxTime - time),"MM:SS.MS"] call BIS_fnc_secondsToString]; 
	round(_maxTime - time) <= 0 OR isNull _this};
	_RespawnBtn ctrlEnable true;
	_Timer ctrlSetText localize "STR_Medic_Respawn_2";
};

[] spawn life_fnc_deathScreen;

//Create a thread to follow with some what precision view of the corpse.
[_unit] spawn
{
	private["_unit"];
	_unit = _this select 0;
	waitUntil {if(speed _unit == 0) exitWith {true}; life_deathCamera camSetTarget _unit; life_deathCamera camSetRelPos [0,22,22]; life_deathCamera camCommit 0;};
};

//Make the killer wanted
if(!isNull _killer && {_killer != _unit} && {side _killer != west} && {alive _killer}) then {
	if(vehicle _killer isKindOf "LandVehicle") then {

	} else {
		if(side _killer != west) then {
			_reason = "187";
			[_killer,_unit,_reason] spawn life_fnc_createEvidence;
		};
	};
};


life_hunger = 100;
life_thirst = 100;

[] call life_fnc_hudUpdate; //Get our HUD updated.
[[player,life_sidechat,playerSide],"TON_fnc_managesc",false,false] spawn bis_fnc_mp;


[0] call SOCK_fnc_updatePartial;
[3] call SOCK_fnc_updatePartial;