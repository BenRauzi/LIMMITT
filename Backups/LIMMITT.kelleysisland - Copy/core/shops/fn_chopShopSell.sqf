/*
	File: fn_chopShopSell.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sells the selected vehicle off.
*/
disableSerialization;
private["_control","_price","_vehicle","_nearVehicles","_price2"];
_control = ((findDisplay 39400) displayCtrl 39402);
_price = _control lbValue (lbCurSel _control);
_vehicle = _control lbData (lbCurSel _control);
_vehicle = call compile format["%1", _vehicle];
_nearVehicles = nearestObjects [getMarkerPos life_chopShop,["Car","Motorbike","Motorcycle","Truck"],25];
_vehicle = _nearVehicles select _vehicle;
if(isNull _vehicle) exitWith {};

["Selling", localize "STR_Shop_ChopShopSelling",  "Success"] call Harris_Notifications;
life_action_inUse = true;
_price2 = LIMMITTCASH + _price;
[[player,_vehicle,_price,_price2],"TON_fnc_chopShopSell",false,false] spawn bis_fnc_mp;
closeDialog 0;