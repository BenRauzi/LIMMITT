disableSerialization;
_masterItemList = getArray (missionConfigFile >> "craftingSystem" >> "craftingConfig" >> "masterItemList");
_index = lbCurSel 1500;


_selected = _masterItemList select _index;

_displayName = getText (missionConfigFile >> "craftingSystem" >> "craftingConfig" >> _selected >> "displayname");

_display = uiNamespace getVariable "gm_craftingMenu";

_itemDescription = getText (missionConfigFile >> "craftingSystem" >> "craftingConfig" >> _selected >> "itemdescription");

_control = (_display displayCtrl 1100);
_control ctrlSetStructuredText parseText format ["%1", _itemDescription];

_ctrl = (_display displayCtrl 100123);
_ctrl ctrlSetText _displayName;

_ironreq = getNumber (missionConfigFile >> "craftingSystem" >> "craftingConfig" >> _selected >> "ironreq");
_cottonreq = getNumber (missionConfigFile >> "craftingSystem" >> "craftingConfig" >> _selected >> "cottonreq");
_glassreq = getNumber (missionConfigFile >> "craftingSystem" >> "craftingConfig" >> _selected >> "glassreq");
_copperreq = getNumber (missionConfigFile >> "craftingSystem" >> "craftingConfig" >> _selected >> "copperreq");
_diamondreq = getNumber (missionConfigFile >> "craftingSystem" >> "craftingConfig" >> _selected >> "diamondreq");

_control = (_display displayCtrl 1101);
_control ctrlSetStructuredText parseText format ["Iron Required: %1<br />Cotton Required: %2<br />Glass Required: %3<br />Copper Required: %4<br />Diamonds Required: %5", _ironreq, _cottonreq, _glassreq, _copperreq, _diamondreq];
