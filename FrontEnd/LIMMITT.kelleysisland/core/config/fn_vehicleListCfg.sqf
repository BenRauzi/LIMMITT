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
switch (_shop) do {
	// Civilian Vehicle Stores
	case "civ_secondHand": {
		_return = [
			["B_Quadbike_01_F",350],
			["ADM_Ford_F100",5600],
			["ADM_1964_Impala",4370],
			["Jonzie_Mini_Cooper",2690],
			["ADM_GMC_Vandura",7240],
			["DAR_FusionCivBlue",8346],
			["DAR_ChargerCiv",10000]
		];
	};
	case "civ_luxury": {
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
	case "civ_mercedesBenz": {
		_return =
		[
			["kw_audi_q7_black",45000],
			["ks_rs3_11_black",50000],
			["cg_audi_rs5_noir",55000],
			["kw_audis8_black",105000],
			["kw_corvette_c7_black",105000]
		];
	};
	case "civ_chevrolet": {
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
	case "civ_ford": {
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
	case "civ_dodge": {
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
	case "civ_truck": {
		_return =
		[
			["C_van_01_box_f",80000],
	        ["kw_gmc_truck_darkgreen",100000],
	        ["kw_gmc_truck_blue",100000],
	        ["kw_gmc_truck_black",100000],
	        ["kw_gmc_truck_pink",100000]
	        
		];
	};
	case "civ_motorcycle": {
		_return = [
			["JD_Renegade_Black",20000],
			["JD_Renegade_Blue",20000],
			["JD_Renegade_Red",20000],
			["JD_Renegade_Green",20000],
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
	case "civ_air": {
		_return =
		[
			["C_Plane_Civil_01_F",40000],
			["C_Plane_Civil_01_racing_F",80000],
			["C_Heli_Light_01_civil_F",100000],
			["d3s_AS_365",150000]
		];
	};
	case "civ_boat": {
		_return =
		[
			["C_Scooter_Transport_01_F",5000],
			["C_Boat_Transport_02_F",10000],
			["C_Boat_Civil_01_F",20000],
			["A3L_Ship",60000],
			["Kw_Yacht",500000],
			["I_SDV_01_F",300000]
		];
	};
	case "civ_rebel": {
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

	// Douglas County Sheriff's Office Vehicle Stores
	case "dcso_patrol": {
		_return =
		[
			["M_CVPI_NEW",1000],
			["M_CVPI_Slick",1000],
			["JD_CVPI_Skin2",1000],
			["JD_CVPI_U_Skin2",1000],
			["M_FPIS_NEW",2000],
			["M_FPIS_slick",2000],
			["M_Charger12_NEW",4000],
			["M_Charger12_Slick",4000],
			["M_Tahoe_NEW",3000],
			["M_Tahoe_supervisor",3000],
			["JD_PoliceB_1",5000]
		];
	};
	case "dcso_dtu": {
		_return =
		[
			["M_FPIS_UC_Grey",1000],
			["M_FPIS_UC_White",1000],
			["M_CVPI_UC_Black",1000],
			["M_CVPI_UC_Grey",1000],
			["M_CVPI_UC_White",1000],
			["M_Charger12_UC_Black",4000],
			["M_Charger12_UC_Grey",4000],
			["M_Charger12_UC_White",4000],
			["M_Tahoe_UC_White",3000],
			["M_Tahoe_UC_Grey",3000]
		];
	};
	case "dcso_sert": {
		_return =
		[
			["M_CVPI_UC_Black",3000],
			["M_Charger12_UC_Black",3000],
			["M_Tahoe_UC_Black",3000],
			["kw_Suburban_06_Black",3000],
			["kw_Sentinal_SWAT",10000]
		];
	};
	case "dcso_command": {
		_return =
		[
			["M_Silverado_cab",1000],
			["M_Silverado",1000],
			["kw_Suburban_06_Black",1000],
			["kw_SUV_Black",1000],
			["JD_PoliceB_1",1000]
		];
	};
	case "dcso_air": {
		_return =
		[
			["MELB_MH6M",10000],
			["O_Heli_Light_02_unarmed_F",30000],
			["ds3_AS_365_PD",30000]
		];
	};
	case "dcso_boat": {
		_return =
		[
			["B_Boat_Transport_01_F",4000],
			["C_Boat_Civil_01_police_F",5000]
		];
	};

	// Douglas County Fire Department Vehicle Stores
	case "dcfd_patrol": {
		_return = [
			["M_Ambulance",2000],
			["M_Tahoe_EMS",3000],
		];
	};
	case "dcfd_fd": {
		_return = [
			["Fox_HeavyRescue",2000],
			["Fox_HeavyRescue2",3000],
			["Fox_ArrowXTLadder",3000],
			["Fox_Firetruck",3000],
			["JD_F350_Red",3000],
			["M_Tahoe_EMS",3000],
		];
	};
	case "dcfd_air": {
		_return = [
			["EMS_Chopper",5000],
			["d3s_HH_65",10000]
		];
	};
};

_return;