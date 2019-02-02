/*
	Author: Ben Harris
	Description: Phone - Read Function Name
*/


Harris_deleteMessage = {
	params["_id"];


	_messages = Harris_messages;
	_newid = 0;
	if (_id == 0 && Harris_messagesPage != 1) then {
		_newid = (Harris_messagesPage - 1) * 6;
	} else {
		_newid = Harris_messagesPage + _id - 1;
	};
	_messages deleteAt (count Harris_messages - 1) - _newid;

	[false,1] call Harris_listmessages;
	Harris_messages = _messages
};