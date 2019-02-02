/*
	Author: Ben Harris
	Description: Phone - Read Function Name
*/


Harris_cancelCall = {
	Harris_inCall = "Cancelled";
	Harris_Calling = nil;
	[Harris_numberToCall] remoteExecCall ["Harris_canceledCall", 0];
};