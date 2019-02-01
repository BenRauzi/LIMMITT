
profileNameSpace setVariable ["contactList",[["Test","Ben Harris"]]];
Harris_Messages = [["Test", "123456789012345"],["Test", "12345678901"],["Test2", "12345678901"],["Test3", "12345678901"], ["Test4", "12345678901"], ["Test5", "12345678901"], ["Test6", "12345678901"]];


Harris_openPhone = {
		createDialog "Harris_Phone_mainScreen";

		_id = profileNameSpace getVariable ["backGround",4];

		_background = format ["\Harris_Client\Phone\background%1.paa", _id];
		ctrlSetText [7565, _backGround];
};

Harris_setBackground = {
	params["_id"];

	profileNamespace setVariable ["background", _id];
	saveProfileNamespace;	
};

Harris_phoneNumberText  = {
	params["_number"];

	_number1 = _number select [0,1];
	_number2 = _number select [1,3];
	_number3 = _number select [4,3];
	_number4 = _number select [7,3];

	_yourNumber = _number1 + " " + _number2 + " " + _number3 + " " + _number4;

	_yourNumber;
};

Harris_listContacts = {
	params["_type", "_page"];

	if (_type == 1) then {
		createDialog "Harris_Phone_contacts";

	};

	waitUntil {!isNull (findDisplay 5004)};
	_buttons = [2322,2323,2324,2325,2326,2327];
	_img = [2001,2002,2003,2004,2006,2005];
	_buttons2 = [8001,8002,8003,8004,8005,8006];
	_buttons3 = [2603,2604,2605,2606,2607,2608];
	_textBoxes = [7778,7779,7780,7781,7782,7783];
	_textBoxes2 = [7001,7002,7003,7004,7005,7006];

	_vars = ["","","","","",""];

	_contacts = profileNameSpace getVariable ["contactList",[]];
	_yourNumber = profileNamespace getVariable ["yourNumber", 1];

	//_yourNumber = [_yourNumber] call Harris_phoneNumberText;

	//ctrlSetText [7777, "\n" + _yourNumber];

	Harris_contactsList = [];
	Harris_contactsVar = call compile (str _contacts);

	{
		if (count Harris_contactsVar < 6) then {
			Harris_contactsVar pushBack _x;
		};
		if (count Harris_contactsVar > 6 && count Harris_contactsVar < 12) then {
			Harris_contactsVar pushBack _x;
		};
		if (count Harris_contactsVar > 12 && count Harris_contactsVar < 18) then {
			Harris_contactsVar pushBack _x;
		};
	} forEach _vars;
;
	if (count _contacts < 7) then {
		ctrlShow [1610, false];
	} else {
		ctrlShow [1610, true];
	};

	{
		{
			ctrlShow [_x, false];
		} forEach _x;
	} forEach [_buttons, _img, _buttons2, _textBoxes, _buttons3, _textBoxes2];

	if (isNil "_page") then {
		_page = Harris_contactsPage;
	};
	switch (_page) do
	{
		case 1:
		{
			Harris_contactsPage1 = [(Harris_contactsVar select 0), (Harris_contactsVar select 1), (Harris_contactsVar select 2), (Harris_contactsVar select 3), (Harris_contactsVar select 4), Harris_contactsVar select 5];
			page = Harris_contactsPage1;
			Harris_contactsPage = 1;
			ctrlShow [1609, false];

		};
		case 2:
		{
			Harris_contactsPage2 = [(Harris_contactsVar select 6), (Harris_contactsVar select 7), (Harris_contactsVar select 8), (Harris_contactsVar select 9), (Harris_contactsVar select 10), (Harris_contactsVar select 11)];
			page = Harris_contactsPage2;
			Harris_contactsPage = 2;
		};
		case 3:
		{
			Harris_contactsPage3 = [(Harris_contactsVar select 12), (Harris_contactsVar select 13), (Harris_contactsVar select 14), (Harris_contactsVar select 15), (Harris_contactsVar select 16), (Harris_contactsVar select 17)];
			page = Harris_contactsPage3;
			Harris_contactsPage = 3;
		};
	};

	{
		if (_x in page && count _x > 0) then {
			Harris_contactsList pushBack _x;
		};
	} foreach Harris_contactsVar;

	_count = 0;
	Harris_contactDetails = [];
	{
		if (count _x > 0) then {
			_ID = _buttons select _count;
			_ID2 = _img select _count;
			_ID3 = _buttons2 select _count;
			_ID4 = _textBoxes select _count;
			_ID5 = _textBoxes2 select _count;


			ctrlShow [_ID, true];
			ctrlShow [_ID2, true];
			ctrlShow [_ID3, true];
			ctrlShow [_ID4, true];
			ctrlShow [_ID5, true];

			_name = _x select 1;

			_number = [_x select 0] call Harris_phoneNumberText;
			ctrlSetText [_ID4, _name];
			ctrlSetText [_ID5, _number];
			_count = _count + 1;

		};
	} foreach Harris_contactsList;
};


