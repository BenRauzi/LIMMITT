/*
	Author: Ben Harris
	Description: Phone - Read Function Name
*/


Harris_bankEdited = {
	_number = (ctrlText 2702) select [count (ctrlText 2702) - 1 ,count (ctrlText 2702)];
	if (!(_number in ["1","2","3","4","5","6","7","8","9","0"]) || count (ctrlText 2702) > 10) exitWith {ctrlSetText [2702,(ctrlText 2702) select [0, count (ctrlText 2702) - 1]];};
};