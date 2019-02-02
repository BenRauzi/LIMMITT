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
ctrlSetText[3103,"Bruce's Outback Outfits"];

switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[
		["U_C_Scientist","Hazmat Suit",30000],
		
		["KAEL_SUITS_BR_F12",nil,17500],

		["A3L_Suit_Uniform","Suit",13500],
		["KAEL_SUITS_BLK_F",nil,13500],
		["KAEL_SUITS_BR_F",nil,13500],
		["KAEL_SUITS_BR_F3",nil,13500],
		["KAEL_SUITS_BR_F4",nil,13500],
		["KAEL_SUITS_BR_F5",nil,13500],
		["KAEL_SUITS_BR_F6",nil,13500],
		["KAEL_SUITS_BR_F7",nil,13500],
		["KAEL_SUITS_BR_F8",nil,13500],
		["KAEL_SUITS_BR_F9",nil,13500],
		["KAEL_SUITS_BR_F10",nil,13500],
		["KAEL_SUITS_BR_F11",nil,13500],
		["KAEL_SUITS_BR_F13",nil,13500],
		["KAEL_SUITS_BR_F14",nil,13500],

		["TRYK_SUITS_BLK_F","TRYK Black Suit",13500],
		["TRYK_SUITS_BR_F","TRYK Brown Suit",13500],


		["TRYK_U_B_PCUODHs",nil,2500],
		["TRYK_U_B_PCUGHs",nil,2500],
		["TRYK_U_B_PCUHs",nil,2500],

		["TRYK_U_B_BLOD_T","Black T Green P",500],
		["TRYK_U_B_BLKTAN_CombatUniform","Black T Tan P",700],
		["TRYK_U_B_BLKTANR_CombatUniformTshirt","Black T Tan P II",700],
		["TRYK_U_B_BLTAN_T","Black T Dark Tan P",500],
		["TRYK_U_B_fleece_UCP","Leader",500],
		["TRYK_U_B_ODTANR_CombatUniformTshirt","Green T Tan P",800],
		["TRYK_U_B_PCUGs_OD","Jeans Green Hood",800],
		["TRYK_U_B_PCUGs_gry","Jeans Gray Hood ",800],
		["TRYK_U_B_PCUGs_BLK","Jeans Black Hood",800],
		["TRYK_U_B_C02_Tsirt","Baggy Jeans + Black T",500],
		["TRYK_OVERALL_SAGE_BLKboots_nk","Coveralls Green",400],
		["TRYK_OVERALL_nok_flesh","Coveralls Tan",400],
		["TRYK_U_B_wh_blk_Rollup_CombatUniform","White T Black Cargos",700],
		["TRYK_U_B_wh_tan_Rollup_CombatUniform","White T Tan Cargos",700],
		["TRYK_U_pad_hood_Blk","Black Hood Tan Cargos",1000],
		["TRYK_U_denim_hood_blk","Black Hood Jeans II",1500],
		["TRYK_U_denim_jersey_blk","Black T & Jeans",1000],
		["TRYK_U_denim_jersey_blu","Blue T & Jeans",1000],
		["TRYK_U_denim_hood_nc","Green Hood & Jeans",1000],
		["TRYK_U_taki_wh","Tan Mid East",1000],
		["TRYK_U_taki_BLK","Black Mid East",1000],
		["TRYK_U_taki_COY","Brown Mid East ",1000],

		["TRYK_U_B_BLK_T_BK","Black Jeans (Black)",500],
		["TRYK_U_B_BLK_T_WH","Black Jeans (White)",500],
		["TRYK_U_B_Denim_T_BK","Grey Jeans (Black)",500],
		["TRYK_U_B_Denim_T_WH","Grey Jeans (White)",500],

		["A3L_Priest_Uniform","Priest Uniform",1000],
		["A3L_Character_Uniform","Life Uniform",1500],
		["A3L_Dude_Outfit","Dude outfit",2000],
		["A3L_Farmer_Outfit","Farmer Outfit",2000],
		["A3L_Worker_Outfit","Worker Outfit",2000],
		["A3LShirt","ArmA 3 Life Shirt",250],
		["A3L_Poop2day","I Pooped Today!",275],
		["A3L_A3LogoPants","A3L Logo Pants",150],
		["pervt_uni","Pervert Shirt",175],
		["BluePlaid_uni","A3L Plaid (Blue)",125],
		["OrangePlaid_uni","A3L Plaid (Orange)",350],
		["PinkPlaid_uni","A3L Plaid (Pink)",350],
		["RedPlaid_uni","A3L Plaid (Red)",350],
		["YellowPlaid_uni","A3L Plaid (Yellow)",350],
		["checkered_uni","A3L Polo (Checkered)",350],
		["GbGyBr_uni","A3L Polo (GB-GY-BR)",350],
		["GnBlBr_uni","A3L Polo (GN-BL-BR)",350],
		["GnGyBr_uni","A3L Polo (GN-GN-GY)",350],
		["GyBlBr_uni","A3L Polo (GY-BL-BR)",350],
		["kingfish_uni","A3L Polo (Kingfish)",350],
		["mothertrucker_uni","A3L Polo (Mothertrucker)",350],
		["OrBlBr_uni","A3L Polo (OR-BL-BR)",350],
		["OrGnGy_uni","A3L Polo (OR-GN-GY)",350],
		["OrGyBr_uni","A3L Polo (OR-GY-BR)",350],
		["PkGnGy_uni","A3L Polo (PK-GN-GY)",350],
		["PkGyBr_uni","A3L Polo (PK-GY-BR)",350],
		["RdBlBr_uni","A3L Polo (RD-BL-BR)",350],
		["RdGnGy_uni","A3L Polo (RD-GN-GY)",350],
		["RdGyBr_uni","A3L Polo (RD-GY-BR)",350],
		["sohoku_uni","A3L Polo (Sohoku)",350],
		["WhBlBr_uni","A3L Polo (WH-BL-BR)",350],
		["WhGyBr_uni","A3L Polo (WH-GY-BR)",350],
		["YlBlBr_uni","A3L Polo (YL-BL-BR)",350],
		["YlGnGy_unI","A3L Polo (YL-GN-GY)",350],
		["YlGyBr_uni","A3L Polo (YL-GY-BR)",350],
		["racer_uni","A3L Racer Uniform",350],
		["taxi_uni","A3L Taxi Uniform",350],
		["arma3","ArmA 3 Polo",350],
		["arma3black","ArmA 3 Polo (Black)",350],
		["ATI","ATI Enthusiast",350],
		["tacobell","Delgado Shirt",350],
		["dutch","Dutch Shirt",350],
		["hanacd","Hannes Academy",350],
		["nvidia","Nvidia Enthusiast",350],
		["SFG","SF Giant",350],
		["walkingdead","The Walking Dead",350],
		["A3L_SpookyMummy","Mummy",40000],
		["A3L_Bikini_Girl","Bikini",40000]	
		];
	};
	
	//Hats
	case 1:
	{
		[



			//Cobra added
			["Masque_Bush","George Bush Mask",1000],

            ["kio_vfv_mask","Anon", 1000],
            ["Kio_Capital_Hat","Top Hat w/Monacle", 1000],
            ["a3l_hardhat","Hard Hat", 750],
            ["Kio_Afro_Hat","Brown Afro", 1000],
            ["H_Beret_blk","Black Beret", 1000],
            ["H_Booniehat_khk",nil, 500],
            ["H_Booniehat_oli",nil, 500],
            ["H_Booniehat_tan",nil, 500],
            ["Kio_No1_Hat","#1 Hat", 1000],
			["Masque_archNemesis","#1 Mask", 1000],
			["Masque_Fish","#2 Mask", 1000],
			["Masque_Optimiste","#3 Mask", 1000],
			["Masque_Religieuse","#4 Mask", 1000],
			["Masque_Smiley","#5 Mask", 1000],
			["Masque_speedRunner","#6 Mask", 1000],
			["Masque_Unic","#7 Mask", 1000],
		    ["Kio_Pirate_Hat","Pirate Hat", 1000],
            ["Kio_Santa_Hat","Santa Hat", 1000],
            ["Kio_Spinning_Hat","Spinning Hat", 1000],
            ["Kio_Hat","Cute Warm Hat", 1000],
            ["TRYK_H_Bandana_H","Ninja Bandana",700],
            ["TRYK_H_Bandana_wig","Ninja Bandana II",700],
            ["TRYK_H_EARMUFF","Ear Protectors",500],
            ["TRYK_H_headsetcap_blk","Black Hat",1000],
            ["TRYK_H_headsetcap","White Hat",1000],
            ["TRYK_H_pakol2","Mid East Hat",1200],
            ["TRYK_R_CAP_BLK","Reverse Black",850],
            ["TRYK_R_CAP_TAN","Reverse White",850],
            ["TRYK_H_wig","Real Hair Wig",600],
            ["TRYK_H_woolhat","Slick Beanie",1000],



			["A3L_Legoman","Lego Helmet",5000],
			["A3L_soa_helmet","Biker Helmet",400],	
			["A3L_gangster_hat","Gangster Mask",100],
			["A3L_Mask","Mask",100],				
			["A3L_longhairblack","Long Hair Black",120],
			["A3L_longhairblond","Long Hair Blond",120],
			["A3L_longhairbrown","Long Hair Brown",120],
			["A3L_Crown","Crown",120],
			["cowboyhat","Cowboyhat",120],
			["A3L_mexicanhat","Mexican Hat",120],
			["santahat","Santa hat",120],
			["A3L_Sombrero","Sombrero",120],
			["turban","Turban",120],
			["A3L_russianhat","Russianhat",120],
			["H_Cap_tan",nil,120],
			["H_Cap_blk",nil,120],
			["H_Cap_blk_CMMG",nil,120],
			["H_Cap_brn_SPECOPS",nil,120],
			["H_Cap_tan_specops_US",nil,120],
			["H_Cap_khaki_specops_UK",nil,120],
			["H_Cap_grn",nil,120],
			["H_Cap_grn_BI",nil,120],
			["H_Cap_blk_Raven",nil,120],
			["H_Cap_blk_ION",nil,120]

		];
	};
	
	//Glasses
	case 2:
	{
		[
			["G_Shades_Black",nil,25],
			["G_Shades_Blue",nil,20],
			["G_Sport_Blackred",nil,20],
			["G_Sport_Checkered",nil,20],
			["G_Sport_Blackyellow",nil,20],
			["G_Sport_BlackWhite",nil,20],
			["G_Squares",nil,10],
			["G_Aviator",nil,100],
			["G_Lady_Mirror",nil,150],
			["G_Lady_Dark",nil,150],
			["G_Lady_Blue",nil,150],
			["G_Lowprofile",nil,30],
			["G_Combat",nil,55]
		];
	};
	
	//Vest
	case 3:
	{
		[
			["A3L_SpiderVest",nil,2500],
			["A3L_SpookyVest",nil,2500]
		];
	};
	
	//Backpacks
	case 4:
	{
		[
            
			["B_AssaultPack_cbr",nil,2000],
			["B_AssaultPack_rgr",nil,2000],
			["B_AssaultPack_khk",nil,2000],
			["B_AssaultPack_sgg",nil,2000],
			["B_AssaultPack_blk",nil,2000],
			["B_TacticalPack_oli",nil,2000],
			["B_Bergen_sgg",nil,2000],
			["B_FieldPack_oli",nil,2000],
			["B_FieldPack_cbr",nil,2000],
			["B_FieldPack_khk",nil,2000],
			["B_Carryall_oli",nil,2000],
			["B_Carryall_khk",nil,2000]

		];
	};
};
