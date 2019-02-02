_unit = _this select 0;
_firer = _this select 1;
_distance = _this select 2;
_weapon = _this select 3;

if (_weapon isEqualTo "JD_Taser") exitWith {};

life_combatTime = time + 60;