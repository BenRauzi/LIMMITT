/*
medic siren
medicsiren
*/
private["_vehicle"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

if(isNull _vehicle) exitWith {};
if(isNil {_vehicle getVariable "sirenUC"}) exitWith {};
if(life_nospampls == 1) exitWith {};

life_nospampls = 1;

while {(_vehicle getVariable "sirenUC")} do
{
	if(!(_vehicle getVariable "sirenUC")) exitWith { uiSleep 3; life_nospampls = 0;  };
	if(count (crew (_vehicle)) == 0) exitwith { uiSleep 3; life_nospampls = 0; };
	if(!alive _vehicle) exitWith { uiSleep 3; life_nospampls = 0; };
	if(isNull _vehicle) exitWith { uiSleep 3; life_nospampls = 0; };
	_vehicle say3D "SirenLong";
	uiSleep 5.09;
	if(life_nospampls == 1) then {
		life_nospampls = 0;
	};
	if(!(_vehicle getVariable "sirenUC")) exitWith { uiSleep 3; life_nospampls = 0; };
};

