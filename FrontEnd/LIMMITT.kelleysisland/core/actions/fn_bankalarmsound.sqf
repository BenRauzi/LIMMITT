/*
fn_bankalarmsound.sqf
*/
private["_shop"];
_shop = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _vault) exitWith {};
_shop say3D "RobAlarm";