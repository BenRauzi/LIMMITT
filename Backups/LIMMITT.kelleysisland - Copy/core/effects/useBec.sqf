/*
	File: fn_useBec.sqf
	@Deo	
	Description:
	Bacon, Eggs & Coffee.
*/

#include <macro.h>
if (vehicle player == player) then 
{
player playMove "AmovPercMstpSnonWnonDnon_Scared2";
waitUntil{animationState player != "AmovPercMstpSnonWnonDnon_Scared2";};
uiSleep 1;
};
player setVariable["intoxicated",false,true];
[[0,format["%1 just had Bacon, Eggs & Coffee! Weewww, there go's that hangover!",name player]],"life_fnc_broadcast",(position player) nearEntities [["Man"], 25],false] spawn bis_fnc_mp;

closeDialog 0;


"chromAberration" ppEffectAdjust [0,0,true];
"chromAberration" ppEffectCommit 5;
player enableFatigue true;
player setFatigue 0;
"chromAberration" ppEffectEnable false;
"radialBlur" ppEffectEnable false;
resetCamShake;
life_thirst = 100;
life_thirst = 100;