/*
	Author: Ben Harris
	Description: Phone - Read Function Name
*/

Harris_hungUp = {
	
	{ // If the player HAD a radio then replace their phone with the radio
		if (_x find "tf_anprc152" >= 0 && Harris_hadRadio) then {
			// Get the phone
			_phone = "";
			{
				if (_x find "LIMMITT_Network_Phone" >= 0) then {
					_phone = _x;
				};
			} forEach assignedItems player;
			// Swap the radio/phone
			player unassignItem _phone;
			player assignItem _x;
			Harris_hadRadio = nil;
		};
	} forEach items player;

	/* !! OLD AND DOESNT WORK !!
	if ("tf_anprc152" in (items player) && Harris_hadRadio) then {
		player unassignItem "LIMMITT_Network_Phone";
		player assignItem "tf_anprc152";
		Harris_hadRadio = nil;
	};
	*/

	[(call TFAR_fnc_activeSwRadio), 1, Harris_oldFrequency] call TFAR_fnc_SetChannelFrequency;
	["Hung Up", "You have been hung up on", "Info"] spawn Harris_Notifications;
	Harris_inCurrentCall = nil;
	Harris_Calling = nil;

	if (!isNull (findDisplay 5020)) then {
		createDialog "Harris_phone_contacts";
	};
};