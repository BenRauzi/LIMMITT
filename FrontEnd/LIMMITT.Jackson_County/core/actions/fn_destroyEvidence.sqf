/*
File: destroy evidence
*/
private["_curtarget","_unit"];

_curTarget = cursorTarget;

titleText["Destroying Evidence..","PLAIN"];
titleFadeOut 3;
uiSleep 3;
titleText["This will take a couple of minutes to clean up.","PLAIN"];
titleFadeOut 120;
_cme = 1;
_myposy = getPos player;

while {true} do {
	life_action_inUse = true;
	uiSleep 1;
	if( player distance _myposy > 5 ) exitwith { 
		titleText["You moved to far - the evidence was not destroyed.","PLAIN"];
		life_action_inUse = false;
	};
	_cme = _cme + 1;

	if(_cme > 120) exitwith {
	life_action_inUse = false;
		deleteVehicle _curTarget;
		titleText["You have destroyed the evidence..","PLAIN"];
	};
};
life_action_inUse = false;
