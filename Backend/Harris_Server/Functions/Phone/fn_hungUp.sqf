/*
	Author: Ben Harris
	Description: Phone - Read Function Name
*/

Harris_hungUp = {
	
	if ("tf_anprc152" in (items player) && Harris_hadRadio) then {
		player unassignItem "LIMMITT_Network_Phone";
		player assignItem "tf_anprc152";
		Harris_hadRadio = nil;
	};

	[(call TFAR_fnc_activeSwRadio), 1, Harris_oldFrequency] call TFAR_fnc_SetChannelFrequency;
	["Hung Up", "You have been hung up on", "Info"] spawn Harris_Notifications;
	Harris_inCurrentCall = nil;
	Harris_Calling = nil;

	if (!isNull (findDisplay 5020)) then {
		closeDialog 5020;
	};
};