/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Handles various different ammo types being fired.
*/
private["_ammoType","_projectile"];
_ammoType = _this select 4; 
_projectile = _this select 6;

if(_ammoType == "GrenadeHand_stone") then {
	_projectile spawn {
		private["_position"];
		while {!isNull _this} do {
			_position = getPosATL _this;
			uiSleep 0.1;
		};
		[[_position],"life_fnc_flashbang",true,false] spawn bis_fnc_mp;
	};
};

  _unit = _this select 0;
  _ammo = _this select 4;

	if(_ammo isKindOf "Melee") then {
		_cfg = (configFile>>"CfgAmmo">>_ammo>>"Melee");
		_anim = getText(_cfg>>"anim");
		_unit playActionNow _anim;
	};