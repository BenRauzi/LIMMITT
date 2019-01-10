/*
	Author: Ben Harris
	Description: Uses Item in Inventory & Config
*/
Harris_useItemPhysical = {

	_value = lbText [_this select 0, _this select 1];

	switch (_value) do
	{
		case "Plant Pot":
		{
			//[] spawn HRP_fnc_plantPot;
		};
		case "Crafting Notes":
		{
			[] spawn Harris_addBluePrint;
		};
		case "Workbench":
		{
			["A3L_Workbench"] spawn Harris_spawnFurniture;
		};
	};
};