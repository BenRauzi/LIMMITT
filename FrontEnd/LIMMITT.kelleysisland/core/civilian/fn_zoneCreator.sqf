/*
	File: fn_zoneCreator.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Creates triggers around the map to add the addAction for specific
	fields such as apples, cocaine, heroin, etc. This method is to reduce
	CPU load.
	
	Note: 
	Triggers are NOT my preferred method so this is considered temporary until a more suitable
	option is presented.
*/

/*
private["_appleZones","_peachZones","_heroinZones","_cocaineZones","_weedZones", "_methZones","_MDMAZones","_shank","_HHZones"];
_appleZones = ["wheat_1","wheat_2","sunflower_1","sunflower_2"];
_peachZones = ["corn_1","bean_1","cotton_1","olive_1"];
_heroinZones = ["opium_1"];
_cocaineZones = ["coke_1","coke_2","coke_3"];
_weedZones = ["cannabis_1", "cannabis_2"];
_methZones = ["meth_1"];
_MDMAZones = ["MDMA_1"];
_shankZones = ["SHANK_1"];
_HHZones = ["HH_1"];

//Create Haunted House
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[100,100,0,false];
	_zone setTriggerActivation["ANY","PRESENT",true];
	_zone setTriggerStatements["player in thislist","life_action_hh = player addAction['Open your mind...',life_fnc_hh,'',0,false,false,'','!life_action_inUse'];","player removeAction life_action_hh;"];
} foreach _HHZones;

//Create SHANK Creation zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[40,40,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","life_action_shank = player addAction['Create Shank',life_fnc_shank,'',0,false,false,'','!life_action_inUse'];","player removeAction life_action_shank;"];
} foreach _shankZones;



//Create MDMA zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[8,8,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_MDMA = player addAction['Gather MDMA',life_fnc_gatherMDMA,'',0,false,false,'','!life_action_inUse'];","player removeAction LIFE_Action_MDMA;"];
} foreach _MDMAZones;


//Create meth zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[8,8,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_Meth = player addAction['Meth Seperation',life_fnc_gatherMeth,'',0,false,false,'','!life_action_inUse'];","player removeAction LIFE_Action_Meth;"];
} foreach _methZones;

//Create apple zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[25,25,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_Apples = player addAction[(localize ""STR_Gather_Apples""),life_fnc_gather,'',0,false,false,'','!life_action_inUse'];","player removeAction LIFE_Action_Apples;"];
} foreach _appleZones;

//Create peach zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[25,25,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_Peaches = player addAction[(localize ""STR_Gather_Peaches""),life_fnc_gather,'',0,false,false,'','!life_action_inUse'];","player removeAction LIFE_Action_Peaches;"];
} foreach _peachZones;

//Create heroin zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[50,50,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_heroin = player addAction[(localize ""STR_Gather_Heroin""),life_fnc_gather,'',0,false,false,'','!life_action_inUse'];","player removeAction LIFE_Action_Heroin;"];
} foreach _heroinZones;

//Create Weed zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[90,90,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_Cannabis = player addAction[(localize ""STR_Gather_Cannabis""),life_fnc_gather,'',0,false,false,'','!life_action_inUse'];","player removeAction LIFE_Action_Cannabis;"];
} foreach _weedZones;
*/