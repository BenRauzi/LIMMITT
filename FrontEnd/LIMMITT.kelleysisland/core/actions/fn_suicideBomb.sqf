	/*
	"ALLAHU SNACKBAR" YELLED THE LONELY PANCAKE
	Created by: PANCAKE
	Edited By "James Pham"
	JK He is autism
	Tested and Approved by Jesus
	*/
	private["_test"];
	if(vest player != "V_HarnessOGL_gry") exitWith {};
	[[0,format["Someone will blow up in 30 seconds, Run for your lives!"]],"life_fnc_broadcast,true,false"] spawn bis_fnc_mp;
	uiSleep 15;
	[[0,format["Someone will blow up in 15 seconds, Run for your lives!"]],"life_fnc_broadcast,true,false"] spawn bis_fnc_mp;
	uiSleep 15;
	[[0,format["%1 is now with 72 virgins!",name player]],"life_fnc_broadcast,true,false"] spawn bis_fnc_mp;
	
	_test = "Bo_Mk82" createVehicle [0,0,9999];
	_test setPos (getPos player);
	_test setVelocity [100,0,0];
	
	if(alive player) then {player setDamage 1;};