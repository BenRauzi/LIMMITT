/*
	Author: Ben Harris
	Description: Phone - Read Function Name
*/

Harris_idEdited = {
	_number = (ctrlText 1400) select [count (ctrlText 1400) - 1 ,count (ctrlText 1400)];
	if (!(_number in ["1","2","3","4","5","6","7","8","9","0"]) || count (ctrlText 1400) > 10) exitWith {ctrlSetText [1400,(ctrlText 1400) select [0, count (ctrlText 1400) - 1]];};
};