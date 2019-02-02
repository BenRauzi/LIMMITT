/*
	Author: Ben Harris
	Description: Phone - Read Function Name
*/

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