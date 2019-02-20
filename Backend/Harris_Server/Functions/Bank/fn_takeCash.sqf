/*
	Author: Nicholas Jo'Foski
	Description: Take dirty cash from the bank
	Usage: [bankCashObject] spawn Foski_takeCash;

	For Config Init:
		Foski_copsNeeded2RobBank = 5; // Number of cops needed online to rob the bank
		Foski_dirtyCash = "Harris_dirtyCash"; // Classname of the dirty cash physical inventory item
		Foski_dyedDirtyCash = "Harris_dyedDirtyCash"; // Classname of the dyed dirty cash physical inventory item
		Foski_startupBankCash = 10; // Total number of times cash can be taken from the bank
		
		missionNamespace setVariable ["Foski_bankObj",nearestObject [player, "Land_CommonwealthBank"], true]; // BANK BUILDING OBJECT
		missionNamespace setVariable ["Foski_banksCashObj",nearestObject [player, "A3L_MoneyPile"], true]; // BANK CASH OBJECT

		Foski_bankObj animate ["Vault_Door",0]; 
		Foski_bankObj setVariable ['vaultUnlocked', false, true];
		Foski_banksCashObj setVariable ["Foski_cashLeft", Foski_startupBankCash, true];

*/

Foski_takeCash = {
	params [["_cashObj", objNull]];
	// Important checks
	if ((!isNil {player getVariable "Harris_unconscious"}) || (player getVariable ["Foski_Surrender",false]) || (player getVariable ["Foski_Restrained",false]) || player distance _cashObj > 5) exitWith { // Check if player is unconscious, surrendering or restrained
		["Error", "Something has happened which is stopping you from stealing the cash.", "Failure"] spawn Harris_Notifications;
	};
	if ((isNull Foski_bankObj) || !(Foski_bankObj getVariable ['vaultUnlocked', false])) exitWith { // Check if bank vault is currently locked
		["Error", "The bank vault is currently locked, meaning you cannot steal any cash.", "Failure"] spawn Harris_Notifications;
	};
	if ((west countSide playableUnits) < Foski_copsNeeded2RobBank) exitWith { // Check if enough cops are online
		["Error", "There are not enough on-duty law enforcement to steal cash.", "Failure"] spawn Harris_Notifications;
	};
	if (animationState player == "AinvPknlMstpSnonWnonDnon_medic_1") exitWith { // Check if the player is currently grabbing any cash
		["Error", "You are already in the process of grabbing cash.", "Failure"] spawn Harris_Notifications;
	};
	if ((isNull _cashObj) || (_cashObj != Foski_banksCashObj) || ((_cashObj getVariable ["Foski_cashLeft", 0]) <= 0)) exitWith { // Check if the cash object still exists and still has money
		["Error", "There is no more cash to steal, it has all been taken.", "Failure"] spawn Harris_Notifications;
	};

	// Start money taking process
	_time = 10 + round(random 10);
	["Bank Robbery", "You have started to steal some cash, this may take a few seconds.", "Info"] spawn Harris_Notifications;
	_cashObj setVariable ["Foski_cashLeft", ((_cashObj getVariable ["Foski_cashLeft", 0]) - 1), true];
	while {_time > 0} do {
		// Important checks... again
		if ((!isNil {player getVariable "Harris_unconscious"}) || (player getVariable ["Foski_Surrender",false]) || (player getVariable ["Foski_Restrained",false]) || player distance _cashObj > 5) exitWith { // Check if player is unconscious, surrendering or restrained
			["Error", "Something has happened which is stopping you from stealing the cash.", "Failure"] spawn Harris_Notifications;
			_cashObj setVariable ["Foski_cashLeft", ((_cashObj getVariable ["Foski_cashLeft", 0]) + 1), true];
			player playMoveNow "";
		};

		// Control Time
		_time = _time - 1;

		// Handle Animation
		if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then { // Check if the player is playing the animation
			player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
		};

		// Handle item spawning
		if (_time <= 0) exitWith {
			_cashAmnt = round(random [1,3,5]);
			if !(player canAdd [Foski_dirtyCash, _cashAmnt]) exitWith {
				["Error", format["You do not have enough room to take %1 peice(s) of dirty cash.",_cashAmnt], "Failure"] call Harris_Notifications;
				_cashObj setVariable ["Foski_cashLeft", ((_cashObj getVariable ["Foski_cashLeft", 0]) + 1), true];
			};
			for "_i" from 1 to _cashAmnt do {
				player addItem Foski_dirtyCash;
			};
			["Success", format["You have managed to steal %1 peice(s) of dirty cash.",_cashAmnt], "Success"] call Harris_Notifications;
			player playMoveNow "";
		};
		sleep 1;
	};
};