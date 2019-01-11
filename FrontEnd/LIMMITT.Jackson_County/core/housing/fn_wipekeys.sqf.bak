#include <macro.h>
/*
	give a key wipekeys
*/
private["_house","_uid","_action","_houseCfg"];
_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

if(isNull _house) exitWith {};
if(!(_house isKindOf "House_F")) exitWith {};

if(LIMMITTCASH < 50000) exitWith { hint "You need $50000 dollars to change the locks."; };

LIMMITTCASH = LIMMITTCASH - 50000;


_house setVariable["shared1",nil,true];
_house setVariable["shared2",nil,true];
_house setVariable["shared3",nil,true];
_house setVariable["shared4",nil,true];
_house setVariable["shared5",nil,true];

hint "Keys have been wiped, for people online with a set of keys, their keys will be removed on restart.";
[[_house],"TON_fnc_dowipekeys",false,false] spawn bis_fnc_mp;

