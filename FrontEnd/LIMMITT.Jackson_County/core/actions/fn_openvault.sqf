/*
open vault

cgbankvault is the variable name
*/

if (cgbankvault animationPhase "d_o_Anim" == 0 && cgbankvault animationPhase "d_l_Anim" == 1) then {
	["General",  "Vault Opening Starting.", "General"] call Harris_Notifications;
	uiSleep 5;
	["Success",  "Vault Opened.", "Success"] call Harris_Notifications;
	cgbankvault animate ["d_o_Anim",1];
} else {
	["Error",  "The vault appears to be locked/open already..", "Failure"] call Harris_Notifications;
};