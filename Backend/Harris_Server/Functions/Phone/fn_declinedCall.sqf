/*
	Author: Ben Harris
	Description: Phone - Read Function Name
*/

Harris_declinedCall = {
	Harris_Calling = nil;
	closeDialog 5011;
	Harris_inCall = "Declined";
	["Call Declined", "You call has been Declined", "Info"] spawn Harris_Notifications;
};