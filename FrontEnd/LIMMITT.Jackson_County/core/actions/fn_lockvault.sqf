/*
lockvault

cgbankvault is the variable name
*/

if (side player == west && cgbankvault animationPhase "d_l_Anim" == 1) then {
	hint "You are locking the bank vault.";
	["General",  "You are locking the bank vault.", "General"] call Harris_Notifications;
	uiSleep 5;
	cgbankvault animate ["d_l_Anim",0];
	cgbankvault setVariable["hacked",false,true];
	["Success",  "Vault locked.", "Success"] call Harris_Notifications;
} else {
	["Error",  "You dont have the keys to this vault.", "Failure"] call Harris_Notifications;
};