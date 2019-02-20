/*
	Author: Nicholas Jo'Foski
	Description: Server Init function
*/

LIMMITT_ServerInit ={
	missionNameSpace setVariable ["firstLogin", false, true];
	LIMMITT_Servers = ["LIMMITT Network Official Server | Custom ArmA 3 Life | ts.limmitt-network.co.uk"];
	publicVariable "LIMMITT_Servers";
	setTimeMultiplier 25;
	
	[] spawn { // Stop bank vault randomly opening
		bank = (nearestObjects [[3606.93,3069.6,0.00143814],["Land_CommonwealthBank"],100]) select 0;
		while {alive bank} do {
			waitUntil {bank animationPhase "Vault_Door" > 0 && !(bank getVariable ['vaultUnlocked', false])};
			bank animate ["Vault_Door",0]; 
			bank setVariable ['vaultUnlocked', false, true];
			missionNamespace setVariable ["inRobbery", false, true];	
		};
	};
		
	missionNamespace setVariable ["cellNumbers", [], true];
	missionNamespace setVariable ["uberDrivers", [], true];
	addMissionEventHandler ["HandleDisconnect",{ [] spawn SOCK_fnc_syncSilent; deleteVehicle (_this select 0); }];
};