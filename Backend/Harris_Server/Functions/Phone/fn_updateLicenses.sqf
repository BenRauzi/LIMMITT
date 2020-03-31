/*
	Author: Ben Harris
	Description: Phone - Read Function Name
*/


Harris_updateLicenses = {
	waitUntil {!isNull (findDisplay 5022)};

	_dialog = findDisplay 5022;
	_licenses = []

	_licenseList = player getVariable "licenses";
	{
			_licenseArray = _x select 1;
			_licenseCompiled = (call compile _licenseArray) select 0;
			if (_licenseCompiled in _licenseList) then {
				_licenses pushBack (_x select 0);
			};
	} foreach HRP_dmvLicenses;	

	if(str _licenses == "[]") then
	{
		_licenses = ["No Licenses"];
	};
	
	{
		lbAdd [2702, _x];
	} forEach _licenses;
};