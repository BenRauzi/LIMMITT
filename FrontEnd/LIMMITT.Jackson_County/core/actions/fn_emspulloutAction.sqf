/*
	File: fn_emspulloutAction.sqf

	Pulls all players from a vehicle
*/
private["_crew"];
_myposy = getPos player;

["Info", "This will take atleast 10 seconds.", "Info"] call Harris_Notifications;

_crew = crew cursorTarget;

_okbrah = 1;
while {_okbrah < 10} do {
	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	uiSleep 1;
	waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
	_okbrah = _okbrah + 1;
	if (_okbrah == 5) then {

	};
	_they = getPos cursorTarget;
	if( _they distance _myposy > 3 ) exitwith {
		["Error", "Vehicle Moved to Far", "Failure"] call Harris_Notifications;
	};
};



{
	if(side _x == independent || side _x == west || side _x == civilian) then
	{
			_x setVariable ["transporting",false,true]; _x setVariable ["Escorting",false,true];
			[[_x],"life_fnc_pulloutVeh",_x,false] spawn bis_fnc_mp;
	};
} foreach _crew;


