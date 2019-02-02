/*
	File: fn_copLoadout.sqf
	Author: Bryan "Tonic" Boardwine
	Edited: Itsyuka
	
	Description:
	Loads the cops out with the default gear.
*/
private["_handle"];
_handle = [] spawn life_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};

//Load player with default cop gear.
player addUniform "JD_Deputy";

// Add shortrange radio
player addItem "tf_anprc152"; 
player assignItem "tf_anprc152";

player addItem "Harris_keyCard";

/* ITEMS */
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "tf_microdagr";
player assignItem "tf_microdagr";
player addItem "ItemGPS";
player assignItem "ItemGPS";

player addWeapon "JD_Taser";
player addMagazine "Taser_mag";


[] call life_fnc_saveGear;

asdih_inv_mobilephone = asdih_inv_mobilephone + 1;