Harris_deleteContact = {
	params["_id"];


	_contacts = profileNamespace getVariable "contactList";
	_newid = 0;
	if (_id == 0 && Harris_contactsPage != 1) then {
		_newid = (Harris_contactsPage - 1) * 6;
	} else {
		_newid = Harris_contactsPage + _id - 1;
	};
	_contacts deleteAt _newid;
	[2,1] call Harris_listContacts;
	profileNamespace setVariable ["contactList", _contacts];
	saveProfileNamespace;
};


Harris_switchContactPage = {
	params["_type"];
		_contacts = profileNamespace getVariable "contactList";
		if (_type == 1) then {
			Harris_contactsPage = Harris_contactsPage + 1;
			if (Harris_contactsPage >= 2) then {
				ctrlShow [1609, true];
				ctrlShow [7325, true];
			};
			if (Harris_contactsPage == 3) then {
				ctrlShow [1610, false];
				ctrlShow [7324, false];
			};
			if (Harris_contactsPage == 2 && count _contacts > 6 && count _contacts < 12) then {
				ctrlShow [1610, false];
				ctrlShow [7324, false];
			};
		} else {
			Harris_contactsPage = Harris_contactsPage - 1;
			if (Harris_contactsPage == 1) then {
				ctrlShow [1609, false];
				ctrlShow [7325, false];
			};

			if (Harris_contactsPage == 1 && count _contacts > 6) then {
				ctrlShow [1610, true];
				ctrlShow [7324, true];
			};

			if (Harris_contactsPage == 2 && count _contacts > 12) then {
				ctrlShow [1610, true];
				ctrlShow [7324, true];
			};
		};

		[0, Harris_contactsPage] call Harris_listContacts;	
};

Harris_addContact = {

	_name = ctrlText 1400;
	_number = ctrlText 1401;

	if (count _number != 10) exitWith { ["Error", "All Phone numbers must be 10 Characters", "Failure"] spawn Harris_notifications; };
	if (count _name < 3) exitWith { ["Error", "Names must be at least 3 Characters long", "Failure"] spawn Harris_notifications; };

	_toPush = [_number, _name];

	_contacts = profileNamespace getVariable ["contactList",[]];

	if (_toPush in _contacts) exitWith { ["Error", "You already have an identical contact", "Failure"] spawn Harris_notifications;};

	_contacts pushBack _toPush;

	profileNamespace setVariable ["contactList", _contacts];
	saveProfileNamespace;

	closeDialog 0;
	[1,1] call Harris_listContacts;
};

Harris_contactEdited = {
	_number = _this select 0;
	if (!(_number in [2,3,4,5,6,7,8,9,11]) || count (ctrlText 1401) > 10) exitWith {ctrlSetText [1401,(ctrlText 1401) select [0, count (ctrlText 1401) - 1]];};
};

Harris_idEdited = {
	_number = _this select 0;
	if (!(_number in [2,3,4,5,6,7,8,9,11]) || count (ctrlText 1400) > 10) exitWith {ctrlSetText [1400,(ctrlText 1400) select [0, count (ctrlText 1400) - 1]];};
};


