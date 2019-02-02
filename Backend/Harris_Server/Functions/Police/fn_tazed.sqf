/*
	Author: Ben Harris
	Descirption: Tazes the player
*/

Harris_tazed = {
	[] remoteExecCall ["KK_fnc_forceRagdoll", player];
	player setVariable ["Harris_unconscious", true, true];
	playSound3D ["Harris_Client\Sounds\tazer.ogg", player, false, getpos player, 1, 1, 125];
	life_iztazed = true;
	sleep 2;
	player setVariable ["Harris_unconscious", nil, true];
	life_iztazed = false;
};