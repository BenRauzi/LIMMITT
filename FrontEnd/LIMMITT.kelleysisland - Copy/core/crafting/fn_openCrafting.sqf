disableSerialization;

_masterItemList = getArray (missionConfigFile >> "craftingSystem" >> "craftingConfig" >> "masterItemList");

createDialog "craftingMenu";
_display = (findDisplay 36501255);

{
	_displayName = getText (missionConfigFile >> "craftingSystem" >> "craftingConfig" >> _x >> "displayname");
	lbAdd [1500, _displayName];
} forEach _masterItemList;

lbSetCurSel [1500, 0];