/*
	Author: Nicholas Jo'Foski
	Description: Cuts open prison fences defined in client init
*/

Foski_breakPrisonFence ={
	params [["_fence", objNull]];
	_wpn = currentWeapon player;

	// Animate player (weapon)
	if !(_wpn in Foski_prisonFenceWpns) exitWith {}; 

	switch (_wpn) do { 
		case "A3L_Pickaxe" : {
			player playAction "GestureSwing";
		}; 
		default {}; 
	};

	if (isNull _fence || typeOf _fence != (Foski_prisonFences select 0) || player distance _fence > 3.5) exitWith {}; // Not a breakable fence

	// Set the fence cut & hit variables
	if (isNil {_fence getVariable "Foski_fenceCut"}) then {
		_fence setVariable ["Foski_fenceCut",[0,round(random Foski_prisonFenceCut)],true];
	};

	_cut = _fence getVariable "Foski_fenceCut" select 0;
	_cutHits = _fence getVariable "Foski_fenceCut" select 1;
	_fence say3D "cuttingWire";
	_cut = _cut + 1;
	if (_cut >= _cutHits) then {
		_cutFence = (Foski_prisonFences select 1) createVehicle [0,0,0];
		_cutFence setDir (direction _fence);
		_fence hideObject true;
		_cutFence setPosATL (getPosATL _fence);
		_cutFence setVariable ["Foski_fixedFence",_fence,true];
	} else {
		_fence setVariable ["Foski_fenceCut",[_cut,_cutHits],true];
	};
};