/*
	Author: Ben Harris
	Description: Phone - Read Function Name
*/


Harris_viewMessage = {
	params["_id"];

	_newid = 0;
	if (_id == 0 && Harris_messagesPage != 1) then {
		_newid = (Harris_messagesPage - 1) * 6;
	} else {
		_newid = Harris_messagesPage + _id - 1;
	};

	createDialog "Harris_phone_readMessage";

	_message = Harris_messages select (count Harris_messages - 1) - _newid;

	_cellNumber = _message select 0;
	_messageBody = _message select 1;
	
	Harris_numberToCall = _cellNumber;

	{
		if (_cellNumber == _x select 0) then {
			_cellNumber = _x select 1;
		}
	} forEach (profileNamespace getVariable ["contactList", []]);


	if (_cellNumber == Harris_numberToCall) then {
		ctrlSetText [1400, [Harris_numberToCall] call Harris_phoneNumberText];
	} else {
		ctrlSetText [1400, _cellNumber];
	};


	ctrlSetText [1401, _messageBody];
};