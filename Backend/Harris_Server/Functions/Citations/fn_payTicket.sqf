/*
	Author: Ben Harris
	Description: Pays / Doesn't pay the ticket 
*/

Harris_payTicket = {

	_check = (LIMMITTCASH >= Harris_priceToPay);

	if !(_check) exitWith { 
		closeDialog 0;
		["Error", "You cannot afford this ticket", "Failure"] spawn Harris_Notifications;
		["Error", "This person cannot afford the ticket", "Failure"] remoteExec ["Harris_Notifications", Harris_ticketSender];
	};

	LIMMITTCASH = LIMMITTCASH - Harris_priceToPay;

	_name = format ["%1 has paid the ticket", name player];

	["Success", _name, "Success"] remoteExec ["Harris_Notifications", Harris_ticketSender];

	closeDialog 0;
};