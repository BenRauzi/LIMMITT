/*
	Author: Ben Harris
	Description: Read (On Combobox sel changed)
*/

Harris_onCraftSelectionLbChanged = {
	_data = lbData [2100, ( lbCurSel 2100 )];

	lbClear 1500;

	if (craftType == 0) then {
		craftAbleItems = Harris_craftAbleItems;
	} else {
		craftAbleItems = Harris_smeltAbleItems;
	};
	craftType = nil;
	_bluePrints = player getVariable "bluePrints";
	{
		_bluePrint = _x select 2;
		_select = _x select 4;

		if (_bluePrint != "" && _bluePrint in _bluePrints && _select == _data) then {
			
			_index = lbAdd [1500, _x select 0];
			lbSetData [1500, _index, str _x];
		} else {
			if (_bluePrint == "" && _select == _data) then {
				_index = lbAdd [1500, _x select 0];
				lbSetData [1500, _index, str _x];
			};
		};
	} forEach craftAbleItems;
	craftAbleItems = nil;
};