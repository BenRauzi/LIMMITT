/*
	Author: Ben Harris
	Description: Opens Crafting (/Refining) Menu
*/

Harris_openCraftingMenu = {
	params["_type", "_ct"];

	if (isNil "_type") then {
		createDialog "Harris_Crafting";
		craftTypes = Harris_craftTypes;
		craftType = 0;
	} else {
		createDialog "Harris_Refine";
		if !(isNil "_ct") then {
			craftTypes = ["Refine Oil"];
			craftType = 1;
		} else {
			craftTypes = Harris_smeltTypes;
			craftType = 1;
		}
	};

	_bluePrints = player getVariable ["bluePrints",[]];

	{
		_index = lbAdd [2100, _x];
		lbSetData [2100, _index, _x];
	} forEach craftTypes;
	craftTypes = nil;

	lbSetCurSel [2100, 0];
};