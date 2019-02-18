/*
	Author: Nicholas Jo'Foski
	Description: Creates a random chance of a 'Dye Pack' exploding when a player leaves the bank (Function Called) with dirty cash in their inventory
*/

Foski_dyeCash = {
	[] spawn {
		if (Foski_dirtyCash in (items player) && !(player getVariable ["Foski_dyeCash",false])) then {
			// Max Load Uniform
			_maxLoadUniform = 0;
			if (getContainerMaxLoad uniform player > 0) then {_maxLoadUniform = getContainerMaxLoad uniform player;};
			// Max Load Vest
			_maxLoadVest = 0;
			if (getContainerMaxLoad vest player > 0) then {_maxLoadVest = getContainerMaxLoad vest player;};
			// Max Load Backpack
			_maxLoadBackpack = 0;
			if (getContainerMaxLoad backpack player > 0) then {_maxLoadBackpack = getContainerMaxLoad backpack player;};
			// Total Max Load
			_maxLoad = _maxLoadUniform + _maxLoadVest + _maxLoadBackpack;

			//((({_x == Foski_dirtyCash} count (items player)) / _maxLoad) / 3) < 0.3

			if (random 100 > 50) then {
				player setVariable ["Foski_dyeCash",true,true];
				// Create Smoke Object
				_smoke = "SmokeShellPurple" createVehicle position player; 
				_smoke attachTo [player, [0,0,0.3], "pelvis"];
				_smoke hideObject true; 
				// Replace Cash with Dyed Cash
				sleep 4;
				while {!isNull _smoke} do {
					sleep 0.1;
					_amnt = {_x == Foski_dirtyCash} count (items player);
					if (_amnt > 0) then {
						player removeItems Foski_dirtyCash;
						for "_i" from 1 to _amnt do {player addItem Foski_dyedCash};
					};
				};
				waitUntil {isNull _smoke};
				player setVariable ["Foski_dyeCash",false,true];
			};
		};
	};
};