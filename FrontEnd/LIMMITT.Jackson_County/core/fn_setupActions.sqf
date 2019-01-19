/*
	File: fn_setupActions.sqf
	
	Description:
	Master addAction file handler for all client-based actions.
*/
switch (playerSide) do
{
	case independent:
	{

		//Unblindfold person
		life_actions = life_actions + [player addAction["Remove blindfold",life_fnc_untieb,"",0,false,false,"",'
		!isNull cursorTarget && player distance cursorTarget < 2.5 && isPlayer cursorTarget && (cursorTarget getVariable "blindfolded") ']];

			//Get out of the electric chair
		life_actions = life_actions + [player addAction["Stand Up",life_fnc_electric,"",0,false,false,"",' ( animationState player == "BasicDriver" && vehicle player == player )  ']];

//Pickup Item
life_actions = life_actions + [player addAction["Pickup Item(s)",{createDialog "life_pickup_items"},"",0,false,false,"",
' !isNull nearestObject (screenToWorld [0.5,0.5]) && count (nearestObject (screenToWorld [0.5,0.5]) getVariable ["item",[]]) > 0 && player distance nearestObject (screenToWorld [0.5,0.5]) < 5 && !life_action_inUse ']];


		//Heal Person
		life_actions = life_actions + [player addAction["Heal Self",life_fnc_healself,"",0,false,false,"",' (damage player) > 0 ']];

		//Heal Self
		life_actions = life_actions + [player addAction["Heal Person",life_fnc_healperson,"",0,false,false,"",' !isNull cursorTarget && player distance cursorTarget < 2.5 && isPlayer cursorTarget && (damage cursorTarget) > 0 ']];




		//Untie person
		life_actions = life_actions + [player addAction["Untie Person",life_fnc_untie,"",0,false,false,"",'
		!isNull cursorTarget && player distance cursorTarget < 2.5 && isPlayer cursorTarget && (cursorTarget getVariable "tied") ']];

	// Heli Fast Rope
		life_actions = life_actions + [player addAction["Fast Rope",life_fnc_fastRope,"",99,false,false,"", ' (vehicle player) != player && !isNull (vehicle player) && (vehicle player) isKindOf "Air" && driver (vehicle player) != player && (getPos player) select 2 <= 100 && (getPos player) select 2 >= 15 && speed vehicle player < 30 && !(player getVariable["transporting",false]) ']];

		life_actions = life_actions + [player addAction[localize "STR_pAct_sContPlayer","","",0,false,false,"",' (player getVariable "diseaseon") > 1 ']];

		life_actions = life_actions + [player addAction[localize "STR_pAct_sHeatPlayer",life_fnc_sheatPlayer,"",0,false,false,"",' (player getVariable "diseaseon") > 1 ']];

		life_actions = life_actions + [player addAction[localize "STR_pAct_sCoolPlayer",life_fnc_scoolPlayer,"",0,false,false,"",' (player getVariable "diseaseon") > 1 ']];;

		life_actions = life_actions + [player addAction[localize "STR_pAct_sHydratePlayer",life_fnc_shydratePlayer,"",0,false,false,"",' (player getVariable "diseaseon") > 1 ']];

		life_actions = life_actions + [player addAction[localize "STR_pAct_sAntiViralPlayer",life_fnc_santiviralPlayer,"",0,false,false,"",' (player getVariable "diseaseon") > 1 ']];

		life_actions = life_actions + [player addAction[localize "STR_pAct_sPainKillerPlayer",life_fnc_spainkillerPlayer,"",0,false,false,"",' (player getVariable "diseaseon") > 1 ']];

		//healself system
		life_actions = life_actions + [player addAction[localize "STR_pAct_BandageSelf",life_fnc_bandageSelf,"",0,false,false,"",' (player getVariable "bleedingon") > 1 ']];

		life_actions = life_actions + [player addAction[localize "STR_pAct_StitchSelf",life_fnc_stitchSelf,"",0,false,false,"",' (player getVariable "woundedon") > 1 ']];

		life_actions = life_actions + [player addAction[localize "STR_pAct_SplintSelf",life_fnc_splintSelf,"",0,false,false,"",' (player getVariable "fractureon") > 1 ']];

		life_actions = life_actions + [player addAction[localize "STR_pAct_EpiPenSelf",life_fnc_epipenSelf,"",0,false,false,"",' (player getVariable "unconciouson") > 1 ']];


		life_actions = life_actions + [player addAction["<t color = '#f4a84e'>Go to the Toilet</t>",life_fnc_takeashit,"",0,false,false,"",' life_poop > 80 && (vehicle player == player) ']];
	//place roadcones
		life_actions = life_actions + [player addAction["Place Roadcone",{if(!isNull life_roadcone) then {{detach _x} foreach (life_roadcone getvariable "roadcone"); _handle = [life_roadcone,"roadcone"] spawn life_fnc_enablecollisionwith; waitUntil {scriptDone _handle}; [[life_roadcone,"roadcone"],"life_fnc_enablecollisionwith",true,false] call BIS_fnc_MP; life_roadcone = ObjNull;};},"",999,false,false,"",'!isNull life_roadcone']];
		
	//Packup Roadcones
		life_actions = life_actions + [player addAction["Pack up Roadcone Strip",life_fnc_packupRoadcones,"",0,false,false,"",'
		_cones = nearestObjects[getPos player,["RoadCone_L_F"],3.5] select 0; !isNil "_cones" && !isNil {(_cones getVariable "roadcone")} && (count (_cones getVariable "roadcone") > 1)
		']];
		life_actions = life_actions + [player addAction["Pack up Roadcone",life_fnc_packupRoadcones,"",0,false,false,"",'
		_cones = nearestObjects[getPos player,["RoadCone_F"],3.5] select 0; !isNil "_cones" && !isNil {(_cones getVariable "roadcone")} && {count (_cones getVariable "roadcone") == 1}
		']];
		life_actions = life_actions + [player addAction["Pack up Roadcone Strip",life_fnc_packupRoadcones,"",0,false,false,"",'
		_cones = nearestObjects[getPos player,["RoadCone_F"],3.5] select 0; !isNil "_cones" && !isNil {(_cones getVariable "roadcone")} && {count (_cones getVariable "roadcone") > 1}
		']];
		life_actions = life_actions + [player addAction["Pack up Roadcone",life_fnc_packupRoadcones,"",0,false,false,"",'
		_cones = nearestObjects[getPos player,["RoadCone_L_F"],3.5] select 0; !isNil "_cones" && !isNil {(_cones getVariable "roadcone")} && {count (_cones getVariable "roadcone") == 1}
		']];

	//Pickup roadcone briefcases
		life_actions = life_actions + [player addAction["Pickup Blinking Roadcone Strip",life_fnc_pickupItem,"",0,false,false,"",
		' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "RoadconeStripB" && (player distance cursorTarget) < 3 ']];
		life_actions = life_actions + [player addAction["Pickup Roadcone Strip",life_fnc_pickupItem,"",0,false,false,"",
		' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "RoadconeStrip" && (player distance cursorTarget) < 3 ']];
		life_actions = life_actions + [player addAction["Pickup Blinking Roadcone",life_fnc_pickupItem,"",0,false,false,"",
		' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "RoadconeB" && (player distance cursorTarget) < 3 ']];
		life_actions = life_actions + [player addAction["Pickup Roadcone",life_fnc_pickupItem,"",0,false,false,"",
		' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "Roadcone" && (player distance cursorTarget) < 3 ']];
		

	//place roadblock
		life_actions = life_actions + [player addAction["Place Roadblock",{if(!isNull life_roadblock) then {{detach _x;} foreach (life_roadblock getvariable "roadblock"); 
		_handle = [life_roadblock,"roadblock"] spawn life_fnc_enablecollisionwith; waitUntil {scriptDone _handle}; [[life_roadblock,"roadblock"],"life_fnc_enablecollisionwith",true,false] call BIS_fnc_MP; life_roadblock = ObjNull;};},"",999,false,false,"",'!isNull life_roadblock']];

	//Packup Roadblocks
		life_actions = life_actions + [player addAction["Pack up RoadBlock (Wooden)",life_fnc_packupRoadblock,"",0,false,false,"",'
		_roadblock = nearestObjects[getPos player,["RoadCone_F"],3.5] select 0; !isNil "_roadblock" && !isNil {(_roadblock getVariable "RoadBlock")}
		']];
		life_actions = life_actions + [player addAction["Pack up RoadBlock (Fortified)",life_fnc_packupRoadblock,"",0,false,false,"",'
		_roadblock = nearestObjects[getPos player,["RoadCone_L_F"],3.5] select 0; !isNil "_roadblock" && !isNil {(_roadblock getVariable "RoadBlock")}
		']];
		life_actions = life_actions + [player addAction["Pack up RoadBlock (Wreck)",life_fnc_packupRoadblock,"",0,false,false,"",'
		_roadblock = nearestObjects[getPos player,["Land_MetalBarrel_empty_F"],3.5] select 0; !isNil "_roadblock" && !isNil {(_roadblock getVariable "RoadBlock")}']];


	//Pickup roadblock briefcases
		life_actions = life_actions + [player addAction["Pickup RoadBlock (Wooden)",life_fnc_pickupItem,"",0,false,false,"",
		' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "RoadBlockWood" && (player distance cursorTarget) < 3 ']];
		life_actions = life_actions + [player addAction["Pickup RoadBlock (Fortified)",life_fnc_pickupItem,"",0,false,false,"",
		' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "RoadBlockConc" && (player distance cursorTarget) < 3 ']];
		life_actions = life_actions + [player addAction["Pickup RoadBlock (Wreck)",life_fnc_pickupItem,"",0,false,false,"",
		' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "RoadBlockRebel" && (player distance cursorTarget) < 3 ']];

	};
	case civilian:
	{
	
		//Pancakes Suicide Vest
		life_actions = life_actions + [player addAction["Active Explosive Vest",life_fnc_suicideBomb,"",0,false,false,"",
        'vest player == "V_HarnessOGL_gry" && alive player && playerSide == civilian && !life_istazed && !(player getVariable "restrained") && !(player getVariable "Escorting") && !(player getVariable "transporting")']];

		//destroyevidence
		life_actions = life_actions + [player addAction["Destroy Evidence",life_fnc_destroyEvidence,"",0,false,false,"",' !isNull cursorTarget && player distance cursorTarget < 2.5 && !dialog && typeOf cursorTarget == "cl_evidencebox"']];


		life_actions = life_actions + [player addAction["<t color = '#f4a84e'>Go to the Toilet</t>",life_fnc_takeashit,"",0,false,false,"",' life_poop > 80 && (vehicle player == player) ']];

		life_actions = life_actions + [player addAction[localize "STR_pAct_Breakout",life_fnc_breakout,"",0,false,false,"",' (player getVariable "breakouton") == 2 && (!life_action_inUse) ']];

		life_actions = life_actions + [player addAction[localize "STR_pAct_ShovelWork",life_fnc_shovelwork,"",0,false,false,"",' (life_is_arrested) && (!life_action_inUse) && ((currentWeapon player) == "A3L_Shovel") ']];


//Pickup Item
life_actions = life_actions + [player addAction["Pickup Item(s)",{createDialog "life_pickup_items"},"",0,false,false,"",
' !isNull nearestObject (screenToWorld [0.5,0.5]) && count (nearestObject (screenToWorld [0.5,0.5]) getVariable ["item",[]]) > 0 && player distance nearestObject (screenToWorld [0.5,0.5]) < 5 && !life_action_inUse ']];

		life_actions = life_actions + [player addAction["Taxi Computer",life_fnc_openTaxi,"",0,false,false,"",' typeOf (vehicle player) isEqualTo "d3s_crown_98_T1" && (driver vehicle player) isEqualTo player && (player getVariable ["GM_Job", "Unemployed"]) isEqualTo "Lakeside Valley Taxi Company";']];

		//Heal Person
		life_actions = life_actions + [player addAction["Heal Self",life_fnc_healself,"",0,false,false,"",' (damage player) > 0.2 && (asdih_inv_bandage > 0) ']];

		//Heal Self
		life_actions = life_actions + [player addAction["Heal Person",life_fnc_healperson,"",0,false,false,"",' !isNull cursorTarget && player distance cursorTarget < 2.5 && isPlayer cursorTarget && (damage cursorTarget) > 0.2 && (asdih_inv_bandage > 0) ']];



		// Heli Fast Rope
		life_actions = life_actions + [player addAction["Fast Rope",life_fnc_fastRope,"",99,false,false,"", ' (vehicle player) != player && !isNull (vehicle player) && (vehicle player) isKindOf "Air" && driver (vehicle player) != player && (getPos player) select 2 <= 100 && (getPos player) select 2 >= 15 && speed vehicle player < 30 && !(player getVariable["transporting",false]) ']];
	
			//Get out of the electric chair
		life_actions = life_actions + [player addAction["Stand Up",life_fnc_electric,"",0,false,false,"",' ( animationState player == "BasicDriver" && vehicle player == player ) ']];



		//Rob person
		life_actions = life_actions + [player addAction["<t color = '#a7afec'>Rob</t>",life_fnc_robAction,"",0,false,false,"",'
		!isNull cursorTarget && player distance cursorTarget < 5 && isPlayer cursorTarget && !(cursorTarget getVariable["robbed",FALSE]) && ( animationState cursorTarget == "Incapacitated" || cursorTarget getVariable "tied" || animationState cursorTarget == "amovpercmstpsnonwnondnon_amovpercmstpssurwnondnon" ) ']];



		//Tie person
		life_actions = life_actions + [player addAction["<t color = '#f4a84e'>Tie Person</t>",life_fnc_tieingAction,"",0,false,false,"",'
		!isNull cursorTarget && player distance cursorTarget < 2.5 && isPlayer cursorTarget && (animationState cursorTarget == "Incapacitated" || animationState cursorTarget == "AmovPercMstpSsurWnonDnon" && (!life_action_inUse) ) ']];

		//Strip Person
		life_actions = life_actions + [player addAction["<t color = '#f4a84e'>Strip Person</t>",life_fnc_stripAction,"",0,false,false,"",'
		!isNull cursorTarget && player distance cursorTarget < 2.5 && isPlayer cursorTarget && (cursorTarget getVariable "tied") && (!life_action_inUse) ) ']];

		//Untie person
		life_actions = life_actions + [player addAction["<t color = '#f4a84e'>Untie Person</t>",life_fnc_untie,"",0,false,false,"",'
		!isNull cursorTarget && player distance cursorTarget < 2.5 && isPlayer cursorTarget && (cursorTarget getVariable "tied") && (!life_action_inUse) ']];

		//Blindfold person
		life_actions = life_actions + [player addAction["<t color = '#d02b2b'>Blindfold Person</t>",life_fnc_tieingActionb,"",0,false,false,"",'
		!isNull cursorTarget && player distance cursorTarget < 2.5 && isPlayer cursorTarget && (cursorTarget getVariable "tied")  && (!life_action_inUse) ']];

		//Unblindfold person
		life_actions = life_actions + [player addAction["<t color = '#d02b2b'>Remove blindfold</t>",life_fnc_untieb,"",0,false,false,"",'
		!isNull cursorTarget && player distance cursorTarget < 2.5 && isPlayer cursorTarget && (cursorTarget getVariable "blindfolded")  && (!life_action_inUse) ']];


		//Throw in car
		life_actions = life_actions + [player addAction["<t color = '#6baf41'>Throw in car</t>",life_fnc_throwcar,"",0,false,false,"",'
		!isNull cursorTarget && player distance cursorTarget < 2.5 && isPlayer cursorTarget && (cursorTarget getVariable "tied") ']];	

		//Escort
		life_actions = life_actions + [player addAction["<t color = '#4170af'>Move Person</t>",life_fnc_civescort,"",0,false,false,"",'
		!isNull cursorTarget && player distance cursorTarget < 2.5 && isPlayer cursorTarget && (cursorTarget getVariable "tied") && !(cursorTarget getVariable "escorting")  && (!life_action_inUse) ']];	

		//Stop Escort
		life_actions = life_actions + [player addAction["<t color = '#4170af'>Stop Escort</t>",life_fnc_civstopescort,"",0,false,false,"",'
		!isNull cursorTarget && player distance cursorTarget < 2.5 && isPlayer cursorTarget && (cursorTarget getVariable "tied") && (cursorTarget getVariable["Escorting",false]) ']];	


		//Drop fishing net
		life_actions = [player addAction[localize "STR_pAct_DropFishingNet",life_fnc_dropFishingNet,"",0,false,false,"",'
		(surfaceisWater (getPos vehicle player)) && (vehicle player isKindOf "Ship") && life_carryWeight < life_maxWeight && speed (vehicle player) < 2 && speed (vehicle player) > -1 && !life_net_dropped ']];




		//Remove Comms
		life_actions = life_actions + [player addAction["<t color = '#a7afec'>Destroy Radio/Gps</t>",life_fnc_destroyComms,"",0,false,false,"",'
		!isNull cursorTarget && player distance cursorTarget < 3.5 && isPlayer cursorTarget && ( animationState cursorTarget == "Incapacitated" || animationState cursorTarget == "amovpercmstpsnonwnondnon_amovpercmstpssurwnondnon" || (cursorTarget getVariable "tied") || animationState cursorTarget == "AmovPercMstpSsurWnonDnon" ) ']];



	//place roadblock
		life_actions = life_actions + [player addAction["Place Roadblock",{if(!isNull life_roadblock) then {{detach _x;} foreach (life_roadblock getvariable "roadblock"); 
		_handle = [life_roadblock,"roadblock"] spawn life_fnc_enablecollisionwith; waitUntil {scriptDone _handle}; [[life_roadblock,"roadblock"],"life_fnc_enablecollisionwith",true,false] call BIS_fnc_MP; life_roadblock = ObjNull;};},"",999,false,false,"",'!isNull life_roadblock']];


		life_actions = life_actions + [player addAction["Pack up RoadBlock (Fortified)",life_fnc_packupRoadblock,"",0,false,false,"",'
		_roadblock = nearestObjects[getPos player,["RoadCone_L_F"],3.5] select 0; !isNil "_roadblock" && !isNil {(_roadblock getVariable "RoadBlock")}
		']];


	};
	case west:
	{
			
		//gatherevidence
		life_actions = life_actions + [player addAction["Gather Evidence",life_fnc_gatherEvidence,"",0,false,false,"",' !isNull cursorTarget && player distance cursorTarget < 2.5 && !dialog && typeOf cursorTarget == "cl_evidencebox"']];


		life_actions = life_actions + [player addAction["<t color = '#f4a84e'>Go to the Toilet</t>",life_fnc_takeashit,"",0,false,false,"",' life_poop > 80 && (vehicle player == player) ']];
		
		//Heal Person
		life_actions = life_actions + [player addAction["Heal Self",life_fnc_healself,"",0,false,false,"",' (damage player) > 0.2 && (asdih_inv_bandage > 0) ']];

		//Heal Self
		life_actions = life_actions + [player addAction["Heal Person",life_fnc_healperson,"",0,false,false,"",' !isNull cursorTarget && player distance cursorTarget < 2.5 && isPlayer cursorTarget && (damage cursorTarget) > 0.2 && (asdih_inv_bandage > 0) ']];



//Pickup Item
life_actions = life_actions + [player addAction["Pickup Item(s)",{createDialog "life_pickup_items"},"",0,false,false,"",
' !isNull nearestObject (screenToWorld [0.5,0.5]) && count (nearestObject (screenToWorld [0.5,0.5]) getVariable ["item",[]]) > 0 && player distance nearestObject (screenToWorld [0.5,0.5]) < 5 && !life_action_inUse ']];



life_actions = life_actions + [player addAction["Seize Items",life_fnc_seizeObjects,cursorTarget,0,false,false,"",'(count(nearestObjects [player,["weaponholder"],3])>0)']]; 

			//Get out of the electric chair
		life_actions = life_actions + [player addAction["Stand Up",life_fnc_electric,"",0,false,false,"",' ( animationState player == "BasicDriver" && vehicle player == player )  ']];

			//electrocute victim
		life_actions = life_actions + [player addAction["Electrocute Victim",life_fnc_electricchairdo,"",0,false,false,"",' ( animationState cursorTarget == "BasicDriver" && vehicle cursorTarget == cursorTarget )  ']];


		//Unblindfold person
		life_actions = life_actions + [player addAction["Remove blindfold",life_fnc_untieb,"",0,false,false,"",'
		!isNull cursorTarget && player distance cursorTarget < 2.5 && isPlayer cursorTarget && (cursorTarget getVariable "blindfolded") ']];

		//Untie person
		life_actions = life_actions + [player addAction["Untie Person Person",life_fnc_untie,"",0,false,false,"",'
		!isNull cursorTarget && player distance cursorTarget < 1.5 && isPlayer cursorTarget && (cursorTarget getVariable "tied") ']];

		//heal system
		life_actions = life_actions + [player addAction[localize "STR_pAct_NoBandagePlayer","","",0,false,false,"",'
		!isNull cursorTarget && player distance cursorTarget < 3 && isPlayer cursorTarget && (cursorTarget getVariable "bleedingon") == 2 ']];

		life_actions = life_actions + [player addAction[localize "STR_pAct_NoStitchPlayer","","",0,false,false,"",'
		!isNull cursorTarget && player distance cursorTarget < 3 && isPlayer cursorTarget && (cursorTarget getVariable "woundedon") == 2 ']];

		life_actions = life_actions + [player addAction[localize "STR_pAct_NoSplintPlayer","","",0,false,false,"",'
		!isNull cursorTarget && player distance cursorTarget < 3 && isPlayer cursorTarget && (cursorTarget getVariable "fractureon") == 2 ']];

		life_actions = life_actions + [player addAction[localize "STR_pAct_NoEpiPenPlayer","","",0,false,false,"",'
		!isNull cursorTarget && player distance cursorTarget < 3 && isPlayer cursorTarget && (cursorTarget getVariable "unconciouson") == 2 ']];


	//Pickup Unprocessed MDMA
life_actions = life_actions +
[player addAction["Pickup Unprocessed MDMA",life_fnc_pickupItem,false,0,false,false,"",
' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "MDMAu" && (player distance cursorTarget) < 3 && (life_carryWeight + (["MDMAu"] call life_fnc_itemWeight)) <= life_maxWeight ']];
//Pickup Processed MDMA
life_actions = life_actions +
[player addAction["Pickup Processed MDMA",life_fnc_pickupItem,true,0,false,false,"",
' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "MDMAp" && (player distance cursorTarget) < 3 && (life_carryWeight + (["MDMAp"] call life_fnc_itemWeight)) <= life_maxWeight ']];


	//Pickup Unprocessed Meth
life_actions = life_actions +
[player addAction["Pickup Unprocessed Meth",life_fnc_pickupItem,false,0,false,false,"",
' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "methu" && (player distance cursorTarget) < 3 && (life_carryWeight + (["methu"] call life_fnc_itemWeight)) <= life_maxWeight ']];
//Pickup Processed Meth
life_actions = life_actions +
[player addAction["Pickup Processed Meth",life_fnc_pickupItem,true,0,false,false,"",
' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "methp" && (player distance cursorTarget) < 3 && (life_carryWeight + (["methp"] call life_fnc_itemWeight)) <= life_maxWeight ']];

	//Pickup Unprocessed Coke
life_actions = life_actions +
[player addAction["Pickup Unprocessed Coke",life_fnc_pickupItem,false,0,false,false,"",
' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "cokeu" && (player distance cursorTarget) < 3 && (life_carryWeight + (["cokeu"] call life_fnc_itemWeight)) <= life_maxWeight ']];
//Pickup Processed Coke
life_actions = life_actions +
[player addAction["Pickup Processed Coke",life_fnc_pickupItem,true,0,false,false,"",
' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "cokep" && (player distance cursorTarget) < 3 && (life_carryWeight + (["cokep"] call life_fnc_itemWeight)) <= life_maxWeight ']];


	// Heli Fast Rope
		life_actions = life_actions + [player addAction["Fast Rope",life_fnc_fastRope,"",99,false,false,"", ' (vehicle player) != player && !isNull (vehicle player) && (vehicle player) isKindOf "Air" && driver (vehicle player) != player && (getPos player) select 2 <= 100 && (getPos player) select 2 >= 15 && speed vehicle player < 30 && !(player getVariable["transporting",false]) ']];
		
	//place bargate
		life_actions = life_actions + [player addAction["Place BarGate",{if(!isNull life_bargate) then {{detach _x} foreach (life_bargate getvariable "bargate"); _handle = [life_bargate,"bargate"] spawn life_fnc_enablecollisionwith; waitUntil {scriptDone _handle}; [[life_bargate,"bargate"],"life_fnc_enablecollisionwith",true,false] call BIS_fnc_MP; life_bargate = ObjNull;};},"",999,false,false,"",'!isNull life_bargate']];

	//Packup BarGate
		life_actions = life_actions + [player addAction["Pack up BarGate",life_fnc_packupbargate,"",0,false,false,"",'
		_bargate = nearestObjects[getPos player,["RoadCone_F"],3.5] select 0; !isNil "_bargate" && !isNil {(_bargate getVariable "bargate")}']];

	//Pickup BarGate Briefcases
		life_actions = life_actions + [player addAction["Pickup BarGate",life_fnc_pickupItem,"",0,false,false,"",
		' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "BarGate" && (player distance cursorTarget) < 3 ']];	
	
	//place roadcones
		life_actions = life_actions + [player addAction["Place Roadcone",{if(!isNull life_roadcone) then {{detach _x} foreach (life_roadcone getvariable "roadcone"); _handle = [life_roadcone,"roadcone"] spawn life_fnc_enablecollisionwith; waitUntil {scriptDone _handle}; [[life_roadcone,"roadcone"],"life_fnc_enablecollisionwith",true,false] call BIS_fnc_MP; life_roadcone = ObjNull;};},"",999,false,false,"",'!isNull life_roadcone']];
		
	//Packup Roadcones
		life_actions = life_actions + [player addAction["Pack up Roadcone Strip",life_fnc_packupRoadcones,"",0,false,false,"",'
		_cones = nearestObjects[getPos player,["RoadCone_L_F"],3.5] select 0; !isNil "_cones" && !isNil {(_cones getVariable "roadcone")} && (count (_cones getVariable "roadcone") > 1)
		']];
		life_actions = life_actions + [player addAction["Pack up Roadcone",life_fnc_packupRoadcones,"",0,false,false,"",'
		_cones = nearestObjects[getPos player,["RoadCone_F"],3.5] select 0; !isNil "_cones" && !isNil {(_cones getVariable "roadcone")} && {count (_cones getVariable "roadcone") == 1}
		']];
		life_actions = life_actions + [player addAction["Pack up Roadcone Strip",life_fnc_packupRoadcones,"",0,false,false,"",'
		_cones = nearestObjects[getPos player,["RoadCone_F"],3.5] select 0; !isNil "_cones" && !isNil {(_cones getVariable "roadcone")} && {count (_cones getVariable "roadcone") > 1}
		']];
		life_actions = life_actions + [player addAction["Pack up Roadcone",life_fnc_packupRoadcones,"",0,false,false,"",'
		_cones = nearestObjects[getPos player,["RoadCone_L_F"],3.5] select 0; !isNil "_cones" && !isNil {(_cones getVariable "roadcone")} && {count (_cones getVariable "roadcone") == 1}
		']];

	//Pickup roadcone briefcases
		life_actions = life_actions + [player addAction["Pickup Blinking Roadcone Strip",life_fnc_pickupItem,"",0,false,false,"",
		' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "RoadconeStripB" && (player distance cursorTarget) < 3 ']];
		life_actions = life_actions + [player addAction["Pickup Roadcone Strip",life_fnc_pickupItem,"",0,false,false,"",
		' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "RoadconeStrip" && (player distance cursorTarget) < 3 ']];
		life_actions = life_actions + [player addAction["Pickup Blinking Roadcone",life_fnc_pickupItem,"",0,false,false,"",
		' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "RoadconeB" && (player distance cursorTarget) < 3 ']];
		life_actions = life_actions + [player addAction["Pickup Roadcone",life_fnc_pickupItem,"",0,false,false,"",
		' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "Roadcone" && (player distance cursorTarget) < 3 ']];
		

	//place roadblock
		life_actions = life_actions + [player addAction["Place Roadblock",{if(!isNull life_roadblock) then {{detach _x;} foreach (life_roadblock getvariable "roadblock"); 
		_handle = [life_roadblock,"roadblock"] spawn life_fnc_enablecollisionwith; waitUntil {scriptDone _handle}; [[life_roadblock,"roadblock"],"life_fnc_enablecollisionwith",true,false] call BIS_fnc_MP; life_roadblock = ObjNull;};},"",999,false,false,"",'!isNull life_roadblock']];

	//Packup Roadblocks
		life_actions = life_actions + [player addAction["Pack up RoadBlock (Wooden)",life_fnc_packupRoadblock,"",0,false,false,"",'
		_roadblock = nearestObjects[getPos player,["RoadCone_F"],3.5] select 0; !isNil "_roadblock" && !isNil {(_roadblock getVariable "RoadBlock")}
		']];
		life_actions = life_actions + [player addAction["Pack up RoadBlock (Fortified)",life_fnc_packupRoadblock,"",0,false,false,"",'
		_roadblock = nearestObjects[getPos player,["RoadCone_L_F"],3.5] select 0; !isNil "_roadblock" && !isNil {(_roadblock getVariable "RoadBlock")}
		']];
		life_actions = life_actions + [player addAction["Pack up RoadBlock (Wreck)",life_fnc_packupRoadblock,"",0,false,false,"",'
		_roadblock = nearestObjects[getPos player,["Land_MetalBarrel_empty_F"],3.5] select 0; !isNil "_roadblock" && !isNil {(_roadblock getVariable "RoadBlock")}']];


	//Pickup roadblock briefcases
		life_actions = life_actions + [player addAction["Pickup RoadBlock (Wooden)",life_fnc_pickupItem,"",0,false,false,"",
		' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "RoadBlockWood" && (player distance cursorTarget) < 3 ']];
		life_actions = life_actions + [player addAction["Pickup RoadBlock (Fortified)",life_fnc_pickupItem,"",0,false,false,"",
		' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "RoadBlockConc" && (player distance cursorTarget) < 3 ']];
		life_actions = life_actions + [player addAction["Pickup RoadBlock (Wreck)",life_fnc_pickupItem,"",0,false,false,"",
		' !isNull cursorTarget && (typeOf cursorTarget) == "Land_Suitcase_F" && ((cursorTarget getVariable "item") select 0) == "RoadBlockRebel" && (player distance cursorTarget) < 3 ']];
	};
};