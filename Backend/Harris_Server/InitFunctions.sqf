/*
  Author: Ben Harris
  Description: Initialises All Server-Side Functions, Meaning they can be saved server-side but accessed by the client
*/

InitDir = "\Harris_Server\Functions\Init\";
Init_Functions =
[
  ["fn_serverInit","LIMMITT_ServerInit"],
  ["fn_clientInit","LIMMITT_clientInit"]
];

TwitterDir = "\Harris_Server\Functions\Twitter\";
Twitter_Functions = 
[
  ["fn_addMessage", "Harris_addMessage"],
  ["fn_updateTwitter", "Harris_updateTwitter"],
  ["fn_openTwitterType", "Harris_openTwitterType"],
  ["fn_sendMessage", "Harris_sendMessage"]
];

TrafficLightsDir = "\Harris_Server\Functions\Traffic Lights\";
TrafficLights_Functions = 
[
  ["fn_changeTrafficLights", "Foski_changeTrafficLights"],
  ["fn_manageTrafficLights", "Foski_manageTrafficLights"]
];

InteractionDir = "\Harris_Server\Functions\Interaction\";
Interaction_Functions = 
[
  ["fn_colourRadialInner", "Harris_colourRadialInner"],
  ["fn_colourRadialOuter", "Harris_colourRadialOuter"],
  ["fn_interactionExecute", "Harris_interactionExecute"],
  ["fn_openinteraction", "Harris_openinteraction"]
];

MiningDir = "\Harris_Server\Functions\Mining\";
Mining_Functions = 
[
  ["fn_initOreLoop", "Harris_initOreLoop"],
  ["fn_mineObject", "Harris_mineObject"],
  ["fn_oreSpawn", "Harris_oreSpawn"]
];

NotificationsDir = "\Harris_Server\Functions\Notifications\";
Notifications_Functions = 
[
  ["fn_Notifications", "Harris_Notifications"]
];

CraftingDir = "\Harris_Server\Functions\Crafting\";
Crafting_Functions = 
[
  ["fn_addBluePrint", "Harris_addBluePrint"],
  ["fn_craftItem", "Harris_craftItem"],
  ["fn_onCraftLbChanged", "Harris_onCraftLbChanged"],
  ["fn_onCraftSelectionLbChanged", "Harris_onCraftSelectionLbChanged"],
  ["fn_openCraftingMenu", "Harris_openCraftingMenu"],
  ["fn_openCraftTimer", "Harris_openCraftTimer"],
  ["fn_useItemPhysical", "Harris_useItemPhysical"]
];

FurnitureDir = "\Harris_Server\Functions\Furniture\";
Furniture_Functions = 
[
  ["fn_createFurniture", "Harris_createFurniture"],
  ["fn_dropFurniture", "Harris_dropFurniture"],
  ["fn_pickUpFurniture", "Harris_pickUpFurniture"],
  ["fn_removeFurniture", "Harris_removeFurniture"]
];

PoliceDir = "\Harris_Server\Functions\Police\";
Police_Functions = 
[
  ["fn_playerRestrained", "Foski_playerRestrained"],
  ["fn_playerUnRestrained", "Foski_playerUnRestrained"],
  ["fn_restrainPlayer", "Foski_restrainPlayer"],
  ["fn_unRestrainPlayer", "Foski_unRestrainPlayer"],
  ["fn_code1", "Harris_code1"],
  ["fn_code2", "Harris_code2"],
  ["fn_code3", "Harris_code3"],
  ["fn_tazed", "Harris_tazed"]

];

MiscDir = "\Harris_Server\Functions\Misc\";
Misc_Functions = 
[
  ["fn_inventoryOpened", "Harris_inventoryOpened"],
  ["fn_openSetName", "Harris_openSetName"],
  ["fn_setName", "Harris_setName"],
  ["fn_playerTags", "Harris_playerTags"],
  ["fn_playerSurrender", "Foski_playerSurrender"],
  ["fn_dropHandgun", "Foski_dropHandgun"]
];

CitationsDir = "\Harris_Server\Functions\Citations\";
Citations_Functions = 
[
  ["fn_openGiveTicket", "Harris_openGiveTicket"],
  ["fn_payTicket", "Harris_payTicket"],
  ["fn_receiveTicket", "Harris_receiveTicket"],
  ["fn_refuseTicket", "Harris_refuseTicket"],
  ["fn_sendTicket", "Harris_sendTicket"]
];

ShopsDir = "\Harris_Server\Functions\Shops\";
Shops_Functions = 
[
  ["fn_onLbSelChanged", "Harris_onLbSelChanged"],
  ["fn_openShop", "Harris_openShop"],
  ["fn_refreshShop", "Harris_refreshShop"],
  ["fn_sellItem", "Harris_sellItem"]
];

CrimeDir = "\Harris_Server\Functions\Crime\";
Crime_Functions = 
[
  ["fn_robBank", "HRP_fnc_robBank"],
  ["fn_checkBank", "Harris_checkBank"],
  ["fn_serverMsg", "Harris_serverMsg"]
];


functionArrays = 
"[
  ['Init_Functions','InitDir'],
  ['Twitter_Functions','TwitterDir'],
  ['TrafficLights_Functions','TrafficLightsDir'],
  ['Interaction_Functions','InteractionDir'],
  ['Mining_Functions','MiningDir'],
  ['Notifications_Functions','NotificationsDir'],
  ['Crafting_Functions','CraftingDir'],
  ['Furniture_Functions','FurnitureDir'],
  ['Police_Functions','PoliceDir'],
  ['Misc_Functions','MiscDir'],
  ['Shops_Functions','ShopsDir'],
  ['Crime_Functions','CrimeDir']
]";

functionArrays2 = call compile functionArrays;

{
  Harris_Compile = _x select 0;
  Harris_File = call compile Harris_Compile;
  Harris_Directory = _x select 1;
  Harris_Dir = call compile Harris_Directory;

  {
    Harris_File2 = _x;
    Harris_File3 = Harris_File2 select 0;
    Harris_File4 = Harris_File2 select 1;
    Harris_Final = Harris_Dir + Harris_File3 + ".sqf";
    systemChat format ["Loading Function, Please Wait %1", Harris_Final];
    diag_log format ["Loading Function, Please Wait %1", Harris_Final];
    [] call compile preprocessFileLineNumbers Harris_Final;
    publicVariable Harris_File4;
    systemChat "Function Loaded";
    diag_log "Function Loaded";
  } foreach Harris_File;

} foreach functionArrays2