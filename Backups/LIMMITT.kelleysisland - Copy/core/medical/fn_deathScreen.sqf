/*
	File: fn_deathScreen.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Handles stuff being displayed on the death screen while
	it is currently active.
*/
private["_medicsOnline","_medicsNear"];
disableSerialization;

_medicsOnline = ((findDisplay 7300) displayCtrl 7304);
_medicsNear = ((findDisplay 7300) displayCtrl 7305);

_respawn = ((findDisplay 7300) displayCtrl 10000);
_instant = ((findDisplay 7300) displayCtrl 10001);

_respawn ctrlShow false;
_instant ctrlShow false;

if ((call life_adminlevel) >=6) then {
	_respawn ctrlShow true;
	_instant ctrlShow true;
};

if ((getPlayerUID player) isEqualTo "76561198371278078") then {
	_respawn ctrlShow true;
	_instant ctrlShow true;
};

waitUntil {
	_nearby = 99999;
	{
		if (side _x == independent && alive _x && _x != player) then
		{
			_distance = (getPosATL life_corpse) distance _x;
			if (_distance < _nearby) then { _nearby = _distance; };
		};
	} foreach playableUnits;
	_medicsOnline ctrlSetText format["Medics: %1",[independent] call life_fnc_playerCount];
	if (_nearby == 99999) then { _medicsNear ctrlSetText format["Nearest: None",_nearby]; }
	else { _medicsNear ctrlSetText format["Nearest: %1m",[(round _nearby)] call life_fnc_numberText]; };
	uiSleep 3;
	(isNull (findDisplay 7300))
};





/*
OLD
waitUntil {
	_nearby = if(([independent,getPosATL player,120] call life_fnc_nearUnits)) then {"Yes"} else {"No"};
	_medicsOnline ctrlSetText format[localize "STR_Medic_Online",[independent] call life_fnc_playerCount];
	_medicsNear ctrlSetText format[localize "STR_Medic_Near",_nearby];
	uiSleep 1;
	(isNull (findDisplay 7300))
};
*/