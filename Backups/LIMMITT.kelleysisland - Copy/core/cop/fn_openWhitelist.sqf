#include <macro.h>
// Open Whitelisting Menu
if (__GETC__(life_coplevel) < 6) exitWith {};
createDialog "whitelistingMenu";

_display = findDisplay 365019;
_plist = _display displayCtrl 2100;
_saveButton = _display displayCtrl 2400;

{		
	_plist lbAdd format["%1",_x getVariable["name",name _x]];
	_plist lbSetData [(lbSize _plist)-1, str(_x)];
} forEach allPlayers;

_levels = [1,2,3,4];
{ lbAdd[2101, str _x]; } forEach _levels;	

_saveButton buttonSetAction "[] spawn life_fnc_saveWhitelisting";