/*
	Author: Ben Harris
	Description: Spawns Ores
*/
Harris_oreSpawn = {
	
	_ores = (missionNamespace getVariable "Harris_Ores");
	{
		deleteVehicle _x;
	} forEach _ores;
	
	_ores = [];

	for "_i" from 1 to 30 do {
		{
			_AorB = round (random 4);
			Harris_Pos = getMarkerPos (_x select 0);

			Harris_xPos = round (random 50);
			Harris_yPos = round (random 50);

			_object = _x select 2;

			switch (_AorB) do
			{
				case 0:
				{
					Harris_orePos = [(Harris_Pos select 0) + Harris_xPos, (Harris_Pos select 1) + Harris_yPos, (Harris_Pos select 2)];
				};
				case 1:
				{
					Harris_orePos = [(Harris_Pos select 0) + Harris_xPos, (Harris_Pos select 1) + Harris_yPos, (Harris_Pos select 2)];
				};
				case 2:
				{
					Harris_orePos = [(Harris_Pos select 0) - Harris_xPos, (Harris_Pos select 1) - Harris_yPos, (Harris_Pos select 2)];
				};
				case 3:
				{
					Harris_orePos = [(Harris_Pos select 0) + Harris_xPos, (Harris_Pos select 1) - Harris_yPos, (Harris_Pos select 2)];
				};
				case 4:
				{
					Harris_orePos = [(Harris_Pos select 0) - Harris_xPos, (Harris_Pos select 1) + Harris_yPos, (Harris_Pos select 2)];
				};
			};

			_ore = _object createVehicle Harris_orePos;
			_ores pushBack _ore;
			_ore setVariable ["mined", 0, true];
		} foreach Harris_mineArea;
	};

	missionNamespace setVariable ["Harris_Ores", _ores, true];
};
