/*
	Author: Ben Harris
	Description: Checks if the bank has been robbed recently
*/
Harris_checkBank = {
	params["_bank"]; 

	_bank setVariable ["recentlyRobbed", true];

	sleep (Harris_recentRobberyTime * 60);

	_bank setVariable ["recentlyRobbed", false];
	Foski_banksCashObj setVariable ["Foski_cashLeft", Foski_startupBankCash, true];

	missionNamespace setVariable ["inRobbery", false, true];
};