/*
	Author: Ben Harris
	Description: Phone - Read Function Name
*/

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
