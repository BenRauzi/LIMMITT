/*
	Author: Ben Harris
	Description: Phone - Read Function Name
*/

Harris_openPhone = {
		if !(isNil "Harris_inCurrentCall") exitWith { [] call Harris_openPhoneInCall; };
		if !(isNil "Harris_receivingCall") exitWith { [] call Harris_openPhoneInCalling; };
		if !(isNil "Harris_Calling") exitWith { [] call Harris_openPhoneWhileCalling; };

		createDialog "Harris_Phone_mainScreen";
};