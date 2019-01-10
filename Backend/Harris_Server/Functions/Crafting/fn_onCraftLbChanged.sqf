/*
	Author: Ben Harris
	Description: Displays required crafting materials
*/
Harris_onCraftLbChanged = {

	Harris_Data = lbData [1500, ( lbCurSel 1500 )];

	Harris_Data = call compile Harris_Data;

	_neededMaterials = Harris_data select 3;

	_count = false;

	lbClear 1501;
	{
		_toAdd = format ["%1 x%2", _x select 2, _x select 1];
		lbAdd [1501, _toAdd];
	} forEach _neededMaterials;
	
};