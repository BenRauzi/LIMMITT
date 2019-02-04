/*
	File: fn_vehShopLicenses.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Checks what shop it is and sometimes the vehicle to determine whether or not they have the license.
	
	Returns:
	TRUE if they have the license or are allowed to get that specific vehicle without having that license.
	FALSE if they don't have the license or are not allowed to obtain that vehicle.
*/
private["_veh","_ret"];
_veh = _this select 0;
_ret = false;

if(_veh == "B_Quadbike_01_F") exitWith {true}; //ATV's don't need to require a license anymore.

switch (life_veh_shop select 0) do
{
	// Civilian Vehicle Stores
	case "civ_secondHand": {_ret = license_civ_driver;};
	case "civ_luxury": {_ret = license_civ_driver;};
	case "civ_mercedesBenz": {_ret = license_civ_driver;};
	case "civ_chevrolet": {_ret = license_civ_driver;};
	case "civ_ford": {_ret = license_civ_driver;};
	case "civ_dodge": {_ret = license_civ_driver;};
	case "civ_truck":	{_ret = license_civ_truck;};
	case "civ_motorcycle": {_ret = license_civ_driver;};
	case "civ_air": {_ret = license_civ_air;};
	case "civ_boat": {_ret = license_civ_boat;};
	case "civ_rebel": {_ret = license_civ_rebel;};
	// Douglas County Sheriff's Office Vehicle Stores
	case "dcso_patrol": {_ret = true;};
	case "dcso_air": {_ret = true;};
	case "dcso_boat": {_ret = true;};
	// Douglas County Fire Department Vehicle Stores
	case "med_shop": {_ret = true;};
	case "med_air_hs": {_ret = license_med_air;};
	case "reb_car": {_ret = license_civ_rebel;};
};

_ret;