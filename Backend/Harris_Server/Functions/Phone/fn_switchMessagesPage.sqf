/*
	Author: Ben Harris
	Description: Phone - Read Function Name
*/

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