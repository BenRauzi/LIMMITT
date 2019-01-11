/*
    File: fn_saveGear.sqf
    Author: Bryan "Tonic" Boardwine
    Full Gear/Y-Menu Save by Vampire
    Edited: Itsyuka
    
    Description:
    Saves the players gear for syncing to the database for persistence..
*/
private["_return","_uItems","_bItems","_vItems","_pItems","_hItems","_yItems","_uMags","_vMags","_bMags","_pMag","_hMag","_uni","_ves","_bag","_handled"];
_return = [];

_return set[count _return,uniform player];
_return set[count _return,vest player];
_return set[count _return,backpack player];
_return set[count _return,goggles player];
_return set[count _return,headgear player];
_return set[count _return,assignedITems player];
if(playerSide == west || playerSide == civilian && {(call life_save_civ)}) then {
    _return set[count _return,primaryWeapon player];
    _return set[count _return,handgunWeapon player];
} else {
    _return set[count _return,[]];
    _return set[count _return,[]];
};

_uItems = [];
_uMags  = [];
_bItems = [];
_bMags  = [];
_vItems = [];
_vMags  = [];
_pItems = [];
_hItems = [];
_yItems = [];
_uni = [];
_ves = [];
_bag = [];

if(uniform player != "") then
{
    {
        if (_x in (magazines player)) then {
            _uMags = _uMags + [_x];
        } else {
            _uItems = _uItems + [_x];
        };
    } forEach (uniformItems player);
};

if(backpack player != "") then
{
    {
        if (_x in (magazines player)) then {
            _bMags = _bMags + [_x];
        } else {
            _bItems = _bItems + [_x];
        };
    } forEach (backpackItems player);
};

if(vest player != "") then
{
    {
        if (_x in (magazines player)) then {
            _vMags = _vMags + [_x];
        } else {
            _vItems = _vItems + [_x];
        };
    } forEach (vestItems player);
};

if(count (primaryWeaponMagazine player) > 0 && alive player) then
{
    _pMag = ((primaryWeaponMagazine player) select 0);
    if(_pMag != "") then
    {
        _uni = player canAddItemToUniform _pMag;
        _ves = player canAddItemToVest _pMag;
        _bag = player canAddItemToBackpack _pMag;
        _handled = false;
        if(_ves) then
        {
            _vMags = _vMags + [_pMag];
            _handled = true;
        };
        if(_uni && !_handled) then
        {
            _uMags = _uMags + [_pMag];
            _handled = true;
        };
        if(_bag && !_handled) then
        {
            _bMags = _bMags + [_pMag];
            _handled = true;
        };
    };
};

if(count (handgunMagazine player) > 0 && alive player) then
{
    _hMag = ((handgunMagazine player) select 0);
    if(_hMag != "") then
    {
        _uni = player canAddItemToUniform _hMag;
        _ves = player canAddItemToVest _hMag;
        _bag = player canAddItemToBackpack _hMag;
        _handled = false;
        if(_ves) then
        {
            _vMags = _vMags + [_hMag];
            _handled = true;
        };
        if(_uni && !_handled) then
        {
            _uMags = _uMags + [_hMag];
            _handled = true;
        };
        if(_bag && !_handled) then
        {
            _bMags = _bMags + [_hMag];
            _handled = true;
        };
    };
};

if(count (primaryWeaponItems player) > 0) then
{
    {
        _pItems = _pItems + [_x];
    } forEach (primaryWeaponItems player);
};

if(count (handGunItems player) > 0) then
{
    {
        _hItems = _hItems + [_x];
    } forEach (handGunItems player);
};

{
    _name = (_x select 0);
    _val = (_x select 1);
    if (_val > 0) then {
        for "_i" from 1 to _val do {
            _yItems = _yItems + [_name];
        };
    };
} forEach [
    ["asdih_inv_bec", asdih_inv_bec],
    ["asdih_inv_medkit", asdih_inv_medkit],
    ["asdih_inv_mobilephone", asdih_inv_mobilephone],
    ["asdih_inv_panicbutton", asdih_inv_panicbutton],
    ["asdih_inv_tierope", asdih_inv_tierope],   
    ["asdih_inv_apple", asdih_inv_apple],
    ["asdih_inv_rabbit", asdih_inv_rabbit],
    ["asdih_inv_salema", asdih_inv_salema],
    ["asdih_inv_ornate", asdih_inv_ornate],
    ["asdih_inv_mackerel", asdih_inv_mackerel],
    ["asdih_inv_tuna", asdih_inv_tuna],
    ["asdih_inv_mullet", asdih_inv_mullet],
    ["asdih_inv_catshark", asdih_inv_catshark],
    ["asdih_inv_fishingpoles", asdih_inv_fishingpoles],
    ["asdih_inv_water", asdih_inv_water],
    ["asdih_inv_donuts", asdih_inv_donuts],
    ["asdih_inv_turtlesoup", asdih_inv_turtlesoup],
    ["asdih_inv_coffee", asdih_inv_coffee],
    ["asdih_inv_fuelF", asdih_inv_fuelF],
    ["asdih_inv_fuelE", asdih_inv_fuelE],
    ["asdih_inv_pickaxe", asdih_inv_pickaxe],
    ["asdih_inv_tbacon", asdih_inv_tbacon],
    ["asdih_inv_lockpick", asdih_inv_lockpick],
    ["asdih_inv_redgull", asdih_inv_redgull],
    ["asdih_inv_peach", asdih_inv_peach],
    ["asdih_inv_bandage", asdih_inv_bandage],
    ["asdih_inv_spikeStrip", asdih_inv_spikeStrip],
    ["asdih_inv_defusekit", asdih_inv_defusekit],
    ["asdih_inv_storagesmall", asdih_inv_storagesmall],
    ["asdih_inv_storagebig", asdih_inv_storagebig]
];

_return set[count _return,_uItems];
_return set[count _return,_uMags];
_return set[count _return,_bItems];
_return set[count _return,_bMags];
_return set[count _return,_vItems];
_return set[count _return,_vMags];
_return set[count _return,_pItems];
_return set[count _return,_hItems];
if(call life_save_yinv) then {
    _return set[count _return,_yItems];
} else {
    _return set[count _return,[]];
};

life_gear = _return;
