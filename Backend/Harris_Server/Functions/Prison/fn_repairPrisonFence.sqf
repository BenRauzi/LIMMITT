/*
	Author: Nicholas Jo'Foski
	Description: Repairs broken prison fences defined in client init
*/

Foski_repairPrisonFence ={
	params [["_brokenFence", objNull]];
	if (isNull _brokenFence || isNull (_brokenFence getVariable "Foski_fixedFence") || typeOf _brokenFence != (Foski_prisonFences select 1) || player distance _brokenFence > 3.5) exitWith {}; // Not a broken fence
	deleteVehicle _brokenFence;
	(_brokenFence getVariable "Foski_fixedFence") hideObject false;
};