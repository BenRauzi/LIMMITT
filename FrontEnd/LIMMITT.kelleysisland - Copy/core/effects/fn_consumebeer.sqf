/*
    File: fn_consumebeer.sqf
	Author: Cobra
	Description:
	An effect for drinking beer.
*/
closeDialog 0;
hint "You crack open a bottle of Cobra beer. Delicious!";
["Info",  "You crack open a bottle of Cobra beer. Delicious!",  "Info"] call Harris_Notifications; 
player say2d "openbottle";
player enableFatigue true;
player setFatigue 1;
uiSleep 20;
"chromAberration" ppEffectAdjust[0.16,random 0.16, true];
"chromAberration" ppEffectCommit 1;   
"radialBlur" ppEffectAdjust  [random 0.05,random 0.05,0.3,0.3];
"radialBlur" ppEffectCommit 1;
addcamShake[random 4, 2, random 4];
uiSleep 1;
"chromAberration" ppEffectAdjust [0,0,true];
"chromAberration" ppEffectCommit 5;
"radialBlur" ppEffectAdjust  [0,0,0,0];
"radialBlur" ppEffectCommit 5;
uiSleep 6;
player setFatigue 0;
player enableFatigue false;
closeDialog 0;
["Info",  "You've recovered from the beer and now feel normal again, although you could do with a drink of water and a bite to eat.",  "Info"] call Harris_Notifications; 
life_thirst =  50;
life_hunger =  50;
[] call life_fnc_hudUpdate;
uiSleep 10;
closeDialog 0;