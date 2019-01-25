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
			if (player getVariable "Foski_Surrender") then {[] call Foski_playerSurrender};
			sleep 0.1;
			player setVariable ["Foski_Restrained", true, true];
			player setVariable["restrained", true, true];
			if !(currentWeapon player isKindOf ["Pistol", configFile >> "CfgWeapons"]) then {
				Holstlife_curWep_h = currentWeapon player;
				player action ["SwitchWeapon", player, player, 100];
				player switchcamera cameraView;
				[[player,"AmovPercMstpSnonWnonDnon"],"life_fnc_animSync",true,false] spawn bis_fnc_mp;
				player switchMove "AmovPercMstpSnonWnonDnon";
			};
			player playAction ("Foski_Cuff_" + _pos);
			["Foski_Restrained"] call Foski_dropHandgun;
			player setVariable ["Foski_RestrainedPos",_pos,true];

			player forceWalk true;
		};
		// Manage the restrained player
		while {true} do {
			if !(player getVariable "Foski_Restrained") exitWith {player setVariable ["tf_unable_to_use_radio", false, true]; player setVariable["restrained", false, true]; player setVariable ["Harris_TwitterEnabled", true, true]; player setVariable ["Harris_InteractionEnabled", true, true];};
			// Block Certain Actions
			player playAction ("Foski_Cuff_" + _pos); // Constantly loop animation to stop it from being overidden
			player setVariable ["tf_unable_to_use_radio", true, true]; // Disable the use of a radio
			player setVariable ["Harris_TwitterEnabled", false, true]; // Disable typing in twitter
			player setVariable ["Harris_InteractionEnabled", false, true]; // Disable interaction menu
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