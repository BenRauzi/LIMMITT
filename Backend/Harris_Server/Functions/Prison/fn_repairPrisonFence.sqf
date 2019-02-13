/*
	Author: Nicholas Jo'Foski
	Description: Repairs broken prison fences defined in client init
*/

Foski_repairPrisonFence ={
	params [["_brokenFence", objNull]];

	if (isNull _brokenFence || typeOf _brokenFence != (Foski_prisonFences select 1) || player distance _brokenFence > 3.5) exitWith {}; // Not a broken fence
	//if (isNull _brokenFence || str _brokenFence find (Foski_prisonFences select 0) < 0 || player distance _brokenFence > 3.5) exitWith {}; // Not a breakable fence

	_repairedFence = (Foski_prisonFences select 0) createVehicle [0,0,0];
	_repairedFence setDir (direction _brokenFence);
	deleteVehicle _brokenFence;
	_repairedFence setPosATL (getPosATL _brokenFence);
};