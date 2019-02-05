if(isNil "MB_NLR") then {MB_NLR = false;};
if(isNil "MB_NLRTime") then {MB_NLRTime = time;};

//Confirm that NLR is active
if(!MB_NLR) exitWith {};

//Check if NLR Time is over
if((MB_NLRTime + 900) >= time) exitWith {
	[] call life_fnc_removeNewLifePoint;
};

//Warn the player to leave if within circle
if(((getPos player) distance (getMarkerPos "nlr")) < 200) then {
	hint "Warning! You recently died here! Leave the area!";
	
};