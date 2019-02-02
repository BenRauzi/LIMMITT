/*
	Author: Ben Harris
	Description: Phone - Read Function Name
*/

Harris_contactEdited = {
	_number = _this select 0;
	if (!(_number in [2,3,4,5,6,7,8,9,11]) || count (ctrlText 1401) > 10) exitWith {ctrlSetText [1401,(ctrlText 1401) select [0, count (ctrlText 1401) - 1]];};
};