#include <macro.h>
/*
	give a key givekey1
*/
private["_house","_uid","_action","_houseCfg"];
_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

if(LIMMITTCASH < 50000) exitWith { hint "You need $50000 dollars to create a permanent key."; };


if(isNull _house) exitWith {};
if(!(_house isKindOf "House_F")) exitWith {};

		_radius = 10;
		_sidecheck = civilian;
		_side = civilian;
		_nearestunits = nearestObjects [player,["Man"],_radius];
		_nearestunitofside = [];

				{
					_unit = _x;
					if (side _unit == _sidecheck && (isPlayer _unit) && _unit != player) then 
						{
							_nearestunitofside = _nearestunitofside + [_unit]
						};
				} foreach _nearestunits;


_nameshare = name (_nearestunitofside select 0);
_shared1 = getPlayerUID (_nearestunitofside select 0);
if(isNil "_shared1") then {
	hint "Error - no player is close enough.";
} else {
	hint format ["House keys given to user ID %1 -- %2", _shared1, _nameshare];
	[[_house,_shared1],"TON_fnc_dogivekey1",false,false] spawn bis_fnc_mp;
	LIMMITTCASH = LIMMITTCASH - 50000;
	_house setVariable["shared1",true,true];	
};