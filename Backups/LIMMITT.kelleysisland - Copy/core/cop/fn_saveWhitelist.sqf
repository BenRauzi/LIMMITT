_selected = lbCurSel 2100;
_number = lbCurSel 2101;
_levels = [1,2,3,4];

_selectedLevel = _levels select _number;
_selectedPlayer = lbData [2100, _selected];

_unit = call compile format["%1", _selectedPlayer];

_selectedLevel remoteExecCall ["life_fnc_syncWhitelist", _unit]; 

hint format ["Whitelisted %1 for %2 cop whitelisting", name _unit, _selectedLevel];