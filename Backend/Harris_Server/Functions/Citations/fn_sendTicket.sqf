/*
	Author: Ben Harris
	Description: Gives the Ticket
*/

Harris_sendTicket = {

	_fields = [1004, 1402];
	{
		if ((ctrlText _x) isEqualTo "") exitWith { ["Error", "You must enter all fields", "Failure"] spawn Harris_Notifications; };
	} forEach _fields;

	if ((parseNumber (ctrlText 1401)) <= 0) exitWith {
		["Error", "You must enter a valid number", "Failure"] spawn Harris_Notifications;
	};

	_toSendArray = [Harris_first, Harris_second, Harris_middle, Harris_dob, "Jackson Country", (ctrlText 1004), lbData [2100, ( lbCurSel 2100 )], name player, ( ctrlText 1402 ), ( ctrlText 1400 ), (parseNumber (ctrlText 1401))];
	test =_toSendArray;
	[_toSendArray, player] remoteExecCall ["Harris_receiveTicket", Harris_ticketTarget];
};