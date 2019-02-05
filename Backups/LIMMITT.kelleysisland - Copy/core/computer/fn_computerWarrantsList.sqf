_return = _this select 0;
_returnList = _this select 1;

_index = lbAdd [1500, "----------------"];
lbSetColor [1500, _index, [0, 1, 0, 0.5]];
lbAdd [1500, _return];

{
	lbAdd [1500, _x];
} forEach _returnList;

lbSetCurSel [1500, LbSize 1500];

gm_searchingWarrants = false;