/*
	File: fn_useBec.sqf
	@Deo	
	Description:
	Bacon, Eggs & Coffee.
*/

#include <macro.h>
life_thirst = 100;
life_hunger = 100;
life_intox = 0.00;
if (vehicle player == player) then 
{
player playMove "CL3_anim_drink";
waitUntil{animationState player != "CL3_anim_drink";};
};




player setVariable["intoxicated",false,true];

closeDialog 0;

enableCamShake true;
"chromAberration" ppEffectAdjust [0,0,true];
"chromAberration" ppEffectCommit 5;
player enableFatigue true;
player setFatigue 0;
"chromAberration" ppEffectEnable false;
"radialBlur" ppEffectEnable false;
resetCamShake;
enableCamShake false;
life_thirst = 100;
life_hunger = 100;