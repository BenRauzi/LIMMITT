/*
	Author: Ben Harris
	Description: Checks your items again after sale -- Could be more efficient but I can't be bothered
*/
Harris_refreshShop = {
	_array = currentShop;
	lbClear 38403;
	if !(isNil "_array") then {
		for "_i" from 2 to count _array -1 do {
			if (((_array select _i) select 1) in items player) then {
				_index = lbAdd [38403, (_array select _i) select 0];
				lbSetData [38403, _index, (_array select _i) select 1];
			};
		};
		lbSetCurSel[38403,0];
	};
};