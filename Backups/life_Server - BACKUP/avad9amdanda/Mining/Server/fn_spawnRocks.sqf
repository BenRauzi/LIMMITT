// Heisen
// 0:iron(marker: mine_zone_0), 1:coal(marker: mine_zone_1), 2:diamond(marker: mine_zone_2)

rockAllowSpawning = false; // enable rock spawning or not
rockTypes = ["A3L_Bits_Rock_L_Iron","A3L_Bits_Rock_L_Coal","A3L_Bits_Rock_L_Diamond"];

svr_spawnRocks = {
	private ["_countArr"];
	params [
		"_rock" 
	];
	
	_countArr = [];
	{
		if ((typeOf _x) IN rockTypes) then {
			_countArr pushback _x;
		};
	} forEach (nearestObjects[getMarkerPos format ["mine_zone_%1",_rock],[],50]);
	
	if ((count _countArr) < 15) exitWith {
		_rockType = rockTypes select _rock;
		
		_newRock = _rockType createVehicle [((getMarkerPos format ["mine_zone_%1",_rock]) select 0)+random(25),((getMarkerPos format ["mine_zone_%1",_rock]) select 1)+random(25),((getMarkerPos format ["mine_zone_%1",_rock]) select 2)+random(25)];
		_newRock setVariable ["rockHealth",100,true];
		_newRock setVariable ["rockType",_rock,true];
	};
};

[] spawn {
	if !(rockAllowSpawning) exitWith {};
	//looperino
	for "_i" from 0 to 1 step 0 do {
		sleep 10;
		[0] spawn svr_spawnRocks;
		sleep 10;
		[1] spawn svr_spawnRocks;
		sleep 10;
		[2] spawn svr_spawnRocks;
	};
};