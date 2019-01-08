#include "..\..\script_macros.hpp"
/*
    File: fn_playerTags.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Adds the tags above other players heads when close and have visible range.
*/
if (!life_settings_tagson) exitWith {};
private ["_ui","_units"];
#define iconID 78000
#define scale 0.8

if (visibleMap || {!alive player} || {dialog}) exitWith {
    500 cutText["","PLAIN"];
};

_ui = uiNamespace getVariable ["Life_HUD_nameTags",displayNull];
if (isNull _ui) then {
    500 cutRsc["Life_HUD_nameTags","PLAIN"];
    _ui = uiNamespace getVariable ["Life_HUD_nameTags",displayNull];
};

_units = nearestObjects[(visiblePosition player),["Man","Land_Pallet_MilBoxes_F","Land_Sink_F"],50];
_units = _units - [player];

private _index = -1;
{
    if (!(_x == player) && (isPlayer _x) && ((vehicle _x) == _x)) then {
        _nametagData = _x getVariable "nametagData";
        _color = _nametagData select 0;
        _gang = _nametagData select 1;

        private "_text";
        _idc = _ui displayCtrl (iconID + _forEachIndex);
        if (!(lineIntersects [eyePos player, eyePos _x, player, _x]) && alive _x && {!isNil {getPlayerUID _x}} && {getPlayerUID _x != "_SP_AI_"}) then {
                _pos = switch (typeOf _x) do {
                    case "Land_Pallet_MilBoxes_F": {[visiblePosition _x select 0, visiblePosition _x select 1, (getPosATL _x select 2) + 1.5]};
                    case "Land_Sink_F": {[visiblePosition _x select 0, visiblePosition _x select 1, (getPosATL _x select 2) + 2]};
                    default {[visiblePosition _x select 0, visiblePosition _x select 1, ((_x modelToWorld (_x selectionPosition "head")) select 2)+.5]};
                };
                     _sPos = worldToScreen _pos;
                      _distance = _pos distance player;
                     if (count _sPos > 1 && {_distance < 2}) then {
                         _text = switch (true) do {
                        case (_x in (units group player) && (playerSide isEqualTo civilian || playerSide isEqualTo west)): {format ["<t color=%1 font='EtelkaNarrowMediumPro'>%2</t>",(_color select 1),(name _x)];};
                        case (side _x isEqualTo independent): {format ["<t color='%1' font='EtelkaNarrowMediumPro'>%2</t>",(_color select 1),(name _x)];};
                        default {format ["<t color='%1' font='EtelkaNarrowMediumPro'>%2</t><br/><t size='0.8' color='#ffffff' font='EtelkaNarrowMediumPro'>%3</t>",(_color select 1),(name _x),_gang];};
                    };

                    _idc ctrlSetStructuredText parseText _text;
                    _idc ctrlSetPosition [_sPos select 0, _sPos select 1, 0.4, 0.65];
                    _idc ctrlSetScale scale;
                    _idc ctrlSetFade 0;
                    _idc ctrlCommit 0;
                    _idc ctrlShow true;
                } else {
                    _idc ctrlShow false;
                };
        } else {
            _idc ctrlShow false;
        };
        _index = _forEachIndex;
    };
} forEach allPlayers;
(_ui displayCtrl (iconID + _index + 1)) ctrlSetStructuredText parseText "";