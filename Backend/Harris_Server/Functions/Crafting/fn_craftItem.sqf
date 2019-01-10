/*
	Author: Ben Harris
	Description: Initialises crafting object. Wow I was bad at scripting when I made this file in 2016 :/
*/


Harris_craftItem = {
	if (Harris_inProcessing) exitWith { ["Error", "You cannot smelt and craft at the same time!", true] spawn Harris_Notifications; };
	_data = lbData [1500, ( lbCurSel 1500 )];
	_data = call compile _data;	

	_requiredItems = _data select 3;
	_bool = false;
	_items = items player;
	{
		_itemsLocal = _items;
		_id = _x select 0;
		_count = 0;
			{
				if (_id == _x) then {
					_count = _count + 1;
				};
			} forEach _itemsLocal;

		if (_count < (_x select 1)) exitWith { ["Error","You do not have the required items", true] spawn Harris_Notifications; _bool = true;};

	} forEach _requiredItems;

	if !(_bool) then {
		Harris_Items = _requiredItems;
		{	

			_vars = ["","","","","","","","",""];
			_count = 0;
			_item = _x select 0;
			Harris_itemCount = _x select 1;
			{
				if (_count < Harris_itemCount) then {
					player removeItem _item;
				};
				_count = _count + 1;
			} forEach _vars;
		} forEach _requiredItems;

		Harris_craftSchedule pushBack _data;
		if (count Harris_craftSchedule <= 1) then {
			[_data select 5, _data select 1, _data select 4, _data select 0, _data select 6] spawn Harris_openCraftTimer;
		};
	};
};