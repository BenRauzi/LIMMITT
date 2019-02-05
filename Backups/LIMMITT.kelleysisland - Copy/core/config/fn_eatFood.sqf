/*
	File: fn_eatFood.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main handling system for eating food.
	*Needs to be revised and made more modular and more indept effects*
*/
private["_food","_val","_sum"];
_food = [_this,0,"",[""]] call BIS_fnc_param;
if(_food == "") exitWith {};

if([false,_food,1] call life_fnc_handleInv) then {
	switch (_food) do
	{
		case "apple": {_val = 25};
		case "rabbit":{ _val = 35};
		case "salema": {_val = 25};
		case "ornate": {_val = 25};
		case "mackerel": {_val = 30};
		case "tuna": {_val = 45};
		case "mullet": {_val = 70};
		case "catshark": {_val = 90};
		case "turtle": {_val = 85};
		case "turtlesoup": {_val = 45};
		case "donuts": {_val = 10};
		case "tbacon": {_val = 15};
		case "peach": {_val = 25};
	};

	_sum = life_hunger + _val;
	if(_sum > 100) then {_sum = 100; player setFatigue 1; ["Info", "You have over eaten, you are now feeling fatigued.", "Info"] call Harris_Notifications;};
	life_hunger = _sum;
};