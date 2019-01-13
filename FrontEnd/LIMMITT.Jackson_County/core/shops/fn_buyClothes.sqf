/*
	File: fn_buyClothes.sqf
	Author: Bryan "Tonic" Boardwine
	LIMMITTCASH
	Description:
	Buys the current set of clothes and closes out of the shop interface.
*/
private["_price"];
if((lbCurSel 3101) == -1) exitWith {["Error", localize "STR_Shop_NoClothes",  "Failure"] call Harris_Notifications;};
if (clothingCooldown) exitWith {["Slow Down", "You are buying clothes too fast!",  "Failure"] call Harris_Notifications;};

_price = 0;
{
	if(_x != -1) then
	{
		_price = _price + _x;
	};
} foreach life_clothing_purchase;

if(_price > LIMMITTCASH) exitWith {["Error", localize "STR_Shop_NotEnoughClothes",  "Failure"] call Harris_Notifications;};
LIMMITTCASH = LIMMITTCASH - _price;
clothingCooldown = true;

life_clothesPurchased = true;
["Success", "You purchased some clothes Successful",  "Succses"] call Harris_Notifications;
closeDialog 0;

sleep 1;
clothingCooldown = false;