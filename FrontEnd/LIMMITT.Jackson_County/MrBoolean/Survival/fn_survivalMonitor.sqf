if (life_eattotal > 9) then {
	life_eattotal = life_eattotal - 10;
};

[] call life_fnc_foodMonitor;
[] call life_fnc_waterMonitor;
[] call life_fnc_phoneBatteryMonitor; 
[] call life_fnc_karmaMonitor;

//Done running everything - let's update the hud
[] call life_fnc_hudUpdate;