_masterItemList = getArray (missionConfigFile >> "craftingSystem" >> "craftingConfig" >> "masterItemList");
_index = lbCurSel 1500;

_selected = _masterItemList select _index;

_displayName = getText (missionConfigFile >> "craftingSystem" >> "craftingConfig" >> _selected >> "displayname");
_itemDescription = getText (missionConfigFile >> "craftingSystem" >> "craftingConfig" >> _selected >> "itemdescription");
_className = getText (missionConfigFile >> "craftingSystem" >> "craftingConfig" >> _selected >> "classname");

_ironreq = getNumber (missionConfigFile >> "craftingSystem" >> "craftingConfig" >> _selected >> "ironreq");
_cottonreq = getNumber (missionConfigFile >> "craftingSystem" >> "craftingConfig" >> _selected >> "cottonreq");
_glassreq = getNumber (missionConfigFile >> "craftingSystem" >> "craftingConfig" >> _selected >> "glassreq");
_copperreq = getNumber (missionConfigFile >> "craftingSystem" >> "craftingConfig" >> _selected >> "copperreq");
_diamondreq = getNumber (missionConfigFile >> "craftingSystem" >> "craftingConfig" >> _selected >> "diamondreq");

hint "Crafting process begun";

if (asdih_inv_ironr < _ironreq) exitWith {hint "You do not have the required processed iron!"};

if (asdih_inv_cotton < _cottonreq) exitWith {hint "You do not have the required cotton!"};

if (asdih_inv_glass < _glassreq) exitWith {hint "You do not have the required processed glass!"};

if (asdih_inv_copperr < _copperreq) exitWith {hint "You do not have the required processed copper!"};

if (asdih_inv_diamondr < _diamondreq) exitWith {hint "You do not have the required processed diamonds!"};

gm_craftingBox addItemCargo [_className, 1];

asdih_inv_ironr = asdih_inv_ironr - _ironreq;
asdih_inv_cotton = asdih_inv_cotton - _cottonreq;
asdih_inv_glass = asdih_inv_glass - _glassreq;
asdih_inv_copperr = asdih_inv_copperr - _copperreq;
asdih_inv_diamondr = asdih_inv_diamondr - _diamondreq;

hint format ["You have crafted %1 and it was placed in the crafting box.", _displayName];

_content = format ["%1 [%2] Just crafted %3", name player, getPlayerUID player, _displayName];
[[_content],"DB_fnc_logToLogs",false,false] spawn bis_fnc_mp;