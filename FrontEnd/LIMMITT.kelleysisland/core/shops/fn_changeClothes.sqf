/*
	File: fn_changeClothes.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Used in the clothing store to show a 'preview' of the piece of clothing.
*/
disableSerialization;
private["_control","_selection","_data","_price","_total","_totalPrice"];
_control = (_this select 0) select 0;
_selection = (_this select 0) select 1;
_price = (findDisplay 3100) displayCtrl 3102;
_total = (findDisplay 3100) displayCtrl 3106;
if(_selection == -1) exitWith {["Error", localize "STR_Shop_NoSelection",  "Error"] call Harris_Notifications;};
if(isNull _control) exitWith {["Error", localize "STR_Shop_NoDisplay",  "Error"] call Harris_Notifications;};
if(life_cMenu_lock) exitWith {};
life_cMenu_lock = true;

life_clothing_purchase set[life_clothing_filter,(_control lbValue _selection)];

_data = _control lbData _selection;

[_data,true,nil,nil,nil,nil,nil,true] call life_fnc_handleItem;
life_cMenu_lock = false;
_price ctrlSetStructuredText parseText format [(localize "STR_GNOTF_Price")+ " <t color='#8cff9b'>$%1</t>",[(_control lbValue _selection)] call life_fnc_numberText];

_totalPrice = 0;
{
	if(_x != -1) then
	{
		_totalPrice = _totalPrice + _x;
	};
} foreach life_clothing_purchase;

_total ctrlSetStructuredText parseText format [(localize "STR_Shop_Total")+ " <t color='#8cff9b'>$%1</t>",[_totalPrice] call life_fnc_numberText];