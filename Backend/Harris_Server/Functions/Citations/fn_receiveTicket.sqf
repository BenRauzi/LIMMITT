/*
	Author: Ben Harris
	Description: Receives Ticket Information
*/

Harris_receiveTicket = {
	params["_info", "_sender"];

	createDialog "Harris_getCitation";

	_first = _info select 0;
	_second = _info select 1;
	_middle = _info select 2;
	_dob = _info select 3;
	_country = _info select 4;
	_driverLicense = _info select 5;
	_courtRequired = _info select 6;
	_policeName	= _info select 7;
	_policeBadge = _info select 8;
	_violation = _info select 9;
	_price = _info select 10;

	ctrlSetText [1000, _first];
	ctrlSetText [1001, _second];
	ctrlSetText [1002, _middle];
	ctrlSetText [1003, _doc];
	ctrlSetText [1005, _country];
	ctrlSetText [1004, _driverLicense];
	ctrlSetText [2100, _courtRequired];
	ctrlSetText [1006, _policeName];
	ctrlSetText [1402, _policeBadge];
	ctrlSetText [1400, _violation];
	ctrlSetText [1401, str _price];

	Harris_priceToPay = _price;
	Harris_ticketSender = _sender;
};