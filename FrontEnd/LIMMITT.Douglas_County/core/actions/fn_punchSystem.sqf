/*
punch system copy pasted by koil out of his brain cuz he copy paste everything and he a cunt m8
*/

if(life_action_inuse) exitWith {};
if(life_istazed) exitWith {};
if((animationState player) == "Incapacitated") exitWith {};
if (vehicle player != player) exitwith { };
life_action_inUse = true;
_koilsucks = round (random 4);


uiSleep 0.1;
switch (true) do
{
	case (_koilsucks == 0): { 
		[[player,"CL3_anim_Punch1"],"life_fnc_animSync",true,false] spawn bis_fnc_mp;
		uiSleep 0.3;
		if(!isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && alive cursorTarget && cursorTarget distance player < 2 ) then
		{
			cursorTarget setDamage (damage cursorTarget) + .02;
			[[cursorTarget,"CL3_anim_Receive1a"],"life_fnc_animSync",true,false] spawn bis_fnc_mp;

			[[player,"punch1"],"A3L_Fnc_NearestSound",false,false,false] call BIS_fnc_MP;
		};
		waitUntil{animationState player != "CL3_anim_Punch1";};
	};
	case (_koilsucks == 1): { 
		[[player,"CL3_anim_Punch2"],"life_fnc_animSync",true,false] spawn bis_fnc_mp;
		uiSleep 0.3;
		if(!isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && alive cursorTarget && cursorTarget distance player < 2 ) then
		{
			cursorTarget setDamage (damage cursorTarget) + .07;
			[[cursorTarget,"CL3_anim_Receive2a"],"life_fnc_animSync",true,false] spawn bis_fnc_mp;

			[[player,"punch2"],"A3L_Fnc_NearestSound",false,false,false] call BIS_fnc_MP;
		};
		waitUntil{animationState player != "CL3_anim_Punch2";};
	};
	case (_koilsucks == 2): { 
		[[player,"CL3_anim_Punch2"],"life_fnc_animSync",true,false] spawn bis_fnc_mp;
		uiSleep 0.3;
		if(!isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && alive cursorTarget && cursorTarget distance player < 2 ) then
		{
			[[cursorTarget,"CL3_anim_Receive3a"],"life_fnc_animSync",true,false] spawn bis_fnc_mp;
			cursorTarget setDamage (damage cursorTarget) + .05;
			[[player,"punch2"],"A3L_Fnc_NearestSound",false,false,false] call BIS_fnc_MP;
		};
		waitUntil{animationState player != "CL3_anim_Punch2";};
	};
	case (_koilsucks == 3): { 
		[[player,"CL3_anim_Punch3"],"life_fnc_animSync",true,false] spawn bis_fnc_mp;
		uiSleep 0.3;
		if(!isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && alive cursorTarget && cursorTarget distance player < 2 ) then
		{
			[[cursorTarget,"CL3_anim_Receive1a"],"life_fnc_animSync",true,false] spawn bis_fnc_mp;
			cursorTarget setDamage (damage cursorTarget) + .04;
			[[player,"punch3"],"A3L_Fnc_NearestSound",false,false,false] call BIS_fnc_MP;
		};
		waitUntil{animationState player != "CL3_anim_Punch3";};
	};
	case (_koilsucks == 4): { 
		[[player,"CL3_anim_Punch4"],"life_fnc_animSync",true,false] spawn bis_fnc_mp;
		uiSleep 0.3;
		if(!isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && alive cursorTarget && cursorTarget distance player < 2 ) then
		{
					[[cursorTarget,"CL3_anim_Receive2a"],"life_fnc_animSync",true,false] spawn bis_fnc_mp;

			cursorTarget setDamage (damage cursorTarget) + .04;
			[[player,"punch4"],"A3L_Fnc_NearestSound",false,false,false] call BIS_fnc_MP;
		};
		waitUntil{animationState player != "CL3_anim_Punch4";};
	};
	default { 
		player switchMove "CL3_anim_Punch4";
		[[player,"CL3_anim_Punch4"],"life_fnc_animSync",true,false] spawn bis_fnc_mp;
		uiSleep 0.3;
		if(!isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && alive cursorTarget && cursorTarget distance player < 2 ) then
		{
					[[cursorTarget,"CL3_anim_Receive3a"],"life_fnc_animSync",true,false] spawn bis_fnc_mp;

			cursorTarget setDamage (damage cursorTarget) + .04;
			[[player,"punch4"],"A3L_Fnc_NearestSound",false,false,false] call BIS_fnc_MP;
		};
		waitUntil{animationState player != "CL3_anim_Punch4";};
	};
};
uiSleep 3.5;

life_action_inuse = false;


