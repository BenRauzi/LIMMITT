/*
Search Words: 
grab shovel
grabshovel
yard work
*/

if (!life_is_arrested) exitwith {
	hint "You cant grab this item";
};

if ((currentWeapon player) != "A3L_Shovel") then {
	player addWeapon "A3L_Shovel";
	hint "You Grabbed a Shovel";
};