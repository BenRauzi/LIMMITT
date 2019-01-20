/*
	Author: Ben Harris
	Description: Shackles
*/
Harris_shackle = {

	if (animationState player != 'hubspectator_stand') then {
		player switchMove "HubSpectator_stand";
		["Shackled", "You have been shackled by your legs", true] spawn HRP_fnc_Notifications;
	} else {
		player playMove "AmovPercMstpSlowWrflDnon"; 
		["UnShackled", "You have been freed from your shackles", true] spawn HRP_fnc_Notifications;
	};
};