Harris_viewContact = {
	params["_id"];

	createDialog "Harris_phone_contactDetails";

	_contact = Harris_contactsList select _id;

	_cellNumber = _contact select 0;
	_contactName = _contact select 1;
	
	Harris_numberToCall = _cellNumber;


	_number = [_cellNumber] call Harris_phoneNumberText;

	ctrlSetText [1400, _contactName];
	ctrlSetText [1401, _number];
};


Harris_listMessages = {
	params["_type","_page"];

	 if (_type) then {
		createDialog "Harris_Phone_messageList";
	};

	waitUntil {!isNull (findDisplay 5007)};

	_buttons = [1602,1603,1604,1605,1606,1607];
	_img = [2001,2002,2003,2004,2006,2005];
	_buttons2 = [8001,8002,8003,8004,8005,8006];
	_buttons3 = [2603,2604,2605,2606,2607,2608];
	_textBoxes = [7778,7779,7780,7781,7782,7783];
	_textBoxes2 = [7001,7002,7003,7004,7005,7006];

	_vars = ["", "", "", "", "", ""];
	Harris_messageList = [];
	Harris_messagesVar = [];
	{
		Harris_messagesVar pushBack _x
	} foreach Harris_Messages;
	reverse Harris_messagesVar;
	{
		if (count Harris_messagesVar < 6) then {
			Harris_messagesVar pushBack _x;
		};
		if (count Harris_messagesVar > 6 && count Harris_messagesVar < 12) then {
			Harris_messagesVar pushBack _x;
		};
		if (count Harris_messagesVar > 11 && count Harris_messagesVar < 16) then {
			Harris_messagesVar pushBack _x;
		};
	} forEach _vars;
	
	if (count Harris_Messages < 6) then {
		ctrlShow [1610, false];
	};

	{
		{
			ctrlShow [_x, false];
		} forEach _x;
	} forEach [_buttons, _img, _buttons2, _textBoxes, _buttons3, _textBoxes2];


	if (isNil "_page") then {
		_page = Harris_messagesPage;
	};
	switch (_page) do
	{
		case 1:
		{
			Harris_messagesPage1 = [(Harris_messagesVar select 0), (Harris_messagesVar select 1), (Harris_messagesVar select 2), (Harris_messagesVar select 3), (Harris_messagesVar select 4), (Harris_messagesVar select 5)];
			page = Harris_messagesPage1;
			Harris_messagesPage = 1;
			ctrlShow [1609, false];

		};
		case 2:
		{
			Harris_messagesPage2 = [(Harris_messagesVar select 6), (Harris_messagesVar select 7), (Harris_messagesVar select 8), (Harris_messagesVar select 9), (Harris_messagesVar select 10), (Harris_messagesVar select 11)];
			page = Harris_messagesPage2;
			Harris_messagesPage = 2;
		};
		case 3:
		{
			Harris_messagesPage3 = [(Harris_messagesVar select 12), (Harris_messagesVar select 13), (Harris_messagesVar select 14), (Harris_messagesVar select 15), (Harris_messagesVar select 16), (Harris_messagesVar select 17)];
			page = Harris_messagesPage3;
			Harris_messagesPage = 3;
		};
	};

	{
		if (_x in page && count _x > 0) then {
			Harris_messageList pushBack _x;
		};
	} foreach Harris_messagesVar;

	_count = 0;
	Harris_readMessages = [];

	{
	 if (count _x > 0) then {
			_id = _buttons select _count;
			_id2 = _img select _count;
			_id3 = _buttons2 select _count;
			_id4 = _textBoxes select _count;
			_id5 = _textBoxes2 select _count;
			_id6 = _buttons3 select _count;
	
			ctrlShow [_id, true];
			ctrlShow [_id2, true];
			ctrlShow [_id3, true];
			ctrlShow [_id4, true];
			ctrlShow [_id5, true];
			ctrlShow [_id6, true];



			_caller = _x select 0;
			_message = _x select 1;

			if (count _message < 14) then {
				_message = _message + "...";
			} else {
				_message = (_message select [0,13]) + "...";
			};

			{
				if (_caller == _x select 0) then {
					_caller = _x select 1;
				}
			} forEach (profileNamespace getVariable ["contactList", []]);

			ctrlSetText [_ID4, _caller];
			ctrlSetText [_ID5, _message];

			_toRead = [_caller, _x, _caller];
			Harris_readMessages pushBack _toRead;


			_count = _count + 1;
		};
	} forEach Harris_messageList;
};


