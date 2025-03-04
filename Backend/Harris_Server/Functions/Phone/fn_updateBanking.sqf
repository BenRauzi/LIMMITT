/*
	Author: Ben Harris
	Description: Phone - Read Function Name
*/

Harris_updateBanking = {
	waitUntil {!isNull (findDisplay 5015)};

	_dialog = findDisplay 5015;
	_units = _dialog displayCtrl 2703;

	ctrlSetText [1400,format["$%1",[gm_memecash] call life_fnc_numberText]];
	ctrlSetText [1401,format["$%1",[gm_memecash] call life_fnc_numberText]];
	ctrlSetText [1402,format["$%1",[LIMMITTCASH] call life_fnc_numberText]];

	_type = "Civ";
	lbClear 2703; // Clears the lisbox to stop duplication - NJF
	if (count playAbleUnits > 1) then {
		{
			if(alive _x && _x != player) then
			{
				switch (side _x) do
				{
					case west: {_type = "Cop"};
					case civilian: {_type = "Civ"};
					case independent: {_type = "EMS"};
				};
				_units lbAdd format["%1 (%2)",_x getVariable["realname",name _x],_type];
				_units lbSetData [(lbSize _units)-1,str(_x)];
			};
		} foreach playableUnits;
	} else {
		_units lbAdd "N/A";
	};
	lbSetCurSel [2703, 0];
};