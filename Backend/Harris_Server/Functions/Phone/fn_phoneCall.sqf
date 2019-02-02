/*
	Author: Ben Harris
	Description: Phone - Read Function Name
*/

Harris_phoneCall = {
	if (!isNil "Harris_Calling") exitWith { ["Error","You are already in a call", "Failure"] spawn Harris_Notifications;};
	if (Harris_numberToCall isEqualTo (profileNameSpace getVariable "yourNumber")) exitWith { ["Failed", "You cannot call yourself", "Failure"] spawn Harris_Notifications; Harris_Calling = nil; };
	if !(Harris_numberToCall in (missionNamespace getVariable ["cellNumbers", []])) exitWith  { playSound "notinservice_tone"; Harris_Calling = nil; ["Invalid CallerID", "This Cell Phone Number is not in service", "Failure"] spawn Harris_Notifications; };

	closeDialog 0;
	
	Harris_Calling = true;

	
	//if (Harris_playerToCall getVariable "inCurrentCall") exitWith { ["Failure","This person is already in a call", "Failure"] spawn Harris_Notifications; Harris_Calling = nil; };
	//if (damage Harris_playerToCall >= 1) exitWith { [] spawn { for "_i" from 0 to 2 do { playSound "dialing_tone"; sleep 3;	}; playSound "unavailable_tone"; ["Invalid CallerID", "This Cell Phone Number is Unavailable", "Failure"] spawn Harris_Notifications; Harris_Calling = false; }; };


	_callFreq = str (round (random 10000));

	_cellNumber = profileNamespace getVariable "yourNumber";
	if (player getVariable "anonymousCalling") then {
		_cellNumber = "Anonymous Caller ID";
	};


	[_callFreq, _cellNumber, player, Harris_numberToCall] remoteExecCall ["Harris_receiveCall", 0];

	Harris_inCall = "Calling";
	[] spawn { 
		while {true} do 
		{
			if (Harris_inCall isEqualTo "Declined") exitWith { Harris_inCall = nil; };
			if (Harris_inCall isEqualTo "Accepted") exitWith { Harris_inCall = nil; };
			if (Harris_inCall isEqualTo "Cancelled") exitWith { Harris_inCall = nil; };
			if (Harris_inCall isEqualTo "Blocked") exitWith { sleep 3; playSound "unavailable_tone"; Harris_inCall = nil; };
			playSound "dialing_tone";
			sleep 3;
		};
	};

	[] call Harris_openPhoneWhileCalling;
};