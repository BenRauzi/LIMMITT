/*
close vault

cgbankvault is the variable name
*/

if ( cgbankvault animationPhase "d_o_Anim" == 1 ) then {
	hint "Vault Closing Starting.";
	["Info", "Vault Closing Starting.",  "Info"] call Harris_Notifications;
	uiSleep 5;
	cgbankvault animate ["d_o_Anim",0];
	["Success", "Vault Closing Engaged.",  "Success"] call Harris_Notifications;
} else {
	["Failure", "The vault appears to be locked/closed already..",  "Failure"] call Harris_Notifications;
};