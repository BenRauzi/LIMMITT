/*
	Author: Ben Harris
	Description: Phone - Read Function Name
*/

Harris_openSendMessageContact = {
	waitUntil {!isNull (findDisplay 5030)};
	_id = Harris_numberToCall;
	{
		if (_id == _x select 0) then {
			_id = _x select 1;
		};
	} forEach (profileNamespace getVariable ["contactList", []]);

	if (_id == Harris_numberToCall) then {
		ctrlSetText [1400, [Harris_numberToCall] call Harris_phoneNumberText];
	} else {
		ctrlSetText [1400, _id];
	};
};