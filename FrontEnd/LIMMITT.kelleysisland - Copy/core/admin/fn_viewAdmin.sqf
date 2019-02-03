#include <macro.h>
if(__GETC__(life_adminlevel) < 1) exitWith {closeDialog 0;}; // die
if(__GETC__(life_adminlevel) < 1) exitWith {closeDialog 0;}; // die
if(__GETC__(life_adminlevel) < 1) exitWith {closeDialog 0;}; // die

lbClear 1334;
_memeUnformat = (_this select 0) select 1;
_meme = format ["%1", (_this select 0) select 1];
_cancer = adminMenuLastOpenedArray select _memeUnformat;
_aids = getPlayerUID _cancer;
_newLB = lbAdd [1334, "General Stats"];
lbSetColor [1334, _newLB, [0, 0, 1, 1]];
_displayAids = format ["Player UID: %1", _aids];
lbAdd[1334, _displayAids]; 
_cancername123 = name _cancer;

_cancerLocation = getPos _cancer;

((findDisplay 365012) displayCtrl 12397) ctrlMapAnimAdd [0.5, 1, _cancerLocation];
ctrlMapAnimCommit ((findDisplay 365012) displayCtrl 12397);

_markerAdminMenu = createMarkerLocal ["markaermmee", _cancerLocation];
_markerAdminMenu setMarkerShapeLocal "ICON";
_markerAdminMenu setMarkerTypeLocal "hd_dot";
_markerAdminMenu setMarkerColorLocal "ColorRed";
_textToView = format ["Located: %1", _cancername123];
_markerAdminMenu setMarkerTextLocal _textToView;



_aidsWeapon = currentWeapon _cancer;
_aidsWeaponDisplay = format ["Wep: %1", _aidsWeapon];
lbAdd[1334, _aidsWeaponDisplay];

_aidsWeapon = getDammage _cancer;
_aidsWeaponDisplay = format ["Damage: %1/1", _aidsWeapon];
lbAdd[1334, _aidsWeaponDisplay];

_aidsWeapon = getFatigue _cancer;
_aidsWeaponDisplay = format ["Fatigue: %1/1", _aidsWeapon];
lbAdd[1334, _aidsWeaponDisplay];

_aidsWeapon = side _cancer;
_aidsWeaponDisplay = format ["Side: %1", _aidsWeapon];
lbAdd[1334, _aidsWeaponDisplay];

_aidsWeapon = items _cancer;
_aidsWeaponDisplay = format ["Items: %1", _aidsWeapon];
lbAdd[1334, _aidsWeaponDisplay];

_newLB = lbAdd [1334, ""];
_newLB = lbAdd [1334, "Clothing"];
lbSetColor [1334, _newLB, [1, 0, 0, 1]];

_aidsWeapon = uniform _cancer;
_aidsWeaponDisplay = format ["Uniform: %1", _aidsWeapon];
lbAdd[1334, _aidsWeaponDisplay];

_aidsWeapon = vest _cancer;
_aidsWeaponDisplay = format ["Vest: %1", _aidsWeapon];
lbAdd[1334, _aidsWeaponDisplay];

_aidsWeapon = backpack _cancer;
_aidsWeaponDisplay = format ["Backpack: %1", _aidsWeapon];
lbAdd[1334, _aidsWeaponDisplay];

_aidsWeapon = headgear _cancer;
_aidsWeaponDisplay = format ["Headgear: %1", _aidsWeapon];
lbAdd[1334, _aidsWeaponDisplay];

/*
_newLB = lbAdd [1334, ""];
_newLB = lbAdd [1334, "Anti-Hack Checks"];
lbSetColor [1334, _newLB, [0, 1, 0, 1]];

_aidsWeapon = isDamageAllowed _cancer;
_aidsWeaponDisplay = format ["Damage Enabled: %1", _aidsWeapon];
lbAdd[1334, _aidsWeaponDisplay];

_aidsWeapon = ((unitRecoilCoefficient _cancer) * 100);
_aidsWeaponDisplay = format ["Recoil: %2%1", _aidsWeapon, "%"];
lbAdd[1334, _aidsWeaponDisplay];

_aidsWeapon = ((getCustomAimCoef _cancer) * 100);
_aidsWeaponDisplay = format ["Sway: %2%1", _aidsWeapon, "%"];
lbAdd[1334, _aidsWeaponDisplay];

_aidsWeapon = getAnimSpeedCoef _cancer;
_aidsWeaponDisplay = format ["Speed: %1", _aidsWeapon];
lbAdd[1334, _aidsWeaponDisplay];
*/


waitUntil {!dialog};
deleteMarker _markerAdminMenu;