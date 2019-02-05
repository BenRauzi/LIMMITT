/*
	File: fn_removeLicenses.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Used for stripping certain licenses off of civilians as punishment.
*/
private["_state"];
_state = [_this,0,1,[0]] call BIS_fnc_param;

switch (_state) do
{
	//Death while being wanted
	case 0:
	{
		license_civ_rebel = false;
		license_civ_driver = false;
		player setVariable ["LicenseDriver", false, true];
		license_civ_heroin = false;
		license_civ_marijuana = false;
		license_civ_coke = false;
		license_civ_MDMA = false;
	};
	
	//Jail licenses
	case 1:
	{
		license_civ_gun = false;
		license_civ_rebel = false;
		license_civ_driver = false;
		player setVariable ["LicenseDriver", false, true];
		license_civ_meth = false;
		license_civ_heroin = false;
		license_civ_marijuana = false;
		license_civ_coke = false;
		license_civ_MDMA = false;
	};
	
	//Remove motor vehicle licenses
	case 2:
	{
		if(license_civ_driver OR license_civ_air OR license_civ_truck OR license_civ_boat) then {
			license_civ_driver = false;
			player setVariable ["LicenseDriver", false, true];
			license_civ_air = false;
			license_civ_truck = false;
			license_civ_boat = false;
			["Success", localize "STR_Civ_LicenseRemove_1", "Success"] call Harris_Notifications;
		};
	};
	
	//Killing someone while owning a gun license
	case 3:
	{
		if(license_civ_gun) then {
			license_civ_gun = false;
			["Success", localize "STR_Civ_LicenseRemove_2", "Success"] call Harris_Notifications;
		};
	};
	
	// Revoking Licenses
	
	// Drivers License
	case 10:
	{
		license_civ_driver = false;
		player setVariable ["LicenseDriver", false, true];
		["Success", localize "STR_Civ_RevokeLicense_Driver", "Success"] call Harris_Notifications;
	};
	// Truck License
	case 11:
	{
		license_civ_truck = false;
		["Success", localize "STR_Civ_RevokeLicense_Truck", "Success"] call Harris_Notifications;
	};
	// Pilot License
	case 12:
	{
		license_civ_air = false;
		["Success", localize "STR_Civ_RevokeLicense_Pilot", "Success"] call Harris_Notifications;
	};
	// Boating License
	case 13:
	{
		license_civ_boat = false;
		["Success", localize "STR_Civ_RevokeLicense_Boating", "Success"] call Harris_Notifications;
	};
	// Diving License
	case 14:
	{
		license_civ_dive = false;
		["Success", localize "STR_Civ_RevokeLicense_Diving", "Success"] call Harris_Notifications;
	};
	// Taxi License
	case 15:
	{
		license_civ_taxi = false;
		["Success", localize "STR_Civ_RevokeLicense_Taxi", "Success"] call Harris_Notifications;
	};
	// All Motor Vehicle
	case 16:
	{
		license_civ_driver = false;
		player setVariable ["LicenseDriver", false, true];
		license_civ_truck = false;
		license_civ_air = false;
		license_civ_boat = false;
		license_civ_air = false;
		license_civ_dive = false;
		license_civ_taxi = false;
		["Success", localize "STR_Civ_RevokeLicense_AllMotor", "Success"] call Harris_Notifications;
	};
	// Firearms License
	case 17:
	{
		license_civ_gun = false;
		["Success", localize "STR_Civ_RevokeLicense_Firearm", "Success"] call Harris_Notifications;
	};
};