Harris_switchMessagesPage = {
	params["_type"];
		_messages = Harris_messages;
		if (_type == 1) then {
			Harris_messagesPage = Harris_messagesPage + 1;
			if (Harris_messagesPage >= 2) then {
				ctrlShow [1609, true];
				ctrlShow [7325, true];
			};
			if (Harris_messagesPage == 3) then {
				ctrlShow [1610, false];
				ctrlShow [7324, false];
			};
			if (Harris_messagesPage == 2 && count _messages > 6 && count _messages < 12) then {
				ctrlShow [1610, false];
				ctrlShow [7324, false];
			};
		} else {
			Harris_messagesPage = Harris_messagesPage - 1;
			if (Harris_messagesPage == 1) then {
				ctrlShow [1609, false];
				ctrlShow [7325, false];
			};

			if (Harris_messagesPage == 1 && count _messages > 6) then {
				ctrlShow [1610, true];
				ctrlShow [7324, true];
			};

			if (Harris_messagesPage == 2 && count _messages > 12) then {
				ctrlShow [1610, true];
				ctrlShow [7324, true];
			};
		};

		[false, Harris_messagesPage] call Harris_listMessages;	
};


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

Harris_openSendMessageContact = {
	waitUntil {!isNull (findDisplay 5013)};

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


Harris_textPlayer = {
	if !(isNull (findDisplay 5013)) then {
		Harris_numberToCall = ctrlText 1400;
	};
	
	_numberToText = Harris_numberToCall;
	_message = ctrlText 1401;
	if (count _message > 200) exitWith { ["Error", "You cannot send Messages that are longer than 200 Characters", "Failure"] spawn Harris_Notifications; };
	if (count _numberToText < 10) exitWith { ["Error", "Cell Phone numbers must be 10 characters", "Failure"] spawn Harris_Notifications; };

	_callerID = profileNameSpace getVariable "yourNumber";

	_messageToSend = [_message, _callerID];
	Harris_playerToCall = false;


	if !(Harris_numberToCall in (missionNamespace getVariable ["cellNumbers", []])) exitWith  { playSound "notinservice_tone"; ["Invalid CallerID", "This Cell Phone Number is not in service", "Failure"] spawn Harris_Notifications; };
	[_messageToSend, _callerID, Harris_numberToCall] remoteExecCall ["Harris_receiveText", 0];
};

Harris_assignNumber = {
	
	_values = [1,2,3,4,5,6,7,8,9];

	_number = [1,7,0,9,4,8];

	for "_i" from 1 to 4 do {
		_number pushback (selectRandom _values);
	};

	_phoneNumber = _number joinString "";

	_phoneNumber;
};



// InitServer

missionNamespace setVariable ["cellNumbers", []];

// Initclient

arr = missionNamespace getVariable ["cellNumbers", []];

if (isNil {profileNameSpace getVariable "yourNumber"}) then {
	profileNameSpace setVariable ["yourNumber", [] call Harris_assignNumber];
	saveProfileNamespace;
};
arr pushBackUnique (profileNameSpace getVariable "yourNumber");
missionNamespace setVariable ["cellNumbers", arr];

//

Harris_receiveText = {
	params["_message", "_callerID", "_target"];

	if (profileNamespace getVariable ["yourNumber", nil] == _target) then {
		Harris_Messages pushBack _message;
		_callerID = [_callerID] call Harris_phoneNumberText;
		systemChat format ["You received a new SMS from %1", _callerID];
		playSound "message1_tone";	
	};
};

