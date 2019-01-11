/*
punch system copy pasted by koil out of his brain cuz he copy paste everything and he a cunt m8
*/

if(life_action_inuse) exitWith {};
life_action_inUse = true;
_koilsucks = round (random 4);

switch (true) do
{
	case (_koilsucks == 0): { 
		player switchMove "CL3_anim_Punch1";
		uiSleep 0.3;
		if(!isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && alive cursorTarget && cursorTarget distance player < 3.5 && !(player getVariable "tied") && !(player getVariable "restrained")) then
		{
			cursorTarget setDamage (damage player) + .02;
			[[player,"punch1"],"A3L_Fnc_NearestSound",false,false,false] call BIS_fnc_MP;
		};
		waitUntil{animationState player != "CL3_anim_Punch1";};
		life_action_inuse = false;
	};
	case (_koilsucks == 1): { 
		player switchMove "CL3_anim_Punch2";
		uiSleep 0.3;
		if(!isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && alive cursorTarget && cursorTarget distance player < 3.5 && !(player getVariable "tied") && !(player getVariable "restrained")) then
		{
			cursorTarget setDamage (damage player) + .07;
			[[player,"punch2"],"A3L_Fnc_NearestSound",false,false,false] call BIS_fnc_MP;
		};
		waitUntil{animationState player != "CL3_anim_Punch2";};
		life_action_inuse = false;
	};
	case (_koilsucks == 2): { 
		player switchMove "CL3_anim_Punch2";
		uiSleep 0.3;
		if(!isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && alive cursorTarget && cursorTarget distance player < 3.5 && !(player getVariable "tied") && !(player getVariable "restrained")) then
		{
			cursorTarget setDamage (damage player) + .05;
			[[player,"punch2"],"A3L_Fnc_NearestSound",false,false,false] call BIS_fnc_MP;
		};
		waitUntil{animationState player != "CL3_anim_Punch2";};
		life_action_inuse = false;
	};
	case (_koilsucks == 3): { 
		player switchMove "CL3_anim_Punch3";
		uiSleep 0.3;
		if(!isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && alive cursorTarget && cursorTarget distance player < 3.5 && !(player getVariable "tied") && !(player getVariable "restrained")) then
		{
			cursorTarget setDamage (damage player) + .04;
			[[player,"punch3"],"A3L_Fnc_NearestSound",false,false,false] call BIS_fnc_MP;
		};
		waitUntil{animationState player != "CL3_anim_Punch3";};
		life_action_inuse = false;
	};
	case (_koilsucks == 4): { 
		player switchMove "CL3_anim_Punch4";
		uiSleep 0.3;
		if(!isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && alive cursorTarget && cursorTarget distance player < 3.5 && !(player getVariable "tied") && !(player getVariable "restrained")) then
		{
			cursorTarget setDamage (damage player) + .04;
			[[player,"punch4"],"A3L_Fnc_NearestSound",false,false,false] call BIS_fnc_MP;
		};
		waitUntil{animationState player != "CL3_anim_Punch4";};
		life_action_inuse = false;
	};
	default { 
		player switchMove "CL3_anim_Punch4";
		uiSleep 0.3;
		if(!isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && alive cursorTarget && cursorTarget distance player < 3.5 && !(player getVariable "tied") && !(player getVariable "restrained")) then
		{
			cursorTarget setDamage (damage player) + .04;
			[[player,"punch4"],"A3L_Fnc_NearestSound",false,false,false] call BIS_fnc_MP;
		};
		waitUntil{animationState player != "CL3_anim_Punch4";};
		life_action_inuse = false;
	};
};
uiSleep 0.5;

life_action_inuse = false;


