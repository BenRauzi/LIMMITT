// Take a shit


_currentuniform = Uniform player;
disableUserInput true;
life_action_inUse = true;
player switchMove "CL3_anim_Poo";
[[player,"CL3_anim_Poo"],"life_fnc_animSync",true,false] spawn bis_fnc_mp;
uiSleep 2;
[[player,"fart4"],"A3L_Fnc_NearestSound",false,false,false] call BIS_fnc_MP;
uiSleep 4;
[[player,"fart5"],"A3L_Fnc_NearestSound",false,false,false] call BIS_fnc_MP;
waitUntil{animationState player != "CL3_anim_Poo";};
_veh = "cl_turd" createvehicle (getpos player); 
_veh setPosATL (getPosATL player);

life_dirt = life_dirt + 10;
life_poop = 0;
if(_currentuniform isEqualTo "") then {

} else {
	hint "You just went to the toilet with your clothes on... you feel disgusting.";
	life_dirt = 100;
	life_poop = 50;
	player setfatigue 1;	
};
life_action_inUse = false;
disableUserInput false;
uiSleep 120;
deleteVehicle _veh;