/*
	Author: Nicholas Jo'Foski
	Description: Server Init function
*/

LIMMITT_ServerInit ={
	missionNameSpace setVariable ["firstLogin", false, true];
	LIMMITT_Servers = ["LIMMITT Network Official Server | Custom ArmA 3 Life | ts.limmitt-network.co.uk"];
	publicVariable "LIMMITT_Servers";
};