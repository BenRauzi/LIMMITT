/*
	Author: Ben Harris
	Description: Phone - Read Function Name
*/

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