/*
	Author: Ben Harris
	Description: Controls the Twitter System

	["Ben Harris","test"] call Harris_addMessage;
	[Harris_TwitterMessages,0] call Harris_updateTwitter

	Harris_twitterUI = uiNameSpace getVariable ["Harris_TwitterFeed",displayNull];
	_text = Harris_twitterUI displayCtrl 1100;
	_text ctrlSetStructuredText parseText "<t size='1' color='#22ffd9' align='left' font='PuristaBold'>test: </t><br/><t size='1' font='PuristaBold' align='left' color='#bab6b7'>test</t> <br/>"
*/


Harris_openTwitterType = {
	if !(player getVariable "Harris_TwitterEnabled") exitWith {}; // Added by Nicholas Jo'Foski to stop players restrained sending messages
	createDialog "Harris_twitterType";	
	_listBox = ((findDisplay 5002) displayCtrl 1400);


	_listBox ctrlSetPosition [-0.705,0.82+0.04*(count Harris_TwitterMessages-1)];
	_listBox ctrlCommit 0;
};
