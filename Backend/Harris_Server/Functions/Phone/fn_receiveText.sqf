/*
	Author: Ben Harris
	Description: Phone - Read Function Name
*/


Harris_receiveText = {
	params["_message", "_callerID", "_target"];

	if (profileNamespace getVariable ["yourNumber", nil] == _target) then {
		Harris_Messages pushBack _message;
		_callerID = [_callerID] call Harris_phoneNumberText;
		systemChat format ["You received a new SMS from %1", _callerID];
		playSound "message1_tone";	
	};
};