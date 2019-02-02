/*
	Author: Ben Harris
	Description: Phone - Read Function Name
*/

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