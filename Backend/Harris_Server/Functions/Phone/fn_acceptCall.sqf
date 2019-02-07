/*
	Author: Ben Harris
	Description: Phone - Read Function Name
*/

Harris_acceptCall = {

	Harris_oldFrequency = [(call TFAR_fnc_activeSwRadio), 1] call TFAR_fnc_GetChannelFrequency;
	{ // Check if the player has a radio
		if (_x find "tf_anprc152" >= 0) then {
			player unassignItem _x;
			Harris_hadRadio = true;
		};
	} forEach assignedItems player;

	/* !! OLD AND DOESNT WORK !!
	if ("tf_anprc152" in (assignedItems player)) then {
		player unassignItem "tf_anprc152";
		Harris_hadRadio = true;
	};
	*/

	// Assign the phone (radio)
	_hasPhone = false;
	_phone = "";
	{ // Check if the player has a phone in their inventory
		if (_x find "LIMMITT_Network_Phone" >= 0) then {
			_phone = _x;
			_hasPhone = true;
		};
	} forEach (items player) + (assignedItems player);

	// If the player doesn't have a phone, add one
	if !(_hasPhone) then {
		player addItem "LIMMITT_Network_Phone";
		{
			if (_x find "LIMMITT_Network_Phone" >= 0) then {
				_phone = _x;
			};
		} forEach items player;
	};

	// Check if the phone is assigned, if not assign it
	if !(_phone in assignedItems player) then {
		player assignItem _phone;
	};

	/* !! OLD AND DOESNT WORK !!
	if !("LIMMITT_Network_Phone" in items player) then {
		player addItem "LIMMITT_Network_Phone";
	};
	if !("LIMMITT_Network_Phone" in assignedItems player) then {
		player assignItem "LIMMITT_Network_Phone";;
	};
	*/		
	
	waitUntil {[] call TFAR_fnc_haveSWRadio};
	[(call TFAR_fnc_activeSwRadio), 1, Harris_CallerFreq] call TFAR_fnc_SetChannelFrequency;

	[Harris_CallerFreq, (profileNamespace getVariable "yourNumber"), player] remoteExec ["Harris_acceptedCall", Harris_Caller];
	Harris_inCurrentCall = true;
	Harris_receivingCall = nil;

	[] call Harris_openPhoneInCall;
};