/*
	File: fn_initHC.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Server checks for the headless client and initializes?
*/
private["_HC_Monitor"];
if(isNil "life_HC_isActive") then {life_HC_isActive = false;};


HC_DC = ["HC_Disconnected","onPlayerDisconnected",{if(!isNil "HC_UID" && {_uid == HC_UID}) then {life_HC_isActive = false;};}] call BIS_fnc_addStackedEventHandler;


"life_HC_isActive" addPublicVariableEventHandler {
HC_UID = getPlayerUID hc_1;
};


if(isNil "HC_UID" && {!isNil "hc_1"} && {!isNull hc_1}) then {
HC_UID = getPlayerUID hc_1;
life_HC_isActive = true;
};life_fnc_sidechat =
compileFinal "
	life_sidechat = false; };
	[[player,life_sidechat,playerSide],""TON_fnc_managesc"",false,false] spawn bis_fnc_mp;
	[] call life_fnc_settingsMenu;
";