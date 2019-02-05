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
	case "civ_secondHand": {_ret = license_civ_driver;};
	case "civ_luxury": {_ret = license_civ_driver;};
	case "civ_mercedesBenz": {_ret = license_civ_driver;};
	case "civ_chevrolet": {_ret = license_civ_driver;};
	case "civ_ford": {_ret = license_civ_driver;};
	case "civ_dodge": {_ret = license_civ_driver;};
	case "civ_motorcycle": {_ret = license_civ_driver;};
	case "dcso_patrol": {_ret = true;};
	case "dcso_air": {_ret = true;};
	case "med_shop": {_ret = true;};
	case "super_bikes": {_ret = license_civ_driver;};
	case "dezzie_car": {_ret = license_civ_driver;};
	case "kart_shop": {_ret = license_civ_driver;};
	case "med_air_hs": {_ret = license_med_air;};
	case "civ_car": {_ret = license_civ_driver;};
	case "ford_car": {_ret = license_civ_driver;};
	case "jaguar_car": {_ret = license_civ_driver;};
	case "chev_car": {_ret = license_civ_driver;};
	case "moto_car": {_ret = license_civ_driver;};
	case "dodge_car": {_ret = license_civ_driver;};
	case "merc_car": {_ret = license_civ_driver;};
	case "exo_car": {_ret = license_civ_driver;};
	case "kavali_car": {_ret = license_civ_driver;};
	case "civ_ship": {_ret = license_civ_boat;};
	case "civ_air": {_ret = license_civ_air;};
	case "cop_air": {_ret = true;};
	case "cop_airhq": {_ret = true;};
	case "civ_truck":	{_ret = license_civ_truck;};
	case "reb_car": {_ret = license_civ_rebel;};
	case "car_montana": {_ret = license_civ_strife;};
	case "cop_swat": {_ret = true;};
	case "cop_caruc": {_ret = true;};
	case "cop_ia": {_ret = true;};
	case "cop_marshals": {_ret = true;};
	case "cop_doc": {_ret = true;};
	case "cop_command": {_ret = true;};
	case "civ_lsmovehicle": {_ret = true;};
	case "cop_ship": 
	{
		if(_veh == "B_Boat_Armed_01_minigun_F") then
		{
			_ret = license_cop_cg;
		}
			else
		{
			_ret = true;
		};
	};
};

_ret;