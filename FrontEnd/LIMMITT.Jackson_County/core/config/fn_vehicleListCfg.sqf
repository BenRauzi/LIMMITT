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
	case "dezzie_car":
	{
		_return = [
			["IVORY_PRIUS",15000],
			["A3L_FordKaBlue",20000],
			["A3L_FordKaRed",20000],
			["A3L_FordKaBlack",20000],
			["A3L_FordKaWhite",20000],
			["A3L_FordKaGrey",20000],
			["DAR_FusionCiv",25000],
			["DAR_FusionCivBlue",25000],
			["IVORY_R8",175000],
			["IVORY_R8SPYDER",175000],
			["IVORY_REV",220000]

		];
	};
	case "super_bikes":
	{
		_return = [
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
	case "civ_lsmovehicle":
	{
		_return = [
			["DAR_H1A",45000],
			["DAR_TahoeCivBlack",30000],
			["cg_audi_rs4_pol_white",30000],
			["A3L_TaurusUC",30000],
			["A3L_Camaro",30000],
			["Nhz_audia8limo",45000],
			["AM_Sexcalade_Custom",30000],
			["A3L_EvoXBlack",30000]

		];
	};
	case "car_montana":
	{
		_return = [
			["critgamin_vangmcc_civ_noir",35000],
			["DAR_H1A",35000],
			["DAR_TahoeCivBlack",30000],
			["B_Quadbike_01_F",3500],
			["I_G_Van_01_fuel_F",80000],
			["B_Heli_Light_01_F",425000],
			["B_G_Van_01_transport_F",50000],
			["B_G_Offroad_01_F",145000],
			["A3L_SuburbanBlack",30000]
			
		];
	};
	case "kart_shop":
	{
		_return = [
			["A3L_Karts",15000],
			["C_Kart_01_Blu_F",15000],
			["C_Kart_01_Fuel_F",15000],
			["C_Kart_01_Red_F",15000],
			["C_Kart_01_Vrana_F",15000]
		];
	};
	case "med_shop":
	{
		_return = [
		
			["evo_ems_CHARGER",500],
			["evo_ems_TAURUS",500],
			["evo_ems_TAHOE",500],
			["GM_EXPLORER_EMS",500],
			["GM_SAVANA_EMS",500],
			["GM_VAN_EMS",500],
			["GM_MUSTANG_EMS",500],
			["GM_EXPLORER_EMSLT",500],
			["GM_EXPLORER_EMSCPT",500],
			["A3L_AmberLamps",500],
			["cg_mercedes_sprinter_ems",500],
			["GM_EXPLORER_FTO",500],
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
	case "exo_car":
	{
		_return = [
			["ADM_1969_charger",100000],
			["DAR_challenger_civBlack",110000],
			["Jonzie_Viper",115000],
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

	case "chev_car":
	{
		_return = [
			["DAR_TahoeCivSilver",135000],
			["DAR_TahoeCivBlue",135000],
			["DAR_TahoeCivRed",135000],
			["DAR_TahoeCivBlack",135000],
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
	case "ford_car":
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
	case "jaguar_car":
	{
		_return = [
		];
	};
	case "dodge_car":
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

	case "merc_car":
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

	case "civ_car":
	{
		_return =
		[
			["Jonzie_Mini_Cooper",20000],
			["Jonzie_Mini_Cooper_R_spec",45000],
			["B_Quadbike_01_F",3500],
			["A3L_Escort",15000],
			["A3L_EscortTaxi",15000],
			["A3L_EscortBlack",15000],
			["A3L_EscortBlue",15000],
			["A3L_EscortWhite",15000],
			["A3L_EscortPink",15000],
			["A3L_GolfVI_Red",32000],
			["A3L_GolfVI_Black",32000],
			["A3L_GolfVI_DarkBlue",32000],
			["A3L_GolfVI_Yellow",32000],
			["A3L_GolfVI_Pink",32000],
			["A3L_GolfVI_Grey",32000],
			["A3L_GolfVI_Purple",32000],
			["A3L_GolfVI_Orange",32000],
	
			
			["A3L_RegalBlack",22500],
			["A3L_RegalBlue",22500],
			["A3L_RegalOrange",22500],
			["A3L_RegalRed",22500],
			["A3L_RegalWhite",22500],
			["DAR_H1A",500000],
			["A3L_JeepWhiteBlack",30000],
			["A3L_JeepGreenBlack",30000],
			["A3L_JeepRedTan",30000],
			["A3L_JeepRedBlack",30000],
			["A3L_JeepGrayBlack",30000],
			["A3L_VolksWagenGolfGTired",40000],
			["A3L_VolksWagenGolfGTiblack",40000],
			["A3L_VolksWagenGolfGTiblue",40000],
			["A3L_VolksWagenGolfGTiwhite",40000],
			["d3s_svr_17_SD4",120000],
			["d3s_svr_17_CHARGED",140000],
			["d3s_svr_17_SVR",160000],
			["AM_73transam_White",55500],
			["AM_73transam_Black",55500],
			["AM_73transam_Red",55500],
			["AM_73transam_Blue",55500],
			["AM_73transam_Green",55500],
			["AM_Holden2_White",90000],
			["AM_Holden2_Black",90000],
			["AM_Holden2_Red",90000],
			["AM_Holden2_Orange",90000],
			["AM_Holden2_Yellow",90000],
			["AM_Holden2_Green",90000],
			["AM_Holden2_Blue",90000],
			["AM_Holden2_Purple",90000],
			["AM_Holden2_Pink",90000],
			["AM_Holden2_Silver",90000],
			["AM_Holden2_Grey",90000],
			["AM_Holden_White",85000],
			["AM_Holden_Black",85000],
			["AM_Holden_Red",85000],
			["AM_Holden_Orange",85000],
			["AM_Holden_Yellow",85000],
			["AM_Holden_Green",85000],
			["AM_Holden_Blue",85000],
			["AM_Holden_Pink",85000],
			["AM_Holden_Purple",85000],
			["AM_Holden_Grey",85000],
			["AM_Holden_Silver",85000],
			["AM_Eldorado_White",80000],
			["AM_Eldorado_Black",80000],
			["AM_Eldorado_Red",80000],
			["AM_Eldorado_Orange",80000],
			["AM_Eldorado_Yellow",80000],
			["AM_Eldorado_Green",80000],
			["AM_Eldorado_Blue",80000],
			["AM_Eldorado_Pink",80000],
			["AM_Eldorado_Purple",80000],
			["AM_Eldorado_Grey",80000],
			["AM_Eldorado_Silver",80000],
			["AM_X5_White",92500],
			["AM_X5_Black",92500],
			["AM_X5_Red",92500],
			["AM_X5_Orange",92500],
			["AM_X5_Yellow",92500],
			["AM_X5_Green",92500],
			["AM_X5_Blue",92500],
			["AM_X5_Pink",92500],
			["AM_X5_Purple",92500],
			["AM_X5_Grey",92500],
			["AM_X5_Silver",92500],
			["AM_Q7_White",100000],
			["AM_Q7_Black",100000],
			["AM_Q7_Red",100000],
			["AM_Q7_Orange",100000],
			["AM_Q7_Yellow",100000],
			["AM_Q7_Green",100000],
			["AM_Q7_Blue",100000],
			["AM_Q7_Pink",100000],
			["AM_Q7_Purple",100000],
			["AM_Q7_Grey",100000],
			["AM_Q7_Silver",100000],
			["A3L_Alfa_Romeo_White",65000],
			["A3L_Alfa_Romeo_Black",65000],
			["A3L_Alfa_Romeo_DarkBlue",65000],
			["A3L_Alfa_Romeo_Red",65000],
			["A3L_Alfa_Romeo_Yellow",65000],
			["A3L_Alfa_Romeo_Pink",65000],
			["A3L_Alfa_Romeo_Grey",65000],
			["A3L_Alfa_Romeo_Purple",65000],
			["A3L_Alfa_Romeo_Orange",65000]
			
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
	case "kavali_car":
	{
		_return = 
		[
			["A3L_MonsterTruck",5000]

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
	case "cop_patrol":
	{
		_return =
		[
			["kw_11rs3_sheriff",1000],
			["kw_06Surburban_sheriff",1000],
			["kw_09Tahoe_SHERIFF",1000],
			["kw_15Charger_SHERIFF",3000],
			["kw_12Charger_SHERIFF",4000],
			["kw_06Victoria_SHERIFF",4000],
			["kw_Explorer_14_SHERIFF",4000],
			["kw_fordRaptor_2017_SHERIFF",5000],
			["kw_Mercedes_GLE450_SHERIFF",5000]
		];
	};
	case "cop_marshals":
	{
		_return =
		[
			["d3s_crown_98_PD",1000],
			["d3s_nemises_taurus_FPI_10",1000],
			["d3s_vklasse_17_COP",1000],
			["d3s_300_12_COP",3000],
			["d3s_charger_15_CPP",4000],
			["d3s_tahoe_PPV_2",4000],
			["d3s_nemises_FPIU_13",4000],
			["d3s_durango_18_DDPI",5000],
			["d3s_cherokee_18_JPPV",5000],
			["d3s_nemises_f90_18_PD",6000],
			["d3s_escalade_16_cop",6000]

		];
	};
	case "cop_doc":
	{
		_return =
		[
			["kw_11rs3_sheriff",1000],
			["kw_06Surburban_sheriff",1000],
			["kw_09Tahoe_SHERIFF",1000],
			["kw_15Charger_SHERIFF",3000],
			["kw_12Charger_SHERIFF",4000],
			["kw_06Victoria_SHERIFF",4000],
			["kw_Explorer_14_SHERIFF",4000],
			["kw_fordRaptor_2017_SHERIFF",5000],
			["kw_Mercedes_GLE450_SHERIFF",5000]
		];
	};
	case "cop_swat":
	{
		_return =
		[
			["kw_sentinal_swat",5000]
			
		];
	};
	case "cop_caruc":
	{
		_return =
		[
			
			["d3s_nemises_explorer_UNM_13",1000],
			["d3s_tahoe_UNM",1000],
			["d3s_nemises_taurus_UNM_10",1000],
			["d3s_300_12_UNM",2000],
			["d3s_cherokee_18_UNM",3000],
			["d3s_charger_15_CPST",3000],
			["d3s_amazing_f10_12_UNM",4000],
			["d3s_vklasse_17_UNM",4000],
			["d3s_f86_15_UNM",4000],
			["d3s_nemises_explorer_UNM_13",4000],
			["d3s_durango_18_UNM",5000],
			["d3s_raptor_UNM_17",5000],		
			["d3s_f86_15_UNM",6000]
		];
    };
	case "civ_air":
	{
		_return =
		[
			["IVORY_T6A_1",300000],
			["bwi_a3_t6a_6",300000],
			["bwi_a3_t6a_nta",300000],
			["bwi_a3_t6a_7",300000],
			["bwi_a3_t6a_9",300000],
			["bwi_a3_t6a_4",300000],
			["C_Heli_Light_01_civil_F",325000],
			["O_Heli_Light_02_unarmed_F",350000],
			["ivory_b206",350000],
			["ivory_b206_news",375000],
			["GNT_C185",1000000]
		];
	};
	case "cop_air":
	{
		_return =
		[
			["ivory_b206_police",25000],
			["B_Heli_Light_01_F",25000],
			["C_Heli_Light_01_civil_F",27500],
			["O_Heli_Light_02_unarmed_F",27500],
			["IVORY_BELL512_POLICE",25000],
			["I_Heli_Transport_02_F",30000],
			["I_Heli_light_03_unarmed_F",30000],
			["EC635_Unarmed",32500],
			["d3s_AS_365_PD",32500],
			["EC635_SAR",32500],
			["NH90",35000]
		];
	};
	case "cop_airhq":
	{
		_return =
		[
			["ivory_b206_police",25000],
			["B_Heli_Light_01_F",25000],
			["C_Heli_Light_01_civil_F",27500],
			["O_Heli_Light_02_unarmed_F",27500],
			["IVORY_BELL512_POLICE",25000],
			["I_Heli_Transport_02_F",30000],
			["I_Heli_light_03_unarmed_F",30000],
			["EC635_Unarmed",32500],
			["EC635_SAR",32500],
			["NH90",35000]
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