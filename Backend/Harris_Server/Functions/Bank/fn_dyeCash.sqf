/*
	Author: Nicholas Jo'Foski
	Description: Creates a random chance of a 'Dye Pack' exploding when a player leaves the bank (Function Called) with dirty cash in their inventory
*/

Foski_dyeCash = {
	[] spawn {
		if (Foski_dirtyCash in (items player)) then {
			// Max Load Uniform
			if (getContainerMaxLoad uniform player < 0) then {_maxLoadUniform = 0;} else {_maxLoadUniform = getContainerMaxLoad uniform player;};
			// Max Load Vest
			if (getContainerMaxLoad vest player < 0) then {_maxLoadVest = 0;} else {_maxLoadVest = getContainerMaxLoad vest player;};
			// Max Load Backpack
			if (getContainerMaxLoad backpack player < 0) then {_maxLoadBackpack = 0;} else {_maxLoadBackpack = getContainerMaxLoad backpack player;};
			// Total Max Load
			_maxLoad = _maxLoadUniform + _maxLoadVest + _maxLoadBackpack;

			//((({_x == Foski_dirtyCash} count (items player)) / _maxLoad) / 3) < 0.3

			if (random 100 > 50) then {
				// Create Smoke Object
				_smoke = "SmokeShellPurple" createVehicle position player; 
				_smoke attachTo [player, [0,0,0.3], "pelvis"];
				_smoke hideObject true; 
				// Replace Cash with Dyed Cash
				sleep 4;
				_newAmnt = {_x == Foski_dirtyCash} count (items player);
				player removeItems Foski_dirtyCash;
				for "_i" from 1 to _newAmnt do {player addItem Foski_dyedCash};
				sleep 5;
				deleteVehicle _smoke;
			};
		};
	};
};