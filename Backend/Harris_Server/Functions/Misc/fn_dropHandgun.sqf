/*
	Author: Nicholas Jo'Foski
	Description: Allows the player to drop their handgun while surrendered / restrained
*/

Foski_dropHandgun ={
	[_this select 0] spawn {
		_var = _this select 0;
		if (isNil "_var") exitWith {};
		if ((player getVariable _var) && currentWeapon player != "") then {
			_action = player addAction ["Drop Handgun", {
				_ammo = 0;
				_gun = currentWeapon player;
				_mag = (getArray (configfile >> "CfgWeapons" >> _gun >> "magazines")) select 0;
				if (player ammo _gun > 0) then {_ammo = 1;};
				player removeWeaponGlobal _gun;
				_gunI = "GroundWeaponHolder" createvehicle position player;
				_gunI setPos position player;
				_gunI addWeaponCargoGlobal [_gun,1];
				_gunI addMagazinecargoGlobal [_mag,_ammo];
				player removeAction (_this select 2);
			}];
			waitUntil {(!(player getVariable [_var, false]))};
			if (currentWeapon player != "") then {player removeAction _action;};
		};
	};
};