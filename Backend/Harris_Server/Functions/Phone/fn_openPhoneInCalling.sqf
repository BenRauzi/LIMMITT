/*
	Author: Ben Harris
	Description: Phone - Read Function Name
*/


Harris_openPhoneInCalling = {
	if (!isNull (findDisplay 5010)) exitWith {};
	createDialog "Harris_Phone_inComingCall";

	_callerID = Harris_numberToCall;
		{
			if (_callerID == _x select 0) then {
				_callerID = _x select 1;
			}
		} forEach (profileNamespace getVariable ["contactList", []]);

	if (_callerID == Harris_numberToCall && !(_callerID == "Anonymous Caller ID")) then {
		_callerID = [_callerID] call Harris_phoneNumberText;
	};

	ctrlSetText [1400, _callerID];
};