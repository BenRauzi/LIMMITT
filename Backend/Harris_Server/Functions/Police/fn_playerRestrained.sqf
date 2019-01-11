/*
	Author: Nicholas Jo'Foski
	Description: Restrains and manages the player while restrained
*/

Foski_playerRestrained ={
	[_this select 0] spawn {
		// Restrain the player
		_pos = _this select 0;
		if (isNil "_pos") then {_pos = "back"};
		if !(_pos in ["front","back"]) then {_pos = "back"};
		if (isNil {player getVariable "Foski_Restrained"}) then {player setVariable ["Foski_Restrained", false, true];};
		if !(player getVariable "Foski_Restrained") then {
			player setVariable ["Foski_Restrained", true, true];
			player getVariable["restrained", true, true];
			if !(currentWeapon player isKindOf ["Pistol", configFile >> "CfgWeapons"]) then {
				Holstlife_curWep_h = currentWeapon player;
				player action ["SwitchWeapon", player, player, 100];
				player switchcamera cameraView;
				[[player,"AmovPercMstpSnonWnonDnon"],"life_fnc_animSync",true,false] spawn bis_fnc_mp;
				player switchMove "AmovPercMstpSnonWnonDnon";
			};
			player playAction ("Foski_Cuff_" + _pos);
			player setVariable ["Foski_RestrainedPos",_pos,true];
		};

		// Manage the restrained player
		while {true} do {
			if !(player getVariable "Foski_Restrained") exitWith {player getVariable["restrained", false, true]; player setVariable ["tf_unable_to_use_radio", false, true];};
			// Block Certain Actions
			player playAction ("Foski_Cuff_" + _pos); // Constantly loop animation to stop it from being overidden
			player setVariable ["tf_unable_to_use_radio", true, true]; // Disable the use of a radio
			if (!isNull findDisplay 602) then {closeDialog 602;}; // Disable Inventory
			if (vehicle player != player && driver (vehicle player) == player) then {player action["eject",vehicle player];}; // Eject player from vehicle if in the drivers seat
			// Block any type of weapon switching | V
			if !(currentWeapon player == "" || currentWeapon player isKindOf ["Pistol", configFile >> "CfgWeapons"]) then { // Changed to '! isKindOf "Pistol"' to stop bino's coming out as well
				Holstlife_curWep_h = currentWeapon player;
				player action ["SwitchWeapon", player, player, 100];
				player switchcamera cameraView;
				[[player,"AmovPercMstpSnonWnonDnon"],"life_fnc_animSync",true,false] spawn bis_fnc_mp;
				player switchMove "AmovPercMstpSnonWnonDnon";
			};
			if (currentVisionMode player == 1) then {player action ["nvGogglesOff", player];}; // Check if the player has enabled night vision, if so disable it

			sleep 0.1;
		};
	};
};