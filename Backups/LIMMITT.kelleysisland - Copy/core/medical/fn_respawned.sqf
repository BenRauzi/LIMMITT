/*
	File: fn_respawned.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sets the player up if he/she used the respawn option.
*/
private["_handle"];
life_death = 2;
//Reset our weight and other stuff
life_use_atm = TRUE;
life_hunger = 100;
life_thirst = 100;
life_carryWeight = 0;
LIMMITTCASH = 0; //Make sure we don't get our cash back.
life_respawned = false;
playSound "intro";
if (player getVariable "Foski_Restrained") then {[] call Foski_playerUnRestrained;};
player playMove "amovpercmstpsnonwnondnon";

life_corpse setVariable["Revive",nil,TRUE];
life_corpse setVariable["name",nil,TRUE];
life_corpse setVariable["Reviving",nil,TRUE];
player setVariable["Revive",nil,TRUE];
player setVariable["name",nil,TRUE];
player setVariable["Reviving",nil,TRUE];

//Load gear for a 'new life'
switch(playerSide) do
{
	case west: {
		_handle = [] spawn life_fnc_copLoadout;
	};
	case civilian: {
		_handle = [] spawn life_fnc_civLoadout;
	};
	case independent: {
		_handle = [] spawn life_fnc_medicLoadout;
	};
	waitUntil {scriptDone _handle};
};

//Cleanup of weapon containers near the body & hide it.
if(!isNull life_corpse) then {
	private["_containers"];
	life_corpse setVariable["Revive",TRUE,TRUE];
	_containers = nearestObjects[life_corpse,["WeaponHolderSimulated"],5];
	{deleteVehicle _x;} foreach _containers; //Delete the containers.
	hideBody life_corpse;
	deleteVehicle life_corpse;
};

//Destroy our camera...
life_deathCamera cameraEffect ["TERMINATE","BACK"];
camDestroy life_deathCamera;

//Bad boy
if(life_is_arrested) exitWith {
	["Suicide", localize "STR_Jail_Suicide", "Warning"] call Harris_Notifications;
	[false,false,life_arrestMinutes,life_arrestReason] call fnc_jailsetup;
	[] call SOCK_fnc_updateRequest;
};

//Johnny law got me but didn't let the EMS revive me, reward them half the bounty.
if(!isNil "life_copRecieve") then {
	[[player,life_copRecieve,true],"life_fnc_wantedBounty",false,false] spawn bis_fnc_mp;
	life_copRecieve = nil;
};

//So I guess a fellow gang member, cop or myself killed myself so get me off that Altis Most Wanted
if(life_removeWanted) then {
	[[getPlayerUID player],"life_fnc_wantedRemove",false,false] spawn bis_fnc_mp;
};
[] call SOCK_fnc_updateRequest;
[] call life_fnc_hudUpdate; //Request update of hud.
//[] call life_fnc_koilcombat;

{	
	if ((_x select 0) isEqualTo (getPlayerUID player)) then {
		ticketLog deleteAt (ticketLog find _x);
		publicVariable "ticketLog";
	};
} forEach ticketLog;