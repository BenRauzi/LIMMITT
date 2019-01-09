class cfgInteractions
{
	class OpenPhone
	{
		condition = "[alive player, !(player getVariable 'restrained'), (player distance Harris_currentCursorObject > 3)]";
		action = "[] call fnc_opentablet;";
		icon = "002_Tag.paa";
		text = "Open Phone";
		class OpenPhone
		{
			condition = "[true]";
			action = "[] call fnc_opentablet;";
			icon = "002_Tag.paa";
			text = "Test";
		};
	};
	class PoliceVehicle
	{
		action = "";
		icon = "027-hat-of-a-policeman.paa";
		text = "Police";
		class Registration
		{
			condition = "[(Harris_currentCursorObject isKindOf 'Land' || Harris_currentCursorObject isKindOf 'Air' || Harris_currentCursorObject isKindOf 'Sea'), (playerSide == west)]";
			action = "[Harris_currentCursorObject] spawn life_fnc_searchVehAction;";
			icon = "002_Tag.paa";
			text = "Registration";
		};
		class Search
		{
			condition = "[(Harris_currentCursorObject isKindOf 'Land' || Harris_currentCursorObject isKindOf 'Air' || Harris_currentCursorObject isKindOf 'Sea'), (playerSide == west)]";
			action = "[Harris_currentCursorObject] spawn fnc_searchVehicle;";
			icon = "002_Tag.paa";
			text = "Search Vehicle";
		};
		class Pullout
		{
			condition = "[(Harris_currentCursorObject isKindOf 'Land' || Harris_currentCursorObject isKindOf 'Air' || Harris_currentCursorObject isKindOf 'Sea'), (playerSide == west)]";
			action = "[Harris_currentCursorObject] spawn life_fnc_pulloutAction;";
			icon = "002_Tag.paa";
			text = "Pullout";
		};
		class Impound
		{
			condition = "[(Harris_currentCursorObject isKindOf 'Land' || Harris_currentCursorObject isKindOf 'Air' || Harris_currentCursorObject isKindOf 'Sea'), (playerSide == west)]";
			action = "[Harris_currentCursorObject] spawn life_fnc_impoundAction;";
			icon = "002_Tag.paa";
			text = "Impound";
		};
	};
	class ImpoundEMS
	{
		condition = "[(Harris_currentCursorObject isKindOf 'Land' || Harris_currentCursorObject isKindOf 'Air' || Harris_currentCursorObject isKindOf 'Sea'), (playerSide == independent)]";
		action = "[Harris_currentCursorObject] spawn life_fnc_impoundAction;";
		icon = "002_Tag.paa";
		text = "Impound";
	};
	class Pullout
	{
		condition = "[(Harris_currentCursorObject isKindOf 'Land' || Harris_currentCursorObject isKindOf 'Air' || Harris_currentCursorObject isKindOf 'Sea'), Harris_currentCursorObject in life_vehicles]";
		action = "[Harris_currentCursorObject] spawn life_fnc_pulloutAction;";
		icon = "002_Tag.paa";
		text = "Pullout";
	};
	class checkLicense 
	{
		condition = "[(Harris_currentCursorObject isKindOf 'Land' || Harris_currentCursorObject isKindOf 'Air' || Harris_currentCursorObject isKindOf 'Sea'), (playerSide == west), (driver Harris_currentCursorObject != Harris_currentCursorObject)]";
		action = "[[driver Harris_currentCursorObject],""life_fnc_licenseCheck"",Harris_currentCursorObject,FALSE] spawn bis_fnc_mp;";
		icon = "002_Tag.paa";
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
			icon = "002_Tag.paa";
			text = "Push Boat";
		};
		class unFlip
		{
			condition = "[(Harris_currentCursorObject isKindOf 'Land' || Harris_currentCursorObject isKindOf 'Air')]";
			action = "Harris_currentCursorObject setPos [getPos Harris_currentCursorObject select 0, getPos Harris_currentCursorObject select 1, (getPos Harris_currentCursorObject select 2)+0.5];";
			icon = "002_Tag.paa";
			text = "Unflip";
		};
	};
	class PoliceAction
	{
		action = "";
		icon = "icon_handcuffs.paa";
		text = "Police Handle";
		class Unrestrain 
		{
			condition = "[(Harris_currentCursorObject getVariable 'restrained'), isPlayer Harris_currentCursorObject]";
			action = "[Harris_currentCursorObject] call life_fnc_unrestrain;";
			icon = "002_Tag.paa";
			text = "Unflip";
		};
		class Unescort 
		{
			condition = "[(Harris_currentCursorObject getVariable['Escorting',false], isPlayer Harris_currentCursorObject]";
			action = "[Harris_currentCursorObject] call life_fnc_stopEscorting;";
			icon = "002_Tag.paa";
			text = "Unescort";
		};
		class Escort 
		{
			condition = "[!(Harris_currentCursorObject getVariable['Escorting',false], isPlayer Harris_currentCursorObject, (Harris_currentCursorObject getVariable 'restrained')]";
			action = "[Harris_currentCursorObject] call life_fnc_escortAction;";
			icon = "002_Tag.paa";
			text = "EScort";
		};
		class PutInCar
		{
			condition = "[isPlayer Harris_currentCursorObject, (Harris_currentCursorObject distance nearestObject [Harris_currentCursorObject, 'Car'] < 5 || Harris_currentCursorObject distance nearestObject [Harris_currentCursorObject, 'Air'] < 5)]";
			action = "[Harris_currentCursorObject] call life_fnc_putInCar;";
			icon = "002_Tag.paa";
			text = "Put In Vehicle";
		};
		class PatDown
		{
			condition = "[isPlayer Harris_currentCursorObject,(Harris_currentCursorObject getVariable 'restrained')]";
			action = "[Harris_currentCursorObject] call life_fnc_putInCar;";
			icon = "002_Tag.paa";
			text = "Pat Down";
		};
		class Strip
		{
			condition = "[isPlayer Harris_currentCursorObject,(Harris_currentCursorObject getVariable 'restrained')]";
			action = "[Harris_currentCursorObject] call fnc_stripSearch;";
			icon = "002_Tag.paa";
			text = "Strip Search";
		};
	};
	class Licenses
	{
		action = "";
		icon = "icon_handcuffs.paa";
		text = "Legal";
		class checkLicenses 
		{
			condition = "[isPlayer Harris_currentCursorObject]";
			action = "[[player],""life_fnc_licenseCheck"",life_pInact_curTarget,FALSE] spawn bis_fnc_mp";
			icon = "002_Tag.paa";
			text = "Licenses";
		};
		class revokeLicenses 
		{
			condition = "[isPlayer Harris_currentCursorObject,(Harris_currentCursorObject getVariable 'restrained')]";
			action = "[[player],""life_fnc_licenseCheck"",life_pInact_curTarget,FALSE] spawn bis_fnc_mp";
			icon = "002_Tag.paa";
			text = "Revoke";
		};
		class Ticket
		{
			condition = "[isPlayer Harris_currentCursorObject]";
			action = "[Harris_currentCursorObject] call life_fnc_ticketAction";
			icon = "002_Tag.paa";
			text = "Revoke";
		};
		class testIntox
		{
			condition = "[isPlayer Harris_currentCursorObject]";
			action = "[Harris_currentCursorObject] call life_fnc_testIntox";
			icon = "002_Tag.paa";
			text = "Text Intox";
		};

		class Arrest
		{
			condition = "[(Harris_currentCursorObject getVariable 'restrained'), isPlayer Harris_currentCursorObject], (player distance getMarketPos 'Test' < 50)";
			action = "[Harris_currentCursorObject] call fnc_arrestmenu;";
			icon = "002_Tag.paa";
			text = "Arrest";
		};
	};
};
