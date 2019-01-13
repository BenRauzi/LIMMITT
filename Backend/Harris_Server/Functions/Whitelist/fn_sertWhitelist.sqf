/*
	Author: Ben Harris
	Description: Whitelists for SERT
*/

Harris_sertWhitelist = {
	_licenses = Harris_toWhitelist getVariable "licenses";

	_licenses pushBack "SERT_License";

	Harris_toWhitelist setVariable ["licenses", _licenses, true];
};