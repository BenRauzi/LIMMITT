/*
Search Words: 
grab shovel
grabshovel
yard work
*/

if (!life_is_arrested) exitwith {
	["Error", "You cant grab this item", "Failure"] call Harris_Notifications;
};

if ((currentWeapon player) != "A3L_Shovel") then {
	player addWeapon "A3L_Shovel";
	["Success", "You Grabbed a Shovel", "Success"] call Harris_Notifications;
};