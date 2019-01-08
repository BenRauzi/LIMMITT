/*
	File: fn_useMarijuana.sqf	
	Edited by: Cobra
	Description:
	Use Marijuana Effect
*/

#include <macro.h>
private["_smoke","_playerdo"];


if (vehicle player != player) then 
{
player playMove "AmovPercMstpSnonWnonDnon_Scared2";
waitUntil{animationState player != "AmovPercMstpSnonWnonDnon_Scared2";};
};


[[0,format["%1 is stoned.",name player]],"life_fnc_broadcast",(position player) nearEntities [["Man"], 25],false] spawn bis_fnc_mp;

closeDialog 0;

"chromAberration" ppEffectEnable true;
player say2d "weed";
hint "I'm blazed.";
uiSleep 3;
hint "It feels like my body is slowly healing.";
player say2d "cough";
for "_i" from 0 to 60 do
{
    player setDamage (damage player) - .05;
    "chromAberration" ppEffectAdjust [random 0.03,random 0.03,true];
    "chromAberration" ppEffectCommit 4;   
    uiSleep 15;
};
hint "The weed is wearing off.";
"chromAberration" ppEffectAdjust [0,0,true];
"chromAberration" ppEffectCommit 5;
uiSleep 6;

"chromAberration" ppEffectEnable false;
"radialBlur" ppEffectEnable false;
resetCamShake;