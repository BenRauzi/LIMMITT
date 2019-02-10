class CfgPatches
{
	class babe_int_EHs
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {"A3_armor_F","A3_air_F","A3_Characters_F_BLUFOR","A3_Characters_F","A3_Sounds_F","A3_Data_F","A3_Sounds_F","A3_Anims_F"};
	};
};
class CfgVehicles
{
	class AllVehicles;
	class Air: AllVehicles
	{
		class EventHandlers
		{
			class babe_int_initEH
			{
				init = "(_this select 0) call babe_int_fnc_seats3d";
			};
		};
	};
	class LandVehicle;
	class Car: LandVehicle
	{
		class EventHandlers
		{
			class babe_int_initEH
			{
				init = "(_this select 0) call babe_int_fnc_seats3d";
			};
		};
	};
	class Tank: LandVehicle
	{
		class EventHandlers
		{
			class babe_int_initEH
			{
				init = "(_this select 0) call babe_int_fnc_seats3d";
			};
		};
	};
};
