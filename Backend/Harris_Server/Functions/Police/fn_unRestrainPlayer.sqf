/*
	Author: Nicholas Jo'Foski
	Description: Change Traffic Lights (John Doe's Traffic Lights) | ["red","green"] call Foski_fnc_changeTrafficLights (Red, Green or Yellow)
*/

Foski_changeTrafficLights ={
	params ["_mode1","_mode2"];
	_lights1 = nearestObjects [player, ["Land_light_1_1","Land_light_2_1"], 500];
	_lights2 = nearestObjects [player, ["Land_light_1_2","Land_light_2_2"], 500];
	switch (_mode1) do { 
		case "red" : {
			{ // Assign all first lights to green
				_x setObjectTexture [0,"#(argb,8,8,3)color(1,0,0,1.0,co)"]; // Red
				_x setObjectTexture [1,""]; // Yellow
				_x setObjectTexture [2,""]; // Green
			} forEach _lights1;
		}; 
		case "yellow" : {
			{ // Assign all first lights to green
				_x setObjectTexture [0,""]; // Red
				_x setObjectTexture [1,"#(argb,8,8,3)color(1,0.501961,0,1.0,co)"]; // Yellow
				_x setObjectTexture [2,""]; // Green
			} forEach _lights1;
		};
		case "green" : {
			{ // Assign all first lights to green
				_x setObjectTexture [0,""]; // Red
				_x setObjectTexture [1,""]; // Yellow
				_x setObjectTexture [2,"#(argb,8,8,3)color(0,0.807843,0,1.0,co)"]; // Green
			} forEach _lights1;
		}; 
		default {}; 
	};
	switch (_mode2) do { 
		case "red" : {
			{ // Assign all first lights to green
				_x setObjectTexture [0,"#(argb,8,8,3)color(1,0,0,1.0,co)"]; // Red
				_x setObjectTexture [1,""]; // Yellow
				_x setObjectTexture [2,""]; // Green
			} forEach _lights2;
		}; 
		case "yellow" : {
			{ // Assign all first lights to green
				_x setObjectTexture [0,""]; // Red
				_x setObjectTexture [1,"#(argb,8,8,3)color(1,0.501961,0,1.0,co)"]; // Yellow
				_x setObjectTexture [2,""]; // Green
			} forEach _lights2;
		};
		case "green" : {
			{ // Assign all first lights to green
				_x setObjectTexture [0,""]; // Red
				_x setObjectTexture [1,""]; // Yellow
				_x setObjectTexture [2,"#(argb,8,8,3)color(0,0.807843,0,1.0,co)"]; // Green
			} forEach _lights2;
		}; 
		default {}; 
	};
};