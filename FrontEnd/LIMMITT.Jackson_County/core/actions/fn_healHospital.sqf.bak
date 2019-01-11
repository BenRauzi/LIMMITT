/*
	File: fn_healHospital.sqf
	Author: Bryan "Tonic" Boardwine
	Revised: Killian
	
	Description:
	NPC healing at hospitals.
*/
if(LIMMITTCASH < 10) exitWith {hint format[localize "STR_NOTF_HS_NoCash",1000];};
titleText[localize "STR_NOTF_HS_Healing","PLAIN"];
uiSleep 8;
if(player distance (_this select 0) > 5) exitWith {titleText[localize "STR_NOTF_HS_ToFar","PLAIN"]};
titleText[localize "STR_NOTF_HS_Healed","PLAIN"];
player setdamage 0;



_price = 1000;



player setVariable ["bleedingon",1,true]; 
player setVariable ["woundedon",1,true]; 
player setVariable ["fractureon",1,true]; 
player setVariable ["unconciouson",1,true]; 
player setVariable ["diseaseon",1,true];