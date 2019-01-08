/*
phone call
phonecall
*/
if(gm_memecash < 500) exitWith { hint "You dont have $5000 in your bank for this.."; };

gm_memecash = gm_memecash - 5000;
[] call fnc_opentablet;