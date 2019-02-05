/*
	File: fn_varHandle.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master handler for getting a variables name, short name, etc.
*/
private["_var","_mode"];
_var = [_this,0,"",[""]] call BIS_fnc_param;
_mode = [_this,1,-1,[0]] call BIS_fnc_param;
if(_var == "" OR _mode == -1) exitWith {""};

switch (_mode) do
{
	case 0:
	{
		switch (_var) do
		{
			case "cleankit": {"asdih_inv_cleankit"};
			case "panicbutton": {"asdih_inv_panicbutton"};
			case "mobilephone": {"asdih_inv_mobilephone"};
			case "bec": {"asdih_inv_bec"};
			case "medkit": {"asdih_inv_medkit"};
			case "methu": {"asdih_inv_methu"};
			case "methp": {"asdih_inv_methp"};   // into case 0 field 
			case "cokeu": {"asdih_inv_cokeu"};
			case "cokep": {"asdih_inv_cokep"};
			case "MDMAu": {"asdih_inv_MDMAu"};
			case "shank": {"asdih_inv_shank"};
			case "MDMAp": {"asdih_inv_MDMAp"};

			case "weddingring": {"asdih_inv_weddingring"};

			case "condom": {"asdih_inv_condom"};
			case "bandage": {"asdih_inv_bandage"};
			case "stitches": {"asdih_inv_stitches"};
			case "splint": {"asdih_inv_splint"};
			case "epipen": {"asdih_inv_epipen"};
			case "tierope": {"asdih_inv_tierope"};

			case "heroinu": {"asdih_inv_heroinu"};
			case "heroinp": {"asdih_inv_heroinp"};
			case "marijuana": {"asdih_inv_marijuana"};
			case "apple": {"asdih_inv_apple"};
			case "apple seeds": {"asdih_inv_appleseeds"};
			case "water": {"asdih_inv_water"};
			case "rabbit": {"asdih_inv_rabbit"};
			case "salema": {"asdih_inv_salema"};
			case "ornate": {"asdih_inv_ornate"};
			case "mackerel": {"asdih_inv_mackerel"};
			case "tuna": {"asdih_inv_tuna"};
			case "mullet": {"asdih_inv_mullet"};
			case "catshark": {"asdih_inv_catshark"};
			case "turtle": {"asdih_inv_turtle"};
			case "fishing": {"asdih_inv_fishingpoles"};
			case "coffee": {"asdih_inv_coffee"};
			case "turtlesoup": {"asdih_inv_turtlesoup"};
			case "donuts": {"asdih_inv_donuts"};
			case "fuelE": {"asdih_inv_fuelE"};
			case "fuelF": {"asdih_inv_fuelF"};
			case "money": {"LIMMITTCASH"};
			case "pickaxe": {"asdih_inv_pickaxe"};


			case "oilu": {"asdih_inv_oilu"};
			case "oilp": {"asdih_inv_oilp"};
			case "copperore": {"asdih_inv_copperore"};
			case "ironore": {"asdih_inv_ironore"};
			case "iron_r": {"asdih_inv_ironr"};
			case "copper_r": {"asdih_inv_copperr"};
			case "salt": {"asdih_inv_salt"};
			case "salt_r": {"asdih_inv_saltr"};
			case "sand": {"asdih_inv_sand"};
			case "glass": {"asdih_inv_glass"};
			case "diamond": {"asdih_inv_diamond"};
			case "diamondc": {"asdih_inv_diamondr"};
			case "cement": {"asdih_inv_cement"};
			case "rock": {"asdih_inv_rock"};




			case "tbacon": {"asdih_inv_tbacon"};
			case "lockpick": {"asdih_inv_lockpick"};
			case "redgull": {"asdih_inv_redgull"};
			case "peach": {"asdih_inv_peach"};





			case "goldbar": {"asdih_inv_goldbar"};
			case "blastingcharge": {"asdih_inv_blastingcharge"};
			case "hackingtool": {"asdih_inv_hackingtool"};
			case "boltcutter": {"asdih_inv_boltcutter"};
			case "defusekit": {"asdih_inv_defusekit"};
			case "storagesmall": {"asdih_inv_storagesmall"};
			case "storagebig": {"asdih_inv_storagebig"};
			case "wheat": {"asdih_inv_wheat"};
			case "sunflower": {"asdih_inv_sunflower"};
			case "corn": {"asdih_inv_corn"};
			case "bean": {"asdih_inv_bean"};
			case "cotton": {"asdih_inv_cotton"};
			case "olive": {"asdih_inv_olive"};
			case "opium": {"asdih_inv_opium"};
			case "cannabis": {"asdih_inv_cannabis"};
			case "pumpkin": {"asdih_inv_pumpkin"};
			case "wheat seed": {"asdih_inv_wheatseeds"};
			case "dirty money": {"asdih_inv_dirtymoney"};
			case "sunflower seed": {"asdih_inv_sunflowerseeds"};
			case "corn seed": {"asdih_inv_cornseeds"};
			case "bean seed": {"asdih_inv_beanseeds"};
			case "cotton seed": {"asdih_inv_cottonseeds"};
			case "olive seed": {"asdih_inv_oliveseeds"};
			case "opium seed": {"asdih_inv_opiumseeds"};
			case "cannabis seed": {"asdih_inv_cannabisseeds"};
			case "pumpkin seed": {"asdih_inv_pumpkinseeds"};
			case "raw goat meat": {"asdih_inv_rawgoatmeat"};
			case "raw chicken": {"asdih_inv_rawchicken"};
			case "raw sheep meat": {"asdih_inv_rawsheepmeat"};
			case "raw rabbit": {"asdih_inv_rawrabbit"};
			case "cigarette": {"asdih_inv_cigarette"};



			case "spikeStrip": {"asdih_inv_spikeStrip"};
			case "RoadConeStripB": {"asdih_inv_RoadConeStripB"};
			case "RoadConeB": {"asdih_inv_RoadConeB"};
			case "RoadConeStrip": {"asdih_inv_RoadConeStrip"};
			case "RoadCone": {"asdih_inv_RoadCone"};
			case "RoadBlockWood": {"asdih_inv_RoadBlockWood"};
			case "RoadBlockConc": {"asdih_inv_RoadBlockConc"};
			case "RoadBlockRebel": {"asdih_inv_RoadBlockRebel"};
			case "BarGate": {"asdih_inv_BarGate"};


				//beer glass  wine glass
			case "zoobeer": {"asdih_inv_zoobeer"}; // Duff Beer
			case "zoobeer2": {"asdih_inv_zoobeer2"};
			case "jackdaniels": {"asdih_inv_jackdaniels"};
			case "vodka": {"asdih_inv_vodka"};
			case "jagerbomb": {"asdih_inv_jagerbomb"};
			case "absinthe": {"asdih_inv_absinthe"};
			case "redwine": {"asdih_inv_redwine"};
			case "whitewine": {"asdih_inv_whitewhine"};
			case "whiterussian": {"asdih_inv_whiterussian"};
			case "sexonthebeach": {"asdih_inv_sexonthebeach"};
			case "tequila": {"asdih_inv_tequila"};
			case "jackdanielsandcoke": {"asdih_inv_jackdanielsandcoke"};
			case "Rax's Rum": {"asdih_inv_raxsrum"};
			
			case "methequipment": {"asdih_inv_methequipment"};
			case "meth2": {"asdih_inv_meth2"};
			//Uranium Stuff
			case "uranium": {"asdih_inv_uranium"};
			case "uraniumr": {"asdih_inv_uraniumr"};
			//Forestry Stuff
			case "log": {"asdih_inv_log"};
			case "lumber": {"asdih_inv_lumber"};
			
		};
	};
	
	case 1:
	{
		switch (_var) do
		{
		case "asdih_inv_medkit": {"medkit"};		
		case "asdih_inv_condom": {"condom"};
			case "asdih_inv_panicbutton": {"panicbutton"};
			case "asdih_inv_cleankit": {"cleankit"};
			case "asdih_inv_mobilephone": {"mobilephone"};
					case "asdih_inv_shank": {"shank"};
			case "asdih_inv_weddingring": {"weddingring"};
			case "asdih_inv_tierope": {"tierope"};
			case "asdih_inv_bandage": {"bandage"};
			case "asdih_inv_stitches": {"stitches"}; // in the case 1 field 
			case "asdih_inv_splint": {"splint"};
			case "asdih_inv_epipen": {"epipen"};
			case "asdih_inv_MDMAu": {"MDMAu"};
			case "asdih_inv_MDMAp": {"MDMAp"}; // in the case 1 field 
			case "asdih_inv_bec": {"bec"};
			case "asdih_inv_methu": {"methu"};
			case "asdih_inv_methp": {"methp"}; // in the case 1 field 
			case "asdih_inv_cokeu": {"cokeu"};
			case "asdih_inv_cokep": {"cokep"}; // in the case 1 field 
			case "asdih_inv_oilu": {"oilu"};
			case "asdih_inv_oilp": {"oilp"};
			case "asdih_inv_heroinu": {"heroinu"};
			case "asdih_inv_heroinp": {"heroinp"};
			case "asdih_inv_cannabis": {"cannabis"};
			case "asdih_inv_marijuana": {"marijuana"};
			case "asdih_inv_apple": {"apple"};
			case "asdih_inv_water": {"water"};
			case "asdih_inv_rabbit": {"rabbit"};
			case "asdih_inv_salema": {"salema"};
			case "asdih_inv_ornate": {"ornate"};
			case "asdih_inv_mackerel": {"mackerel"};
			case "asdih_inv_tuna": {"tuna"};
			case "asdih_inv_mullet": {"mullet"};
			case "asdih_inv_catshark": {"catshark"};
			case "asdih_inv_turtle": {"turtle"};
			case "asdih_inv_fishingpoles": {"fishing"};
			case "asdih_inv_coffee": {"coffee"};
			case "asdih_inv_turtlesoup": {"turtlesoup"};
			case "asdih_inv_donuts": {"donuts"};
			case "asdih_inv_fuelE": {"fuelE"};
			case "asdih_inv_fuelF": {"fuelF"};
			case "LIMMITTCASH": {"money"};
			case "asdih_inv_pickaxe": {"pickaxe"};
			case "asdih_inv_copperore": {"copperore"};
			case "asdih_inv_ironore": {"ironore"};
			case "asdih_inv_ironr": {"iron_r"};
			case "asdih_inv_copperr": {"copper_r"};
			case "asdih_inv_sand": {"sand"};
			case "asdih_inv_salt": {"salt"};
			case "asdih_inv_glass": {"glass"};
			case "asdih_inv_redgull": {"redgull"};
			case "asdih_inv_lockpick": {"lockpick"};
			case "asdih_inv_tbacon": {"tbacon"};
			case "asdih_inv_peach": {"peach"};
			case "asdih_inv_diamond": {"diamond"};
			case "asdih_inv_diamondr": {"diamondc"};
			case "asdih_inv_saltr": {"salt_r"};
			case "asdih_inv_coke": {"cocaine"};
			case "asdih_inv_cokep": {"cocainep"};
			case "asdih_inv_spikeStrip": {"spikeStrip"};
			case "asdih_inv_cement": {"cement"};
			case "asdih_inv_rock": {"rock"};
			case "asdih_inv_goldbar": {"goldbar"};
			case "asdih_inv_blastingcharge": {"blastingcharge"};
			case "asdih_inv_boltcutter": {"boltcutter"};
			case "asdih_inv_defusekit": {"defusekit"};
			case "asdih_inv_storagesmall": {"storagesmall"};
			case "asdih_inv_storagebig": {"storagebig"};
			case "asdih_inv_wheat": {"wheat"};
			case "asdih_inv_sunflower": {"sunflower"};
			case "asdih_inv_corn": {"corn"};
			case "asdih_inv_bean": {"bean"};
			case "asdih_inv_cotton": {"cotton"};
			case "asdih_inv_olive": {"olive"};
			case "asdih_inv_opium": {"opium"};
			case "asdih_inv_cannabis": {"cannabis"};
			case "asdih_inv_pumpkin": {"pumpkin"};
			case "asdih_inv_wheatseeds": {"wheat seed"};
			case "asdih_inv_dirtymoney": {"dirty money"};
			case "asdih_inv_sunflowerseeds": {"sunflower seed"};
			case "asdih_inv_cornseeds": {"corn seed"};
			case "asdih_inv_beanseeds": {"bean seed"};
			case "asdih_inv_cottonseeds": {"cotton seed"};
			case "asdih_inv_oliveseeds": {"olive seed"};
			case "asdih_inv_opiumseeds": {"opium seed"};
			case "asdih_inv_cannabisseeds": {"cannabis seed"};
			case "asdih_inv_pumpkinseeds": {"pumpkin seed"};
			case "asdih_inv_rawgoatmeat": {"raw goat meat"};
			case "asdih_inv_rawchicken": {"raw chicken"};
			case "asdih_inv_rawsheepmeat": {"raw sheep meat"};
			case "asdih_inv_rawrabbit": {"raw rabbit"};
			case "asdih_inv_zoobeer": {"zoobeer"};


			case "asdih_inv_zoobeer2": {"zoobeer2"};
			case "asdih_inv_jackdaniels": {"jackdaniels"};
			case "asdih_inv_vodka": {"vodka"};
			case "asdih_inv_jagerbomb": {"jagerbomb"};
			case "asdih_inv_absinthe": {"absinthe"};
			case "asdih_inv_redwine": {"redwine"};
			case "asdih_inv_whitewine": {"whitewine"};
			case "asdih_inv_whiterussian": {"whiterussian"};
			case "asdih_inv_sexonthebeach": {"sexonthebeach"};
			case "asdih_inv_tequila": {"tequila"};
			case "asdih_inv_jackdanielsandcoke": {"jackdanielsandcoke"};


			case "zoobeer2": {"asdih_inv_zoobeer2"};
			case "jackdaniels": {"asdih_inv_jackdaniels"};
			case "vodka": {"asdih_inv_vodka"};
			case "jagerbomb": {"asdih_inv_jagerbomb"};
			case "absinthe": {"asdih_inv_absinthe"};
			case "redwine": {"asdih_inv_redwine"};
			case "whitewine": {"asdih_inv_whitewhine"};
			case "whiterussian": {"asdih_inv_whiterussian"};
			case "sexonthebeach": {"asdih_inv_sexonthebeach"};
			case "tequila": {"asdih_inv_tequila"};
			case "jackdanielsandcoke": {"asdih_inv_jackdanielsandcoke"};


			case "asdih_inv_RoadConeStripB": {"RoadConeStripB"};
			case "asdih_inv_RoadConeB": {"RoadConeB"};
			case "asdih_inv_RoadConeStrip": {"RoadConeStrip"};
			case "asdih_inv_RoadCone": {"RoadCone"};
			case "asdih_inv_RoadBlockWood": {"RoadBlockWood"};
			case "asdih_inv_RoadBlockConc": {"RoadBlockConc"};
			case "asdih_inv_RoadBlockRebel": {"RoadBlockRebel"};
			case "asdih_inv_BarGate": {"BarGate"};
			case "asdih_inv_cigarette": {"cigarette"};
			case "asdih_inv_raxsrum": {"Rax's Rum"};
			case "asdih_inv_methequipment": {"methequipment"};
			case "asdih_inv_meth2": {"meth2"};
			
			//Uranium Stuff
			case "asdih_inv_uranium": {"uranium"};
			case "asdih_inv_uraniumr": {"uraniumr"};
			//Forestry Stuff
			case "asdih_inv_log": {"log"};
			case "asdih_inv_lumber": {"lumber"};
		};
	};
};
