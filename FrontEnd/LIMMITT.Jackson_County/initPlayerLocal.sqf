/*
	File: initPlayerLocal.sqf
	
	Description:
	Starts the initialization of the player.
*/

if(!hasInterface) exitWith {}; //This is a headless client, he doesn't need to do anything but keep being headless..
#define __CONST__(var1,var2) var1 = compileFinal (if(typeName var2 == "STRING") then {var2} else {str(var2)})
__CONST__(BIS_fnc_endMission,BIS_fnc_endMission);
[] execVM "core\init.sqf";

//Execute JIP code.
if((_this select 1)) then {
	[] execVM "core\jip.sqf";
};

pb_positionen = [[10251,10253,0.0014],[10267.2,10260.2,0.0014],[10284.4,10245,0.0014],[10302,10231.2,0.0014],[10288.5,10231.8,0.0014],[10262.5,10218,0.0016],[10248.5,10213.1,0.0014],[10244.2,10208.7,0.0014],[10251.6,10212.6,0.0011],[10254.6,10229.4,0.0013],[10272.7,10230.3,0.00146],[10284.7,10225,0.00126],[10286.3,10222.9,0.0012]];
joinmode = 0;