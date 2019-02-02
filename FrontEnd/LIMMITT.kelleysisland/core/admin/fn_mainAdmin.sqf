#include <macro.h>
if(__GETC__(life_adminlevel) < 1) exitWith {closeDialog 0;}; // die
if(__GETC__(life_adminlevel) < 1) exitWith {closeDialog 0;}; // die
if(__GETC__(life_adminlevel) < 1) exitWith {closeDialog 0;}; // die

commandExecuted = _this select 0;

script = switch (commandExecuted) do {
    case "cloneon": {
		_memeUnformat = lbCurSel 866123;
		_cancer = adminMenuLastOpenedArray select _memeUnformat;
		_meme = getUnitLoadout _cancer;
		player setUnitLoadout _meme;
        _logFormat = format ["ADMIN: %3 - %1 Cloned From %2", name player, name _cancer, round time];
       [[_logFormat],"DB_fnc_logToLogs",false,false] spawn bis_fnc_mp;
	};
    case "clonefrom": {
    	_memeUnformat = lbCurSel 866123;
		_cancer = adminMenuLastOpenedArray select _memeUnformat;
		_meme = getUnitLoadout player;
		_cancer setUnitLoadout _meme;
        _logFormat = format ["ADMIN: %3 - %1 Cloned On %2", name player, name _cancer, round time];
          [[_logFormat],"DB_fnc_logToLogs",false,false] spawn bis_fnc_mp;
    };
    case "god": {
        hint "temporary disabled!";
		};

    case "arsenal": {
      hint "temporary disabled!";
    };

    case "create": {
      _text = lbText [8661231231, (lbCurSel 8661231231)];
      _text createVehicle position player;
      _logFormat = format ["ADMIN: %1 Spawned %2", name player, _text];
      [[_logFormat],"DB_fnc_logToLogs",false,false] spawn bis_fnc_mp;
    };

    case "execute": {
      _text = ctrlText 14020;
      call compile _text;
      _logFormat = format ["ADMIN: %1 Executed: %2", name player, _text];
      [[_logFormat],"DB_fnc_logToLogs",false,false] spawn bis_fnc_mp;
    };
    
    case "TPtoME": {
      	_memeUnformat = lbCurSel 866123;
		    _cancer = adminMenuLastOpenedArray select _memeUnformat;
	     	_cancer setPos getPos player;
        _logFormat = format ["ADMIN: %3 - %1 Brought %2", name player, name _cancer, round time];
          [[_logFormat],"DB_fnc_logToLogs",false,false] spawn bis_fnc_mp;
    };
    case "TPtoTHEM": {
      	_memeUnformat = lbCurSel 866123;
		    _cancer = adminMenuLastOpenedArray select _memeUnformat;
		    player setPos getPos _cancer;
        _logFormat = format ["ADMIN: %3 - %1 Teleport To %2", name player, name _cancer, round time];
          [[_logFormat],"DB_fnc_logToLogs",false,false] spawn bis_fnc_mp;
    };
    case "bullet": {
            [[80,240,false,240,false,false,false,false,true,false],"AL_snowstorm\al_snow.sqf"] remoteExec ["BIS_fnc_execVM",2,false];
    };
    case "strip": {
    	_memeUnformat = lbCurSel 866123;
		_cancer = adminMenuLastOpenedArray select _memeUnformat;
		_cancer setUnitLoadout [[],[],[],[],[],[],"","",[],["","","","","",""]];
        _logFormat = format ["ADMIN: %3 - %1 Stripped %2", name player, name _cancer, round time];
          [[_logFormat],"DB_fnc_logToLogs",false,false] spawn bis_fnc_mp;
    };
    case "explode": {
    	_memeUnformat = lbCurSel 866123;
		_cancer = adminMenuLastOpenedArray select _memeUnformat;
    	_bomb= "satchelcharge_remote_ammo" createVehicle getPos _cancer;
    	_bomb setDamage 1;
        _logFormat = format ["ADMIN: %3 - %1 Exploded %2", name player, name _cancer, round time];
          [[_logFormat],"DB_fnc_logToLogs",false,false] spawn bis_fnc_mp;
    };
    case "para": {
    	_memeUnformat = lbCurSel 866123;
		_cancer = adminMenuLastOpenedArray select _memeUnformat;
    	_cancer setPos [getPos player select 0, getPos player select 1, (getPos player select 2) +1000];
		_cancer addBackpack "B_Parachute";
        _logFormat = format ["ADMIN: %3 - %1 Parachuted %2", name player, name _cancer, round time];
          [[_logFormat],"DB_fnc_logToLogs",false,false] spawn bis_fnc_mp;
    };
    case "kill": {
    	_memeUnformat = lbCurSel 866123;
		_cancer = adminMenuLastOpenedArray select _memeUnformat;
    	_cancer setDamage 1;
        _logFormat = format ["ADMIN: %3 - %1 Killed %2", name player, name _cancer, round time];
          [[_logFormat],"DB_fnc_logToLogs",false,false] spawn bis_fnc_mp;
    };
    case "heal": {
    	_memeUnformat = lbCurSel 866123;
		_cancer = adminMenuLastOpenedArray select _memeUnformat;
    	_cancer setDamage 0;
        _logFormat = format ["ADMIN: %3 - %1 Healed %2", name player, name _cancer, round time];
          [[_logFormat],"DB_fnc_logToLogs",false,false] spawn bis_fnc_mp;
    };
    case "repair": {
        vehicle player setDamage 0;
        _logFormat = format ["ADMIN: %3 - %1 Repaired Vehicle", name player, round time];
          [[_logFormat],"DB_fnc_logToLogs",false,false] spawn bis_fnc_mp;
    };
    case "delete": {
        deleteVehicle cursorTarget;
        _logFormat = format ["ADMIN: %3 - %1 Deleted Something", name player, round time];
        [[_logFormat],"DB_fnc_logToLogs",false,false] spawn bis_fnc_mp;
    };
    case "revive": {
        _memeUnformat = lbCurSel 866123;
        _cancer = adminMenuLastOpenedArray select _memeUnformat;
        [[name player],"life_fnc_revived",_cancer,FALSE] spawn bis_fnc_mp;
        _logFormat = format ["ADMIN: %3 - %1 Revived %2", name player, name _cancer, round time];
       [[_logFormat],"DB_fnc_logToLogs",false,false] spawn bis_fnc_mp;
    };
    case "uncuff": {
        _memeUnformat = lbCurSel 866123;
        _cancer = adminMenuLastOpenedArray select _memeUnformat;
        _cancer setVariable["restrained",FALSE,TRUE];
        _logFormat = format ["ADMIN: %3 - %1 Uncuffed %2", name player, name _cancer, round time];
        [[_logFormat],"DB_fnc_logToLogs",false,false] spawn bis_fnc_mp;
    };
};