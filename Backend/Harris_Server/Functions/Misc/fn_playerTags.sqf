/*
	Author: Ben Harris
	Description: Player Tags Master
*/

Harris_playerTags = {
	onEachFrame
	{
		 {
		   if ((_x != player) && isPlayer _x && (player distance _x) < 5 && (vehicle _x == _x)) then {
		    	if (!alive _x || _x getVariable ["Harris_unconscious", false]) then{
		    		drawIcon3D ["", [1, 1, 1, 1], [visiblePosition _x select 0, visiblePosition _x select 1,(getPosATL _x select 2)+0.5], 0.2, 0.2, 45, (format ["%1 - %2 - Unconscious", getPlayerUID _x, profileNamespace getVariable [str (getPlayerUID	_x), "Unknown"]]), 1, 0.04, "PuristaMedium"];
		    	} else {
		    		 drawIcon3D ["", [1, 1, 1, 1], [visiblePosition _x select 0, visiblePosition _x select 1,(getPosATL _x select 2)+2.1], 0.2, 0.2, 45, (format ["%1 - %2", getPlayerUID _x, profileNamespace getVariable [str (getPlayerUID _x), "Unknown"]]), 1, 0.04, "PuristaMedium"];
		    	};
		   };
		 } foreach nearestObjects [player, ["Man"], 5];
	};
};
