/*
	File: fn_useItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main function for item effects and functionality through the player menu.
*/


private["_item"];
disableSerialization;
if((lbCurSel 2005) == -1) exitWith {hint localize "STR_ISTR_SelectItemFirst";};
_item = lbData[2005,(lbCurSel 2005)];

switch (true) do
{
	case (_item == "water"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			if (vehicle player == player) then 
			{
				player playMove "CL3_anim_drink";
				playSound3D ["cg_sndimg\sounds\drink.ogg", player, false, getPosASL player, 6, 1, 45];
	
				waitUntil{animationState player != "CL3_anim_drink";};
			};
			life_thirst = 100;
			player setFatigue 0;
		};
	};

	case (_item == "weddingring"):
	{
		if( life_married != "-2" ) then 
		{
			if(([false,_item,1] call life_fnc_handleInv)) then
			{
				cutText ["Great! Someone has married you, you get $1,500 from friends and family!","PLAIN",2];
				player say2d "wedding";
				LIMMITTCASH = LIMMITTCASH + 1500;
				if(life_married == "-1") then {
					life_married = "someone";
				};
				if(life_married != "") then {
				[[0,format["%1 just married %2! That is great isn't it? We wish them good luck!",profileName, life_married]],"life_fnc_broadcast",nil,false] spawn bis_fnc_mp;
				life_married = "-2";
				};
			};
		}
		else
		{
			cutText ["You cannot marry twice!","PLAIN",2];
		};
	};
	
	case (_item == "methequipment"):
	{
		[] spawn life_fnc_methequipment;
	};

	case (_item == "condom"):
	{
			if(([false,_item,1] call life_fnc_handleInv)) then
			{
				[] spawn life_fnc_prostitute;
			};
	};

	case (_item == "cleankit"):
	{
			if(([false,_item,1] call life_fnc_handleInv)) then
			{
				_currentuniform = Uniform player;
				life_action_inUse = true;
				if (vehicle player == player) then {
					[[player,"CL3_anim_managerdoorlockpick"],"life_fnc_animSync",true,false] spawn bis_fnc_mp;
					uiSleep 6;
					[[player,"spray"],"A3L_Fnc_NearestSound",false,false,false] call BIS_fnc_MP;
					waitUntil{animationState player != "CL3_anim_managerdoorlockpick";};
				};
				if(_currentuniform isEqualTo "") then {
					hint "You feel cleansed and can now carry extra virtual weight.";
					life_dirt = 0;
					player setfatigue 0;
					if(life_maxweightdone != 1) then {
	  					life_maxWeightT = 52;
	  					life_maxWeight = life_maxWeight + 28;
	  					life_maxweightdone = 1;
  					};
				} else {
					Hint "Wow, this body cleaning kit is great - to bad I had my clothes on, atleast they are clean now!";
					life_dirt = 100;
					player setfatigue 1;
				};
				life_action_inUse = false;
			};
	};

	case (_item == "coffee"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			if (vehicle player == player) then 
			{
				player playMove "CL3_anim_drink";
				playSound3D ["cg_sndimg\sounds\drink.ogg", player, false, getPosASL player, 6, 1, 45];
				waitUntil{animationState player != "CL3_anim_drink";};
			};


			life_thirst = 100;
			player setFatigue 0;
			if(life_intox <= 0.02) then
			{
			life_intox = 0.00;
			}
			else
			{
			life_intox = life_intox - 0.02;			
			};			
		};
	};

	case (_item == "cigarette"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{

			if (vehicle player == player) then 
			{
				player playMove "CL3_anim_drink";
				waitUntil{animationState player != "CL3_anim_drink";};
			};

			titleText["You have consumed a Cigarette","PLAIN"];
			player setFatigue 1;
			[] spawn life_fnc_useCigarette;	
		};
	};

	case (_item == "zoobeer"):
	{
			if(([false,_item,1] call life_fnc_handleInv)) then
			{
				[] spawn life_fnc_consumebeer;
			};
	};
	


	case (_item == "zoobeer2"):
	{
			if(([false,_item,1] call life_fnc_handleInv)) then
			{
				[] spawn life_fnc_consumebeer;
			};
	};



	case (_item == "vodka"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			if (vehicle player == player) then 
			{
				player playMove "CL3_anim_drink";
				playSound3D ["cg_sndimg\sounds\drink.ogg", player, false, getPosASL player, 6, 1, 45];
				waitUntil{animationState player != "CL3_anim_drink";};
			};
			titleText["You have consumed a Vodka Shot","PLAIN"];
			life_intox = life_intox + 0.05;
		};
	};





	case (_item == "jackdaniels"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			if (vehicle player == player) then 
			{
				player playMove "CL3_anim_drink";
				playSound3D ["cg_sndimg\sounds\drink.ogg", player, false, getPosASL player, 6, 1, 45];
				waitUntil{animationState player != "CL3_anim_drink";};
			};
			titleText["You have consumed a Jack Daniels Shot","PLAIN"];
			life_intox = life_intox + 0.05;
		};
	};


	case (_item == "jagerbomb"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			if (vehicle player == player) then 
			{
				player playMove "CL3_anim_drink";
				playSound3D ["cg_sndimg\sounds\drink.ogg", player, false, getPosASL player, 6, 1, 45];
				waitUntil{animationState player != "CL3_anim_drink";};
			};
			titleText["You have consumed a Jager Bomb","PLAIN"];
			life_intox = life_intox + 0.05;
		};
	};



	case (_item == "absinthe"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			if (vehicle player == player) then 
			{
				player playMove "CL3_anim_drink";
				playSound3D ["cg_sndimg\sounds\drink.ogg", player, false, getPosASL player, 6, 1, 45];
				waitUntil{animationState player != "CL3_anim_drink";};
			};
			titleText["You have consumed a shot of Absinthe","PLAIN"];
			life_intox = life_intox + 0.08;
		};
	};

	case (_item == "redwine"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			if (vehicle player == player) then 
			{
				player playMove "CL3_anim_drink";
				playSound3D ["cg_sndimg\sounds\drink.ogg", player, false, getPosASL player, 6, 1, 45];
				waitUntil{animationState player != "CL3_anim_drink";};
			};
			titleText["You have consumed a Glass of Red Wine","PLAIN"];
			life_intox = life_intox + 0.02;
		};
	};


	case (_item == "whitewine"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			if (vehicle player == player) then 
			{
				player playMove "CL3_anim_drink";
				playSound3D ["cg_sndimg\sounds\drink.ogg", player, false, getPosASL player, 6, 1, 45];
				waitUntil{animationState player != "CL3_anim_drink";};
			};
			titleText["You have consumed a Glass of White Wine","PLAIN"];
			life_intox = life_intox + 0.02;
		};
	};


	case (_item == "whiterussian"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			if (vehicle player == player) then 
			{
				player playMove "CL3_anim_drink";
				playSound3D ["cg_sndimg\sounds\drink.ogg", player, false, getPosASL player, 6, 1, 45];
				waitUntil{animationState player != "CL3_anim_drink";};
			};
			titleText["You have consumed a White Russian","PLAIN"];
			life_intox = life_intox + 0.04;
		};
	};


	case (_item == "sexonthebeach"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			if (vehicle player == player) then 
			{
				player playMove "CL3_anim_drink";
				playSound3D ["cg_sndimg\sounds\drink.ogg", player, false, getPosASL player, 6, 1, 45];
				waitUntil{animationState player != "CL3_anim_drink";};
			};
			titleText["You have consumed a Sex on the Beach","PLAIN"];
			life_intox = life_intox + 0.03;
		};
	};


	case (_item == "tequila"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			if (vehicle player == player) then 
			{
				player playMove "CL3_anim_drink";
				playSound3D ["cg_sndimg\sounds\drink.ogg", player, false, getPosASL player, 6, 1, 45];
				waitUntil{animationState player != "CL3_anim_drink";};
			};
			titleText["You have consumed a Shot of Tequila","PLAIN"];
			life_intox = life_intox + 0.06;
		};
	};

	case (_item == "jackdanielsandcoke"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			if (vehicle player == player) then 
			{
				player playMove "CL3_anim_drink";
				playSound3D ["cg_sndimg\sounds\drink.ogg", player, false, getPosASL player, 6, 1, 45];
				waitUntil{animationState player != "CL3_anim_drink";};
			};
			titleText["You have consumed a JD and Coke","PLAIN"];
			life_intox = life_intox + 0.04;
		};
	};



	case (_item == "Rax's Rum"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			if (vehicle player == player) then 
			{
				player playMove "CL3_anim_drink";
				playSound3D ["cg_sndimg\sounds\drink.ogg", player, false, getPosASL player, 6, 1, 45];
				waitUntil{animationState player != "CL3_anim_drink";};
			};
			titleText["You have consumed a Rax's Rum","PLAIN"];
			life_intox = life_intox + 0.06;
		};
	};
	case (_item == "boltcutter"): {
		[cursorTarget] spawn life_fnc_boltcutter;
		closeDialog 0;
	};
	
	case (_item == "blastingcharge"): {
		player reveal fed_bank;
		(group player) reveal fed_bank;
		[cursorTarget] spawn life_fnc_blastingCharge;
	};

	case (_item == "marijuana"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{

			if (vehicle player == player) then 
			{
				player playMove "CL3_anim_drink";
				waitUntil{animationState player != "CL3_anim_drink";};
			};

			[] spawn life_fnc_useMarijuana;
		};
	};

	case (_item == "methp"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{

			if (vehicle player == player) then 
			{
				player playMove "CL3_anim_drink";
				waitUntil{animationState player != "CL3_anim_drink";};
			};

			[] spawn life_fnc_useMeth;
		};
	};

	case (_item == "MDMAp"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{

			if (vehicle player == player) then 
			{
				player playMove "CL3_anim_drink";
				waitUntil{animationState player != "CL3_anim_drink";};
			};

			[] spawn life_fnc_useMDMA;
		};
	};

	case (_item == "cokep"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			if (vehicle player == player) then 
			{
				player playMove "CL3_anim_drink";
				waitUntil{animationState player != "CL3_anim_drink";};
			};

			[] spawn life_fnc_useCoke;
		};
	};


	case (_item == "bec"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			playSound3D ["cg_sndimg\sounds\eat.ogg", player, false, getPosASL player, 6, 1, 45];
			[] spawn life_fnc_useBEC;
		};
	};


	case (_item == "cocainep"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn
			{
				if (vehicle player == player) then 
				{
					player playMove "CL3_anim_drink";
					waitUntil{animationState player != "CL3_anim_drink";};
				};
				life_cocaine_effect = time;
				titleText["You're so jacked up on Cocaine you can now sprint for 2 minutes","PLAIN"];
				player enableFatigue false;
				life_intox = life_intox + 0.10;
				[] spawn life_fnc_useCocaine;
				waitUntil {!alive player OR ((time - life_cocaine_effect) > (2 * 60))};
				player enableFatigue true;
			};
		};
	};

	case (_item == "heroinp"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			if (vehicle player == player) then 
			{
				player playMove "CL3_anim_drink";
				waitUntil{animationState player != "CL3_anim_drink";};
			};

			[[0,format["%1 injects some Heroin.",name player]],"life_fnc_broadcast",(position player) nearEntities [["Man"], 50],false] spawn bis_fnc_mp;
			life_intox = life_intox + 0.10;
			[] spawn life_fnc_useHeroin;
		};
	};
	
	case (_item == "defusekit"): {
		[cursorTarget] spawn life_fnc_defuseKit;
	};

	case (_item == "BarGate"):
	{
		if(!isNull life_bargate) exitWith {hint "You already have a BarGate active in deployment"};
		if(playerSide == west || playerSide == independent) then 
		{
			if(([false,_item,1] call life_fnc_handleInv)) then 
			{
				[] spawn life_fnc_BarGate;
			};
		};
	};

	case (_item == "RoadCone"):
	{
		if(!isNull life_roadcone) exitWith {hint "You already have a Roadcone active in deployment"};
		//if cop override and allow use of item
		if(playerSide == west || playerSide == independent) then {
			if(([false,_item,1] call life_fnc_handleInv)) then 
			{
				[] spawn life_fnc_RoadCone;
			};
		};
	};

	case (_item == "RoadConeB"):
	{
		if(!isNull life_roadcone) exitWith {hint "You already have a Blinking Roadcone active in deployment"};
		//if cop override and allow use of item
		if(playerSide == west || playerSide == independent) then {
			if(([false,_item,1] call life_fnc_handleInv)) then 
			{
				[] spawn life_fnc_RoadConeB;
			};
		};
	};
	case (_item == "RoadConeStrip"):
	{
		if(!isNull life_roadcone) exitWith {hint "You already have a Roadcone Strip active in deployment"};
		//if cop override and allow use of item
		if(playerSide == west || playerSide == independent) then {
			if(([false,_item,1] call life_fnc_handleInv)) then 
			{
				[] spawn life_fnc_RoadConeStrip;
			};
		};
	};
	case (_item == "RoadConeStripB"):
	{
		if(!isNull life_roadcone) exitWith {hint "You already have a Blinking Roadcone Strip active in deployment"};
		//if cop override and allow use of item
		if(playerSide == west || playerSide == independent) then {
			if(([false,_item,1] call life_fnc_handleInv)) then 
			{
				[] spawn life_fnc_RoadConeStripB;
			};
		};
	};

	case (_item == "RoadBlockConc"):
	{
		if(!isNull life_roadblock) exitWith {hint "You already have a Road Block active in deployment"};
			if(([false,_item,1] call life_fnc_handleInv)) then 
			{
				[] spawn life_fnc_RoadBlockConc;
			};
	};

	case (_item == "RoadBlockWood"):
	{
		if(!isNull life_roadblock) exitWith {hint "You already have a Road Block active in deployment"};
		//if cop override and allow use of item
		if(playerSide == west || playerSide == independent) then {
			if(([false,_item,1] call life_fnc_handleInv)) then 
			{
				[] spawn life_fnc_RoadBlockWood;
			};
		};
	};
	
	case (_item == "uranium" or _item == "uraniumr"):
{
    if(([false,_item,1] call life_fnc_handleInv)) then
    {
        [] spawn life_fnc_consumeuranium;
    };
};

	case (_item in ["storagesmall","storagebig"]): {
		[_item] call life_fnc_storageBox;
	};
	
	case (_item == "redgull"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			if (vehicle player == player) then 
			{
				player playMove "CL3_anim_drink";
				playSound3D ["cg_sndimg\sounds\drink.ogg", player, false, getPosASL player, 6, 1, 45];
				waitUntil{animationState player != "CL3_anim_drink";};
			};

			life_thirst = 100;
			player setFatigue 0;
			[] spawn
			{
				life_redgull_effect = time;
				titleText[localize "STR_ISTR_RedGullEffect","PLAIN"];
				player enableFatigue false;
				waitUntil {!alive player OR ((time - life_redgull_effect) > (15 * 60))};
				player enableFatigue true;
			};
		};
	};
	
	case (_item == "spikeStrip"):
	{
		if(!isNull life_spikestrip) exitWith {hint localize "STR_ISTR_SpikesDeployment"};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_spikeStrip;
		};
	};
	
	case (_item == "fuelF"):
	{
		if(vehicle player != player) exitWith {hint localize "STR_ISTR_RefuelInVehicle"};
		[] spawn life_fnc_jerryRefuel;
	};
	
	case (_item == "lockpick"):
	{
		[] spawn life_fnc_lockpick;
	};
	
	case (_item in ["apple","rabbit","salema","ornate","mackerel","tuna","mullet","catshark","turtle","turtlesoup","donuts","tbacon","peach"]):
	{
	  if (vehicle player == player) then 
			{
				player playMove "CL3_anim_drink";
				waitUntil{animationState player != "CL3_anim_drink";};
			};
		life_eattotal = life_eattotal + 10;
		playSound3D ["cg_sndimg\sounds\eat.ogg", player, false, getPosASL player, 6, 1, 45];
		life_poop = life_poop + 5;
		[_item] call life_fnc_eatFood;
	};

	case (_item == "pickaxe"):
	{
		[] spawn life_fnc_pickAxeUse;
	};
	
	default
	{
		hint localize "STR_ISTR_NotUsable";
	};
};
	
[] call life_fnc_p_updateMenu;
[] call life_fnc_hudUpdate;