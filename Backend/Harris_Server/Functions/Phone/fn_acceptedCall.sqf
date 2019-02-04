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
	if ("tf_anprc152" in (assignedItems player)) then {
		player unassignItem "tf_anprc152";
		Harris_hadRadio = true;
	};
	if !("LIMMITT_Network_Phone" in items player) then {
		player addItem "LIMMITT_Network_Phone";
	};
	if !("LIMMITT_Network_Phone" in assignedItems player) then {
		player assignItem "LIMMITT_Network_Phone";;
	};
	

	[(call TFAR_fnc_activeSwRadio), 1, _freq] call TFAR_fnc_SetChannelFrequency;
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