/*
    File: fn_consumeuranium.sqf
	Author: Cobra
	Description:
	An effect for consuming uranium.
*/

closeDialog 0;
["Warning",  "You have consumed deadly uranium. Your life is coming to an end.",  "Warning"] call Harris_Notifications; 
player say2d "radioactive";
player enableFatigue true;
player setFatigue 1;
uiSleep 10;
player say2d "cough";
uiSleep 10;

player say2d "radioactive";
life_thirst =  50;
life_hunger =  50;
enableCamShake true;
addcamShake[random 4, 2, random 4];
"dynamicBlur" ppEffectEnable true;
"dynamicBlur" ppEffectAdjust [6];
"dynamicBlur" ppEffectCommit 6;
_damage = damage player;
_damage = _damage + 0.5;
player setDamage (_damage);
[] call life_fnc_hudUpdate;
uiSleep 20;

player say2d "radioactive";
_damage = damage player;
_damage = _damage + 0.5;
player setDamage (_damage);
[] call life_fnc_hudUpdate;

"dynamicBlur" ppEffectEnable false;
"dynamicBlur" ppEffectAdjust [0];
"dynamicBlur" ppEffectCommit 0;
player setFatigue 0;
player enableFatigue false;
resetCamShake;
closeDialog 0;