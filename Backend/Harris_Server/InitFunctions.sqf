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


functionArrays = 
"[
  ['Init_Functions','InitDir'],
  ['Twitter_Functions','TwitterDir'],
  ['TrafficLights_Functions','TrafficLightsDir'],
  ['Interaction_Functions','InteractionDir'],
  ['Mining_Functions','MiningDir'],
  ['Notifications_Functions','NotificationsDir']
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
