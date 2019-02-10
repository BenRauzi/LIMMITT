/*
*
*	Author: MrBoolean
*
*/
private["_display","_respawn","_manual","_title","_abort","_version"];
disableSerialization;

_display = _this select 0;
_respawn = _display displayCtrl 1010;
_manual = _display displayCtrl 122;
_title = _display displayCtrl 523;
_abort = _display displayCtrl 104;
_version = _display displayCtrl 1005;

_respawn ctrlEnable false; //Disable Respawn
_manual ctrlEnable false; //Stops a RE Bug

[] spawn SOCK_fnc_syncSilent;

_version ctrlSetText "LIMMITT Network v1.0";
_title ctrlSetText "LIMMITT Network";
_abort ctrlSetText "Leave LIMMITT Network";
_abort ctrlSetEventHandler ["ButtonClick", "[] call life_fnc_manageAbort; (uiNamespace getVariable 'RscDisplayMPInterrupt') closeDisplay 2;true"];

_meme = getUnitLoadout player;
player setUnitLoadout _meme;

true