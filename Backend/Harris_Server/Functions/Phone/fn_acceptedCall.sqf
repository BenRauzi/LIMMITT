/*
	Author: Ben Harris
	Description: Phone - Read Function Name
*/

Harris_acceptedCall = {
	params["_freq", "_callerID", "_caller"];

	Harris_Calling = nil;
	closeDialog 5011;
	createDialog "Harris_Phone_inCall";
	Harris_Caller = _caller;
	Harris_CallerID = _callerID;

	Harris_inCall = "Accepted";

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
	
	if (isNil ("Harris_hadRadio") || Harris_hadRadio) then {
		waitUntil {{_x find "LIMMITT_Network_Phone" >= 0} forEach assignedItems player};
		[(call TFAR_fnc_activeSwRadio), 1, _freq] call TFAR_fnc_SetChannelFrequency;
	} else {
		[(call TFAR_fnc_activeSwRadio), 1, _freq] call TFAR_fnc_SetChannelFrequency;
	};

	Harris_inCurrentCall = true;

	

	_callerID = Harris_CallerID;
		{
			if (_callerID == _x select 0) then {
				_callerID = _x select 1;
			}
		} forEach (profileNamespace getVariable ["contactList", []]);

	if (_callerID == Harris_numberToCall &&  !(_callerID == "Anonymous Caller ID")) then {
		_callerID = [_callerID] call Harris_phoneNumberText;
	};

	ctrlSetText [1601, _callerID];

	["Call Accepted", "You call has been Accepted", true] spawn Harris_Notifications; 
};