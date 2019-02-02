/*
    File: fn_teargas.sqf
	Edited by: Cobra
	Description:
	Adds tear gas.
*/

_gasmask = ["Mask_M40", "Mask_M40_OD", "Mask_M50"];
_myvariable = -1;

While{true} do {

"dynamicBlur" ppEffectEnable true; 
"dynamicBlur" ppEffectAdjust [0]; 
"dynamicBlur" ppEffectCommit 15; 
resetCamShake; 
20 fadeSound 1;	 


waituntil
{
	((nearestObject [getpos player, "SmokeShellYellow"]) distance player < 10) 																								
	and
	(getpos (nearestObject [getpos player, "SmokeShellYellow"]) select 2 < 0.5)
};

_headgear = goggles player;

if (_headgear in _gasmask)
	then {
			if (_myvariable < 0) then {};
	}



else
		{
			hint "You are starting to feel the effects from the tear gas.";
			player say2d "cough";
			uiSleep 7;
			closeDialog 0;
			player say2d "cough";
			"dynamicBlur" ppEffectEnable true; 
			"dynamicBlur" ppEffectAdjust [9]; 
			"dynamicBlur" ppEffectCommit 3;
			enableCamShake true;	
			addCamShake [10, 45, 10];	
			5 fadeSound 0.1;	 
			uiSleep 5;
			"dynamicBlur" ppEffectAdjust [20]; 
			"dynamicBlur" ppEffectCommit 3; 
			uiSleep 5;
			uiSleep 20;
			_damage = damage player;
			_damage = _damage + 0.1;
			player setDamage (_damage);
			hint "The fumes from the tear gas have started to irritate your lungs.";
			uiSleep 5;
			closeDialog 0;
		};
};
