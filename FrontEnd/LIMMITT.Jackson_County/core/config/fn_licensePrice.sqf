/*
	File: fn_licensePrice.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Returns the license price.
*/
private["_type"];
_type = [_this,0,"",[""]] call BIS_fnc_param;
if(_type == "") exitWith {-1};

switch (_type) do
{
case "MDMA": {150000};
case "meth": {150000};
case "coke": {150000};
	case "driver": {5000}; //Drivers License cost
	case "boat": {10000}; //Boating license cost
	case "pilot": {75000}; //Pilot/air license cost
	case "gun": {25000}; //Firearm/gun license cost
	case "dive": {8500}; //Diving license cost
	case "oil": {30000}; //Oil processing license cost
	case "cair": {0}; //Cop Pilot License cost
	case "swat": {0}; //Swat License cost
	case "cg": {0}; //Coast guard license cost
	case "heroin": {30000}; //Heroin processing license cost
	case "marijuana": {75000}; //Marijuana processing license cost
	case "medmarijuana": {75000}; //Medical Marijuana processing license cost
	case "gang": {15000}; //Gang license cost
	case "rebel": {250000}; //Rebel license cost
	case "truck": {5000}; //Truck license cost
	case "diamond": {30000};
	case "salt": {15000};
	case "cocaine": {75000};
	case "sand": {12500};
	case "iron": {12500};
	case "copper": {12500};
	case "cement": {12500};
	case "mair": {12500};
	case "home": {100000};
	
	case "rifle": {32500};
	case "forestry": {30000};
	case "uranium": {30000}; 
	case "lsmo": {0};
	case "lsmovehicle": {0};
	case "strife": {0};
	case "harv": {0};
	case "dino": {0};
	case "mason": {0};
    case "narcos": {0};
	case "whyos": {0};
	case "davis": {0};
	case "casper": {0};
	case "corleone": {0};
	case "kavali": {0};
};