#include "\life_server\script_macros.hpp"

/*
	Heisen
	Searching Black People's Vehicles e.g. Nigero Cars/Trucks
	I WILL REWRITE THIS, RUSHED CODE BTW
*/

//--- Search
fnc_searchVehicle = {

	params [
		["_vehicle",objNull]
	];

	if ((speed _vehicle) >=5) exitWith {
		["Vehicle is too far!",20,"red"] call A3L_fnc_msg;
	};

	["Searching Vehicle",20,"blue"] call A3L_fnc_msg;
	
	foundItems = [];
	{
		if ((_x select 0) IN illegal_items) then {
			foundItems pushback _x;
		};
	} forEach ((_vehicle getVariable "trunk") select 0);
	if (foundItems isEqualTo []) exitWith {
		["No Illegal Items Found!",20,"red"] call A3L_fnc_msg;
	};
	[_vehicle] call fnc_calculateSiezeTotal;
};

//--- Get Total Items Value
fnc_calculateSiezeTotal = {
	params ["_vehicle"];
	foundItemsTotalValue = 0;
	{
		_itemValue = [_x select 0] call fnc_itemSiezeValue;
		foundItemsTotalValue = foundItemsTotalValue + (_itemValue * (_x select 1));
		systemchat str _itemValue;
	} forEach foundItems;
	[format["Illegal Items Found, worth $%1",foundItemsTotalValue],20,"green"] call A3L_fnc_msg;
	
	//--- Add Reward
	gm_memecash = gm_memecash + foundItemsTotalValue;
	
	//--- Vehicle Full Siezure
	_vehicle setVariable ["trunk",[[],0],true];

	foundItems = nil;
	foundItemsTotalValue = nil;
};

//--- Get Item Value
fnc_itemSiezeValue = {
	params [
		["_item",""]
	];
	if (_item isEqualTo "") exitWith {false};
	private _itemArr = [];
	{ _itemArr pushback (_x select 0); } forEach (call sell_array);	
	private _siezeValue = ((call sell_array) select (_itemArr find _item) select 1) / siezeitem_divider;
	_siezeValue;
};
