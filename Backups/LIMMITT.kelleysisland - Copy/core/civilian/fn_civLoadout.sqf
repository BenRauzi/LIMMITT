/*
	File: fn_civLoadout.sqf
	Author: Bryan "Tonic" Boardwine
	Edited: Itsyuka
	
	Description:
	Loads the civs out with the default gear.
*/
private["_handle"];
_handle = [] spawn life_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};

player addUniform "JD_LN";

/* ITEMS */
player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "LIMMITT_Network_Phone";
player assignItem "LIMMITT_Network_Phone";

[] call life_fnc_saveGear;

asdih_inv_mobilephone = asdih_inv_mobilephone + 1;