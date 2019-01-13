/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Blasting charge is used for the federal reserve vault and nothing  more.. Yet.
*/
private["_vault","_handle"];
_vault = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _vault) exitWith {}; //Bad object
if(typeOf _vault != "Land_CargoBox_V1_F") exitWith {["Error", localize "STR_ISTR_Blast_VaultOnly", "Failure"] call Harris_Notifications;};
if(_vault getVariable["chargeplaced",false]) exitWith {["Error", localize "STR_ISTR_Blast_AlreadyPlaced", "Failure"] call Harris_Notifications;};
if(_vault getVariable["safe_open",false]) exitWith {["Error", localize "STR_ISTR_Blast_AlreadyOpen", "Failure"] call Harris_Notifications;};
if(!([false,"blastingcharge",1] call life_fnc_handleInv)) exitWith {}; //Error?

_vault setVariable["chargeplaced",true,true];
[[1,localize "STR_ISTR_Blast_Placed"],"life_fnc_broadcast",west,false] spawn bis_fnc_mp;
["Info", localize "STR_ISTR_Blast_KeepOff", "Info"] call Harris_Notifications;
_handle = [] spawn life_fnc_demoChargeTimer;
[[],"life_fnc_demoChargeTimer",west,false] spawn bis_fnc_mp;

waitUntil {scriptDone _handle};
uiSleep 0.9;
if(!(fed_bank getVariable["chargeplaced",false])) exitWith {["Disarmed", localize "STR_ISTR_Blast_Disarmed", "Failure"] call Harris_Notifications;};

_bomb = "Bo_GBU12_LGB_MI10" createVehicle [getPosATL fed_bank select 0, getPosATL fed_bank select 1, (getPosATL fed_bank select 2)+0.5];
fed_bank setVariable["chargeplaced",false,true];
fed_bank setVariable["safe_open",true,true];

["Success", localize "STR_ISTR_Blast_Opened", "Success"] call Harris_Notifications;