/*
	File: fn_buyLicense.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Called when purchasing a license. May need to be revised.
*/
private["_type"];
_type = _this select 3;

_price = [_type] call life_fnc_licensePrice;
_license = [_type,0] call life_fnc_licenseType;

if(LIMMITTCASH < _price) exitWith {["Error", format[localize "STR_NOTF_NE_1",[_price] call life_fnc_numberText,_license select 1],  "Failure"] call Harris_Notifications;};

LIMMITTCASH = LIMMITTCASH - _price;
["Success", format[localize "STR_NOTF_B_1", _license select 1,[_price] call life_fnc_numberText],  "Success"] call Harris_Notifications;
missionNamespace setVariable[(_license select 0),true];

if ((_license select 1) isEqualTo "Driver License") then {player setVariable ["LicenseDriver", true, true];};