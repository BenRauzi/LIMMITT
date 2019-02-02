/*
	Author: Ben Harris
	Description: Phone - Read Function Name
*/

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