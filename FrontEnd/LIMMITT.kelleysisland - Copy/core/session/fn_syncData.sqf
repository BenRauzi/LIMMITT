/*
	File: fn_syncData.sqf
	Author: Bryan "Tonic" Boardwine"
	
	Description:
	Used for player manual sync to the server.
*/
uiSleep 0.2;
_syncsucces = "\A3L_Client2\tablet_new\other\syncmenu\syncmenu.paa";
_cannotsync = "\A3L_Client2\tablet_new\other\syncmenu\cannotsync.paa";

_fnc_scriptName = "Player Synchronization";
private["_exit"];
if(isNil "life_session_time") then {life_session_time = false;};
if(life_session_time) exitWith {
["Error", "You cannot sync as you have recently done so!", "Failure"] spawn Harris_Notifications;
};

[] call SOCK_fnc_updateRequest;
//hint localize "STR_Session_SyncData";
[] spawn
{
	life_session_time = true;
	uiSleep (5 * 60);
	life_session_time = false;
};

["Success", "You have synced your data!", "Success"] spawn Harris_Notifications;