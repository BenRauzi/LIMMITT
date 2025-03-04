#include <macro.h>
/*
	File: fn_virt_sell.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sell a virtual item to the store / shop
*/
private["_type","_index","_price","_var","_amount","_name"];
if((lbCurSel 2402) == -1) exitWith {};
_type = lbData[2402,(lbCurSel 2402)];
_index = [_type,__GETC__(sell_array)] call fnc_index;
if(_index == -1) exitWith {};
_price = (__GETC__(sell_array) select _index) select 1;
_var = [_type,0] call life_fnc_varHandle;

_amount = ctrlText 2405;
if(!([_amount] call fnc_isnumber)) exitWith {["Error", localize "STR_Shop_Virt_NoNum", "Failure"] call Harris_Notifications;};
_amount = parseNumber (_amount);
if(_amount > (missionNameSpace getVariable _var)) exitWith {["Error", localize "STR_Shop_Virt_NoNum", "Failure"] call Harris_Notifications;};

_price = (_price * _amount);
_name = [_var] call life_fnc_vartostr;

if(([false,_type,_amount] call life_fnc_handleInv)) then
{

	["Success", format[localize "STR_Shop_Virt_SellItem",_amount,_name,[_price] call life_fnc_numberText], "Success"] call Harris_Notifications;

	_content = format ["%1 sold %2 %3 for $%4", name player, str _amount, str _name, str _price];
	[[_content],"DB_fnc_logToLogs",false,false] spawn bis_fnc_mp;

	LIMMITTCASH = LIMMITTCASH + _price;
	[] call life_fnc_virt_update;

	
};

if(life_shop_type == "heroin") then
{
	private["_array","_ind","_val"];
	_array = life_shop_npc getVariable["sellers",[]];
	_ind = [getPlayerUID player,_array] call fnc_index;
	if(_ind != -1) then
	{
		_val = (_array select _ind) select 2;
		_val = _val + _price;
		_array set[_ind,[getPlayerUID player,profileName,_val]];
		life_shop_npc setVariable["sellers",_array,true];
	}
		else
	{
		_array set[count _array,[getPlayerUID player,profileName,_price]];
		life_shop_npc setVariable["sellers",_array,true];
	};
};

[0] call SOCK_fnc_updatePartial;