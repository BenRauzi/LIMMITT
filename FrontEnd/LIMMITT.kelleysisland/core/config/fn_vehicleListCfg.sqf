#include <macro.h>
/*
	File:
	Author: Bryan "Tonic" Boardwine

	Description:
	Master configuration list / array for buyable vehicles & prices and their shop.
*/
private["_shop","_return"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {[]};
_return = [];
switch (_shop) do
{
	// Civilian Vehicle Stores
	case "civ_secondHand":
	{
		_return = [
			["B_Quadbike_01_F",350],
			["A3L_Escort",720],
			["A3L_EscortTaxi",720],
			["A3L_EscortBlack",720],
			["A3L_EscortBlue",720],
			["A3L_EscortWhite",720],
			["ADM_Ford_F100",5600],
			["ADM_1964_Impala",4370],
			["Jonzie_Mini_Cooper",2690],
			["ADM_GMC_Vandura",7240],
			["DAR_FusionCivBlue",8346],
			["DAR_ChargerCiv",10000]
		];
	};
	case "civ_luxury":
	{
		_return = [
			["kw_db9_blue",125000],
			["kw_db9_silver",130000],
			["kw_db9_black",130000],
			["kw_audir8_liberty_black",160000],
			["kw_audir8_liberty_black",160000],
			["kw_R8_blue",160000],
			["kw_R8_grey",165500],
			["kw_R8_pink",166000],
			["kw_R8_urban",100000], 
			["kw_corvette_c7_black",100000],
			["kw_corvette_c7_silver",100000],
			["kw_corvette_c7_blue",100000],
			["kw_corvette_c7_purple",100000],
			["kw_corvette_c7_grey",100000]
		];
	};
	case "civ_mercedesBenz":
	{
		_return =
		[
			["kw_audi_q7_black",45000],
			["ks_rs3_11_black",50000],
			["cg_audi_rs5_noir",55000],
			["kw_audis8_black",105000],
			["kw_corvette_c7_black",105000]
		];
	};
	case "civ_chevrolet":
	{
		_return = [
			["A3L_SuburbanWhite",195000],
			["A3L_SuburbanBlue",195000],
			["A3L_SuburbanRed",195000],
			["A3L_SuburbanBlack",195000],
			["A3L_SuburbanGrey",195000],
			["A3L_SuburbanOrange",195000],
			["D_Cobalt_Blue",32500],
			["D_Cobalt_DarkRed",32500],
			["D_Cobalt_Granite",32500],
			["D_Cobalt_Red",32500],
			["D_Cobalt_White",32500],
			["D_Cobalt_Yellow",32500],
			["DAR_ImpalaCivA",30000],
			["DAR_ImpalaCivB",30000],
			["DAR_ImpalaCivD",30000],
			["DAR_ImpalaCiv",30000],
			["DAR_ImpalaCivE",30000],
			["DAR_ImpalaCivG",30000],
			["DAR_ImpalaCivF",30000],
			["A3L_Camaro",200000],
			["AM_15Suburban_White",150000],
			["AM_15Suburban_Black",150000],
			["AM_15Suburban_Red",150000],
			["AM_15Suburban_Blue",150000],
			["AM_15Suburban_Green",150000]
		];
	};
	case "civ_ford":
	{
		_return = [
			["kw_67Mustang_black",25000],
			["kw_Victoria_06_black",60000],
			["kw_Victoria_06_blue",70000],
			["kw_Victoria_06_silver",80000],
			["kw_explorer_14_black",85000],
			["kw_explorer_14_blue",90000],
			["kw_explorer_14_silver",45000],
			["kw_Ford_Raptor_SVT",50000],
			["kw_Ford_Raptor_SVT_Blue",147500],
			["kw_Ford_Raptor_SVT_Black",152500],
			["kw_Ford_Raptor_SVT_Red",155000],
			["kw_ford_focusrs_grey",70000],
			["kw_taurus_10_black",60000],
			["kw_taurus_10_blue",60000]
		];
	};
	case "civ_dodge":
	{
		_return =
		[
			["kw_challenger_16_silver",45000],
			["kw_challenger_16_camo",75000],
			["kw_challenger_16_blue",85000],
			["kw_challenger_16_green",95000],
			["kw_challenger_16_pink",105000],
			["kw_challenger_16_black",100000],
			["kw_charger_15_black",95000],
			["kw_charger_15_blue",45000],
			["kw_charger_15_darkred",50000],
			["kw_charger_15_yellow",55000],
			["kw_charger_15_green",55000],
			["kw_charger_15_pink",55000],
			["kw_viper_08_black",55000],
			["kw_viper_08_darkred",55000],
			["kw_viper_08_white",55000],
			["kw_viper_08_urban",55000]
		];
	};
	case "civ_truck":
	{
		_return =
		[
			["C_van_01_box_f",80000],
	        ["kw_gmc_truck_darkgreen",100000],
	        ["kw_gmc_truck_blue",100000],
	        ["kw_gmc_truck_black",100000],
	        ["kw_gmc_truck_pink",100000]
	        
		];
	};
	case "civ_motorcycle":
	{
		_return = [
			["kw_xr_silver",100000],
			["kw_xr_flame",100000],
			["kw_xr_camo_urban",100000],
			["kw_xr_aqua",100000],
			["kw_xr_camo",100000],
			["kw_xr_white",100000],
			["kw_xr_light_blue",100000],
			["kw_xr_black",100000],
			["kw_xr_baby_pink",100000]
		];
	};

	// Douglas County Sheriff's Office Vehicle Stores
	case "dcso_patrol":
	{
		_return =
		[
			["JD_CVPI_Skin2",1000],
			["JD_CVPI_U_Skin2",1000],
			["JD_CVPI_White",1000],
			["JD_CVPI_U_White",1000],
			["JD_CVPI_Black",1000],
			["JD_CVPI_U_Black",1000],
			["JD_PoliceB_1",2000],
			["kw_06Surburban_sheriff",4000],
			["kw_09Tahoe_SHERIFF",4000],
			["kw_15Charger_SHERIFF",4000],
			["kw_Explorer_14_SHERIFF",4000],
			["kw_fordRaptor_2017_SHERIFF",8000],
			["kw_sentinal_swat",10000]
		];
	};
	case "dcso_air":
	{
		_return =
		[
			["B_Heli_Light_01_F",25000],
			["I_Heli_Transport_02_F",30000],
			["I_Heli_light_03_unarmed_F",30000],
			["EC635_Unarmed",32500],
			["d3s_AS_365_PD",32500],
			["EC635_SAR",32500]
		];
	};




	case "civ_lsmovehicle":
	{
		_return = [
			["DAR_H1A",15000],
			["DAR_TahoeCivBlack",15000],
			["cg_audi_rs4_pol_white",15000],
			["A3L_TaurusUC",15000],
			["A3L_Camaro",15000],
			["Nhz_audia8limo",15000],
			["AM_Sexcalade_Custom",15000],
			["A3L_EvoXBlack",15000]

		];
	};
	case "kart_shop":
	{
		_return = [
			["A3L_Karts",2000],
			["C_Kart_01_Blu_F",2000],
			["C_Kart_01_Fuel_F",2000],
			["C_Kart_01_Red_F",2000],
			["C_Kart_01_Vrana_F",2000]
		];
	};
	case "med_shop":
	{
		_return = [
		
			["KW_Taurus_10_TAC",500],
			["KW_11RS3_EMS",500],
			["KW_12M5_EMS",500],
			["KW_06Suburban_FD",500],
			["KW_15Charger_EMS",500],
			["KW_12Charger_EMS",500],
			["KW_06Victoria_FD",500],
			["cg_merc_atego_firetruck_reg",500],
			["kw_Ford_Raptor_2017_Sheriff ",500],
			["JD_F350_Red",500]
			
		];
	};
	case "med_air_hs": {
		_return = [
			["EMS_Chopper",500],
			["EMS_Orca",500],
			["IVORY_BELL512_RESCUE",500],
			["ivory_b206_rescue",500],
			["RobJ_Rescue1",500]
		];
	};
	case "civ_motorbike":
	{
		_return =
		[
			["kw_xr_silver",250000],
			["kw_xr_flame",250000],
			["kw_xr_camo_urban",250000],
			["kw_xr_aqua",250000],
			["kw_xr_camo",250000],
			["kw_xr_white",250000],
			["kw_xr_light_blue",250000],
			["kw_xr_black",250000],
			["kw_xr_baby_pink",250000]
		];
	};
	case "reb_car":
	{
		_return =
		[
			["B_Quadbike_01_F",3500],
			["I_G_Van_01_fuel_F",80000],
			["B_Heli_Light_01_F",425000],
			["B_G_Van_01_transport_F",50000],
			["B_G_Offroad_01_F",145000]
		];

		if(license_civ_rebel) then
		{
		};
	};
	case "cop_marshals":
	{
		_return =
		[
		];
	};
	case "cop_doc":
	{
		_return =
		[
		];
	};
	case "cop_swat":
	{
		_return =
		[
		];
	};
	case "cop_caruc":
	{
		_return =
		[
		];
    };
	case "civ_air":
	{
		_return =
		[
			["C_Plane_Civil_01_F",50000],
			["C_Heli_Light_01_civil_F",250000],
			["d3s_AS_365",150000]
		];
	};
	case "cop_air":
	{
		_return =
		[
			["B_Heli_Light_01_F",25000],
			["I_Heli_Transport_02_F",30000],
			["I_Heli_light_03_unarmed_F",30000],
			["EC635_Unarmed",32500],
			["d3s_AS_365_PD",32500],
			["EC635_SAR",32500]
		];
	};
	case "cop_airhq":
	{
		_return =
		[
			["B_Heli_Light_01_F",25000],
			["I_Heli_Transport_02_F",30000],
			["I_Heli_light_03_unarmed_F",30000],
			["EC635_Unarmed",32500],
			["d3s_AS_365_PD",32500],
			["EC635_SAR",32500]
		];
	};
	case "civ_ship":
	{
		_return =
		[
			["C_Rubberboat",30000],
			["C_Boat_Civil_01_F",135000],
			["A3L_Ship",625000],
			["A3L_SpeedYacht",675000],
			["A3L_Jetski",115000],
			["B_SDV_01_F",225000],
			["kw_yacht",115000]
		];
	};
	case "cop_ship":
	{
		_return =
		[
			["B_Boat_Transport_01_F",4000],
			["B_SDV_01_F",4500],
			["C_Boat_Civil_01_police_F",5000]
		];
	};
};

_return;