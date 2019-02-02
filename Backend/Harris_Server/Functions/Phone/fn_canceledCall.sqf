/*
	Author: Ben Harris
	Description: Phone - Read Function Name
*/


Harris_canceledCall = {
	params["_id"];

	if (_id == profileNamespace getVariable "yourNumber") then {
		Harris_receivingCall = nil;

		if (!isNull (findDisplay 5010)) then { closeDialog 5010; };
	};
};