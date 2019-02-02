/*
	Author: Ben Harris
	Description: Phone - Read Function Name
*/


Harris_bankEdited = {
	_number = _this select 0;
	if (!(_number in [2,3,4,5,6,7,8,9,11]) || count (ctrlText 2702) > 10) exitWith {ctrlSetText [2702,(ctrlText 2702) select [0, count (ctrlText 2702) - 1]];};
};