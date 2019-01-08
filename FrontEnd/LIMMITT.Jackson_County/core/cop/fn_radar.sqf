/*
	File: fn_radar.sqf
	Author: Silly Aussie kid named Jaydon
	
	Description:
	Looks like weird but radar?
*/
if(playerSide != west) exitWith {};
private ["_speed","_vehicle"];
_vehicle = cursorTarget;
_speed = round speed _vehicle;

if((_vehicle isKindOf "Car" || _vehicle isKindOf "Motorbike") && (currentWeapon player) == "Radar_Gun") then
{
	_name = name (driver _vehicle);
	hint parseText format ["Owner: %1<br/>Speed: %2",_name,round  _speed];
};