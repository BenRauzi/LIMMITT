/*
	Author: Ben Harris
	Description: Shackles
*/
Harris_shackle = {

	if !(isForcedWalk player) then {
		player forceWalk true;
		["Shackled", "You have been shackled by your legs", true] spawn HRP_fnc_Notifications;
		player setVariable ["Shackled", true, true]; 
	} else {
		player forceWalk false;
		["UnShackled", "You have been freed from your shackles", true] spawn HRP_fnc_Notifications;
		player setVariable ["Shackled", false, true];
	};
};
