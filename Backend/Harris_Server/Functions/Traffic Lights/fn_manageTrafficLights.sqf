/*
	Author: Nicholas Jo'Foski
	Description: Manage Traffic Lights (John Doe's Traffic Lights)
*/

Foski_manageTrafficLights ={
	[] spawn {
		while {true} do {
			["red","green"] call Foski_changeTrafficLights;	
			sleep 10;
			["red","yellow"] call Foski_changeTrafficLights;
			sleep 3;
			["green","red"] call Foski_changeTrafficLights;
			sleep 10;
			["yellow","red"] call Foski_changeTrafficLights;
			sleep 3;
		};
	};
};