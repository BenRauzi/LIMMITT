/*
	Author: Nicholas Jo'Foski
	Description: Server Init function
*/

LIMMITT_clientInit ={
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

	waitUntil {!(isNull (findDisplay 46))};
	if !(isNil {missionNamespace getVariable "firstLogin"}) then {
		[] remoteExecCall ["Foski_manageTrafficLights",2];
		[] remoteExec ["Harris_initOreLoop", 2];
		missionNamespace setVariable ["firstLogin", nil, true];
	};

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
		["Coal_1_MineArea","Coal","JD_OreCoal"],
		["Iron_1_MineArea","Iron","JD_OreIron"],
		["Gold_1_MineArea","Gold","JD_OreGold"],
		["Diamond_1_MineArea","Gold","JD_OreDiamond"]
	];


	player addEventHandler["Fired", {_this call Harris_mineObject; }];

	Harris_Messages = 0;
	message1_active = false;
	message2_active = false;
	message3_active = false;
	message4_active = false;
	message5_active = false;

};

