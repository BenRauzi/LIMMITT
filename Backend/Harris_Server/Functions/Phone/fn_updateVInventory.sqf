/*
	Author: Ben Harris
	Description: Phone - Read Function Name
*/

Harris_updateVInventory = {
	waitUntil {!isNull (findDisplay 5001)};

	_dialog = findDisplay 5001;

	_inv = _dialog displayCtrl 2005;

	lbClear _inv;

	{
	_str = [_x] call life_fnc_varToStr;
	_shrt = [_x,1] call life_fnc_varHandle;
	_val = missionNameSpace getVariable _x;
	if(_val > 0) then
	{
		_inv lbAdd format["%1x - %2",_val,_str];
		_inv lbSetData [(lbSize _inv)-1,_shrt];
	};
	} foreach asdih_inv_items;

};