/*
	File: fn_clothing_bruce.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for Bruce's Outback Outfits.
*/
private["_filter"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"EMS Clothing Shop"];

switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[
		
			["JD_Fireman",nil,0],
			["JD_FDPlain",nil,0],
			["JD_EMSPlain",nil,0],
			["U_C_Paramedic_01_F",nil,0]
		];
	};
	
	//Hats
	case 1:
	{
		[
			["H_Cap_red",nil,0],
			["H_Cap_blu",nil, 0],
			["H_HeadBandage_clean_F",nil,0],
			["JD_BlackCap",nil,0],
			["JD_FirehatBlack",nil,0],
			["JD_FirehatRed",nil,0],
			["TCG_pdav_helmet",nil,0]
		];
	};
	
	//Glasses
	case 2:
	{
		[
			["G_Aviator",nil,0],
			["JD_Mask", nil, 0],
			["G_Aviator", nil, 0],
			["G_Respirator_white_F", nil, 0]
		];
	};
	
	//Vest
	case 3:
	{
		[
			["JD_Tank",nil,0],
			["JD_Medic",nil,0],
			["JD_Vest7",nil,0]
		];
	};
	
	//Backpacks
	case 4:
	{
		[
			["JD_InvPack",nil,0],
			["TRYK_B_Medbag",nil,0],
			["TRYK_B_Medbag_BK",nil,0],
			["TRYK_B_Medbag_OD",nil,0],
			["TRYK_B_Medbag_ucp",nil,0],
			["tf_anprc155",nil,0],
			["koilmedicwhite",nil,0],
			["koilmedicyellow2",nil,0],
			["koilmedicdarkred",nil,0],
			["medicz",nil,0],
			["B_mas_Kitbag_wint",nil,0],
			["B_mas_AssaultPack_wint_ATM",nil,0],
			["B_FieldPack_ocamo",nil,0],
			["B_Carryall_oucamo",nil,0],
			["B_Parachute",nil,0],
			["B_TacticalPack_blk",nil,0]
		];
	};
};
