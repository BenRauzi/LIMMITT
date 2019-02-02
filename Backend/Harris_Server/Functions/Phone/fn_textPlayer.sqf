/*
	Author: Ben Harris
	Description: Phone - Read Function Name
*/

Harris_textPlayer = {
	if (isNull (findDisplay 5030) && isNull (findDisplay 5031)) then {
		Harris_numberToCall = ctrlText 1400;
	};
	
	_numberToText = Harris_numberToCall;
	_message = ctrlText 1401;
	if (count _message > 200) exitWith { ["Error", "You cannot send Messages that are longer than 200 Characters", "Failure"] spawn Harris_Notifications; };
	if (count _numberToText < 10) exitWith { ["Error", "Cell Phone numbers must be 10 characters", "Failure"] spawn Harris_Notifications; };

	_callerID = profileNameSpace getVariable "yourNumber";

	_messageToSend = [_message, _callerID];


	if !(Harris_numberToCall in (missionNamespace getVariable ["cellNumbers", []])) exitWith  { playSound "notinservice_tone"; ["Invalid CallerID", "This Cell Phone Number is not in service", "Failure"] spawn Harris_Notifications; };
	[_messageToSend, _callerID, Harris_numberToCall] remoteExecCall ["Harris_receiveText", 0];
};