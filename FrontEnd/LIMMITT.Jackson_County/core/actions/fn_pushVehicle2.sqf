/*
	File: push the vehicle brahs

*/

if (pushCooldown) exitWith {hint "Please don't spam push!"};

pushCooldown = true;

_vehicle = cursortarget; 
_vehicle allowdamage false;
_vel = velocity _vehicle;  
_dir = direction player; 
_speed = 5;
_vehicle setVelocity [   (_vel select 0) + (sin _dir * _speed),    (_vel select 1) + (cos _dir * _speed),    (_vel select 2)  ];
uiSleep 1;
_vehicle allowdamage true;
pushCooldown = false;