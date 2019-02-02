Harris_openPhone = {
		if !(isNil "Harris_inCurrentCall") exitWith { [] call Harris_openPhoneInCall; };
		if !(isNil "Harris_receivingCall") exitWith { [] call Harris_openPhoneInCalling; };
		if !(isNil "Harris_Calling") exitWith { [] call Harris_openPhoneWhileCalling; };

		createDialog "Harris_Phone_mainScreen";
};

Harris_phoneOpened = {
	waitUntil {!isNull (findDisplay 5000)};
	_id = profileNameSpace getVariable ["backGround",4];

	if (_id in [1,2,3,4,5,7,8,11]) then {
		ctrlSetText [1202, "Harris_Client\Phone\iconsw.paa"]
	};

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
	_yourNumber = profileNamespace getVariable "yourNumber";

	_t = false;
	{
		if ((_contacts select 0) select 0 == _yourNumber) then {
			_t = true;
		};
	} forEach _contacts;

	if !(_t) then {
		_contacts append [[_yourNumber, "Your Number"]];
	};

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

Harris_bankEdited = {
	_number = _this select 0;
	if (!(_number in [2,3,4,5,6,7,8,9,11]) || count (ctrlText 2702) > 10) exitWith {ctrlSetText [2702,(ctrlText 2702) select [0, count (ctrlText 2702) - 1]];};
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



			_caller = _x select 1;
			_message = _x select 0;

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


Harris_textPlayer = {
	if (isNull (findDisplay 5030) && isNull (findDisplay 5031)) then {
		Harris_numberToCall = ctrlText 1400;
	};
	
	_numberToText = Harris_numberToCall;
	_message = ctrlText 1401;
	if (count _message > 200) exitWith { ["Error", "You cannot send Messages that are longer than 200 Characters", "Failure"] spawn Harris_Notifications; };
	if (count _numberToText < 10) exitWith { ["Error", "Cell Phone numbers must be 10 characters", "Failure"] spawn Harris_Notifications; };

	_callerID = profileNameSpace getVariable "yourNumber";

	_messageToSend = [_message, _callerID];


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
missionNamespace setVariable ["uberDrivers", [], true];	

// Initclient

arr = missionNamespace getVariable ["cellNumbers", []];

if (isNil {profileNameSpace getVariable "yourNumber"}) then {
	profileNameSpace setVariable ["yourNumber", [] call Harris_assignNumber];
	saveProfileNamespace;
};
arr pushBackUnique (profileNameSpace getVariable "yourNumber");
missionNamespace setVariable ["cellNumbers", arr];

Harris_ringTones = 
[
	["Classic iPhone", "iphone_ringtone", 3],
	["Chimba", "chimba_ringtone", 3],
	["House of Cards", "hoc_ringtone", 3],
	["Marimba", "marimba2_ringtone", 3]
];

Harris_Messages = [];
Harris_callNumber = [];

Harris_twitterColours = 
[
	["Default", "default",true],
	["Red","Red",false],
	["Blue","Blue",false],
	["Gold","Gold",false],
	["Green","Green",false]
];

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



Harris_Dial = {
	params["_number"];

	Harris_callNumber pushBack _number;

	Harris_numberToCall = Harris_callNumber joinString "";		

	ctrlSetText [1600, Harris_numberToCall];
};

Harris_clearDial = {
	Harris_callNumber = [];

	Harris_numberToCall = "";
	ctrlSetText [1600, ""];
};



Harris_phoneCall = {
	if (!isNil "Harris_Calling") exitWith { ["Error","You are already in a call", "Failure"] spawn Harris_Notifications;};
	if (Harris_numberToCall isEqualTo (profileNameSpace getVariable "yourNumber")) exitWith { ["Failed", "You cannot call yourself", "Failure"] spawn Harris_Notifications; Harris_Calling = nil; };
	if !(Harris_numberToCall in (missionNamespace getVariable ["cellNumbers", []])) exitWith  { playSound "notinservice_tone"; Harris_Calling = nil; ["Invalid CallerID", "This Cell Phone Number is not in service", "Failure"] spawn Harris_Notifications; };

	closeDialog 0;
	Harris_Calling = true;

	
	//if (Harris_playerToCall getVariable "inCurrentCall") exitWith { ["Failure","This person is already in a call", "Failure"] spawn Harris_Notifications; Harris_Calling = nil; };
	//if (damage Harris_playerToCall >= 1) exitWith { [] spawn { for "_i" from 0 to 2 do { playSound "dialing_tone"; sleep 3;	}; playSound "unavailable_tone"; ["Invalid CallerID", "This Cell Phone Number is Unavailable", "Failure"] spawn Harris_Notifications; Harris_Calling = false; }; };


	_callFreq = str (round (random 10000));

	_cellNumber = profileNamespace getVariable "yourNumber";
	if (player getVariable "anonymousCalling") then {
		_cellNumber = "Anonymous Caller ID";
	};


	[_callFreq, _cellNumber, player, Harris_numberToCall] remoteExecCall ["Harris_receiveCall", 0];

	Harris_inCall = "Calling";
	[] spawn { 
		while {true} do 
		{
			if (Harris_inCall isEqualTo "Declined") exitWith { Harris_inCall = nil; };
			if (Harris_inCall isEqualTo "Accepted") exitWith { Harris_inCall = nil; };
			if (Harris_inCall isEqualTo "Cancelled") exitWith { Harris_inCall = nil; };
			if (Harris_inCall isEqualTo "Blocked") exitWith { sleep 3; playSound "unavailable_tone"; Harris_inCall = nil; };
			playSound "dialing_tone";
			sleep 3;
		};
	};

	[] call Harris_openPhoneWhileCalling;
};


Harris_receiveCall = {
	params["_callFreq", "_callerID", "_caller", "_id"];

	if (_id == profileNamespace getVariable "yourNumber") then {
	
		if !(isNil {profileNamespace getVariable 'blockingCalls'}) exitWith { [] remoteExecCall ["Harris_blockedCall", _caller]; };


		Harris_receivingCall = true;

		Harris_Caller = _caller;
		Harris_CallerID = _callerID;
		Harris_CallerFreq = _callFreq;


		{
			if (_callerID == _x select 0) then {
				_callerID = _x select 1;
			}
		} forEach (profileNamespace getVariable ["contactList", []]);

		systemChat format ["You are Getting a Call From %1", _callerID];
		

		//{
			//if (_ringTone isEqualTo (_x select 1)) then{
			//	_ringSleepTime = _x select 2;
			//};
		//} forEach Harris_ringTones;
		

		[] spawn {
			_ringTone = profileNamespace getVariable ["ringTone", "iphone_ringtone"];
			_ringSleepTime = 2.9;
			while {true} do
			{
		 		if (isNil "Harris_receivingCall") exitWith {};
		 		playSound _ringTone;
		 		sleep _ringSleepTime;
			};
		};
	};
};

Harris_blockedCall = {
	Harris_Calling = false;
	closeDialog 5011;
	Harris_inCall = "Blocked";
};



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


Harris_declineCall = {
	[] remoteExecCall ["HarriS_declinedCall", Harris_Caller];	
	Harris_receivingCall = nil;
};

Harris_declinedCall = {
	Harris_Calling = nil;
	closeDialog 5011;
	Harris_inCall = "Declined";
	["Call Declined", "You call has been Declined", "Info"] spawn Harris_Notifications;
};


Harris_acceptCall = {

	Harris_oldFrequency = [(call TFAR_fnc_activeSwRadio), 1] call TFAR_fnc_GetChannelFrequency;
	if ("tf_anprc152" in (assignedItems player)) then {
		player unassignItem "tf_anprc152";
		
		if !("RR_CellPhone" in items player) then {
			player addItem "RR_CellPhone";
		};
			player assignItem "RR_CellPhone";
		Harris_hadRadio = true;
	};

	[(call TFAR_fnc_activeSwRadio), 1, Harris_CallerFreq] call TFAR_fnc_SetChannelFrequency;

	[Harris_CallerFreq, (profileNamespace getVariable "yourNumber"), player] remoteExecCall ["Harris_acceptedCall", Harris_Caller];
	Harris_inCurrentCall = true;
	Harris_receivingCall = nil;

	[] call Harris_openPhoneInCall;
};


Harris_acceptedCall = {
	params["_freq", "_callerID", "_caller"];

	Harris_Calling = nil;
	closeDialog 5011;
	createDialog "Harris_Phone_inCall";
	Harris_Caller = _caller;
	Harris_CallerID = _callerID;

	Harris_inCall = "Accepted";

	Harris_oldFrequency = [(call TFAR_fnc_activeSwRadio), 1] call TFAR_fnc_GetChannelFrequency;
	if ("tf_anprc152" in (assignedItems player)) then {
		player unassignItem "tf_anprc152";
		
		if !("RR_CellPhone" in items player) then {
			player addItem "RR_CellPhone";
		};
		player assignItem "RR_CellPhone";
		Harris_hadRadio = true;
	};
	

	[(call TFAR_fnc_activeSwRadio), 1, _freq] call TFAR_fnc_SetChannelFrequency;
	Harris_inCurrentCall = true;

	

	_callerID = Harris_CallerID;
		{
			if (_callerID == _x select 0) then {
				_callerID = _x select 1;
			}
		} forEach (profileNamespace getVariable ["contactList", []]);

	if (_callerID == Harris_numberToCall &&  !(_callerID == "Anonymous Caller ID")) then {
		_callerID = [_callerID] call Harris_phoneNumberText;
	};

	ctrlSetText [1601, _callerID];

	["Call Accepted", "You call has been Accepted", true] spawn Harris_Notifications; 
};

Harris_openPhoneInCall = {
	createDialog "Harris_Phone_inCall";

	
	_callerID = Harris_CallerID;
		{
			if (_callerID == _x select 0) then {
				_callerID = _x select 1;
			}
		} forEach (profileNamespace getVariable ["contactList", []]);

	if (_callerID == Harris_numberToCall && !(_callerID == "Anonymous Caller ID")) then {
		_callerID = [_callerID] call Harris_phoneNumberText;
	};

	ctrlSetText [1601, _callerID];
};


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
};

Harris_hungUp = {
	
	if ("tf_anprc152" in (items player) && Harris_hadRadio) then {
		player unassignItem "RR_CellPhone";
		player assignItem "tf_anprc152";
		Harris_hadRadio = nil;
	};

	[(call TFAR_fnc_activeSwRadio), 1, Harris_oldFrequency] call TFAR_fnc_SetChannelFrequency;
	["Hung Up", "You have been hung up on", "Info"] spawn Harris_Notifications;
	Harris_inCurrentCall = nil;
	Harris_Calling = nil;

	if (!isNull (findDisplay 5020)) then {
		closeDialog 5020;
	};
};




Harris_cancelCall = {
	Harris_inCall = "Cancelled";
	Harris_Calling = nil;
	[Harris_numberToCall] remoteExecCall ["Harris_canceledCall", 0];
};


Harris_canceledCall = {
	params["_id"];

	if (_id == profileNamespace getVariable "yourNumber") then {
		Harris_receivingCall = nil;

		if (!isNull (findDisplay 5010)) then { closeDialog 5010; };
	};
};

Harris_openSettings = {
	waitUntil {!isNull (findDisplay 5008)};
	settingsLoad = true;

	{
		_index = lbAdd [2100, _x select 0];
		lbSetData [2100, _index, _x select 1];

		if (_x select 1 isEqualTo (profileNamespace getVariable ["ringTone", "iphone_ringtone"])) then {
			lbSetCurSel [2100, _forEachIndex];
		};
	} forEach Harris_ringtones;

	if (profileNamespace getVariable ["anonCalling", false]) then {
		ctrlShow [1203, true];
		ctrlShow [1604, false];
		ctrlShow [1205, false];
		ctrlShow [1605, true];
	} else {
		ctrlShow [1203, false];
		ctrlShow [1604, true];
		ctrlShow [1205, true];
		ctrlShow [1605, false];
	};

	if (profileNamespace getVariable ["blockingCalls", false]) then {
		ctrlShow [1202, true];
		ctrlShow [1606, false];
		ctrlShow [1204, false];
		ctrlShow [1607, true];
	} else {
		ctrlShow [1202, false];
		ctrlShow [1606, true];
		ctrlShow [1204, true];
		ctrlShow [1607, false];
	};

	{
		if (_x select 2) then {
			_index = lbAdd [2101, _x select 0];
			lbSetData [2101, _index, _x select 1];
		};
		if (_x select 1 == profileNamespace getVariable ["colour", "Default"]) then {
			lbSetCurSel [2101, _forEachIndex];
		};
	} forEach Harris_twitterColours;

	if (lbCurSel 2101 == -1) then {
		profileNamespace setVariable ["colour", "Default"];
		lbSetCurSel [2101, 0];
	};
};

Harris_changeRingTone = {
	params["_index"];

	_ringTone = lbData [2100, _index];
	
	if (isNil "settingsLoad") then {
		playSound _ringTone;
	} else {
		settingsLoad = nil;
	};	

	if (_ringTone != profileNamespace getVariable ["ringTone", ""]) then {
		profileNamespace setVariable ["ringTone", _ringTone];
		saveProfileNamespace;	
	};
};

Harris_switchAnonCalling = {
	params["_type"];

	if (_type) then {
		profileNamespace setVariable ["anonCalling", true];
		ctrlShow [1203, true];
		ctrlShow [1604, false];
		ctrlShow [1205, false];
		ctrlShow [1605, true];
	} else {
		profileNamespace setVariable ["anonCalling", false];
		ctrlShow [1203, false];
		ctrlShow [1604, true];
		ctrlShow [1205, true];
		ctrlShow [1605, false];
	};
};


Harris_switchBlockCalling = {
	params["_type"];

	if (_type) then {
		profileNamespace setVariable ["blockingCalls", true];
		ctrlShow [1202, true];
		ctrlShow [1606, false];
		ctrlShow [1204, false];
		ctrlShow [1607, true];
	} else {
		profileNamespace setVariable ["blockingCalls", nil];
		ctrlShow [1202, false];
		ctrlShow [1606, true];
		ctrlShow [1204, true];
		ctrlShow [1607, false];
	};
};

Harris_updateVInventory = {
	waitUntil {!isNull (findDisplay 5001)};

	_dialog = findDisplay 5001;

	_inv = _dialog displayCtrl 2005;

	lbClear _inv;

	{
	_str = [_x] call life_fnc_varToStr;
	_shrt = [_x,1] call life_fnc_varHandle;
	_val = missionNameSpace getVariable _x;
	if(_val > 0) then
	{
		_inv lbAdd format["%1x - %2",_val,_str];
		_inv lbSetData [(lbSize _inv)-1,_shrt];
	};
	} foreach asdih_inv_items;

};

Harris_updateKeys = {
	waitUntil {!isNull (findDisplay 5003)};

	_dialog = findDisplay 5003;
	_vehicles = _dialog displayCtrl 2701;
	lbClear _vehicles;
	_plist = _dialog displayCtrl 2702;
	lbClear _plist;
	_near_units = [];

	{ if(player distance _x < 20) then {_near_units set [count _near_units,_x];};} foreach playableUnits;

	for "_i" from 0 to (count life_vehicles)-1 do
	{
		_veh = life_vehicles select _i;
		if(!isNull _veh && alive _veh) then
		{
			_color = [(typeOf _veh),(_veh getVariable "Life_VEH_color")] call life_fnc_vehicleColorStr;
			_text = format["(%1)",_color];
			if(_text == "()") then
			{
				_text = "";
			};
			
			_name = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName");
			_pic = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "picture");
			_vehicles lbAdd format["%1 %3 - [Distance: %2m]",_name,round(player distance _veh),_text];
			if(_pic != "pictureStaticObject") then {
				_vehicles lbSetPicture [(lbSize _vehicles)-1,_pic];
			};
			_vehicles lbSetData [(lbSize _vehicles)-1,str(_i)];
		};
	};

	{
		if(!isNull _x && alive _x && player distance _x < 20 && _x != player) then
		{
			_plist lbAdd format["%1",_x getVariable["realname",name _x]];
			_plist lbSetData [(lbSize _plist)-1,str(_x)];
		};
	} foreach _near_units;

	if(((lbSize _vehicles)-1) == -1) then
	{
		_vehicles lbAdd "You don't own any vehicles";
		_vehicles lbSetData [(lbSize _vehicles)-1,str(ObjNull)];
	};
};


Harris_updateBanking = {
	waitUntil {!isNull (findDisplay 5015)};

	_dialog = findDisplay 5015;
	_units = _dialog displayCtrl 2703;

	ctrlSetText [1400,format["$%1",[gm_memecash] call life_fnc_numberText]];
	ctrlSetText [1401,format["$%1",[gm_memecash] call life_fnc_numberText]];
	ctrlSetText [1402,format["$%1",[LIMMITTCASH] call life_fnc_numberText]];

	_type = "Civ";
	{
		if(alive _x) then
		{
			switch (side _x) do
			{
				case west: {_type = "Cop"};
				case civilian: {_type = "Civ"};
				case independent: {_type = "EMS"};
			};
			_units lbAdd format["%1 (%2)",_x getVariable["realname",name _x],_type];
			_units lbSetData [(lbSize _units)-1,str(_x)];
		};
	} foreach playableUnits;

	lbSetCurSel [2703, 0];
};

Harris_updateLicenses = {
	waitUntil {!isNull (findDisplay 5022)};

	_dialog = findDisplay 5022;
	_licenses = [];
	_side = str (playerSide);
	{
		if((_x select 1) == _side) then
		{
			_str = [_x select 0] call life_fnc_varToStr;
			_val = missionNamespace getVariable (_x select 0);
			if(_val) then
			{
				_licenses pushBack _str;
			};
		};
	} foreach life_licenses;

	if(str _licenses == "[]") then
	{
		_licenses = ["No Licenses"];
	};
	
	{
		lbAdd [2702, _x];
	} forEach _licenses;
};

Harris_useItemPhone= {
	[] call life_fnc_useItem;
};

Harris_removeItemPhone = {
	private["_data","_obj","_pos","_ind"];
	disableSerialization;
	_data = lbData[2005,(lbCurSel 2005)];
	if(_data == "") exitWith { ["Error", "You didn't select anything to remove.", "Failure"] call Harris_Notifications;};
	_ind = [_data,life_illegal_items] call fnc_index;
	if(_ind != -1 && ([west,getPos player,100] call life_fnc_nearUnits)) exitWith {titleText["This is an illegal item and cops are near by, you cannot dispose of the evidence","PLAIN"]};
	if(player != vehicle player) exitWith {titleText["You cannot remove an item when you are in a vehicle.","PLAIN"]};
	if(!([false,_data,1] call life_fnc_handleInv)) exitWith { ["Error", "Couldn't remove that much of that item, maybe you don't have that amount?", "Failure"] call Harris_Notifications;};
	_type = [_data,0] call life_fnc_varHandle;
	_type = [_type] call life_fnc_varToStr;
	 ["Success", format["You have successfully removed %1 %2 from your inventory.",1, _type], "Success"] call Harris_Notifications;
		
	[] call Harris_updateVInventory;	
};

Harris_giveKeyPhone = {
	private["_dialog","_list","_plist","_sel","_vehicle","_owners","_index","_unit","_uid"];
	disableSerialization;

	_dialog = findDisplay 5003;
	_list = _dialog displayCtrl 2701;
	_plist = _dialog displayCtrl 2702;

	_sel = lbCurSel _list;
	_vehicle = _list lbData _sel;
	_vehicle = life_vehicles select parseNumber(_vehicle);

	_sel = lbCurSel _plist;
	_unit = _plist lbData _sel;
	_unit = call compile format["%1", _unit];
	if(isNull _unit OR isNil "_unit") exitWith {}; 

	_uid = getPlayerUID _unit;
	_owners = _vehicle getVariable "vehicle_info_owners";
	_index = [_uid,_owners] call fnc_index;
	if(_index == -1) then 
	{
		_owners set[count _owners,[_uid,_unit getVariable["realname",name _unit]]];
		_vehicle setVariable["vehicle_info_owners",_owners,true];
	};

	["Success",  format["You have given %1 keys to your %2",_unit getVariable["realname",name _unit],typeOf _vehicle], "Success"] call Harris_Notifications;
	[[_vehicle,_unit,profileName], "clientGetKey",_unit,false] spawn bis_fnc_mp;
};

Harris_keyDropPhone = {
	private["_dialog","_list","_sel","_vehicle","_impounded","_owners","_index","_index2","_i"];
	disableSerialization;

	_dialog = findDisplay 5003;
	_list = _dialog displayCtrl 2701;
	_sel = lbCurSel _list;
	if(_sel == -1) exitWith {["Error",  "No Data Selected", "Failure"] call Harris_Notifications;};
	_index = (parseNumber(_list lbData _sel));
	_vehicle = life_vehicles select _index;
	if(_vehicle isKindOf "House_F") exitWith {["Error",  "You can't remove the keys to your house!", "Failure"] call Harris_Notifications;};
	_owners = _vehicle getVariable "vehicle_info_owners";

	_index2 = [(getPlayerUID player),_owners] call fnc_index;
	life_vehicles = life_vehicles - [_vehicle];
	_owners set[_index,-1];
	_owners = _owners - [-1];
	_vehicle setVariable["vehicle_info_owners",_owners,true];

	[] spawn Harris_updateKeys;
};

Harris_uberOpened = {
	waitUntil {!isNull (findDisplay 5027)};
	lbClear 1500;

	{
		_index = lbAdd[1500,name (_x select 0)];
		lbSetData [1500, _index, str _forEachIndex];
	} forEach (missionNamespace getVariable "uberDrivers");

	ctrlSetText[1602, "N/A"];
	ctrlSetText[1603, "None"];

	if (!isNil "isUber") then {
		ctrlShow [1203, true];
		ctrlShow [1604, false];
		ctrlShow [1205, false];
		ctrlShow [1605, true];
	} else {
		ctrlShow [1203, false];
		ctrlShow [1604, true];
		ctrlShow [1205, true];
		ctrlShow [1605, false];
	};

	if (count (missionNamespace getVariable 'uberDrivers') == 0) exitWith {};
	lbSetCurSel [1500,0];

	
};

Harris_onUberLbChanged = {
	params["_index"];
	_uberID = ((missionNamespace getVariable "uberDrivers") select _index);
	_uber = _uberID select 0;
	Harris_numberToCall = _uberID select 1;
	

	ctrlSetText[1602, str (player distance _uber)];
	_vehicle = vehicle _uber;
	if (_vehicle == _uber) then {
		_vehicle = "None";
	} else {
		_vehicle = [typeOf _vehicle] call Harris_getVehicleName;
	};

	ctrlSetText[1603, _vehicle];
};

Harris_onDutyUber = {
	_ubers = missionNamespace getVariable "uberDrivers";
	_ubers pushBack [player, profileNamespace getVariable "yourNumber"];
	missionNamespace setVariable ["uberDrivers", _ubers, true];	
	isUber = true;

	[] call Harris_uberOpened;
};

Harris_offDutyUber = {
	_ubers = missionNamespace getVariable "uberDrivers";
	_ubers deleteAt (_ubers find [player, profileNamespace getVariable "yourNumber"]);
	missionNamespace setVariable ["uberDrivers", _ubers, true];	
	isUber = nil;

	[] call Harris_uberOpened;
};


Harris_openSendMessageUber = {
	waitUntil {!isNull (findDisplay 5031)};

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

Harris_getVehicleName = {
	params ["_class"];

	_return = getText(configFile >> "CfgVehicles" >> _class >> "displayName");

	_return;
};

Harris_informationOpened = {
	waitUntil {!isNull (findDisplay 5032)};
	ctrlSetText [1600, format["Current Police: %1", west countside allPlayers]];
	ctrlSetText [1601, format["Current Paramedics: %1", independent countside allPlayers]];
	ctrlSetText [1602, format["Current Civilians: %1", civilian countside allPlayers]];
};