/*
	Author: Ben Harris
	Description: Phone - Read Function Name
*/

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