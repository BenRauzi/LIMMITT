/*
	Author: Ben Harris
	Description: Client Init function
*/

LIMMITT_clientInit = {
	
	// Disable text/voice channels just incase description fails
	for "_i" from 0 to 5 do {_i enableChannel false;};

	// Foski's Bank Functions
	Foski_copsNeeded2RobBank = 5; // Number of cops needed online to rob the bank
	Foski_dirtyCash = "Harris_dirtyCash"; // Classname of the dirty cash physical inventory item
	Foski_dyedDirtyCash = "Harris_dyedDirtyCash"; // Classname of the dyed dirty cash physical inventory item
	Foski_startupBankCash = 10; // Total number of times cash can be taken from the bank

	// Foski's Prison Functions
	Foski_prisonFences = ["Land_Fence1","Land_Fence1_d"]; // Classnames of fences that can be cut | Normal -> Broken
	Foski_prisonFenceWpns = ["A3L_Pickaxe"]; // Classname of weapon used to cut fences
	Foski_prisonFenceCut = [20,30,40]; // Numbers used to randomly generate a number of times a person has to hit an individual fence (Min, Mid, Max)

	player setVariable ["Harris_TwitterEnabled",true,false]; // Able to use twitter variable
	player setVariable ["Harris_InteractionEnabled",true,false]; // Able to use the interaction menu variable
	player setVariable ["Foski_Restrained",false,true]; // Restrain Variable
	player setVariable ["Foski_Surrender", false, true]; // Surrender Variable


	outerImage = [1210,2210,3210,4210,5210,6210,7210,8210];
	outerIcon1 = [1211,2211,3211,4211,5211,6211,7211,8211];
	outerIcon2 = [1212,2212,3212,4212,5212,6212,7212,8212];
	outerIcon3 = [1213,2213,3213,4213,5213,6213,7213,8213];
	outerIcon4 = [1214,2214,3214,4214,5214,6214,7214,8214];

	outerText1 = [1215,2215,3215,4215,5215,6215,7215,8215];
	outerText2 = [1216,2216,3216,4216,5216,6216,7216,8216];
	outerText3 = [1217,2217,3217,4217,5217,6217,7217,8217];
	outerText4 = [1218,2218,3218,4218,5218,6218,7218,8218];

	outerButton1 = [1219,2219,3219,4219,5219,6219,7219,8219];
	outerButton2 = [1220,2220,3220,4220,5220,6220,7220,8220];
	outerButton3 = [1221,2221,3221,4221,5221,6221,7221,8221];
	outerButton4 = [1222,2222,3222,4222,5222,6222,7222,8222];

	Harris_mineObjects = ["JD_OreCoal","JD_OreDiamond","JD_OreGold","JD_OreIron"]; 

	Harris_oreMined = 0;

	Harris_action = false;
	Harris_oreTypes =
	[
		["JD_OreCoal","Harris_coalOre"],
		["JD_OreDiamond","Harris_diamondOre"],
		["JD_OreGold","Harris_goldOre"],
		["JD_OreIron","Harris_ironOre"]
	];

	Harris_mineArea = 
	[
		["Harris_mineArea_Coal","Coal","JD_OreCoal"],
		["Harris_mineArea_Iron","Iron","JD_OreIron"],
		["Harris_mineArea_Gold","Gold","JD_OreGold"],
		["Harris_mineArea_Diamond","Diamond","JD_OreDiamond"]
	];


	player addEventHandler["Fired", {_this call Harris_mineObject; }];

	Harris_MessagesN = 0;
	message1_active = false;
	message2_active = false;
	message3_active = false;
	message4_active = false;
	message5_active = false;

	Harris_craftAbleItems =   
	[
		["M16A4","RH_M16A4", "", [["Harris_steelIngot",18, "Steel Ingot"]], "Rifles", 2.5, false], 
		["30rnd 5.45x39 Stanag Magazine","30Rnd_556x45_Stanag", "", [["Harris_steelIngot",4, "Steel Ingot"]], "Rifles", 0.2, true], 

		["KAC PDW","RH_PDW", "", [["Harris_steelIngot",18, "Steel Ingot"]], "Rifles", 2.5, false], 
		["30rnd 6.5x35 Stanag Magazine","RH_30Rnd_6x35_mag", "", [["Harris_steelIngot",4, "Steel Ingot"]], "Rifles", 0.2, true], 

		["RPG-7","launch_RPG7_F", "bp_rpg7", [["Harris_steelIngot",30, "Steel Ingot"]], "Rifles", 3.5, false],
		["RPG-7 HEAT Grenade","RPG7_F", "bp_rpg7", [["Harris_steelIngot",15, "Steel Ingot"]], "Rifles", 1, true],

		["Beretta M9","RH_m9", "", [["Harris_steelIngot",4, "Steel Ingot"]], "Pistols", 0.3, false],
		["15Rnd 9x19 M9","RH_15Rnd_9x19_M9", "", [["Harris_steelIngot",2, "Steel Ingot"]], "Pistols", 0.1, true],

		["Colt Python","RH_python", "bp_pyth", [["Harris_steelIngot",6, "Steel Ingot"]], "Pistols", 0.4, false], 
		["6Rnd .357 Mag","RH_6Rnd_357_Mag", "bp_pyth", [["Harris_steelIngot",6, "Steel Ingot"]], "Pistols", 0.1, true], 

		["Colt M1911","sab_1911_handgun", "", [["Harris_steelIngot",5, "Steel Ingot"]], "Pistols", 0.4, false],
		["9Rnd .45ACP Mag","9Rnd_45ACP_Mag", "", [["Harris_steelIngot",6, "Steel Ingot"]], "Pistols", 0.1, true],

		["CZ 75","RH_cz75", "", [["Harris_steelIngot",6, "Steel Ingot"]], "Pistols", 0.4, false],
		["16Rnd 9x19 CZ","RH_16Rnd_9x19_CZ", "", [["Harris_steelIngot",6, "Steel Ingot"]], "Pistols", 0.1, true],

		["Magnum Desert Eagle","RH_deagle", "bp_deag", [["Harris_steelIngot",7, "Steel Ingot"]], "Pistols", 0.6, false], 
		["Magnum Desert Eagle - Modern","RH_deaglem", "bp_deag", [["Harris_steelIngot",7, "Steel Ingot"]], "Pistols", 0.6, false], 
		["Magnum Desert Eagle - Silver","RH_deagles", "bp_deag", [["Harris_steelIngot",7, "Steel Ingot"]], "Pistols", 0.6, false], 
		["7Rnd .50 AE","RH_7Rnd_50_AE", "bp_deag", [["Harris_steelIngot",3, "Steel Ingot"]], "Pistols", 0.1, true],
		
		["FN Five-Seven","RH_fn57", "bp_57", [["Harris_steelIngot",6, "Steel Ingot"]], "Pistols", 0.5, false], 
		["20Rnd 57x28 FN","RH_20Rnd_57x28_FN", "bp_57", [["Harris_steelIngot",2, "Steel Ingot"]], "Pistols", 0.1, true],

		["FN FNP-45","RH_fnp45", "", [["Harris_steelIngot",6, "Steel Ingot"]], "Pistols", 0.4, false],
		["FN FNP-45 - Tan","RH_fnp45t", "", [["Harris_steelIngot",6, "Steel Ingot"]], "Pistols", 0.4, false],
		["15Rnd 45cal FNP","RH_15Rnd_45cal_fnp", "", [["Harris_steelIngot",2, "Steel Ingot"]], "Pistols", 0.1, true],

		["Glock 17","RH_g17", "", [["Harris_steelIngot",5, "Steel Ingot"]], "Pistols", 0.3, false],
		["Glock 19","RH_g19", "", [["Harris_steelIngot",5, "Steel Ingot"]], "Pistols", 0.3, false],
		["7Rnd 9x19 Glock ammo","RH_17Rnd_9x19_g17", "", [["Harris_steelIngot",2, "Steel Ingot"]], "Pistols", 0.1, true],

		["GSH-18","RH_gsh18", "", [["Harris_steelIngot",6, "Steel Ingot"]], "Pistols", 0.4, false],
		["18Rnd 9x19 GSH","RH_18Rnd_9x19_gsh", "", [["Harris_steelIngot",2, "Steel Ingot"]], "Pistols", 0.1, true],

		["Heckler & Koch MP5K","hlc_smg_mp5k", "bp_mp5k", [["Harris_steelIngot",9, "Steel Ingot"]], "Pistols", 0.9, false], 
		["30Rnd 9x19 Ball MP5","hlc_30Rnd_9x19_B_MP5", "bp_mp5k", [["Harris_steelIngot",3, "Steel Ingot"]], "Pistols", 0.1, true],

		["Intratec Tec-9","RH_tec9", "", [["Harris_steelIngot",8, "Steel Ingot"]], "Pistols", 0.7, false],
		["32Rnd 9x19 TEC","RH_32Rnd_9x19_tec", "", [["Harris_steelIngot",3, "Steel Ingot"]], "Pistols", 0.1, true],

		["Kimber Night Warrior","RH_kimber_nw", "", [["Harris_steelIngot",6, "Steel Ingot"]], "Pistols", 0.5, false],
		["7Rnd 45cal M1911","RH_7Rnd_45cal_m1911", "", [["Harris_steelIngot",2, "Steel Ingot"]], "Pistols", 0.1, true],

		["Micro UZI","RH_muzi", "bp_uzi", [["Harris_steelIngot",8, "Steel Ingot"]], "Pistols", 0.6, false], 
		["30Rnd 9x19 UZI","RH_30Rnd_9x19_UZI", "bp_uzi", [["Harris_steelIngot",3, "Steel Ingot"]], "Pistols", 0.1, true],

		["VZ 61 Scorpion","RH_vz61", "bp_vz61", [["Harris_steelIngot",6, "Steel Ingot"],["RR_woodLog",1, "Wood"]], "Pistols", 0.5, false], 
		["20Rnd 32cal vz61","RH_20Rnd_32cal_vz61", "bp_vz61", [["Harris_steelIngot",2, "Steel Ingot"]], "Pistols", 0.1, true],

		["Ruger MK2 - Silenced","RH_mk2", "bp_mk2", [["Harris_steelIngot",7, "Steel Ingot"]], "Pistols", 0.4, false], 
		["10Rnd 22LR MK2","RH_10Rnd_22LR_mk2", "bp_mk2", [["Harris_steelIngot",2, "Steel Ingot"]], "Pistols", 0.1, true],

		["Heckler & Koch USP Match","RH_uspm", "", [["Harris_steelIngot",7, "Steel Ingot"]], "Pistols", 0.4, false],
		["16Rnd 40cal USP","RH_16Rnd_40cal_usp", "", [["Harris_steelIngot",3, "Steel Ingot"]], "Pistols", 0.1, true],


		["C4 Explosive","Harris_c4", "", [["Harris_RDX",4, "RDX Compound"],["Harris_steelIngot",6, "Steel Ingot"]], "Items", 1, false],
		["Ghilie Suit (Jungle)","U_O_T_FullGhillie_tna_F", "", [["Harris_burlap",4, "Burlap"],["Harris_rope",6, "Rope"]], "Items", 0.5, false],
		["Ghilie Suit (Arid)","U_I_FullGhillie_ard", "", [["Harris_burlap",4, "Burlap"],["Harris_rope",6, "Rope"]], "Items", 0.5, false],
		["Ghilie Suit (Lush)","U_I_FullGhillie_lsh", "", [["Harris_burlap",4, "Burlap"],["Harris_rope",6, "Rope"]], "Items", 0.5, false],
		["Ghilie Suit (Semi-Arid)","U_I_FullGhillie_sard", "", [["Harris_burlap",4, "Burlap"],["Harris_rope",6, "Rope"]], "Items", 0.5, false],

		["Oil Pump","Harris_oilPump", "", [["Harris_coal",5, "Refined Coal"],["Harris_steelIngot",15, "Steel"]], "Machinery", 1, false]

		//["Lockpicks","RR_lockpicks", "", [["RR_IronIngot",4, "Iron Ingot"]], "Items", 0.5, false]

	];

	Harris_smeltAbleItems =   
	[
		["Refined Coal","Harris_coal", "", [["Harris_CoalOre",2, "Coal Ore"]], "Refine Minerals", 0.1, true],
		["Iron Ingot","Harris_ironIngot", "", [["Harris_ironOre",2, "Iron Ore"]], "Refine Minerals", 0.1, true],
		["Steel Ingot","Harris_steelIngot", "", [["Harris_ironOre",2, "Iron Ore"],["Harris_coalOre",4, "Coal Ore"]], "Refine Minerals", 0.2, true],
		["Gold Bar","Harris_goldIngot", "", [["Harris_goldOre",2, "Gold Ore"]], "Refine Minerals", 0.3, true],
		["Cut Diamond","Harris_diamond", "", [["Harris_diamondOre",2, "Uncut Diamonds"]], "Refine Minerals", 0.3, true],
		["Petroleum Barrel","Harris_petroleumBarrel", "", [["Harris_oilBarrel",2, "Oil Barrel"]], "Refine Oil", 0.3, true],
		["Timber","Harris_woodLog", "", [["Harris_woodLog",2, "Wood Logs"]], "Woodworking", 0.3, true]
	]; // Add Timber from Logs and Diamonds
	Harris_smeltTypes = ["Refine Minerals", "Woodworking"];
	Harris_craftTypes = ["Rifles", "Pistols", "Items", "Machinery"]; //??

	Harris_bluePrints = [
		["bp_uzi", "Uzi"], 
		["bp_ak", "Kalashnikov Rifle"], 
		["bp_vz61", "Scorpian Pistol"], 
		["bp_rpk", "RPK"], 
		["bp_mk2", "MK2"], 
		["bp_m21", "M21 Rifle"], 
		["bp_rpg7", "Rocket-Propelled-Grenade"], 
		["bp_fal", "FN FAL"], 
		["bp_pyth", "Python"],
		["bp_deag", "Desert Eagle"], 
		["bp_57", ".57"], 
		["bp_mp5k", "MPK5"]
	];

	Harris_inProcessing = false;

	Harris_craftSchedule = [];

	player setVariable ["bluePrints", profileNamespace getVariable ['blueprints', []]];

	KK_fnc_forceRagdoll = compileFinal "

	if (vehicle player != player || godMode) exitWith {};
	private ""_rag"";
	godMode = true;
	player allowDamage false;
	_rag = ""Land_Can_V3_F"" createVehicleLocal [0,0,0];
	_rag setMass 1e10;
	_rag attachTo [player, [0,0,0], ""Spine3""];
	_rag setVelocity [0,0,8];
	detach _rag;
	0 = _rag spawn {
		deleteVehicle _this;
		uisleep 1;
		godMode = false;
		player allowDamage true;
	};
	";

	Foski_SurrenderSyncMP ={
		params ["_unit","_anim"]; 
		_unit playAction _anim;

		if (_unit == player) then {
			player playAction _anim;
		};
	};

	Harris_Houses = ["Land_i_Garage_V1_F","Land_i_House_Big_01_V3_F","Land_i_House_Big_02_V3_F","Land_i_House_Big_01_V2_F","Land_i_House_Big_02_V2_F","Land_i_Addon_02_V1_F","Land_i_House_Small_01_V1_F", "Land_House_Small_06_F","Land_i_House_Small_01_b_white_F","Land_i_House_Big_01_b_yellow_F","Land_i_House_Big_01_b_white_F","Land_i_House_Big_02_b_white_F", "Land_Shop_Town_05_F","Land_Warehouse_03_F","Land_GuardHouse_01_F"];


	waitUntil {!(isNull (findDisplay 46))};
	if !(isNil {missionNamespace getVariable "firstLogin"}) then {
		[] remoteExecCall ["Foski_manageTrafficLights",2];
		[] remoteExec ["Harris_initOreLoop", 2];
		missionNamespace setVariable ["firstLogin", nil, true];
		missionNamespace setVariable ["cellNumbers", [], true];
		missionNamespace setVariable ["uberDrivers", [], true];
		missionNamespace setVariable ["Foski_bankObj",nearestObjects [player, ["Land_CommonwealthBank"], 9999] select 0, true];
		missionNamespace setVariable ["Foski_banksCashObj",nearestObjects [player, ["A3L_MoneyPile"], 9999] select 0, true];

		Foski_bankObj animate ["Vault_Door",0]; 
		Foski_bankObj setVariable ['vaultUnlocked', false, true];
		Foski_banksCashObj setVariable ["Foski_cashLeft", Foski_startupBankCash, true];
		missionNamespace setVariable ["inRobbery", false, true];

		{
			_doors = getNumber(configFile >> "CfgVehicles" >> (typeOf _x) >> "numberOfDoors");

			if ((typeOf _x) in Harris_Houses) then {
				for "_i" from 1 to _doors do {
					_x animate[format["door_%1_rot",_i],0];
					_x setVariable[format["bis_disabled_Door_%1",_i],1,true];
				};
				_x setVariable["locked",true,true];
			};
		} forEach nearestObjects[[3943.78,3584.45,0.00143909], ["House_F"],5000];

		//addMissionEventHandler ["HandleDisconnect",{ [] spawn SOCK_fnc_syncSilent; deleteVehicle (_this select 0); }]; -> Added to server Init


	};

	player addEventHandler ["InventoryOpened", {_this call Harris_inventoryOpened}];

	[] call Harris_playerTags;

	Harris_Furniture = ["JD_workbench", "JD_Pot", "Land_oil_pump"];

	Harris_prices = 
	[
		["Harris_coalOre", 1000],
		["Harris_ironOre", 1000],
		["Harris_goldOre", 1500],
		["Harris_diamondOre", 2000],
		["Harris_coal", 2000],
		["Harris_ironIngot", 2500],
		["Harris_goldIngot", 3500],
		["Harris_diamond", 4500],
		["Harris_dirtyCash",75000],
		["Harris_dyedDirtyCash",25000],
		["Harris_oilBarrel", 3000],
		["Harris_petroleumBarrel", 5500],
		["Harris_weedBag", 2000]
	];

	Harris_Shops = 
	[
		[
			"Weed_Dealer",
			"Weed Dealer",
			["Bag of Weed", "Harris_weedBag"]
		],
		[
			"DirtyCash_Cleaner",
			"Dirty Cash Cleaner",
			["Dirty Cash", "Harris_dirtyCash"],
			["Dyed Dirty Cash", "Harris_dyedDirtyCash"]
		],
		[
			"Oil_Trader",
			"Oil Trader",
			["Oil Barrel", "Harris_oilBarrel"],
			["Petroleum Barrel", "Harris_petroleumBarrel"]
		],
		[
			"Mineral_Trader",
			"Mineral Trader",
			["Coal Ore", "Harris_coalOre"],
			["Iron Ore", "Harris_ironOre"],
			["Gold Ore", "Harris_goldOre"],
			["Diamond Ore", "Harris_diamondOre"],
			["Coal", "Harris_coal"],
			["Iron Ingot", "Harris_ironIngot"],
			["Gold Ingot", "Harris_goldIngot"],
			["Diamond", "Harris_diamond"]
		]
	];

	LIMMITTCASH = 0;
	Harris_coolDown = false;

	Harris_bankRobberyTime = 4;
	Harris_recentRobberyTime = 15;

	escorting = false;

	Harris_growTime = 10;

	player addEventHandler ["GetInMan", {
	    params ["_vehicle", "_role", "_unit", "_turret"];

	    if ((_role == "driver" || _role == "gunner" || "Turret" in (assignedVehicleRole player)) && player getVariable ["Foski_Restrained", false]) then {
	        if (vehicle player isKindOf 'Air') then {
	            player action["GetOut",vehicle player];
	        } else {
	                player action["eject",vehicle player];
	        };
	    };

	    if (vehicle player isKindOf "Air") then {
	    	[(call TFAR_fnc_activeLrRadio), 1, "80.7"] call TFAR_fnc_SetChannelFrequency;
	    };
	}];

	player addEventHandler ["SeatSwitchedMan", { // Added to fix people be able to switch to drivers seat while restrained
		params ["_unit1", "_unit2", "_vehicle"];
		if ((driver _vehicle == _unit1 || gunner _vehicle == _unit1 || "Turret" in (assignedVehicleRole player)) && _unit1 getVariable ["Foski_Restrained", false]) then {
		    if (vehicle player isKindOf 'Air') then {
		        player action["GetOut",vehicle player];
		    } else {
		        player action["eject",vehicle player];
		    };
		};
	}];


	arr = missionNamespace getVariable ["cellNumbers", []];

	if (isNil {profileNameSpace getVariable "yourNumber"}) then {
		profileNameSpace setVariable ["yourNumber", [] call Harris_assignNumber];
		saveProfileNamespace;
	};
	arr pushBackUnique (profileNameSpace getVariable "yourNumber");
	missionNamespace setVariable ["cellNumbers", arr,true];


	Harris_ringTones = 
	[
		["Classic iPhone", "iphone_ringtone", 3],
		["Chimba", "chimba_ringtone", 3],
		["House of Cards", "hoc_ringtone", 3],
		["Marimba", "marimba2_ringtone", 3]
	];

	Harris_Messages = [];
	Harris_callNumber = [];


	Harris_twitterColours = 
	[
		["Default", "default",true],
		["Red","Red", getPlayerUID player in ["76561198072625284","76561198099644981","76561198062192032"]],
		["Blue","Blue",getPlayerUID player in ["76561198072625284","76561198099644981","76561198062192032"]],
		["Gold","Gold",getPlayerUID player in ["76561198072625284","76561198099644981","76561198062192032"]],
		["Green","Green",getPlayerUID player in ["76561198072625284","76561198099644981","76561198062192032"]]
	];

	setViewDistance 4000;

	Harris_oilFields = ["Oil_Field_1", "Oil_Field_2"];

};

