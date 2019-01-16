/*
	Author: Ben Harris
	Description: Opens Selling Shop
*/

Harris_openShop = {
	params["_ct"];

	createDialog "sell_shop"; 

	lbAdd [38402, "Your Inventory"];
	lbSetCurSel [38402,0];

	_shop = _ct getVariable "Harris_Shop";

	_array = nil;
	{
		if (_shop == _x select 0) then {
			_array = _x;
		};
	} forEach Harris_Shops;
	ctrlSetText [38401,_array select 1];
	if !(isNil "_array") then {
		for "_i" from 2 to count _array -1 do {
			if (((_array select _i) select 1) in items player) then {
				_index = lbAdd [38403, (_array select _i) select 0];
				lbSetData [38403, _index, (_array select _i) select 1];
			};
		};
		lbSetCurSel[38403,0];
		currentShop = _array;
	};
};