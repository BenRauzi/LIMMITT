		/*
	File: fn_varToStr.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Takes the long-name (variable) and returns a display name for our
	virtual item.
*/
private["_var"];
_var = [_this,0,"",[""]] call BIS_fnc_param;
if(_var == "") exitWith {""};

switch (_var) do
{
	//Virtual Inventory Items 
	//Pancakes Additions
	case "asdih_inv_debitcard": {"Debit Card"};
	//End Pancakes Additions
	case "asdih_inv_weddingring": {(localize "STR_Item_WeddingRing")};
	case "asdih_inv_bandage": {(localize "STR_Item_Bandage")};
	case "asdih_inv_stitches": {(localize "STR_Item_Stitches")};
	case "asdih_inv_splint": {(localize "STR_Item_Splint")};
	case "asdih_inv_epipen": {(localize "STR_Item_Epipen")};
	case "asdih_inv_bec": {"Bacon Eggs & Coffee"};
	case "asdih_inv_tierope": {"Sturdy Rope"};
	case "asdih_inv_mobilephone": {"Mobile Phone"};
	case "asdih_inv_panicbutton": {"Panic Button"};
	case "asdih_inv_MDMAu": {"Pure MDMA"};
	case "asdih_inv_cleankit": {"Deoderant"};
	case "asdih_inv_medkit": {"CPR Medkit"};
	case "asdih_inv_condom": {"Condom"};
	case "asdih_inv_MDMAp": {"Pure MDMA Pills"};
	case "asdih_inv_methu": {"Seperated Meth"};
	case "asdih_inv_methp": {"Meth Cocktail"};
	case "asdih_inv_meth2": {"Pure Meth"};
	case "asdih_inv_cokeu": {"Unpackaged Cocaine"};
	case "asdih_inv_cokep": {"Cocaine Bricks"};
	case "asdih_inv_uranium": {"Uranium"};
	case "asdih_inv_uraniumr": {"Refined Uranium"};
	case "asdih_inv_methequipment": {"Meth Cooking Equipment"};
	case "asdih_inv_log": {"Log"};
	case "asdih_inv_lumber": {"Lumber"};
	case "asdih_inv_oilu": {(localize "STR_Item_OilU")};
	case "asdih_inv_oilp": {(localize "STR_Item_OilP")};
	case "asdih_inv_heroinu": {(localize "STR_Item_HeroinU")};
	case "asdih_inv_heroinp": {(localize "STR_Item_HeroinP")};
	case "asdih_inv_marijuana": {(localize "STR_Item_Marijuana")};
	case "asdih_inv_apple": {(localize "STR_Item_Apple")};
	case "asdih_inv_rabbit": {(localize "STR_Item_RabbitMeat")};
	case "asdih_inv_salema": {(localize "STR_Item_SalemaMeat")};
	case "asdih_inv_ornate": {(localize "STR_Item_OrnateMeat")};
	case "asdih_inv_mackerel": {(localize "STR_Item_MackerelMeat")};
	case "asdih_inv_tuna": {(localize "STR_Item_TunaMeat")};
	case "asdih_inv_mullet": {(localize "STR_Item_MulletMeat")};
	case "asdih_inv_catshark": {(localize "STR_Item_CatSharkMeat")};
	case "asdih_inv_turtle": {(localize "STR_Item_TurtleMeat")};
	case "asdih_inv_fishingpoles": {(localize "STR_Item_FishingPole")};
	case "asdih_inv_water": {(localize "STR_Item_WaterBottle")};
	case "asdih_inv_coffee": {(localize "STR_Item_Coffee")};
	case "asdih_inv_turtlesoup": {(localize "STR_Item_TurtleSoup")};
	case "asdih_inv_donuts": {(localize "STR_Item_Donuts")};
	case "asdih_inv_fuelE": {(localize "STR_Item_FuelE")};
	case "asdih_inv_fuelF": {(localize "STR_Item_FuelF")};
	case "asdih_inv_pickaxe": {(localize "STR_Item_Pickaxe")};
	case "asdih_inv_copperore": {(localize "STR_Item_CopperOre")};
	case "asdih_inv_ironore": {(localize "STR_Item_IronOre")};
	case "asdih_inv_ironr": {(localize "STR_Item_IronIngot")};
	case "asdih_inv_copperr": {(localize "STR_Item_CopperIngot")};
	case "asdih_inv_sand": {(localize "STR_Item_Sand")};
	case "asdih_inv_salt": {(localize "STR_Item_Salt")};
	case "asdih_inv_saltr": {(localize "STR_Item_SaltR")};
	case "asdih_inv_glass": {(localize "STR_Item_Glass")};
	case "asdih_inv_diamond": {(localize "STR_Item_DiamondU")};
	case "asdih_inv_diamondr": {(localize "STR_Item_DiamondC")};
	case "asdih_inv_tbacon": {(localize "STR_Item_TBacon")};
	case "asdih_inv_redgull": {(localize "STR_Item_RedGull")};
	case "asdih_inv_lockpick": {(localize "STR_Item_Lockpick")};
	case "asdih_inv_peach": {(localize "STR_Item_Peach")};
	case "asdih_inv_spikeStrip": {(localize "STR_Item_SpikeStrip")};
	case "asdih_inv_rock": {(localize "STR_Item_Rock")};
	case "asdih_inv_cement": {(localize "STR_Item_CementBag")};
	case "asdih_inv_goldbar": {(localize "STR_Item_GoldBar")};
	case "asdih_inv_blastingcharge": {(localize "STR_Item_BCharge")};
	case "asdih_inv_hackingtool": {(localize "STR_Item_HTool")};
	case "asdih_inv_boltcutter": {(localize "STR_Item_BCutter")};
	case "asdih_inv_defusekit": {(localize "STR_Item_DefuseKit")};
	case "asdih_inv_storagesmall": {(localize "STR_Item_StorageBS")};
	case "asdih_inv_storagebig": {(localize "STR_Item_StorageBL")};
	case "asdih_inv_wheat": {(localize "STR_Item_wheat")};
	case "asdih_inv_sunflower": {(localize "STR_Item_sunflower")};
	case "asdih_inv_corn": {(localize "STR_Item_corn")};
	case "asdih_inv_bean": {(localize "STR_Item_bean")};
	case "asdih_inv_cotton": {(localize "STR_Item_cotton")};
	case "asdih_inv_olive": {(localize "STR_Item_olive")};
	case "asdih_inv_opium": {(localize "STR_Item_opium")};
	case "asdih_inv_cannabis": {(localize "STR_Item_cannabis")};
	case "asdih_inv_pumpkin": {(localize "STR_Item_Pumpkin")};
	case "asdih_inv_wheatseeds": {(localize "STR_Item_wheatseeds")};
	case "asdih_inv_dirtymoney": {(localize "STR_Item_dirtymoney")};
	case "asdih_inv_sunflowerseeds": {(localize "STR_Item_sunflowerseeds")};
	case "asdih_inv_cornseeds": {(localize "STR_Item_cornseeds")};
	case "asdih_inv_beanseeds": {(localize "STR_Item_beanseeds")};
	case "asdih_inv_cottonseeds": {(localize "STR_Item_cottonseeds")};
	case "asdih_inv_oliveseeds": {(localize "STR_Item_oliveseeds")};
	case "asdih_inv_opiumseeds": {(localize "STR_Item_opiumseeds")};
	case "asdih_inv_cannabisseeds": {(localize "STR_Item_cannabisseeds")};
	case "asdih_inv_pumpkinseeds": {(localize "STR_Item_Pumpkinseeds")};
	case "asdih_inv_rawgoatmeat": {(localize "STR_Item_rawgoatmeat")};
	case "asdih_inv_rawchicken": {(localize "STR_Item_rawchicken")};
	case "asdih_inv_rawsheepmeat": {(localize "STR_Item_rawsheepmeat")};
	case "asdih_inv_rawrabbit": {(localize "STR_Item_rawrabbit")};
	//Additions
	case "asdih_inv_zoobeer": {"Light Beer"}; 
	case "asdih_inv_zoobeer2": {"Heavy Beer"}; 


			case "asdih_inv_jackdaniels": {"Jack Daniels"};
			case "asdih_inv_vodka": {"Vodka Shot"};
			case "asdih_inv_jagerbomb": {"Jagerbomb"};
			case "asdih_inv_absinthe": {"Absinthe"};
			case "asdih_inv_redwine": {"Redwine"};
			case "asdih_inv_whitewine": {"Whitewine"};
			case "asdih_inv_whiterussian": {"White Russian"};
			case "asdih_inv_sexonthebeach": {"Sex on the Beach"};
			case "asdih_inv_tequila": {"Tequila"};
			case "asdih_inv_jackdanielsandcoke": {"Jack Daniels & Coke"};







	case "asdih_inv_RoadConeStripB": {"Blinking RoadCone Strip"};
	case "asdih_inv_RoadConeB": {"Blinking RoadCone"};
	case "asdih_inv_RoadConeStrip": {"RoadCone Strip"};
	case "asdih_inv_RoadCone": {"RoadCone"};
	case "asdih_inv_RoadBlockWood": {"RoadBlock (Wooden)"};
	case "asdih_inv_RoadBlockConc": {"RoadBlock (Fortified)"};
	case "asdih_inv_RoadBlockRebel": {"RoadBlock (Wreck)"};
	case "asdih_inv_BarGate": {"Police BarGate"};
	case "asdih_inv_cigarette": {"Cigarette"};
	case "asdih_inv_raxsrum": {"Rax's Rum"};

	//License Block
	
	case "license_civ_driver": {(localize "STR_License_Driver")};
	case "license_civ_air": {(localize "STR_License_Pilot")};
	case "license_civ_heroin": {(localize "STR_License_Heroin")};
	case "license_civ_oil": {(localize "STR_License_Oil")};
	case "license_civ_dive": {(localize "STR_License_Diving")};
	case "license_civ_boat": {(localize "STR_License_Boat")};
	case "license_civ_gun": {(localize "STR_License_Firearm")};
	case "license_cop_air": {(localize "STR_License_Pilot")};
	case "license_cop_swat": {(localize "STR_License_Swat")};
	case "license_cop_cg": {(localize "STR_License_CG")};
	case "license_civ_rebel": {(localize "STR_License_Rebel")};
	case "license_civ_truck": {(localize "STR_License_Truck")};
	case "license_civ_diamond": {(localize "STR_License_Diamond")};
	case "license_civ_copper": {(localize "STR_License_Copper")};
	case "license_civ_iron": {(localize "STR_License_Iron")};
	case "license_civ_sand": {(localize "STR_License_Sand")};
	case "license_civ_salt": {(localize "STR_License_Salt")};
	case "license_civ_coke": {(localize "STR_License_Cocaine")};
	case "license_civ_marijuana": {(localize "STR_License_Marijuana")};
	case "license_civ_cement": {(localize "STR_License_Cement")};
	case "license_med_air": {(localize "STR_License_Pilot")};
	case "license_civ_home": {(localize "STR_License_Home")};
	case "license_civ_MDMA": {(localize "STR_License_MDMA")};
	case "license_civ_meth": {(localize "STR_License_Meth")};
	case "license_civ_rifle": {"Rifle License"};
	case "license_civ_uranium": {"Uranium Processing License"};
	case "license_civ_forestry": {"Forestry License"};
	case "license_civ_lsmo": {"LSMO Badge"};
	case "license_civ_harv": {"M8 i'm Harvie Rhodes"};
	case "license_civ_lsmovehicle": {"LSMO Vehicle License"};
	case "license_civ_dino": {"Dino Family ID Badge"};
	case "license_civ_mason": {"Mason Family ID Badge"};
	case "license_civ_narcos": {"Narcos Family ID Badge"};
};
