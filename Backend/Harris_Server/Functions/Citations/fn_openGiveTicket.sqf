/*
	Author: Ben Harris
	Description: Opens the 'Give Ticket' Menu
*/

Harris_openGiveTicket = {
	params["_ct"];

	Harris_ticketTarget = _ct;

	createDialog "Harris_giveCitation";

	Harris_first = ((name _ct) splitString " ") select 0;
	Harris_second = ((name _ct) splitString " ") select 1;
	Harris_middle = "I";
	Harris_dob = "Unknown";



	ctrlSetText [1000, Harris_first];
	ctrlSetText [1001, Harris_second];
	ctrlSetText [1002, Harris_middle];
	ctrlSetText [1003, Harris_dob];
	ctrlSetText [1005, "Jackson County"];

	if (_ct getVariable ["LicenseDriver", false]) then {
		ctrlSetText [1004, "Yes"];
	} else  {
		ctrlSetText [1004, "No"];
	};

	_toAdd = ["True", "False"];

	{
		_index = lbAdd [2100, _x];
		lbSetData [2100, _index, _x];
	} forEach _toAdd;

	lbSetCurSel [2100, 0];

	ctrlSetText [1006, name player];

};