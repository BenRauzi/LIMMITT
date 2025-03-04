/*
	File: fn_adminQuery.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the query on a player.
*/
private["_display","_text","_info","_prim","_sec","_vest","_uni","_bp","_attach","_tmp"];
disableSerialization;
_display = findDisplay 2900;
if(!isNil {admin_query_ip}) exitWith {hint localize "STR_ANOTF_Query_2"};
_text = _display displayCtrl 2903;
_info = lbData[2902,lbCurSel (2902)];
_info = call compile format["%1", _info];
if(isNil "_info") exitWith {_text ctrlSetText localize "STR_ANOTF_QueryFail";};
if(isNull _info) exitWith {_text ctrlSetText localize "STR_ANOTF_QueryFail";};
[[player],"fnc_player_query",_info,false] spawn bis_fnc_mp;
_text ctrlSetText localize "STR_ANOTF_Query";