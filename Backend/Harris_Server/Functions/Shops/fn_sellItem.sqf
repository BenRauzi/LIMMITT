/*
	Author: Ben Harris
	Description: Sells item
*/
Harris_sellItem = {
	_item = lbData [38403, (lbCurSel 38403)];
	if !(isNil "_item") then {

		if (Harris_coolDown) exitWith {["Slow Down", "You cannot sell items that quickly", "Failure"] call Harris_Notifications; };
		player removeItem _item;
		_price = nil;
		{
			if (_item == _x select 0) then {
				_price = _x select 1;
			};
		} forEach Harris_prices;

		if (!isNil "_price" && !Harris_coolDown) then {
			LIMMITTCASH = LIMMITTCASH + _price;
			Harris_coolDown = true;
			[] call Harris_refreshShop;

			[] spawn {
				sleep 0.01;
				Harris_coolDown = false;
			};
		};
	};
};