class cfgInteractions
{
	class OpenPhone
	{
		condition = "[alive player, !(player getVariable ['restrained',false]), (player distance Harris_currentCursorObject > 3)]";
		action = "[] call fnc_opentablet;";
		icon = "icon_smartphone.paa";
		text = "Open Phone";
	};
	class PoliceVehicle
	{
		action = "";
		icon = "027-hat-of-a-policeman.paa";
		text = "Police";
		class Registration
		{
			condition = "[(Harris_currentCursorObject isKindOf 'Land' || Harris_currentCursorObject isKindOf 'Air' || Harris_currentCursorObject isKindOf 'Sea'), (playerSide == west), !isNull Harris_currentCursorObject]";
			action = "[Harris_currentCursorObject] spawn life_fnc_searchVehAction;";
			icon = "002_Tag.paa";
			text = "Registration";
		};
		class Search
		{
			condition = "[(Harris_currentCursorObject isKindOf 'Land' || Harris_currentCursorObject isKindOf 'Air' || Harris_currentCursorObject isKindOf 'Sea'), (playerSide == west), !isNull Harris_currentCursorObject]";
			action = "[Harris_currentCursorObject] spawn fnc_searchVehicle;";
			icon = "icon_search.paa";
			text = "Search Vehicle";
		};
		class Pullout
		{
			condition = "[(Harris_currentCursorObject isKindOf 'Land' || Harris_currentCursorObject isKindOf 'Air' || Harris_currentCursorObject isKindOf 'Sea'), (playerSide == west), !isNull Harris_currentCursorObject,count crew cursorObject > 0]";
			action = "[Harris_currentCursorObject] spawn life_fnc_pulloutAction;";
			icon = "006_DragChild.paa";
			text = "Pullout";
		};
		class Impound
		{
			condition = "[(Harris_currentCursorObject isKindOf 'Land' || Harris_currentCursorObject isKindOf 'Air' || Harris_currentCursorObject isKindOf 'Sea'), (playerSide == west), !isNull Harris_currentCursorObject]";
			action = "[Harris_currentCursorObject] spawn life_fnc_impoundAction;";
			icon = "029-license-plate.paa";
			text = "Impound";
		};
	};
	class ImpoundEMS
	{
		condition = "[(Harris_currentCursorObject isKindOf 'Land' || Harris_currentCursorObject isKindOf 'Air' || Harris_currentCursorObject isKindOf 'Sea'), (playerSide == independent)]";
		action = "[Harris_currentCursorObject] spawn life_fnc_impoundAction;";
		icon = "0029-license-plate.paa";
		text = "Impound";
	};
	class Pullout
	{
		condition = "[(Harris_currentCursorObject isKindOf 'Land' || Harris_currentCursorObject isKindOf 'Air' || Harris_currentCursorObject isKindOf 'Sea'), Harris_currentCursorObject in life_vehicles, count crew cursorObject > 0, playerside != west]";
		action = "[Harris_currentCursorObject] spawn life_fnc_pulloutAction;";
		icon = "006_DragChild.paa";
		text = "Pullout";
	};
	class checkLicense 
	{
		condition = "[(Harris_currentCursorObject isKindOf 'Land' || Harris_currentCursorObject isKindOf 'Air' || Harris_currentCursorObject isKindOf 'Sea'), (playerSide == west), (driver Harris_currentCursorObject != Harris_currentCursorObject)]";
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
			condition = "[(Harris_currentCursorObject isKindOf 'Sea')]";
			action = "[] spawn life_fnc_pushObject;";
			icon = "020-hand.paa";
			text = "Push Boat";
		};
		class pushCar 
		{
			condition = "[(Harris_currentCursorObject isKindOf 'Land')]";
			action = "[] spawn life_fnc_pushObject;";
			icon = "020-hand.paa";
			text = "Push";
		};
		class unFlip
		{
			condition = "[(Harris_currentCursorObject isKindOf 'Land' || Harris_currentCursorObject isKindOf 'Air')]";
			action = "Harris_currentCursorObject setPos [getPos Harris_currentCursorObject select 0, getPos Harris_currentCursorObject select 1, (getPos Harris_currentCursorObject select 2)+0.5];";
			icon = "033-upload.paa";
			text = "Unflip";
		};
		class repairVehicle
		{
			condition = "[(Harris_currentCursorObject isKindOf 'Land' || Harris_currentCursorObject isKindOf 'Air' || Harris_currentCursorObject isKindOf 'Sea'), player distance Harris_currentCursorObject < 10, damage Harris_currentCursorObject > 0]";
			action = "[Harris_currentCursorObject] spawn life_fnc_repairTruck;";
			icon = "023-car-repair.paaa";
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
			condition = "[!(Harris_currentCursorObject getVariable ['Foski_Restrained', false]), isPlayer Harris_currentCursorObject, player distance Harris_currentCursorObject < 3.5]";
			action = "[Harris_currentCursorObject] call Foski_restrainPlayer;";
			icon = "icon_handcuffs.paa";
			text = "Unflip";
		};
		class Unrestrain 
		{
			condition = "[(Harris_currentCursorObject getVariable ['Foski_Restrained', false]), isPlayer Harris_currentCursorObject, player distance Harris_currentCursorObject < 3.5]";
			action = "[Harris_currentCursorObject] call Foski_unrestrainPlayer;";
			icon = "icon_handcuffs.paa";
			text = "Unflip";
		};
		class Unescort 
		{
			condition = "[(Harris_currentCursorObject getVariable['Escorting',false]), isPlayer Harris_currentCursorObject]";
			action = "[Harris_currentCursorObject] call life_fnc_stopEscorting;";
			icon = "002_Tag.paa";
			text = "Unescort";
		};
		class Escort 
		{
			condition = "[!(Harris_currentCursorObject getVariable['Escorting',false]), isPlayer Harris_currentCursorObject, (Harris_currentCursorObject getVariable ['restrained', false])]";
			action = "[Harris_currentCursorObject] call life_fnc_escortAction;";
			icon = "006_DragChild.paa";
			text = "EScort";
		};
		class PutInCar
		{
			condition = "[isPlayer Harris_currentCursorObject, (Harris_currentCursorObject distance nearestObject [Harris_currentCursorObject, 'Car'] < 5 || Harris_currentCursorObject distance nearestObject [Harris_currentCursorObject, 'Air'] < 5)]";
			action = "[Harris_currentCursorObject] call life_fnc_putInCar;";
			icon = "033-download.paa";
			text = "Put In Vehicle";
		};
		class PatDown
		{
			condition = "[isPlayer Harris_currentCursorObject,(Harris_currentCursorObject getVariable ['restrained', false])]";
			action = "[Harris_currentCursorObject] call life_fnc_putInCar;";
			icon = "020-hand.paa";
			text = "Pat Down";
		};
		class Strip
		{
			condition = "[isPlayer Harris_currentCursorObject,(Harris_currentCursorObject getVariable ['restrained', false])]";
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
			condition = "[isPlayer Harris_currentCursorObject]";
			action = "[[player],""life_fnc_licenseCheck"",life_pInact_curTarget,FALSE] spawn bis_fnc_mp";
			icon = "018-id-card.paa";
			text = "Licenses";
		};
		class revokeLicenses 
		{
			condition = "[isPlayer Harris_currentCursorObject,(Harris_currentCursorObject getVariable ['restrained',false])]";
			action = "[[player],""life_fnc_licenseCheck"",life_pInact_curTarget,FALSE] spawn bis_fnc_mp";
			icon = "018-id-card.paa";
			text = "Revoke";
		};
		class Ticket
		{
			condition = "[isPlayer Harris_currentCursorObject]";
			action = "[Harris_currentCursorObject] call Harris_openGiveTicket";
			icon = "017-receipt.paa";
			text = "Revoke";
		};
		class testIntox
		{
			condition = "[isPlayer Harris_currentCursorObject]";
			action = "[Harris_currentCursorObject] call life_fnc_testIntox";
			icon = "028-antibiotic.paa";
			text = "Text Intox";
		};

		class Arrest
		{
			condition = "[(Harris_currentCursorObject getVariable ['restrained', false]), isPlayer Harris_currentCursorObject, (player distance getMarkerPos 'A3L_jailMarker' < 50)]";
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
		condition = "[typeOf Harris_currentCursorObject == 'A3L_WorkBench', isNil {player getVariable 'carryingObject'}]";
		action = "[] call Harris_openCraftingMenu";
		icon = "014_wrench.paa";
		text = "Craft";
	};

	class openRefiner
	{
		condition = "[(player distance (getMarkerPos 'Min_1') < 20 || player distance (getMarkerPos 'Min_2') < 20)]";
		action = "[2] call Harris_openCraftingMenu";
		icon = "014_wrench.paa";
		text = "Refinery";
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
		icon = "031-shopping-cart-1.paa";
		text = "Open Shop";
	};
};

