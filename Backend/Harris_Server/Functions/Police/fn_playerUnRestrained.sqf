/*
	Author: Nicholas Jo'Foski
	Description: Unrestrains the player
*/

Foski_playerUnRestrained ={
	if (isNil {player getVariable "Foski_Restrained"}) then {player setVariable ["Foski_Restrained", false, true];};
	if (player getVariable "Foski_Restrained") then {
		player setVariable ["Foski_Restrained", false, true];
		if (isNil {player getVariable "Foski_RestrainedPos"}) then {player setVariable ["Foski_RestrainedPos","back",true];};
		player playAction ("Foski_UnCuff_" + (player getVariable "Foski_RestrainedPos"));

		player forceWalk false;;
	};
};