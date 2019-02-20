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
			["JD_Pot", "Harris_Pot"] spawn Harris_createFurniture;
		};
		case "Crafting Notes":
		{
			[] spawn Harris_addBluePrint;
		};
		case "Workbench":
		{
			["JD_Workbench", "Harris_WorkBench"] spawn Harris_createFurniture;
		};
		case "Oil Pump Kit":
		{
			["Land_oil_pump", "Harris_oilPump"] spawn Harris_createFurniture;
		};
	};
};

