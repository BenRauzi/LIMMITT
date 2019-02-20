class cfgInteractions
{
	class SyncData
	{
		condition = "[alive player, !(player getVariable ['restrained',false]), (player distance Harris_currentCursorObject > 3)]";
		action = "[] spawn SOCK_fnc_syncData;";
		icon = "032-cloud-sync.paa";
		text = "Sync Data";
	};
	class PoliceVehicle
	{
		action = "";
		icon = "027-hat-of-a-policeman.paa";
		text = "Police";
		class Registration
		{
			condition = "[(Harris_currentCursorObject isKindOf 'Land' || Harris_currentCursorObject isKindOf 'Air' || Harris_currentCursorObject isKindOf 'Ship'), (playerSide == west), !isNull Harris_currentCursorObject, !(cursorObject isKindOf 'Man')]";
			action = "[Harris_currentCursorObject] spawn life_fnc_searchVehAction;";
			icon = "002_Tag.paa";
			text = "Registration";
		};
		class Search
		{
			condition = "[(Harris_currentCursorObject isKindOf 'Land' || Harris_currentCursorObject isKindOf 'Air' || Harris_currentCursorObject isKindOf 'Ship'), (playerSide == west), !isNull Harris_currentCursorObject,!(cursorObject isKindOf 'Man')]";
			action = "[Harris_currentCursorObject] spawn fnc_searchVehicle;";
			icon = "030-search.paa";
			text = "Search Vehicle";
		};
		class Pullout
		{
			condition = "[(Harris_currentCursorObject isKindOf 'Land' || Harris_currentCursorObject isKindOf 'Air' || Harris_currentCursorObject isKindOf 'Ship'), (playerSide == west), !isNull Harris_currentCursorObject,count crew cursorObject > 0,!(cursorObject isKindOf 'Man')]";
			action = "[Harris_currentCursorObject] spawn life_fnc_pulloutAction;";
			icon = "006_DragChild.paa";
			text = "Pullout";
		};
		class Impound
		{
			condition = "[(Harris_currentCursorObject isKindOf 'Land' || Harris_currentCursorObject isKindOf 'Air' || Harris_currentCursorObject isKindOf 'Ship'), (playerSide == west), !isNull Harris_currentCursorObject, !(Harris_currentCursorObject isKindOf 'Man')]";
			action = "[Harris_currentCursorObject] spawn life_fnc_impoundAction;";
			icon = "029-license-plate.paa";
			text = "Impound";
		};
	};
	class ImpoundEMS
	{
		condition = "[(Harris_currentCursorObject isKindOf 'Land' || Harris_currentCursorObject isKindOf 'Air' || Harris_currentCursorObject isKindOf 'Ship'), (playerSide == independent), !(Harris_currentCursorObject isKindOf 'Man')]";
		action = "[Harris_currentCursorObject] spawn life_fnc_impoundAction;";
		icon = "029-license-plate.paa";
		text = "Impound";
	};
	class revivePlayer
	{
		condition = "[cursorObject isKindOf 'Man', (playerSide == independent || 'Harris_medKit' in items player), !alive Harris_currentCursorObject]";
		action = "[Harris_currentCursorObject] spawn life_fnc_revivePlayer;";
		icon = "010_cpr.paa";
		text = "Revive";
	};
	class healPlayer
	{
		condition = "[isPlayer Harris_currentCursorObject, (playerSide == independent || 'Harris_medKit' in items player), damage Harris_currentCursorObject < 1, damage Harris_currentCursorObject > 0]";
		action = "[0,Harris_currentCursorObject] spawn life_fnc_healPerson";
		icon = "020-hand.paa";
		text = "Heal Player";
	};
	class healSelf
	{
		condition = "[damage player > 0, 'Harris_medKit' in items player]";
		action = "[0,player] spawn life_fnc_healPerson";
		icon = "020-hand.paa";
		text = "Heal Self";
	};
	class Pullout
	{
		condition = "[(Harris_currentCursorObject isKindOf 'Land' || Harris_currentCursorObject isKindOf 'Air' || Harris_currentCursorObject isKindOf 'Ship'), Harris_currentCursorObject in life_vehicles, count crew cursorObject > 0, playerside != west]";
		action = "[Harris_currentCursorObject] spawn life_fnc_pulloutAction;";
		icon = "006_DragChild.paa";
		text = "Pullout";
	};
	class checkLicense 
	{
		condition = "[(Harris_currentCursorObject isKindOf 'Land' || Harris_currentCursorObject isKindOf 'Air' || Harris_currentCursorObject isKindOf 'Ship'), (playerSide == west), (driver Harris_currentCursorObject != Harris_currentCursorObject), (!isNull (driver Harris_currentCursorObject))]";
		action = "[[driver Harris_currentCursorObject],""life_fnc_licenseCheck"",Harris_currentCursorObject,FALSE] spawn bis_fnc_mp;";
		icon = "030-identity-card.paa";
		text = "Check License";
	};
	class ctrlVehicle
	{
		action = "";
		icon = "023-car-repair.paa";
		text = "Vehicle";
		class pushBoat 
		{
			condition = "[(Harris_currentCursorObject isKindOf 'Ship')]";
			action = "[] spawn life_fnc_pushObject;";
			icon = "020-hand.paa";
			text = "Push Boat";
		};
		class pushCar 
		{
			condition = "[(Harris_currentCursorObject isKindOf 'Land'),!( cursorObject isKindOf'Man')]";
			action = "[] spawn life_fnc_pushObject;";
			icon = "020-hand.paa";
			text = "Push";
		};
		class unFlip
		{
			condition = "[(Harris_currentCursorObject isKindOf 'Land' || Harris_currentCursorObject isKindOf 'Air'),!( cursorObject isKindOf'Man')]";
			action = "Harris_currentCursorObject setPos [getPos Harris_currentCursorObject select 0, getPos Harris_currentCursorObject select 1, (getPos Harris_currentCursorObject select 2)+0.5];";
			icon = "033-upload.paa";
			text = "Unflip";
		};
		class repairVehicle
		{
			condition = "[(Harris_currentCursorObject isKindOf 'Land' || Harris_currentCursorObject isKindOf 'Air' || Harris_currentCursorObject isKindOf 'Ship'), player distance Harris_currentCursorObject < 10,!(Harris_currentCursorObject isKindOf 'Man')]";
			action = "[Harris_currentCursorObject] spawn life_fnc_repairTruck;";
			icon = "023-car-repair.paa";
			text = "Repair";
		};
	};
	class PoliceAction
	{
		action = "";
		icon = "icon_handcuffs.paa";
		text = "Police Handle";
		class Restrain 
		{
			condition = "[!(Harris_currentCursorObject getVariable ['Foski_Restrained', false]), isPlayer Harris_currentCursorObject, player distance Harris_currentCursorObject < 3.5, playerside == west]";
			action = "[Harris_currentCursorObject] call Foski_restrainPlayer; player playMove 'AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon';";
			icon = "icon_handcuffs.paa";
			text = "Restrain";
		};
		class Unrestrain 
		{
			condition = "[(Harris_currentCursorObject getVariable ['Foski_Restrained', false]), isPlayer Harris_currentCursorObject, player distance Harris_currentCursorObject < 3.5, playerside == west]";
			action = "[Harris_currentCursorObject] call Foski_unrestrainPlayer; Harris_currentCursorObject setVariable ['Harris_roped', nil,true]; player playMove 'AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon';";
			icon = "icon_handcuffs.paa";
			text = "Unrestrain";
		};
		class shackle 
		{
			condition = "[(animationState Harris_currentCursorObject != 'hubspectator_stand'), isPlayer Harris_currentCursorObject, player distance Harris_currentCursorObject < 3.5, playerside == west]";
			action = "[] remoteExecCall ['Harris_shackle', Harris_currentCursorObject]; player playMove 'AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon';";
			icon = "015_handcuffs.paa";
			text = "Shackle";
		};
		class unShackle 
		{
			condition = "[(animationState Harris_currentCursorObject == 'hubspectator_stand'), isPlayer Harris_currentCursorObject, player distance Harris_currentCursorObject < 3.5, playerside == west]";
			action = "[] remoteExecCall ['Harris_shackle', Harris_currentCursorObject]; player playMove 'AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon';";
			icon = "015_handcuffs.paa";
			text = "UnShackle";
		};
		class Unescort 
		{
			condition = "[count (attachedObjects player) > 0, !isNil 'escorting', playerside == west]";
			action = "[escorting] call life_fnc_stopEscorting; escorting = nil;";
			icon = "006_DragChild.paa";
			text = "Unescort";
		};
		class Escort 
		{
			condition = "[!(Harris_currentCursorObject getVariable['Escorting',false]), isPlayer Harris_currentCursorObject, (Harris_currentCursorObject getVariable ['restrained', false]), playerside == west]";
			action = "[Harris_currentCursorObject] call life_fnc_escortAction; escorting = Harris_currentCursorObject;";
			icon = "006_DragChild.paa";
			text = "Escort";
		};
		class PutInCar
		{
			condition = "[isPlayer Harris_currentCursorObject, (Harris_currentCursorObject distance nearestObject [Harris_currentCursorObject, 'Car'] < 5 || Harris_currentCursorObject distance nearestObject [Harris_currentCursorObject, 'Air'] < 5), playerside == west, vehicle Harris_currentCursorObject == Harris_currentCursorObject]";
			action = "[Harris_currentCursorObject] call life_fnc_putInCar;";
			icon = "033-download.paa";
			text = "Put In Vehicle";
		};
	};
	class Rope 
	{
		condition = "[!(Harris_currentCursorObject getVariable ['Foski_Restrained', false]), isPlayer Harris_currentCursorObject, player distance Harris_currentCursorObject < 3.5, 'Harris_rope' in items player, (Harris_currentCursorObject getVariable ['Foski_Surrender', false] || Harris_currentCursorObject getVariable ['Harris_unconscious', false])]";
		action = "[Harris_currentCursorObject] call Foski_restrainPlayer; Harris_currentCursorObject setVariable ['Harris_roped', true,true]; player playMove 'AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon';";
		icon = "icon_handcuffs.paa";
		text = "Tie";
	};
	class UnRope 
	{
		condition = "[(Harris_currentCursorObject getVariable ['Foski_Restrained', false]), isPlayer Harris_currentCursorObject, player distance Harris_currentCursorObject < 3.5, Harris_currentCursorObject getVariable ['Harris_roped', false]]";
		action = "[Harris_currentCursorObject] call Foski_unrestrainPlayer; Harris_currentCursorObject setVariable ['Harris_roped', nil,true]; player playMove 'AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon';";
		icon = "icon_handcuffs.paa";
		text = "Untie";
	};
	class searchPlayer 
	{
		action = "";
		icon = "020-hand.paa";
		text = "Search";
		class PatDown
		{
			condition = "[isPlayer Harris_currentCursorObject,(Harris_currentCursorObject getVariable ['restrained', false]), playerside == west]";
			action = "[[[],""life_fnc_removeWeaponAction"",Harris_currentCursorObject,false] spawn bis_fnc_mp;";
			icon = "020-hand.paa";
			text = "Pat Down";
		};
		class Strip
		{
			condition = "[isPlayer Harris_currentCursorObject,(Harris_currentCursorObject getVariable ['restrained', false]),playerside == west]";
			action = "[Harris_currentCursorObject] call fnc_stripSearch;";
			icon = "020-hand.paa";
			text = "Strip Search";
		};
	};
	class Licenses
	{
		action = "";
		icon = "021-tax.paa";
		text = "Legal";
		class checkLicenses 
		{
			condition = "[isPlayer Harris_currentCursorObject, playerside == west]";
			action = "[[player],""life_fnc_licenseCheck"",Harris_currentCursorObject,FALSE] spawn bis_fnc_mp";
			icon = "018-id-card.paa";
			text = "Licenses";
		};
		class revokeLicenses 
		{
			condition = "[isPlayer Harris_currentCursorObject,(Harris_currentCursorObject getVariable ['restrained',false]),playerside == west]";
			action = "[[player],""life_fnc_licenseCheck"",Harris_currentCursorObject,FALSE] spawn bis_fnc_mp";
			icon = "018-id-card.paa";
			text = "Revoke";
		};
		class Ticket
		{
			condition = "[isPlayer Harris_currentCursorObject,playerside == west]";
			action = "[Harris_currentCursorObject] call Harris_openGiveTicket";
			icon = "017-receipt.paa";
			text = "Ticket";
		};
		class testIntox
		{
			condition = "[isPlayer Harris_currentCursorObject,playerside == west, !(player distance getMarkerPos 'A3L_jailMarker' < 50), (player distance getMarkerPos 'Correctional_Facility_1' > 50)]";
			action = "[Harris_currentCursorObject] call life_fnc_testIntox";
			icon = "028-antibiotic.paa";
			text = "Test Intox";
		};

		class Arrest
		{
			condition = "[(Harris_currentCursorObject getVariable ['restrained', false]), isPlayer Harris_currentCursorObject, (player distance getMarkerPos 'Correctional_Facility_1' < 50),playerside == west]";
			action = "[Harris_currentCursorObject] call fnc_arrestmenu;";
			icon = "014_wanted.paa";
			text = "Arrest";
		};
	};

	class dropFurniture
	{
		condition = "[!isNil {player getVariable 'carryingObject'}]";
		action = "[] spawn Harris_dropFurniture";
		icon = "033-download.paa";
		text = "Drop";
	};
	class pickUpFurniture
	{
		condition = "[typeOf Harris_currentCursorObject in Harris_Furniture, isNil {player getVariable 'carryingObject'}, player distance Harris_currentCursorObject < 5]";
		action = "[Harris_currentCursorObject] spawn Harris_pickUpFurniture";
		icon = "033-upload.paa";
		text = "Pickup";
	};
	class removeFurniture
	{
		condition = "[!isNil {player getVariable 'carryingObject'}]";
		action = "[] call Harris_removeFurniture";
		icon = "031-shopping-cart-1.paa";
		text = "Pickup";
	};
	class openCrafting
	{
		condition = "[typeOf Harris_currentCursorObject == 'JD_WorkBench', isNil {player getVariable 'carryingObject'}]";
		action = "[] call Harris_openCraftingMenu";
		icon = "014_wrench.paa";
		text = "Craft";
	};

	class openRefiner
	{
		condition = "[(player distance (getMarkerPos 'Min_1') < 50 || player distance (getMarkerPos 'Min_2') < 50)]";
		action = "[2] call Harris_openCraftingMenu";
		icon = "014_wrench.paa";
		text = "Refinery";
	};

	class openRefinery2
	{
		condition = "[(player distance (getMarkerPos 'Oil_Rig') < 50]";
		action = "[2,2] call Harris_openCraftingMenu";
		icon = "014_wrench.paa";
		text = "Refinery";
	};

	class startPumping
	{
		condition = "[typeOf Harris_currentCursorObject == 'Land_oil_pump', !(Harris_currentCursorObject getVariable ['isDrillingOil', false])]";
		action = "[Harris_currentCursorObject] spawn Harris_drillOil";
		icon = "014_wrench.paa";
		text = "Start Pumping";
	};

	class stopPumping
	{
		condition = "[typeOf Harris_currentCursorObject == 'Land_oil_pump', (Harris_currentCursorObject getVariable ['isDrillingOil', false])]";
		action = "Harris_currentCursorObject setVariable ['isDrillingOil', nil,true];";
		icon = "014_wrench.paa";
		text = "Stop Pumping";
	};

	class setName
	{
		condition = "[isPlayer Harris_currentCursorObject, player distance Harris_currentCursorObject < 5]";
		action = "[Harris_currentCursorObject] call Harris_openSetName";
		icon = "002_Tag.paa";
		text = "Set Name";
	};

	class sellShop
	{
		condition = "[!isNil {Harris_currentCursorObject getVariable 'Harris_Shop'}, player distance Harris_currentCursorObject < 5]";
		action = "[Harris_currentCursorObject] call Harris_openShop";
		icon = "001_Shop.paa";
		text = "Open Shop";
	};

	class policeHouse
	{
		action = "";
		icon = "013_police-shield.paa";
		text = "House Actions";
		class raidHouse
		{
			condition = "[!isNil {Harris_currentCursorObject getVariable 'house_owner'}, player distance Harris_currentCursorObject < 10, playerside == west, Harris_currentCursorObject isKindOf 'House_F']";
			action = "[Harris_currentCursorObject] call life_fnc_raidHouse;";
			icon = "013_police-shield.paa";
			text = "Raid House";
		};
		class houseOwner
		{
			condition = "[!isNil {Harris_currentCursorObject getVariable 'house_owner'}, player distance Harris_currentCursorObject < 10, playerside == west, Harris_currentCursorObject isKindOf 'House_F']";
			action = "[Harris_currentCursorObject] call life_fnc_copHouseOwner;";
			icon = "030-identity-card.paa";
			text = "House Owner";
		};
		class breakHouse
		{
			condition = "[!isNil {Harris_currentCursorObject getVariable 'house_owner'}, player distance Harris_currentCursorObject < 10, playerside == west, Harris_currentCursorObject isKindOf 'House_F']";
			action = "[Harris_currentCursorObject] call life_fnc_copBreakDoor;";
			icon = "013_police-shield.paa";
			text = "Break Down";
		};
	};

	class lockHouse
	{
		condition = "[!isNil {Harris_currentCursorObject getVariable 'house_owner'}, player distance Harris_currentCursorObject < 10, playerside == west,Harris_currentCursorObject isKindOf 'House_F']";
		action = "[Harris_currentCursorObject] spawn life_fnc_lockupHouse;";
		icon = "031-key-silhouette-security-tool-interface-symbol-of-password.paa";
		text = "Lock House";
	};

	class forSale 
	{
		action = "";
		icon = "046-for-sale-post.paa";
		text = "For Sale";
		class buyHouse 
		{
			condition = "[(!(Harris_currentCursorObject in life_vehicles) && isNil {Harris_currentCursorObject getVariable 'house_owner'}), player distance Harris_currentCursorObject < 10, Harris_currentCursorObject isKindOf 'House_F', typeOf Harris_currentCursorObject in Harris_Houses]";
			action = "[Harris_currentCursorObject] spawn life_fnc_buyHouse;";
			icon = "046-for-sale-post.paa";
			text = "Buy House";
		};
		class priceHouse 
		{
			condition = "[(!(Harris_currentCursorObject in life_vehicles) && isNil {Harris_currentCursorObject getVariable 'house_owner'}), player distance Harris_currentCursorObject < 10,Harris_currentCursorObject isKindOf 'House_F', typeOf Harris_currentCursorObject in Harris_Houses]";
			action = "[Harris_currentCursorObject] call life_fnc_housePrice;";
			icon = "019-open-male-purse.paa";
			text = "House Price";
		};
	};

	class civHouse
	{
		action = "";
		icon = "048-home-with-locked-padlock.paa";
		text = "House";
		class houseGarage 
		{
			condition = "[(typeOf Harris_currentCursorObject) in ['Land_i_Garage_V1_F','Land_i_Garage_V2_F'], player distance Harris_currentCursorObject < 10, (Harris_currentCursorObject in life_vehicles)]";
			action = "[Harris_currentCursorObject,""Car""] spawn life_fnc_vehicleGarage";
			icon = "024-garage.paa";
			text = "Garage";
		};
		class storeVehicle 
		{
			condition = "[(typeOf Harris_currentCursorObject) in ['Land_i_Garage_V1_F','Land_i_Garage_V2_F'], player distance Harris_currentCursorObject < 10, (Harris_currentCursorObject in life_vehicles)]";
			action = "[Harris_currentCursorObject,player] spawn life_fnc_storeVehicle;";
			icon = "022-parking.paa";
			text = "Store Vehicle";
		};
		class unLockStorage 
		{
			condition = "[player distance Harris_currentCursorObject < 10, (Harris_currentCursorObject in life_vehicles), (Harris_currentCursorObject getVariable ['locked',false]), Harris_currentCursorObject isKindOf 'House_F']";
			action = "[cursorObject] spawn life_fnc_lockHouse";
			icon = "031-key-silhouette-security-tool-interface-symbol-of-password.paa";
			text = "Unlock";
		};
		class lockStorage 
		{
			condition = "[player distance Harris_currentCursorObject < 10, (Harris_currentCursorObject in life_vehicles), !(Harris_currentCursorObject getVariable ['locked',false]),Harris_currentCursorObject isKindOf 'House_F']";
			action = "[cursorObject] spawn life_fnc_lockHouse";
			icon = "031-key-silhouette-security-tool-interface-symbol-of-password.paa";
			text = "Lock";
		};
		class sellHouse 
		{
			condition = "[player distance Harris_currentCursorObject < 10, (Harris_currentCursorObject in life_vehicles), Harris_currentCursorObject isKindOf 'House_F']";
			action = "[Harris_currentCursorObject,""Car""] spawn life_fnc_sellHouse";
			icon = "046-for-sale-post.paa";
			text = "Sell House";
		};
	};

	class plantWeed
	{
		condition = "[typeOf Harris_currentCursorObject isEqualTo 'JD_Pot', player distance Harris_currentCursorObject < 5, (isNil {Harris_currentCursorObject getVariable 'growingPlant'}),'Harris_weedSeeds' in (items player)]";
		action = "[Harris_currentCursorObject] spawn Harris_plantWeed";
		icon = "020-hand.paa";
		text = "Plant Weed";
	};

	class seizeWeed
	{
		condition = "[typeOf Harris_currentCursorObject isEqualTo 'JD_Pot', player distance Harris_currentCursorObject < 5, !(isNil {Harris_currentCursorObject getVariable 'growingPlant'}), playerside == west]";
		action = "[Harris_currentCursorObject] spawn Harris_seizeWeed";
		icon = "033-upload.paa";
		text = "Seize Weed";
	};

	class seizePot
	{
		condition = "[typeOf Harris_currentCursorObject isEqualTo 'JD_Pot', player distance Harris_currentCursorObject < 5, (isNil {Harris_currentCursorObject getVariable 'growingPlant'}), playerside == west]";
		action = "[Harris_currentCursorObject] spawn Harris_seizePot";
		icon = "033-upload.paa";
		text = "Seize Pot";
	};

	class harvestWeed
	{
		condition = "[!(isNil {Harris_currentCursorObject getVariable 'weedReady'}), player distance Harris_currentCursorObject < 5]";
		action = "[Harris_currentCursorObject] spawn Harris_gatherWeed";
		icon = "020-hand.paa";
		text = "Gather";
	};

	class takeBankCash
	{
		condition = "[typeOf Harris_currentCursorObject isEqualTo 'A3L_MoneyPile', player distance Harris_currentCursorObject < 5]";
		action = "[] spawn Foski_takeCash";
		icon = "050-money.paa";
		text = "Take Cash";
	};
};

