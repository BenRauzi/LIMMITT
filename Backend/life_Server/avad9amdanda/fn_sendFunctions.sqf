"fnc_requestFunctions" addPublicVariableEventHandler {
	private ["_player"];
	_player = owner (_this select 1);
	[{{[] spawn _x} foreach amd92mamd9am02m;},"BIS_fnc_spawn",_player,false] call BIS_fnc_MP;
};