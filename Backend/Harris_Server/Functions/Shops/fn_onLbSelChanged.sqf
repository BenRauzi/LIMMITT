/*
	Author: Ben Harris
	Description: Updates Shop Price
*/
Harris_onLbSelChanged = {
	_item = lbData [38403, (lbCurSel 38403)];
	if !(isNil "_item") then {

		_price = nil;
		{
			if (_item == _x select 0) then {
				_price = _x select 1;
			};
		} forEach Harris_prices;
	ctrlSetText [38404, str _price];

	_ctrl = (findDisplay 123123) displayCtrl 38404;
	_ctrl ctrlSetStructuredText parseText format ["<t size='0.8'>Price: <t color='#8cff9b'>$%1</t></t>",[(_price)] call life_fnc_numberText];


	};
};