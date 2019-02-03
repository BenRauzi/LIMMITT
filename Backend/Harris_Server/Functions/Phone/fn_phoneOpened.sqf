/*
	Author: Ben Harris
	Description: Phone - Read Function Name
*/

Harris_phoneOpened = {
	waitUntil {!isNull (findDisplay 5000)};
	_id = profileNameSpace getVariable ["backGround",4];

	if (_id in [1,2,3,4,5,7,8,11]) then {
		ctrlSetText [1202, "Harris_Client\Phone\iconsw.paa"]
	};

	_background = format ["\Harris_Client\Phone\background%1.paa", _id];
	ctrlSetText [7565, _backGround];
	
};