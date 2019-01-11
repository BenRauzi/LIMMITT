/*
	Does it matter? Needs to be replaced.
	Built for Feint's Push functionality
*/
private["_target","_caller","_posCaller","_dir"];
_target = cursorTarget;
_caller = player;
_posCaller = getPos _caller;
_dir = getDir _caller;

if (pushCooldown) exitWith {hint "Please don't spam push!"};

if(isNull _target) exitWith {};
if(_caller distance _target > 5) exitWith {};

pushCooldown = true;

if(local _target) then
{
	[_caller,_target,_posCaller,_dir] spawn life_fnc_pushFunction;
}
	else
{
	[[_caller,_target,_posCaller,_dir],"life_fnc_pushFunction",_target,false] spawn bis_fnc_mp;
};

sleep 3;
pushCooldown = false;