/*
	File: fn_clothing_reb.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for Reb shop.
*/
private["_filter"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Rebel Shop"];






switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[

			["U_B_T_Soldier_F",nil,6000],
			["U_B_T_Soldier_AR_F",nil,6000],
			["U_I_CombatUniform",nil,6000],
			["U_B_CTRG_Soldier_F",nil,6000],
			["U_B_CTRG_Soldier_3_F",nil,6000]
		];
	};
	
	//Hats
	case 1:
	{
		[
			["H_MilCap_ghex_F",nil,1000],
			["TRYK_H_Booniehat_MARPAT_WOOD",nil,1000],
			["TRYK_H_Booniehat_AOR1",nil,1000],
			["TRYK_H_Booniehat_JSDF",nil,1000],
			["H_Bandanna_camo",nil,650],
			["H_Shemag_olive",nil,650],
			["TRYK_Kio_Balaclava","Ghost Balaclava",15000],
			["H_HelmetB_light_black",nil,30000],
			["H_HelmetSpecB_snakeskin",nil,30000]
		];
	};
	
	//Glasses
	case 2:
	{
		[
			["G_Shades_Black",nil,50],
			["G_Shades_Blue",nil,50],
			["G_Sport_Blackred",nil,50],
			["G_Sport_Checkered",nil,50],
			["G_Sport_Blackyellow",nil,50],
			["G_Sport_BlackWhite",nil,50],
			["G_Squares",nil,50],
			["G_Lowprofile",nil,50],
			["G_Combat",nil,50],
			["G_Balaclava_blk",nil,800],
			["G_Balaclava_combat",nil,800],
			["G_Balaclava_lowprofile",nil,800],
			["A3L_Balaclava",nil,800]
		];
	};
	
	//Vest
	case 3:
	{
		[
			["V_TacVest_camo",nil,18500],
			["V_TacVest_darkblck",nil,18500],
			["V_TacVest_brn",nil,18500],
			["REB_vest_base",nil,15000],
			["V_TacVest_oli",nil,15000],
			["TRYK_V_Bulletproof_BLK",nil,18500],
			["V_BandollierB_oli",nil,30000]
		];
	};
	
	//Backpacks
	case 4:
	{
		[
			["B_AssaultPack_cbr",nil,3000],
			["TRYK_B_tube_blk",nil,3000],
			["B_FieldPack_ocamo",nil,3000],
			["B_TacticalPack_oli","Olive Bergen",4500],
			["B_Bergen_sgg","Sage Bergen",4500],
			["B_Carryall_oli","Olive Carryall",5000],
			["B_Carryall_khk","Khaki Carryall",5000],
			//Camo Packs
			["B_AssaultPack_mcamo","MTP Assault Pack",4500],
			["TRYK_B_AssaultPack_MARPAT_Wood","MARPAT Assault Pack",5000],
			["TRYK_B_AssaultPack_Type2camo","Jungle Assault Pack",5000],
			["TRYK_B_Kitbag_Base_JSDF","Jungle Kitbag",5000],
			["B_Kitbag_mcamo","MTP Kitbag",5000],
			//Belts
			["TRYK_B_Belt_AOR2",nil,3000],
			["TRYK_B_Belt_CYT",nil,3000],
			["TRYK_B_Belt_GR",nil,3000]

		];
	};
};