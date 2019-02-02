/*
	Author: Ben Harris
	Description: Phone - Read Function Name
*/

Harris_openPhoneWhileCalling = {
	if (!isNull (findDisplay 5011)) exitWith {};
	createDialog "Harris_Phone_outgoingCall";

	_callerID = Harris_numberToCall;
		{
			if (_callerID == _x select 0) then {
				_callerID = _x select 1;
			}
		} forEach (profileNamespace getVariable ["contactList", []]);

	if (_callerID == Harris_numberToCall) then {
		_number = [_callerID] call Harris_phoneNumberText;
	};
	ctrlSetText [1400, _number];
};