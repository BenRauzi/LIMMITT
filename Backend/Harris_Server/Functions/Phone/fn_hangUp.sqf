/*
	Author: Ben Harris
	Description: Phone - Read Function Name
*/

Harris_hangUp = {

	if ("tf_anprc152" in (items player) && Harris_hadRadio) then {
		player unassignItem "Harris_CellPhone";
		player assignItem "tf_anprc152";
		Harris_hadRadio = nil;
	};

	[] remoteExecCall ["Harris_hungUp", Harris_Caller];
	
	[(call TFAR_fnc_activeSwRadio), 1, Harris_oldFrequency] call TFAR_fnc_SetChannelFrequency;
	Harris_inCurrentCall = nil;
	Harris_Calling = nil;

	if (!isNull (findDisplay 5020)) then {
		createDialog "Harris_phone_contacts";
	};
};