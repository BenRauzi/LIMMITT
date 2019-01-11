/*
	File: fn_buyClothes.sqf
	Author: Bryan "Tonic" Boardwine
	LIMMITTCASH
	Description:
	Buys the current set of clothes and closes out of the shop interface.
*/
private["_price"];
if((lbCurSel 3101) == -1) exitWith {titleText[localize "STR_Shop_NoClothes","PLAIN"];};
if (clothingCooldown) exitWith {hint "You are buying clothes too fast!"};

_price = 0;
{
	if(_x != -1) then
	{
		_price = _price + _x;
	};
} foreach life_clothing_purchase;

if(_price > LIMMITTCASH) exitWith {titleText[localize "STR_Shop_NotEnoughClothes","PLAIN"];};
LIMMITTCASH = LIMMITTCASH - _price;
clothingCooldown = true;

life_clothesPurchased = true;
closeDialog 0;

sleep 1;
clothingCooldown = false;