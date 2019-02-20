/*
	Author: Nicholas Jo'Foski
	Description: Creates a random chance of a 'Dye Pack' exploding when a player leaves the bank (Function Called) with dirty cash in their inventory
*/

Foski_dyeCash = {
	[] spawn {
		if (Foski_dirtyCash in (items player) && !(player getVariable ["Foski_dyeCash",false])) then {
			_probability = [] call Foski_dyeProbability;
			if (_probability) then {
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
						for "_i" from 1 to _amnt do {player addItem Foski_dyedDirtyCash};
					};
				};
				waitUntil {isNull _smoke};
				player setVariable ["Foski_dyeCash",false,true];
			};
		};
	};
};