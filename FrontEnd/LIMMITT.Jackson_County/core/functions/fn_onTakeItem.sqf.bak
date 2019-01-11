/*
	File: fn_onTakeItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Blocks the unit from taking something they should not have.
*/
private["_unit","_item"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_container = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
_item = [_this,2,"",[""]] call BIS_fnc_param;

_personNearby = false;



if(isNull _unit OR _item == "") exitWith {}; //Bad thingies?


if (_container isKindOf "Man" && !alive _container) exitWith {hint "No yoinking from bodies."; [_item,false,false,false,false] call life_fnc_handleItem;};

_isBackpack = getNumber(configFile >> "CfgVehicles" >> _item >> "isBackpack");


if (_isBackpack isEqualTo 1) then {
{
	if (_x != player && isPlayer _x && _x distance player < 20 && (parseNumber((((str backpackContainer _x) splitString " ") select 1))) isEqualTo (parseNumber((((str backpackContainer player) splitString " ") select 1)))) then {
		systemChat "Someone nearby with the same backpack! No Duping!";
		[_item,false,false,false,false] call life_fnc_handleItem;

		_content = format ["%1 [%2] Just got their backpack deleted for trying to dupe with %3 [%4]", name player, getPlayerUID player, name _x, getPlayeruiD _x];
		[[_content],"DB_fnc_logToLogs",false,false] spawn bis_fnc_mp;
	};
} forEach (nearestObjects [player, ["Man"], 25]);
};

 
switch(playerSide) do
{
	case west: {}; //Blah
	case civilian: {
		//Currently stoping the civilians from taking the indep clothing from medics.
		if(_item in ["U_I_CombatUniform"]) then {
			[_item,false,false,false,false] call life_fnc_handleItem;
		};
	};
	case independent: {};
};