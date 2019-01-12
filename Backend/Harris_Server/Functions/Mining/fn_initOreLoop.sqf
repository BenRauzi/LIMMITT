/*
	Author: Ben Harris
	Description: Spawns Ores and Initialises Regeneration
*/
Harris_initOreLoop = {

	missionNamespace setVariable ["Harris_Ores", [], true];
	while {true} do
	{
		waitUntil {count allPlayers > 0};
		[] remoteExecCall ["Harris_oreSpawn", allPlayers select 0];
		sleep 300;
	};	
};