/*
sharp melee hit
*/
private["_unit","_shooter","_curWep","_curMags","_attach"];
_unit = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_shooter = [_this,1,Objnull,[Objnull]] call BIS_fnc_param;
if(isNull _unit OR isNull _shooter) exitWith {player allowDamage true; life_istazed = false;};
if(!alive player) exitWith {};

_koildebs = player getVariable "EMSON";

if(_koildebs == 1) exitWith {};

if(_shooter isKindOf "Man" && alive player) then
{
	player setDamage (damage player) + .015;
};