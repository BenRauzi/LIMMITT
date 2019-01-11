/*
	Author: Nicholas Jo'Foski
	Description: UnRestrains a player
*/

Foski_unRestrainPlayer ={
	params ["_person"];
	if (isNil "_person") exitWith {};
	if !(_person getVariable "Foski_Restrained") exitWith {};
	[] remoteExecCall ["Foski_playerUnRestrained", _person];
};