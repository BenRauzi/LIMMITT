/*
	File: initServer.sqf
	
	Description:
	Starts the initialization of the server.
*/



if(!(_this select 0)) exitWith {}; //Not server
[] call compile PreprocessFileLineNumbers "\life_server\init.sqf";
[] call compile PreprocessFileLineNumbers "\life_server\initA3L.sqf";
[] execVM "Harris_Server\InitFunctions.sqf";
//master_group attachTo[bank_obj,[0,0,0]];

onMapSingleClick "if(_alt) then {vehicle player setPos _pos};";

taxiRadioChannel = radioChannelCreate [[0.85,0.85,0,1], "Taxi Channel", "%UNIT_NAME", []];
publicVariable "taxiRadioChannel";

journalistRadioChannel = radioChannelCreate [[0,0,1,1], "Journalist Channel", "%UNIT_NAME", []];
publicVariable "journalistRadioChannel";

repairRadioChannel = radioChannelCreate [[0,0.3,0.6,1], "Repairman Channel", "%UNIT_NAME", []];
publicVariable "repairRadioChannel";

ticketLog = [];
publicVariable "ticketLog";

execVM "gmtime.sqf";

missionNameSpace setVariable ["firstLogin", false, true];