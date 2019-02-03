/*
File: fn_gatherCoke.sqf
Coke
*/
private["_sum"];
_sum = ["cokeu",1,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;

_cme = 0;

if(_sum > 0) then
{
disableUserInput true;
life_action_inUse = true;

titleText["Gathering Coco","PLAIN"];
titleFadeOut 30;


_myposy = getPos player;

while {true} do {

			if (vehicle player == player) then 
			{
				player playMove "CL3_anim_Gathering5";
				waitUntil{animationState player != "CL3_anim_Gathering5";};
			};
			uiSleep 2;


_cme = _cme + 1;
	if(_cme > 4) exitwith { 
		if(([true,"cokeu",1] call life_fnc_handleInv)) then
		{
		titleText["Gathered 1 bag of Coco","PLAIN"];
		}; 
	};

	if( player distance _myposy > 3 ) exitwith { 
			titleText["You moved to far and failed gathering","PLAIN"];
	};

};

} else {
titleText["You are full.","PLAIN"];
titleFadeOut 5;	
};



disableUserInput false;
life_action_inUse = false;