_cop = _this select 0;

_hasDriverLicense = false;

if (license_civ_driver isEqualTo true) then {
	_hasDriverLicense = true;
} else {
	_hasDriverLicense = false;	
};

diag_log (str _hasDriverLicense);


[_hasDriverLicense, player] remoteExecCall ["life_fnc_computerLicenseList",_cop];
