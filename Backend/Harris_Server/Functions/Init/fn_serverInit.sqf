/*
	Author: Nicholas Jo'Foski
	Description: Server Init function
*/

LIMMITT_ServerInit ={
	missionNameSpace setVariable ["firstLogin", false, true];
	LIMMITT_Servers = ["LIMMITT Network Official Server | Custom ArmA 3 Life | ts.limmitt-network.co.uk"];
	publicVariable "LIMMITT_Servers";
	setTimeMultiplier 25;
	
	[] spawn {
		while {true} do 
		{
			_bank = (nearestObjects [[8581.29,6624.8,0.00143909],["Land_CommonwealthBank"],100]) select 0;
			_bank animate ["Vault_Door",0]; 
			_bank setVariable ['vaultUnlocked', false, true];
			missionNamespace setVariable ["inRobbery", false, true];
			sleep 50;
		};
	};

		
	missionNamespace setVariable ["cellNumbers", [], true];
	missionNamespace setVariable ["uberDrivers", [], true];
};