/*
	File: fn_putInCar.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Finds the nearest vehicle and loads the target into the vehicle.
*/
private["_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _unit OR !isPlayer _unit) exitWith {};

_nearestVehicle = nearestObjects[getPosATL player,["Car","Motorcycle","Bicycle","Motorbike","Ship","Submarine","Air"],10] select 0;
if(isNil "_nearestVehicle") exitWith { ["Error",localize "STR_NOTF_VehicleNear", "Failure"] call Harris_Notifications;};

detach _unit;
[[_nearestVehicle],"life_fnc_moveIn",_unit,false] call bis_fnc_mp;
_unit setVariable["Escorting",FALSE,TRUE];
_unit setVariable["transporting",TRUE,TRUE];