/*
	Author: Ben Harris
	Description: Adds Blueprint to player
*/


Harris_addBluePrint = {
	params["_bp"];

	if (isNil "_bp") then {
		_bp = selectRandom Harris_bluePrints;
	};

	player playMove "AinvPknlMstpSnonWnonDnon_medic_1";

	_bluePrints = player getVariable "bluePrints";

	

	closeDialog 0;
	player removeItem "RR_blueprintnotes";

	sleep 3;
	test = _bp select 0;
	test2 = player getVariable "bluePrints";
	if ((_bp select 0) in (player getVariable "bluePrints")) exitWith {
		["Error", "You already know this bluePrint", true] spawn Harris_Notifications;
	};
	_msg = format ["You just researched a %1 blueprint", (_bp select 1)];
	["Success", _msg, true] spawn Harris_Notifications;

	_bluePrints pushBack (_bp select 0);
	player setVariable ["bluePrints", _bluePrints, true];

	profileNamespace setVariable ['bluePrints', _bluePrints, true];
	saveProfileNamespace;
};
