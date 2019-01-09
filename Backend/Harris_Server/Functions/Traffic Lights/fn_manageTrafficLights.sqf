/*
	Author: Nicholas Jo'Foski
	Description: Manage Traffic Lights (John Doe's Traffic Lights)
*/

Foski_manageTrafficLights ={
	[] spawn {
		while {true} do {
			["red","green"] remoteExecCall ["Foski_changeTrafficLights", 0];	
			sleep 10;
			["red","yellow"] remoteExecCall ["Foski_changeTrafficLights", 0];
			sleep 3;
			["green","red"] remoteExecCall ["Foski_changeTrafficLights", 0];
			sleep 10;
			["yellow","red"] remoteExecCall ["Foski_changeTrafficLights", 0];
			sleep 3;
		};
	};
};