/*
	Author: Ben Harris
	Description: Mining Object Handler
*/
Harris_mineObject = {
	_weapon = _this select 1;
	_ct = cursorObject;
	if (_weapon isEqualTo "A3L_Pickaxe") then {
		player playAction "GestureSwing";
	};
	if (_weapon isEqualTo "A3L_Pickaxe" && typeOf _ct in Harris_mineObjects) then {
		{
			if (typeOf _ct isEqualTo (_x select 0)) then {
				Harris_oreMined = Harris_oreMined + round (random 7);
				_value = _ct getVariable "mined";
				_value = _value + 1;
				if (_value >= 20) then
				{
					deleteVehicle _ct;
				} else {
					_ct setVariable ["mined", _value];
				};
				if (Harris_oreMined >= 20) then {

					if (isNil 'Harris_Item') then {
						Harris_Item = "groundWeaponHolder" createVehicle position player;
						Harris_Item setPos (getpos Player);
					} else {
						if (!isNil 'Harris_Item' && player distance Harris_Item > 5) then {
							Harris_Item = "groundWeaponHolder" createVehicle position player;
							Harris_Item setPos (getpos Player);
						};
					};
					Harris_Item addItemCargoGlobal [_x select 1, 1];
					Harris_oreMined = 0;
				};
			};
		} foreach Harris_oreTypes;
	};
};
