/*
	Caiden
*/

amd92mamd9am02m = [];

am2d9m9a2dm = [
	"\fn_sendFunctions.sqf",
];

a9a2md9am2d9a2md9am2d = [	
	"\fn_clientvars.sqf",
	"\Cartel\Client\fn_client.sqf",
	"\Police\Client\fn_stripSearch.sqf",
	"\Police\Client\fn_searchVehicle.sqf"
];

{
private ["_compiled","_preprocess"];
_preprocess = preprocessFile (format ["\life_server\avad9amdanda%1",_x]);
_compiled = compile _preprocess;
[] spawn _compiled;
} foreach am2d9m9a2dm;

{
private ["_compiled","_preprocess"];
_preprocess = preprocessFile (format ["\life_server\avad9amdanda%1",_x]);
_compiled = compile _preprocess;
amd92mamd9am02m = amd92mamd9am02m + [_compiled];
} foreach a9a2md9am2d9a2md9am2d;

amd92mamd9am02m = amd92mamd9am02m + [{an92dma9dma9mda9 = true; amd92mamd9am02m = nil;}];

publicVariable "amd92mamd9am02m";
am2d9m9a2dm = nil;
amd92mamd9am02m = nil;

life_gang_captures = [
	["Herion Cartel",["",false],["",false],0,""],
	["Marijuana Cartel",["",false],["",false],0,""],
	["Oil Cartel",["",false],["",false],0,""],
	["Arms Dealer",["",false],["",false],0,""]
];
life_gang_captures_0 = false;
life_gang_captures_1 = false;
life_gang_captures_2 = false;
life_gang_captures_3 = false;
life_shopTax = 1;

publicVariable "life_gang_captures";
publicVariable "life_gang_captures_0";
publicVariable "life_gang_captures_1";
publicVariable "life_gang_captures_2";
publicVariable "life_gang_captures_3";
publicVariable "life_shopTax";
