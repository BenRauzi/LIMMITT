
/*

	[] spawn
	{
		while{true} do
		{
		waitUntil {life_eattotal > 90};
			player playMove "AmovPercMstpSnonWnonDnon_Scared2";
			uiSleep 2;
			[[player,"vomit"],"A3L_Fnc_NearestSound",false,false,false] call BIS_fnc_MP;
	   		waitUntil{animationState player != "AmovPercMstpSnonWnonDnon_Scared2";};
	   		life_eattotal = 0;
	   		life_hunger = 10;
	   		life_poop = 0;
		};

	};
*/

// MELEE
[] spawn {
        _mweapons = ["CG_BAT","CG_BATON","CG_CROSS","CG_TELBAT","CG_SHOVEL"];
        while{true} do {
		        waitUntil{((secondaryWeapon player) IN _mweapons) && !("nonlethal_swing" IN (magazines player)) && ((player ammo (currentWeapon player)) == 0)};
		        player addMagazine "nonlethal_swing";
		        uiSleep 120;
        };
};

// MELEE
[] spawn {
        _sweapons2 = ["cg_machete","cg_hatchet","CG_PICKAXE","cg_scythe"];
        while{true} do {
                waitUntil{((secondaryWeapon player) IN _sweapons2) && !("sharp_swing" IN (magazines player)) && ((player ammo (currentWeapon player)) == 0)};
                player addMagazine "sharp_swing";
                uiSleep 120;
        };
};


//doublecheck for virtual item duping
[] spawn
{
	private["_theveh","_unitveh","_myveh","_side","_radius","_nearestunits","_nearestunitofside","_unit"];
	while{true} do
	{
		waitUntil {!isNull (findDisplay 3500)};
		life_action_inuse = true;

		if(cursorTarget isKindOf "House_F") then {
			player setVariable["vehopen",2,true];
			_radius = 40;
		} else {
			_cuid = cursorTarget getVariable "vehicle_info_owners";
			player setVariable["vehopen",_cuid,true];
			_radius = 8;
		};
		_myveh = player getVariable "vehopen";

		while{!isNull (findDisplay 3500)} do
		{
			_side = civilian;
			_nearestunits = nearestObjects [player,["Man"],_radius];

			if(_side countSide _nearestunits > 0) then
			{
				{
					_unit = _x;
					if ( isPlayer _unit && player != _unit ) then 
					{
						_unitveh = _unit getVariable "vehopen";

						if(_unitveh isEqualTo _myveh) exitWith {
								life_action_inuse = false;		
								hint "Someone is using a virtual inventory near you. Please wait.";
								closeDialog 0;
						};
					};
				} foreach _nearestunits;
			};
			uiSleep 0.25;
		};
		closeDialog 0;	
		life_action_inuse = false;		
		player setVariable["vehopen",0,true];
	};
};

//Uranium
[] spawn
{
    while {true} do
    {
        private["_damage"];
        uiSleep 1;
        while {((player distance (getMarkerPos "uranium_1") < 100) && (player getVariable["Revive",TRUE]))} do
        {
            if(uniform player == "U_C_Scientist") then
            {
                hint "You're currently in a radioactive zone however, your clothes are protecting you. For now.";
                uiSleep 15;
				hint "You still feel mild effects from the radiation, but nothing too serious.";
				player setFatigue 1;
				life_thirst =  50;
                life_hunger =  50;
				[] call life_fnc_hudUpdate;
				uiSleep 250;
				hint "You need to get out of the area now before you begin to feel more deadly effects.";
				enableCamShake true;
				addcamShake[random 4, 2, random 4];
				"dynamicBlur" ppEffectEnable true;
				"dynamicBlur" ppEffectAdjust [9];
				"dynamicBlur" ppEffectCommit 9;
				player say2d "cough";
				uiSleep 10;
				player say2d "radioactive";
				uiSleep 10;
				player say2d "cough";
				_damage = damage player;
				_damage = _damage + 0.4;
				player setDamage (_damage);
				[] call life_fnc_hudUpdate;
				uiSleep 50;


            }else
            {
                hint "You have entered a highly radioactive zone, get out now.";
				uiSleep 10;
				player setFatigue 1;
				player say2d "radioactive";
				enableCamShake true;
				addcamShake[random 4, 2, random 4];
				"dynamicBlur" ppEffectEnable true;
				"dynamicBlur" ppEffectAdjust [8];
				"dynamicBlur" ppEffectCommit 8;
				uiSleep 10;
				player say2d "cough";
				_damage = damage player;
                _damage = _damage + 0.1;
                player setDamage (_damage);
                [] call life_fnc_hudUpdate;
                uiSleep 45;
            };
        };
    };
};




[] spawn
{
	private["_bp","_load","_cfg"];
	while{true} do
	{
		waitUntil {backpack player != ""};
		_bp = backpack player;
		_cfg = getNumber(configFile >> "CfgVehicles" >> (backpack player) >> "maximumload");
		_load = round(_cfg / 8);
		life_maxWeight = life_maxWeightT + _load;
		waitUntil {backpack player != _bp};
		if(backpack player == "") then 
		{
			life_maxWeight = life_maxWeightT;
		};
	};
};



[] spawn
{
	private["_me","_you"];
	while{true} do
	{
		waitUntil {player getvariable "search"};
		player setVariable["search",false,true];
		_handle = [player] spawn life_fnc_dropItems2;
		waitUntil {scriptDone _handle};
		life_carryWeight = 0;
		uiSleep 0.1;
	};
};



[] spawn
{
	while{true} do
	{
		waitUntil {vehicle player != player};
		waitUntil {vehicle player == player};
		_n = 1;
		while {_n > 0} do {
			if (currentWeapon player != "") then {
				life_curWep_h = currentWeapon player;
				player action ["SwitchWeapon", player, player, 100];
				player switchcamera cameraView;
				[[player,"AmovPercMstpSnonWnonDnon"],"life_fnc_animSync",true,false] spawn bis_fnc_mp;
				player switchMove "AmovPercMstpSnonWnonDnon";
			};
			uiSleep 0.1;
			_n = _n - 1;
		};
		uiSleep 1;
	};
};

[] spawn
{
	while {true} do
	{
		uiSleep 3;

		if ("Harris_keyCard" in items player && player getVariable ['copLevel',0] == 0) then {
			player setVariable ["copLevel",1,true];
			player setVariable ["cop",1,true];
		} else {
			if (player getVariable ['copLevel',0] == 1) then {
				player setVariable ["copLevel",0,true];
				player setVariable ["cop",0,true];
			};
		};
	};
};


[] spawn  
{
	while{true} do 
	{
		uiSleep 240;
		if(!alive player) then {}
		else
		{
			if (life_hunger isEqualTo 0 || life_hunger < 0) then { player setDamage 1; systemChat "You have died of Hunger."};
			if (life_thirst isEqualTo 0 || life_thirst < 0) then { player setDamage 1; systemChat "You have died of dehydration."; };
			life_thirst = life_thirst - 5;
			life_hunger = life_hunger - 4;
		};
	};
};