/*
	Author: Ben Harris
	Description: Phone - Read Function Name
*/

Harris_receiveCall = {
	params["_callFreq", "_callerID", "_caller", "_id"];

	if (_id == profileNamespace getVariable "yourNumber") then {
	
		if !(isNil {profileNamespace getVariable 'blockingCalls'}) exitWith { [] remoteExecCall ["Harris_blockedCall", _caller]; };


		Harris_receivingCall = true;

		Harris_Caller = _caller;
		Harris_CallerID = _callerID;
		Harris_CallerFreq = _callFreq;


		{
			if (_callerID == _x select 0) then {
				_callerID = _x select 1;
			}
		} forEach (profileNamespace getVariable ["contactList", []]);

		systemChat format ["You are Getting a Call From %1", _callerID];
		

		//{
			//if (_ringTone isEqualTo (_x select 1)) then{
			//	_ringSleepTime = _x select 2;
			//};
		//} forEach Harris_ringTones;
		

		[] spawn {
			_ringTone = profileNamespace getVariable ["ringTone", "iphone_ringtone"];
			_ringSleepTime = 2.9;
			while {true} do
			{
		 		if (isNil "Harris_receivingCall") exitWith {};
		 		playSound _ringTone;
		 		sleep _ringSleepTime;
			};
		};
	};
};