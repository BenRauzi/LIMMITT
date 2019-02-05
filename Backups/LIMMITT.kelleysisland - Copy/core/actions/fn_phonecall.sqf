/*
phone call
phonecall
*/
if(gm_memecash < 500) exitWith { ["Error", "You dont have $5000 in your bank for this..", "Failure"] call Harris_Notifications;};

gm_memecash = gm_memecash - 5000;
[] call fnc_opentablet;