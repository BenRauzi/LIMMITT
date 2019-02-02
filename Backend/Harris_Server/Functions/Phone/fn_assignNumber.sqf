/*
	Author: Ben Harris
	Description: Phone - Read Function Name
*/

Harris_assignNumber = {
	
	_values = [1,2,3,4,5,6,7,8,9];

	_number = [1,7,0,9,4,8];

	for "_i" from 1 to 4 do {
		_number pushback (selectRandom _values);
	};

	_phoneNumber = _number joinString "";

	_phoneNumber;
};
