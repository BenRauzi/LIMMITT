/*
	Author: Ben Harris
	Description: Phone - Read Function Name
*/


Harris_acceptCall = {

	Harris_oldFrequency = [(call TFAR_fnc_activeSwRadio), 1] call TFAR_fnc_GetChannelFrequency;
	if ("tf_anprc152" in (assignedItems player)) then {
		player unassignItem "tf_anprc152";
		
		if !("LIMMITT_Network_Phone" in items player) then {
			player addItem "LIMMITT_Network_Phone";
		};
			player assignItem "LIMMITT_Network_Phone";
		Harris_hadRadio = true;
	};

	[(call TFAR_fnc_activeSwRadio), 1, Harris_CallerFreq] call TFAR_fnc_SetChannelFrequency;

	[Harris_CallerFreq, (profileNamespace getVariable "yourNumber"), player] remoteExecCall ["Harris_acceptedCall", Harris_Caller];
	Harris_inCurrentCall = true;
	Harris_receivingCall = nil;

	[] call Harris_openPhoneInCall;
};