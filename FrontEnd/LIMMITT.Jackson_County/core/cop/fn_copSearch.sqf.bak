#include <macro.h>
/*
	File: fn_copSearch.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Returns information on the search.
*/

life_action_inUse = false;
if(side player == civilian) then {
private["_civ","_invs","_license","_robber","_guns","_gun","_cop"];
_civ = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_invs = [_this,1,[],[[]]] call BIS_fnc_param;
_cop = [_this,2,false,[false]] call BIS_fnc_param;
drug_fuck = 1;
turtle_fuck = 1;
uiSleep 1;



totaldrugs = asdih_inv_methu + asdih_inv_methp + asdih_inv_cokeu + asdih_inv_cokep + asdih_inv_heroinu + asdih_inv_heroinp + asdih_inv_cannabis + asdih_inv_marijuana;

if(asdih_inv_methu > 0) then {[false,"methu",asdih_inv_methu] call life_fnc_handleInv; drug_fuck = 2;};
if(asdih_inv_methp > 0) then {[false,"methp",asdih_inv_methp] call life_fnc_handleInv; drug_fuck = 2;};
if(asdih_inv_cokeu > 0) then {[false,"cokeu",asdih_inv_cokeu] call life_fnc_handleInv; drug_fuck = 2;};
if(asdih_inv_cokep > 0) then {[false,"cokep",asdih_inv_cokep] call life_fnc_handleInv; drug_fuck = 2;};
if(asdih_inv_heroinu > 0) then {[false,"heroinu",asdih_inv_heroinu] call life_fnc_handleInv; drug_fuck = 2;};
if(asdih_inv_heroinp > 0) then {[false,"heroinp",asdih_inv_heroinp] call life_fnc_handleInv; drug_fuck = 2;};
if(asdih_inv_cannabis > 0) then {[false,"cannabis",asdih_inv_cannabis] call life_fnc_handleInv; drug_fuck = 2;};
if(asdih_inv_marijuana > 0) then {[false,"marijuana",asdih_inv_marijuana] call life_fnc_handleInv; drug_fuck = 2;};

totalturtles = asdih_inv_turtle;

if(asdih_inv_turtle > 0) then {[false,"turtle",asdih_inv_turtle] call life_fnc_handleInv; turtle_fuck = 2;};



[[0,format["%1 was just searched.",name player, _cop]],"life_fnc_broadcast",(position player) nearEntities [["Man"], 10],false] spawn bis_fnc_mp; 

if(turtle_fuck == 2) then {
	[[0,format["%1 was found with %2 turtles in their possession.",name player, totalturtles]],"life_fnc_broadcast",(position player) nearEntities [["Man"], 10],false] spawn bis_fnc_mp; 
};
if(drug_fuck == 2) then {
	[[0,format["%1 was found with %2 drugs in their possession.",name player, totaldrugs]],"life_fnc_broadcast",(position player) nearEntities [["Man"], 10],false] spawn bis_fnc_mp; 
} else {
	[[0,format["%1 was found with no illegal drugs.",name player]],"life_fnc_broadcast",(position player) nearEntities [["Man"], 10],false] spawn bis_fnc_mp; 
};


[false,"blastingcharge",asdih_inv_marijuana] call life_fnc_handleInv;
[false,"boltcutter",asdih_inv_marijuana] call life_fnc_handleInv;
[false,"spikeStrip",asdih_inv_marijuana] call life_fnc_handleInv;
[false,"roadcone",asdih_inv_marijuana] call life_fnc_handleInv;
[false,"mRoadConeStripB",asdih_inv_marijuana] call life_fnc_handleInv;
[false,"RoadConeB",asdih_inv_marijuana] call life_fnc_handleInv;
[false,"RoadConeStrip",asdih_inv_marijuana] call life_fnc_handleInv;
[false,"RoadCone",asdih_inv_marijuana] call life_fnc_handleInv;
[false,"RoadBlockWood",asdih_inv_marijuana] call life_fnc_handleInv;
[false,"RoadBlockConc",asdih_inv_marijuana] call life_fnc_handleInv;
[false,"RoadBlockRebel",asdih_inv_marijuana] call life_fnc_handleInv;



hint localize "Searching Completed... all illegal items removed.";
[5] call SOCK_fnc_updatePartial;

};



