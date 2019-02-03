/*
Charge phone to 3 for free
*/
titleText["STORE CLERK: Okay, let me charge that for you.","PLAIN"];
if(life_battery > 34) exitWith { titleText["STORE CLERK: Already charged enough.","PLAIN"]; };
uiSleep 3;
life_battery = 35;
playSound3D ["cg_sndimg\sounds\phoneSMS.ogg", player, false, getPosASL player, 1, 1, 25];
titleText["Charged, Thank You - Come Again!","PLAIN"];