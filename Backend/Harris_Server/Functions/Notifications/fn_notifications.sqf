/*
	Author: Ben Harris
	Description: Notification System
	Usage: ["Title", "Text", "Type"] call Harris_Notifications;

	Types:
		Info
		General
		Success
		Failure
		Warning

	For Config Init:
		Harris_Messages = 0;
		message1_active = false;
		message2_active = false;
		message3_active = false;
		message4_active = false;
		message5_active = false;
*/

Harris_Notifications = {
	params["_Title","_Body","_Type"];

	_text = "Harris_Client\Notifications\NotifsGrey.paa";
	switch(_type) do
	{
		case "Info":
		{
			_text = "Harris_Client\Notifications\NotifsBlue.paa";
		};
		case "General":
		{
			_text = "Harris_Client\Notifications\NotifsGrey.paa";
		};
		case "Success":
		{
			_text = "Harris_Client\Notifications\NotifsGreen.paa";
		};
		case "Failure":
		{
			_text = "Harris_Client\Notifications\NotifsRed.paa";
		};
		case "Warning":
		{
			_text = "Harris_Client\Notifications\NotifsOrange.paa";
		};
		default
		{
			_text = "Harris_Client\Notifications\NotifsGrey.paa";
		};
	};

	switch (true) do
	{
		case !(message1_active):
		{
			 Harris_Messages = 1;
		};
		case !(message2_active):
		{
			Harris_Messages = 2;
		};
		case !(message3_active):
		{
			Harris_Messages = 3;
		};
		case !(message4_active):
		{
			Harris_Messages = 4;
		};
		case !(message5_active):
		{
			Harris_Messages = 5;
		};
		default
		{
			Harris_Messages = 0;
		};
	};

	_messages = Harris_Messages;

	_typeCtrl = "";
	_titleCtrl = "";
	_bodyCtrl = "";
	switch(Harris_Messages) do
	{
		case 1:
		{
			5 cutRsc ["Harris_Notifications1","PLAIN"];
			_display1 = uiNameSpace getVariable ["Harris_Notifications1",displayNull];
			_typeCtrl = _display1 displayCtrl 1500; 
			_titleCtrl = _display1 displayCtrl 1001; 
			_bodyCtrl = _display1 displayCtrl 1002; 
			message1_active = true;
		};
		case 2:
		{
			6 cutRsc ["Harris_Notifications2","PLAIN"];
			_display2 = uiNameSpace getVariable ["Harris_Notifications2",displayNull];
			_typeCtrl = _display2 displayCtrl 2500; 
			_titleCtrl = _display2 displayCtrl 2001; 
			_bodyCtrl = _display2 displayCtrl 2002; 
			message2_active = true;
		};
		case 3:
		{
			7 cutRsc ["Harris_Notifications3","PLAIN"];
			_display3 = uiNameSpace getVariable ["Harris_Notifications3",displayNull];
			_typeCtrl = _display3 displayCtrl 3500; 
			_titleCtrl = _display3 displayCtrl 3001; 
			_bodyCtrl = _display3 displayCtrl 3002; 
			message3_active = true;
		};
		case 4:
		{
			8 cutRsc ["Harris_Notifications4","PLAIN"];
			_display4 = uiNameSpace getVariable ["Harris_Notifications4",displayNull];
			_typeCtrl = _display4 displayCtrl 4500; 
			_titleCtrl = _display4 displayCtrl 4001; 
			_bodyCtrl = _display4 displayCtrl 4002; 
			message4_active = true;
		};
		case 5: 
		{
			9 cutRsc ["Harris_Notifications5","PLAIN"];
			_display5 = uiNameSpace getVariable ["Harris_Notifications5",displayNull];
			_typeCtrl = _display5 displayCtrl 5500; 
			_titleCtrl = _display5 displayCtrl 5001; 
			_bodyCtrl = _display5 displayCtrl 5002; 
			message5_active = true;
		};
	};

	_typeCtrl ctrlSetText _text;
	_titleCtrl ctrlSetText _title;
	_bodyCtrl ctrlSetText _body;


	_typeCtrl ctrlSetPosition [1.5,ctrlPosition _typeCtrl select 1];
	_titleCtrl ctrlSetPosition [1.5+0.05,ctrlPosition _titleCtrl select 1];
	_bodyCtrl ctrlSetPosition [1.5+0.05,ctrlPosition _bodyCtrl select 1];

	_typeCtrl ctrlCommit 0;
	_titleCtrl ctrlCommit 0;
	_bodyCtrl ctrlCommit 0;

	_typeCtrl ctrlSetPosition [1.3,ctrlPosition _typeCtrl select 1];
	_titleCtrl ctrlSetPosition [1.3+0.05,ctrlPosition _titleCtrl select 1];
	_bodyCtrl ctrlSetPosition [1.3+0.05,ctrlPosition _bodyCtrl select 1];

	_typeCtrl ctrlCommit 0.5;
	_titleCtrl ctrlCommit 0.5;
	_bodyCtrl ctrlCommit 0.5;

	player say "hint";

	[_messages] spawn {
		sleep 5;

		call compile(format["message%1_active = false",_this select 0]);

		Harris_Messages = Harris_Messages - 1;

	};
};
