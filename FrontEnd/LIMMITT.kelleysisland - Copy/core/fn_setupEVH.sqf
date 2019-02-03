/*
	Master eventhandler file
*/
player addEventHandler["Killed", {gm_playerWeapon = primaryWeapon player; _this spawn life_fnc_onPlayerKilled}];
player addEventHandler["handleDamage",{_this call life_fnc_handleDamage;}];
player addEventHandler["Respawn", {_this call life_fnc_onPlayerRespawn}];
player addEventHandler["Take",{_this spawn life_fnc_onTakeItem}];
player addEventHandler["Fired",{_this call life_fnc_onFired}];
player addEventHandler["InventoryClosed", {_this spawn life_fnc_inventoryClosed}];
player addEventHandler ["FiredNear", {_this call life_fnc_antiCombatRevive}];
"bis_fnc_mp_packet" addPublicVariableEventHandler {[_this select 0,_this select 1] call bis_fnc_mpexec;};

player setVariable["life_is_arrested",false,true];

["MyID", "OnSpeak", {
	if(_this select 1) then {
		player setvariable ["tfrchat",true,true];
	} else {
		player setvariable ["tfrchat",false,true];
	};
}, player] call TFAR_fnc_addEventHandler;


